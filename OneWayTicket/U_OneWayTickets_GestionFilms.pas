{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Fen�tre              : GestionFilms                                  *** 
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : Donne acc�s au fonctionnalit� de la gestion   ***
  ***                        des films                                     ***
  *** Version              : 1.0                                           ***
  *** Date de cr�ation     : 05.05.2015                                    ***
  ***         Modification :                                               ***
  ***           06.05.2015 - AD - Modification de la modification          ***
  ***                             Ajout de la suppression des films        ***
  **************************************************************************** }
unit U_OneWayTickets_GestionFilms;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ComCtrls;

type
  TFrmGestionFilms = class(TForm)
    Label1: TLabel;
    LbxListeFilms: TListBox;
    BtnModifier: TButton;
    BtnSupprimer: TButton;
    BtnAjouter: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtNomFilm: TEdit;
    edtDureeFilm: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    MmoSynopsis: TMemo;
    BtnValiderModification: TButton;
    BtnAnuuler: TButton;
    edtPrixFilm: TEdit;
    Label5: TLabel;
    UDDuree: TUpDown;
    UDPrix: TUpDown;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnAnuulerClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure edtDureeFilmChange(Sender: TObject);
    procedure edtDureeFilmKeyPress(Sender: TObject; var Key: Char);
    procedure testEdit();
    procedure MmoSynopsisChange(Sender: TObject);
    procedure BtnValiderModificationClick(Sender: TObject);
    procedure changeEtat(active: boolean);
    procedure BtnSupprimerClick(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    procedure chargeListeFilm(); // Est disponible depuis l'ext�rieur
  end;

// Information sur un film
Type
  TFilm = record
    NomFilm  : String;
    Duree    : String;
    Prix     : String;
    Synopsis : String;
  end;

var
  FrmGestionFilms      : TFrmGestionFilms;
  listeFilms           : array of TFilm; // Enregistre tous les films pour une modification future

const
  FRM_HEIGHT_MAX : integer = 584;
  FRM_HEIGHT_MIN : integer = 358;
  FICHIER_FILMS  : String  = './Res/films.csv';

implementation

uses U_OneWayTickets_AjouterFilm, U_OneWayTicket;

{$R *.DFM}


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
  *** Change l'�tat des �l�ments                                           ***
  *** @params Boolean active - true ou false                               ***
  **************************************************************************** }
procedure TFrmGestionFilms.changeEtat(active: boolean);
Begin
  LbxListeFilms.Enabled:= active;
  BtnModifier.Enabled:= active;
  BtnAjouter.Enabled:= active;
  BtnSupprimer.Enabled:= active;
end;

{ ****************************************************************************
  *** Ecrit dans le fichier text                                           ***
  *** @params array of TFilm films - Liste des films qui seront �crit      ***
  *** @params string fichier - Chemin du fichier                           ***
  *** @Result Boolean - Retourne vrai si l'�criture c'est bien pass�e      ***
  **************************************************************************** }
function ecritDansFichier(films: array of TFilm; fichier: string):Boolean;
var
  f: TextFile;
  film: string;
  index: integer;
  success: boolean;
Begin
  success:= false;
  
  if FileExists(fichier) then
  Begin
    AssignFile(f, fichier);
    rewrite(f);
    writeln(f, 'NomFilm;Duree;Synopsis;Prix'); // Ecrit la premi�re ligne
    index:= 0;

    // Parcoure le tableau et �crit les films dane le fichier
    while (films[index].NomFilm <> '') and (index < length(films)) do
    Begin
      film:= films[index].NomFilm + ';' + films[index].Duree + ';' +
        films[index].Synopsis + ';' + films[index].Prix;
      writeln(f, film);
      inc(index);
    end;

    CloseFile(f);

    success:= true;
  end;

  Result:= success;
end;

{ ****************************************************************************
  *** Permet de tester si les champs sont remplis                          ***
  **************************************************************************** }
