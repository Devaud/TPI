unit U_OneWayTickets_GestionSeances;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IniFiles;

type
  TFrmGestionSeances = class(TForm)
    Label1: TLabel;
    LbxListeSeances: TListBox;
    BtnModifier: TButton;
    BtnSupprimer: TButton;
    BtnAjouter: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    BtnValiderModification: TButton;
    BtnAnuuler: TButton;
    Label3: TLabel;
    CbxFilm: TComboBox;
    CbxSalle: TComboBox;
    GroupBox2: TGroupBox;
    ChxLundi: TCheckBox;
    ChxSamedi: TCheckBox;
    ChxVendredi: TCheckBox;
    ChxDimanche: TCheckBox;
    ChxMardi: TCheckBox;
    ChxMercredi: TCheckBox;
    ChxJeudi: TCheckBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    edtHeure1: TEdit;
    edtHeure2: TEdit;
    Label5: TLabel;
    edtHeure3: TEdit;
    Label6: TLabel;
    edtHeure4: TEdit;
    Label7: TLabel;
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnAnuulerClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure changeEtat(active: boolean);
    procedure BtnValiderModificationClick(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    procedure chargeListeSeances();
  end;

Type
  TSeance = record
    section  : String;
    film     : String;
    salle    : String;
    jourDiff : String;
    heure1   : String;
    heure2   : String;
    heure3   : String;
    heure4   : String;
    diffuser : String;
  end;

// Tableau pour les cl�s et les valeurs des champs pour le fichier INI
Type
  TCleVal = array [0..7] of array [0..1] of string;

var
  FrmGestionSeances : TFrmGestionSeances;
  ListeSeances      :  array of TSeance;

const
  FRM_WIDTH_MAX             : integer = 580;
  FRM_WIDTH_MIN             : integer = 359;
  FICHIER_FILMS             : String  = './Res/films.csv';
  FICHIER_SALLES            : String = './Res/salles.csv';
  FICHIER_SEANCES           : String = './Res/seances.ini';
  MAX_TABLEAU_CLEVAL_INDICE : integer = 7;  // Taille maximum de la premi�re dimension du tableau

implementation

uses U_OneWayTickets_AjouterSeance, U_OneWayTicket;

{$R *.DFM}

{ ****************************************************************************
  *** Enregistre dans un fichier ini                                       ***
  *** @params String fichier - Chemin et nom du fichier INI                ***
  *** @params String parametre - Nom du param�tre dans le fichier INI      ***
  *** @params TCleVal ValCle - Cl� et valeur � entrer dans le fichier INI  ***
  *** @result boolean - Renvoi vrai si tout c'est bien pass�               ***
  **************************************************************************** }
function sauvegardeIni(fichier: string; parametre: string; ValCle: TCleVal): boolean;
var
  fichierIni: TInifile;
  i: integer;
  sauvegarde: boolean;
Begin
  sauvegarde:= false;

  if FileExists(fichier) then
  Begin
    fichierIni:= TIniFile.Create(fichier);  // Initialise le fichier INI

    // Parcoure le tableau et ajoute les �l�ments
    for i:= 0 to MAX_TABLEAU_CLEVAL_INDICE do
    begin
      fichierIni.WriteString(parametre, ValCle[i][0], ValCle[i][1]);
    end;

    fichierIni.free;  // Lib�re le fichier

    sauvegarde:= true;
  end;

  Result:= sauvegarde;
end;

{ ****************************************************************************
  *** Compte le nombre de section existant dans un fichier ini             ***
  *** @params String fichier - Chemin et nom du fichier INI                ***
  *** @result Integer - Nombre de section                                  ***
  **************************************************************************** }
function compteSectionIni(fichier: string): integer;
var
  FichierIni: TIniFile;
  Section: TStringList;
  NbSection: integer;
Begin
  NbSection:= 0;
  
  if FileExists(fichier) then
  Begin
    FichierIni:= TIniFile.Create(fichier);
    Section:= TStringList.Create;
    FichierIni.ReadSections(Section); // R�cup�re toutes les sections
    NbSection:= Section.Count; // Compte le nombre de sections
    Section.Free;
    FichierIni.Free;
  end;
  
  Result:= NbSection;
end;

{ ****************************************************************************
  *** Ajout un nombre d'espace avant ou apr�s le text                      ***
  *** @params String text - Text qui va prendre des espaces                ***
  *** @params Boolean avant - La modification doit �tre plac�e avant ou    ***
  ***                         apres                                        ***
  *** @params Integer tailleEspace - Nombre d'espace souhait�              ***
  *** @Result string - Retourne le text modifi�                            ***
  **************************************************************************** }
function AjoutEspace(tailleEspace: integer): string;
var
  i : integer;
  text: string;
Begin
  text:= '';
  // Ajoute ce qu'il faut
  for i:= 0 to tailleEspace do
  Begin
    text:= text + ' ';
  end;

  Result:= text; // Retourne le text modifier
end;

{ ****************************************************************************
  *** Ajuste la taille du text                                             ***
  *** @params String text - Text qui va �tre ajust�                        ***
  *** @params Integer taille - Taille final souhait�e                      ***
  *** @Result string - Retourne le text modifi�                            ***
  **************************************************************************** }
function AjusterText(text: string; taille: integer): string;
var
  difference: integer;
Begin
  
  if length(text) > taille then
  Begin
    text:= copy(text, 1, taille - 3);
    text:= text + '...';
  end;

  if length(text) < taille then
  Begin
    difference:= taille - length(text);
    text:= text + AjoutEspace(difference);
  end;

  Result:= text;
end;

{ ****************************************************************************
  *** Traduit les jours de diffusion (1 -> Lundi, etc.)                    ***
  *** @params String jour - Suite de nombre qui compose les jours          ***
  *** @params String caracSeparation - Carac�re qui s�pare les jours       ***
  *** @Result string - Chaine comportant les jours                         ***
  **************************************************************************** }
function assembleJour(jour, caracSeparation : String): String;
var
  j, tmpJour: integer;
  jourDiff: string;
Begin
  jourDiff:= '';
  
  // Boucle qui parcoure tous les jours
  for j:= 1 to length(jour) do
  Begin
    tmpJour:= StrToInt(jour[j]); // R�cup�re la valeur au point j et le traduit en integer
    case tmpJour of
      1 : jourDiff:= jourDiff + 'Lundi';
      2 : jourDiff:= jourDiff + 'Mardi';
      3 : jourDiff:= jourDiff + 'Mercredi';
      4 : jourDiff:= jourDiff + 'Jeudi';
      5 : jourDiff:= jourDiff + 'Vendredi';
      6 : jourDiff:= jourDiff + 'Samedi';
      7 : jourDiff:= jourDiff + 'Dimanche';
    end;

    if j < length(jour) then
      jourDiff:= jourDiff + caracSeparation;
  end;

  Result:= jourDiff;
end;

{ ****************************************************************************
  *** Passe les jours en valeur num�rique                                  ***
  *** @params TList chxList - Listes des checkbox                          ***
  *** @Result string - Chaine comportant les jours                         ***
  **************************************************************************** }
function jourEnNombre(chxList: TList): string;
var
  chx: TCheckBox;
  i: integer;
  valeurs: string;
Begin
  // Initialisation
  valeurs:= '';

  // Parcoure la liste des checkbox
  for i:= 1 to chxList.Count do
  Begin
    chx:= chxList[i-1];

    // Test si le checkbock est checked
    if chx.Checked then
      valeurs:= valeurs + IntToStr(i);
  end;


  Result:= valeurs;
end;

{ ****************************************************************************
  *** Change l'�tat des �l�ments                                           ***
  *** @params Boolean active - true ou false                               ***
  **************************************************************************** }
procedure TFrmGestionSeances.changeEtat(active: boolean);
Begin
  LbxListeSeances.Enabled:= active;
  BtnModifier.Enabled:= active;
  BtnAjouter.Enabled:= active;
  BtnSupprimer.Enabled:= active;
end;

{ ****************************************************************************
  *** Charge et affiche les seances depuis un fichier ini                  ***
  **************************************************************************** }
procedure TFrmGestionSeances.chargeListeSeances();
var
  fichierIni : TIniFile;
  Sections, dataSection : TStringList;
  ligneFormate, jourDiff, horaires: String;
  i: integer;
Begin
  //Initialisation
  SetLength(listeSeances, 250);
  LbxListeSeances.Clear;

  // Lecture du fichier INI
  fichierIni:= TIniFile.Create(FICHIER_SEANCES);
  Sections:= TStringList.Create;
  dataSection:= TStringList.Create;
  
  fichierIni.ReadSections(Sections);

  for i:= 0 to Sections.Count - 1 do
  Begin
    fichierIni.ReadSection(Sections[i], dataSection);
    jourDiff:= '';
    horaires:= '';

    // R�cup�ration des donn�es du fichier ini
    ListeSeances[i].section:= Sections[i];
    ListeSeances[i].film:= fichierIni.ReadString(Sections[i], dataSection[0], 'N/A');
    ListeSeances[i].salle:= fichierIni.ReadString(Sections[i], dataSection[1], 'N/A');
    ListeSeances[i].jourDiff:= fichierIni.ReadString(Sections[i], dataSection[2], 'N/A');
    ListeSeances[i].heure1:= fichierIni.ReadString(Sections[i], dataSection[3], 'N/A');
    ListeSeances[i].heure2:= fichierIni.ReadString(Sections[i], dataSection[4], 'N/A');
    ListeSeances[i].heure3:= fichierIni.ReadString(Sections[i], dataSection[5], 'N/A');
    ListeSeances[i].heure4:= fichierIni.ReadString(Sections[i], dataSection[6], 'N/A');
    ListeSeances[i].diffuser:= fichierIni.ReadString(Sections[i], dataSection[7], 'N/A');

    // Modification des jours (Affichage en tout lettre)
    jourDiff:= assembleJour(listeSeances[i].jourDiff, ',');

    // Assemble les heures
    if ListeSeances[i].heure1 <> '' then
    Begin
      if Length(horaires) > 0 then
        horaires:= horaires + ',';

      horaires:= horaires + listeSeances[i].heure1;
    end;

    if ListeSeances[i].heure2 <> '' then
    Begin
      if Length(horaires) > 0 then
        horaires:= horaires + ',';

      horaires:= horaires + listeSeances[i].heure2;
    end;

    if ListeSeances[i].heure3 <> '' then
    Begin
      if Length(horaires) > 0 then
        horaires:= horaires + ',';

      horaires:= horaires + listeSeances[i].heure3;
    end;

    if ListeSeances[i].heure4 <> '' then
    Begin
      if Length(horaires) > 0 then
        horaires:= horaires + ',';

      horaires:= horaires + listeSeances[i].heure4;
    end;

    // Formate le text pour l'affichage
    ligneFormate:= AjusterText(ListeSeances[i].film, 15) + AjoutEspace(15);
    ligneFormate:= ligneFormate + AjusterText(ListeSeances[i].salle, 10) + AjoutEspace(10);
    ligneFormate:= ligneFormate + AjusterText(jourDiff, 51) + AjoutEspace(10);
    ligneFormate:= ligneFormate + AjusterText(horaires, 23);


    LbxListeSeances.Items.Add(ligneFormate);
  end;
end;

{ ****************************************************************************
  *** Ecrit les donn�es d'un fichier dans un combobox                      ***
  *** @params TCombobox cbs - Combobox qui re�ois les donn�es              ***
  *** @params string fichier - Chemin du fichier                           ***
  **************************************************************************** }
procedure donneDansComboBox(cbx: TComboBox; fichier: String);
var
  f: TextFile;
  ligne: string;
  OutPutList : TStringList;
  premiereLigne: Boolean;
Begin
  premiereLigne:= true;
  cbx.Clear;
  OutPutList:= TStringList.Create;

  // Test si le fichier existe
  if FileExists(fichier) then
  Begin
    AssignFile(f, fichier);
    reset(f);

    repeat
      readln(f, ligne);
      
      if premiereLigne then
        premiereLigne:= false
      else
      Begin
        OutPutList:= FrmOneWayTickets.Split(ligne, ';');
        cbx.Items.Add(OutPutList[0]); // Met les donn�es dans la combobox
      end;

    until eof(f);

    OutPutList.free;
    CloseFile(f);
    cbx.ItemIndex:= 0;
  end;
end;

{ ****************************************************************************
  *** S�lectionne le bon �l�ment                                           ***
  *** @params TCombobox cbs - Combobox o� l'on cherche notre �l�ment       ***
  *** @params string item - nom de l'�l�ment choisi                        ***
  **************************************************************************** }
procedure selectionneItemCombobox(cbx: TCombobox; item: string);
var
  i: integer;
Begin
  i:= 0;
  
  while cbx.Items[i] <> item do
  Begin
    inc(i);
  end;

  cbx.ItemIndex:= i;
end;

{ ****************************************************************************
  *** Ouvre les param�tres de modifications                                ***
  **************************************************************************** }
procedure TFrmGestionSeances.BtnModifierClick(Sender: TObject);
var
  index, i: integer;
  tmpJour : integer;
begin

  // R�cup�re l'index de l'�l�ment s�lectionner
  index:= LbxListeSeances.ItemIndex;

  // Charge les �l�ments des checkbox et s�lectionne les bons �l�ments
  donneDansComboBox(CbxFilm, FICHIER_FILMS);
  selectionneItemCombobox(CbxFilm, listeSeances[index].film);
  donneDansComboBox(CbxSalle, FICHIER_SALLES);
  selectionneItemCombobox(CbxSalle, listeSeances[index].salle);

  // Initialise les champs des horaires
  edtHeure1.Text:= listeSeances[index].heure1;
  edtHeure2.Text:= listeSeances[index].heure2;
  edtHeure3.Text:= listeSeances[index].heure3;
  edtHeure4.Text:= listeSeances[index].heure4;

  // Initialise tous les checkbox a z�ro
  ChxLundi.Checked:= false;
  ChxMardi.Checked:= false;
  ChxMercredi.Checked:= false;
  ChxJeudi.Checked:= false;
  ChxVendredi.Checked:= false;
  ChxSamedi.Checked:= false;
  ChxDimanche.Checked:= false;

  // R�cup�re les jours de diffusion
  for i:= 1 to length(listeSeances[index].jourDiff) do
  Begin
    tmpJour:= StrToInt(listeSeances[index].jourDiff[i]);
    case tmpJour of
      1 : ChxLundi.Checked:= true;
      2 : ChxMardi.Checked:= true;
      3 : ChxMercredi.Checked:= true;
      4 : ChxJeudi.Checked:= true;
      5 : ChxVendredi.Checked:= true;
      6 : ChxSamedi.Checked:= true;
      7 : ChxDimanche.Checked:= true;
    end;
  end;


  self.Height:= FRM_WIDTH_MAX;
  changeEtat(false);
end;

{ ****************************************************************************
  *** Annule les modification                                              ***
  **************************************************************************** }
procedure TFrmGestionSeances.BtnAnuulerClick(Sender: TObject);
begin
  changeEtat(true);
  self.Height:= FRM_WIDTH_MIN;
end;

{ ****************************************************************************
  *** Ouvre la fen�tre pour ajouter une s�ance                             ***
  **************************************************************************** }
procedure TFrmGestionSeances.BtnAjouterClick(Sender: TObject);
var
  CleVal: TCleVal;
  NomSection: String;
  chxList: TList;
begin
  // Initialise les donn�es de la fen�tre
  donneDansComboBox(FrmAjouterSeance.CbxFilms, FICHIER_FILMS);
  donneDansComboBox(FrmAjouterSeance.CbxSalles, FICHIER_SALLES);

  with FrmAjouterSeance do
  Begin
    edtHeure1.Text:= '';
    edtHeure2.Text:= '';
    edtHeure3.Text:= '';
    edtHeure4.Text:= '';

    ChxLundi.Checked:= false;
    ChxMardi.Checked:= false;
    ChxMercredi.Checked:= false;
    ChxJeudi.Checked:= false;
    ChxVendredi.Checked:= false;
    ChxSamedi.Checked:= false;
    ChxDimanche.Checked:= false;

  end;
  
  if FrmAjouterSeance.showModal = mrOk then
  Begin
    // Initialisation des valeurs a sauvegarder dans le fichier INI
    CleVal[0][0]:= 'Film';
    CleVal[0][1]:= FrmAjouterSeance.CbxFilms.Items[FrmAjouterSeance.CbxFilms.ItemIndex];

    CleVal[1][0]:= 'Salle';
    CleVal[1][1]:= FrmAjouterSeance.CbxSalles.Items[FrmAjouterSeance.CbxSalles.ItemIndex];

    CleVal[2][0]:= 'JourDiff';
    CleVal[2][1]:= '';

    chxList:= TList.Create;
    chxList.Add(FrmAjouterSeance.ChxLundi);
    chxList.Add(FrmAjouterSeance.ChxMardi);
    chxList.Add(FrmAjouterSeance.ChxMercredi);
    chxList.Add(FrmAjouterSeance.ChxJeudi);
    chxList.Add(FrmAjouterSeance.ChxVendredi);
    chxList.Add(FrmAjouterSeance.ChxSamedi);
    chxList.Add(FrmAjouterSeance.ChxDimanche);
    CleVal[2][1]:= jourEnNombre(chxList);
    chxList.Free;

    CleVal[3][0]:= 'Heure1';
    CleVal[3][1]:= FrmAjouterSeance.edtHeure1.Text;

    CleVal[4][0]:= 'Heure2';
    CleVal[4][1]:= FrmAjouterSeance.edtHeure2.Text;

    CleVal[5][0]:= 'Heure3';
    CleVal[5][1]:= FrmAjouterSeance.edtHeure3.Text;

    CleVal[6][0]:= 'Heure4';
    CleVal[6][1]:= FrmAjouterSeance.edtHeure4.Text;

    CleVal[7][0]:= 'Diffuser';
    CleVal[7][1]:= '1';

    //Compte le nombre de section existante
    NomSection:= IntToStr(compteSectionIni(FICHIER_SEANCES) + 1);

    if sauvegardeIni(FICHIER_SEANCES, NomSection, CleVal) then
      ShowMessage('S�ance ajout�e avec succ� !')
    else
      ShowMessage('Une erreur est survenue lors de la suppression !');

    chargeListeSeances();
  end;
end;


{ ****************************************************************************
  *** Procedure de la validation de la modification                        ***
  **************************************************************************** }
procedure TFrmGestionSeances.BtnValiderModificationClick(Sender: TObject);
var
  index: integer;
  chxList: TList;
  CleVal: TCleVal;
begin
  // Initialisation
  index:= LbxListeSeances.ItemIndex;

  // Initialisation des valeurs a sauvegarder dans le fichier INI
  CleVal[0][0]:= 'Film';
  CleVal[0][1]:= CbxFilm.Items[CbxFilm.ItemIndex];

  CleVal[1][0]:= 'Salle';
  CleVal[1][1]:= CbxSalle.Items[CbxSalle.ItemIndex];

  CleVal[2][0]:= 'JourDiff';
  chxList:= TList.Create;
  chxList.Add(ChxLundi);
  chxList.Add(ChxMardi);
  chxList.Add(ChxMercredi);
  chxList.Add(ChxJeudi);
  chxList.Add(ChxVendredi);
  chxList.Add(ChxSamedi);
  chxList.Add(ChxDimanche);
  CleVal[2][1]:= jourEnNombre(chxList);
  chxList.Free;

  CleVal[3][0]:= 'Heure1';
  CleVal[3][1]:= edtHeure1.Text;

  CleVal[4][0]:= 'Heure2';
  CleVal[4][1]:= edtHeure2.Text;

  CleVal[5][0]:= 'Heure3';
  CleVal[5][1]:= edtHeure3.Text;

  CleVal[6][0]:= 'Heure4';
  CleVal[6][1]:= edtHeure4.Text;

  CleVal[7][0]:= 'Diffuser';
  CleVal[7][1]:= '1';

  // Sauvegarde dans le fichier
  if sauvegardeIni(FICHIER_SEANCES, IntToStr(index + 1), CleVal) then
    ShowMessage('S�ance modifi�e avec succ� !')
  else
    ShowMessage('Une erreur est survenue lors de la suppression !');

  chargeListeSeances();
  LbxListeSeances.ItemIndex:= index;
  changeEtat(true);
  Self.Height:= FRM_WIDTH_MIN;

end;

end.
