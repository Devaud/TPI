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
    CbxLundi: TCheckBox;
    CbxSamedi: TCheckBox;
    CbxVendredi: TCheckBox;
    CbxDimanche: TCheckBox;
    CbxMardi: TCheckBox;
    CbxMercredi: TCheckBox;
    CbxJeudi: TCheckBox;
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
  *** Charge et affiche les seances depuis un fichier ini                  ***
  **************************************************************************** }
procedure TFrmGestionSeances.chargeListeSeances();
var
  fichierIni : TIniFile;
  Sections, dataSection : TStringList;
  ligneFormate: String;
  jourDiff: String;
  i: integer;
Begin
  //Initialisation
  SetLength(listeSeances, 250);

  // Lecture du fichier INI
  fichierIni:= TIniFile.Create(FICHIER_SEANCES);
  Sections:= TStringList.Create;
  dataSection:= TStringList.Create;
  
  fichierIni.ReadSections(Sections);

  for i:= 0 to Sections.Count - 1 do
  Begin
    fichierIni.ReadSection(Sections[i], dataSection);

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
  

    ligneFormate:= AjusterText(ListeSeances[i].film, 15) + AjoutEspace(25);
    ligneFormate:= ligneFormate + AjusterText(ListeSeances[i].salle, 10) + AjoutEspace(30);


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

procedure TFrmGestionSeances.BtnModifierClick(Sender: TObject);
begin
  self.Height:= FRM_WIDTH_MAX;
end;

procedure TFrmGestionSeances.BtnAnuulerClick(Sender: TObject);
begin
  self.Height:= FRM_WIDTH_MIN;
end;

{ ****************************************************************************
  *** Ouvre la fen�tre pour ajouter une s�ance                             ***
  **************************************************************************** }
procedure TFrmGestionSeances.BtnAjouterClick(Sender: TObject);
var
  CleVal: TCleVal;
  NomSection: String;
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

    // Test les checkbox qui sont coch�es
    if FrmAjouterSeance.ChxLundi.Checked then
      CleVal[2][1]:= CleVal[2][1] + '1';

    if FrmAjouterSeance.ChxMardi.Checked then
      CleVal[2][1]:= CleVal[2][1] + '2';

    if FrmAjouterSeance.ChxMercredi.Checked then
      CleVal[2][1]:= CleVal[2][1] + '3';

    if FrmAjouterSeance.ChxJeudi.Checked then
      CleVal[2][1]:= CleVal[2][1] + '4';

    if FrmAjouterSeance.ChxVendredi.Checked then
      CleVal[2][1]:= CleVal[2][1] + '5';

    if FrmAjouterSeance.ChxSamedi.Checked then
      CleVal[2][1]:= CleVal[2][1] + '6';

    if FrmAjouterSeance.ChxDimanche.Checked then
      CleVal[2][1]:= CleVal[2][1] + '7';

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
  end;
end;

end.