procedure TFrmGestionFilms.testEdit();
Begin
  if (Length(edtNomFilm.Text) > 0) and (Length(edtDureeFilm.Text) > 0) and
    (Length(edtPrixFilm.Text) > 0) and (Length(MmoSynopsis.Text) > 0) then
    BtnValiderModification.Enabled:= true
  else
    BtnValiderModification.Enabled:= false;
end;

{ ****************************************************************************
  *** Charge et affiche les films depuis un fichier csv                    ***   
  **************************************************************************** }
procedure TFrmGestionFilms.chargeListeFilm();
var
  f: TextFile;
  ligne, ligneFormate : String;
  OutPutList : TStringList;
  premiereLigne : boolean;
  i: integer;
Begin
  premiereLigne:= true;
  LbxListeFilms.Clear;
  SetLength(listeFilms, 250);
  i:= 0;
  
  // Test si le fichier existe
  if FileExists(FICHIER_FILMS) then
  Begin
    OutPutList:= TStringList.Create;
    // Assigne le fichier
    AssignFile(f, FICHIER_FILMS);
    Reset(f);
    repeat
      Readln(f, ligne);

      if premiereLigne then
        premiereLigne:= false
      else
      Begin
        OutPutList:= FrmOneWayTickets.Split(ligne, ';');

        // Formate le text
        ligneFormate:= ajusterText(OutPutList[0], 15) + AjoutEspace(5);
        ligneFormate:= ligneFormate + AjoutEspace(10) + OutPutList[1] + AjoutEspace(10);
        ligneFormate:= ligneFormate + AjoutEspace(10) + ajusterText(OutPutList[2], 32) + AjoutEspace(10);
        ligneFormate:= ligneFormate + AjoutEspace(10) + OutPutList[3];

        // Assigne les films a la liste
        listeFilms[i].NomFilm:= OutPutList[0];
        listeFilms[i].Duree:= OutPutList[1];
        listeFilms[i].Synopsis:= OutPutList[2];
        listeFilms[i].Prix:= OutPutList[3];

        LbxListeFilms.Items.Add(ligneFormate);
        inc(i);
      end;
        
    until eof(f);

    OutPutList.free;

    CloseFile(f);
  end;
end;

{ ****************************************************************************
  *** Ouvre les param�tres de modifications                                ***
  **************************************************************************** }
procedure TFrmGestionFilms.BtnModifierClick(Sender: TObject);
var
  index : integer;
begin
  // R�cup�re l'indice
  index:= LbxListeFilms.ItemIndex;

  // Affiche les donn�es dans les bon champs
  edtNomFilm.Text:= listefilms[index].NomFilm;
  edtDureeFilm.Text:= listefilms[index].Duree;
  edtPrixFilm.Text:= listeFilms[index].Prix;
  MmoSynopsis.Text:= listefilms[index].Synopsis;

  changeEtat(false);
  self.Height:= FRM_HEIGHT_MAX;
end;

{ ****************************************************************************
  *** Annule les modification                                              ***
  **************************************************************************** }
procedure TFrmGestionFilms.BtnAnuulerClick(Sender: TObject);
begin
  changeEtat(true);
  self.Height:= FRM_HEIGHT_MIN;
end;

{ ****************************************************************************
  *** Ouvre la fen�tre pour ajouter un film                               ***
  **************************************************************************** }
procedure TFrmGestionFilms.BtnAjouterClick(Sender: TObject);
var
  film: String; // Contient tous les �l�ments pr�t pour �tre mis dans un fichier text
  f: TextFile;
begin
  // Initialisation des composants
  with FrmAjouterFilm do
  Begin
    edtNomFilm.Text:= '';
    edtDureeFilm.Text:= '90';
    edtPrixFilm.Text:= '5';
    MmoSynopsis.Clear;
  end;
  
  if FrmAjouterFilm.showModal = mrOk then
  Begin
    // Initialise la ligne qui sera enregistr�e dans le fichier
    film:= FrmAjouterFilm.edtNomFilm.Text + ';' + FrmAjouterFilm.edtDureeFilm.Text + ';' +
      FrmAjouterFilm.MmoSynopsis.Text + ';' + FrmAjouterFilm.edtPrixFilm.Text;

    // Test si le fichier existe
    if FileExists(FICHIER_FILMS) then
    Begin
      AssignFile(f, FICHIER_FILMS);
      Append(f);
      Writeln(f, film);
      CloseFile(f);
      ShowMessage('Film ajout� avec succ�s !');
    end;

    chargeListeFilm();
  end;
