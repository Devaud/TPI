{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Fenêtre              : GestionFilms                                  *** 
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : Donne accès au fonctionnalité de la gestion   ***
  ***                        des films                                     ***
  *** Version              : 1.0                                           ***
  *** Date de création     : 05.05.2015                                    ***
  ***         Modification :                                               ***
  ***           06.05.2015 - AD - Modification de la modification          ***
  ***                             Ajout de la suppression des films        ***
  **************************************************************************** }
unit U_OneWayTickets_GestionFilms;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ComCtrls, U_FP;

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
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure chargeListeFilm(); // Est disponible depuis l'extérieur
  end;

var
  FrmGestionFilms      : TFrmGestionFilms;
  listeFilms           : array of TFilm; // Enregistre tous les films pour une modification future

const
  FRM_HEIGHT_MAX : integer = 584;
  FRM_HEIGHT_MIN : integer = 358;

implementation

uses U_OneWayTickets_AjouterFilm, U_OneWayTicket;

{$R *.DFM}

{ ****************************************************************************
  *** Change l'état des éléments                                           ***
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
  valeur: TValeur;
  i: integer;
Begin
  premiereLigne:= true;
  LbxListeFilms.Clear;
  SetLength(listeFilms, 250);
  i:= 0;
  
  // Charge les valeurs du ficheir salles
  valeur:= lireFichier(FICHIER_FILMS);
  for i:= 1 to length(valeur) do
  Begin
    // Test s'il y a une valeur
    if valeur[i] = '' then
      break;

    // Split la ligne
    OutPutList:= Split(valeur[i], ';');

    // Formate le text pour l'affichage
    ligneFormate:= ajusterText(OutPutList[0], 15) + AjoutEspace(5);
    ligneFormate:= ligneFormate + AjoutEspace(10) + OutPutList[1] + AjoutEspace(10);
    ligneFormate:= ligneFormate + AjoutEspace(10) + ajusterText(OutPutList[2], 32) + AjoutEspace(10);
    ligneFormate:= ligneFormate + AjoutEspace(10) + OutPutList[3];
    LbxListeFilms.Items.Add(ligneFormate);

    //Met les données dans la liste
    listeFilms[i - 1].NomFilm:= OutPutList[0];
    listeFilms[i - 1].Duree:= OutPutList[1];
    listeFilms[i - 1].Synopsis:= OutPutList[2];
    listeFilms[i - 1].Prix:= OutPutList[3];
  end;
end;

{ ****************************************************************************
  *** Ouvre les paramètres de modifications                                ***
  **************************************************************************** }
procedure TFrmGestionFilms.BtnModifierClick(Sender: TObject);
var
  index : integer;
begin
  // Récupère l'indice
  index:= LbxListeFilms.ItemIndex;

  // Affiche les données dans les bon champs
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
  *** Ouvre la fenêtre pour ajouter un film                               ***
  **************************************************************************** }
procedure TFrmGestionFilms.BtnAjouterClick(Sender: TObject);
var
  valeurs: array [0..3] of String;
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

    // Initialise les valeurs
    valeurs[0]:= FrmAjouterFilm.edtNomFilm.Text;
    valeurs[1]:= FrmAjouterFilm.edtDureeFilm.Text;
    valeurs[2]:= FrmAjouterFilm.MmoSynopsis.Text;
    valeurs[3]:= FrmAjouterFilm.edtPrixFilm.Text;

    if ajoutUneLigne(valeurs, FICHIER_FILMS) then
      ShowMessage('Film ajouté avec succès !')
    else
      ShowMessage('Une erreur est survenue lors de la suppression !');

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
  *** Filtre les caractères d'un champ text                                ***
  **************************************************************************** }
procedure TFrmGestionFilms.edtDureeFilmKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in['0'..'9']) then
    key:= #0; 
end;

{ ****************************************************************************
  *** Procédure lors d'un changement dans le memo                          ***
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
  index, i: integer;
  valeurs: TValeurs;
begin
  index:= LbxListeFilms.ItemIndex;
  setLength(valeurs, length(listeFilms) + 1, 4);

  // Récupère les informations du film modifier et les mets dans le tableau
  listeFilms[index].NomFilm:= edtNomFilm.Text;
  listeFilms[index].Duree:= edtDureeFilm.Text;
  listeFilms[index].Prix:= edtPrixFilm.Text;
  listeFilms[index].Synopsis:= MmoSynopsis.Text;

  // Initialise le tableau pour écrire dans le fichier
  valeurs[0][0]:= 'NomFilm';
  valeurs[0][1]:= 'Duree';
  valeurs[0][2]:= 'Synopsis';
  valeurs[0][3]:= 'Prix';
  
  for i:= 0 to length(listeFilms) - 1 do
  Begin
    valeurs[i + 1][0]:= listeFilms[i].NomFilm;
    valeurs[i + 1][1]:= listeFilms[i].Duree;
    valeurs[i + 1][2]:= listeFilms[i].Synopsis;
    valeurs[i + 1][3]:= listeFilms[i].Prix;
  end;


  if ecritDansFichier(valeurs, FICHIER_FILMS) then
    ShowMessage('Modification effectuée avec succès !')
  else
    ShowMessage('Une erreur est survenue lors de la suppression !');

  chargeListeFilm(); // Charge la nouvelle liste
  
  // Remet la fenêtre comme elle se trouve au départ
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
  valeurs: TValeurs;
begin
  // Initialisation des variables
  setLength(valeurs, length(listeFilms) + 1, 4);
  index:= LbxListeFilms.ItemIndex;

  // "Suppresion" du film
  listeFilms[index].NomFilm:= '';
  listeFilms[index].Duree:= '';
  listeFilms[index].Prix:= '';
  listeFilms[index].Synopsis:= '';

  index:= 0;
  valeurs[0][0]:= 'NomSalle';
  valeurs[0][1]:= 'Places';

  // Nettoyage du tableau (Enlève l'élément vide)
  for i:= 0 to length(listeFilms) - 1 do
  Begin
    if listeFilms[i].NomFilm <> '' then
    Begin
      valeurs[index + 1][0]:= listeFilms[i].NomFilm;
      valeurs[index + 1][1]:= listeFilms[i].Duree;
      valeurs[index + 1][2]:= listeFilms[i].Synopsis;
      valeurs[index + 1][3]:= listeFilms[i].Prix;
      inc(index);
    end;
  end;

  if ecritDansFichier(valeurs, FICHIER_FILMS) then
    ShowMessage('Le film a bien été supprimé !')
  else
    ShowMessage('Une erreur est survenue lors de la suppression !');
    
  chargeListeFilm();
end;

end.