end;

{ ****************************************************************************
  *** Test de la valeur des champs text                                    ***
  **************************************************************************** }
procedure TFrmGestionFilms.edtDureeFilmChange(Sender: TObject);
begin
  if ((Sender as TEdit).Name = 'edtDureeFilm') or ((Sender as TEdit).Name = 'edtPrixFilm') then
    if StrToInt((Sender as TEdit).Text) > 400 then
      (Sender as TEdit).Text:= '10';

  testEdit();
end;

{ ****************************************************************************
  *** Filtre les caract�res d'un champ text                                ***
  **************************************************************************** }
procedure TFrmGestionFilms.edtDureeFilmKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in['0'..'9']) then
    key:= #0; 
end;

{ ****************************************************************************
  *** Proc�dure lors d'un changement dans le memo                          ***
  **************************************************************************** }
procedure TFrmGestionFilms.MmoSynopsisChange(Sender: TObject);
begin
  testEdit();
end;

{ ****************************************************************************
  *** Procedure de la validation de la modification                        ***
  **************************************************************************** }
procedure TFrmGestionFilms.BtnValiderModificationClick(Sender: TObject);
var
  index: integer;
begin
  index:= LbxListeFilms.ItemIndex;

  // R�cup�re les informations du film modifier et les mets dans le tableau
  listeFilms[index].NomFilm:= edtNomFilm.Text;
  listeFilms[index].Duree:= edtDureeFilm.Text;
  listeFilms[index].Prix:= edtPrixFilm.Text;
  listeFilms[index].Synopsis:= MmoSynopsis.Text;


  if ecritDansFichier(listeFilms, FICHIER_FILMS) then
    ShowMessage('Modification effectu�e avec succ�s !')
  else
    ShowMessage('Une erreur est survenue lors de la suppression !');

  chargeListeFilm(); // Charge la nouvelle liste
  
  // Remet la fen�tre comme elle se trouve au d�part
  changeEtat(true);
  LbxListeFilms.ItemIndex:= 0;
  self.Height:= FRM_HEIGHT_MIN;
end;

{ ****************************************************************************
  *** Procedure de la suppression                                          ***
  **************************************************************************** }
procedure TFrmGestionFilms.BtnSupprimerClick(Sender: TObject);
var
  index, i: integer;
  tabPropre: array of TFilm;
begin
  // Initialisation des variables
  SetLength(tabPropre, length(listeFilms));
  index:= LbxListeFilms.ItemIndex;

  // "Suppresion" du film
  listeFilms[index].NomFilm:= '';
  listeFilms[index].Duree:= '';
  listeFilms[index].Prix:= '';
  listeFilms[index].Synopsis:= '';

  index:= 0;
  // Nettoyage du tableau (Enl�ve l'�l�ment vide)
  for i:= 0 to length(listeFilms) - 1 do
  Begin
    if listeFilms[i].NomFilm <> '' then
    Begin
      tabPropre[index].NomFilm:= listeFilms[i].NomFilm;
      tabPropre[index].Duree:= listeFilms[i].Duree;
      tabPropre[index].Prix:= listeFilms[i].Prix;
      tabPropre[index].Synopsis:= listeFilms[i].Synopsis;
      inc(index);
    end;
  end;

  if ecritDansFichier(tabPropre, FICHIER_FILMS) then
    ShowMessage('Le film a bien �t� supprim� !')
  else
    ShowMessage('Une erreur est survenue lors de la suppression !');

  chargeListeFilm();
end;

end.
