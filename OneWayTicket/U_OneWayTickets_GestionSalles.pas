{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Fenêtre              : GestionSalles                                 *** 
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : Donne accès au fonctionnalité de la gestion   ***
  ***                        des salles                                    ***
  *** Version              : 1.0                                           ***
  *** Date de création     : 05.05.2015                                    ***
  ***         Modification :                                               ***
  ***           06.05.2015 - AD - Ajout de l'ajout d'une salle             ***
  ***                             Ajout de la modification d'une salle     ***
  ***                             Ajout de la suppression d'une salle      ***
  ***                             Ajout de la sécurité et de l'affichage   ***
  **************************************************************************** }
unit U_OneWayTickets_GestionSalles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, U_FP;

type
  TFrmGestionSalles = class(TForm)
    Label2: TLabel;
    LbxListeSalles: TListBox;
    BtnModifier: TButton;
    BtnSupprimer: TButton;
    BtnAjouter: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    edtNomSalle: TEdit;
    edtPlacesMax: TEdit;
    BtnValiderModification: TButton;
    BtnAnuuler: TButton;
    UDPlacesMax: TUpDown;
    Label7: TLabel;
    Label6: TLabel;
    procedure BtnAnuulerClick(Sender: TObject);
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure testEdit();
    procedure edtNomSalleChange(Sender: TObject);
    procedure edtPlacesMaxKeyPress(Sender: TObject; var Key: Char);
    procedure changeEtat(active: boolean);
    procedure BtnValiderModificationClick(Sender: TObject);
    procedure BtnSupprimerClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure chargeListeSalles();
  end;





var
  FrmGestionSalles : TFrmGestionSalles;
  listeSalles       : array of TSalle;

const
  FRM_HEIGHT_MAX : integer = 487;
  FRM_HEIGHT_MIN : integer = 358;

implementation

uses U_OneWayTickets_AjouterSalle, U_OneWayTicket;

{$R *.DFM}


{ ****************************************************************************
  *** Change l'état des éléments                                           ***
  *** @params Boolean active - true ou false                               ***
  **************************************************************************** }
procedure TFrmGestionSalles.changeEtat(active: boolean);
Begin
  LbxListeSalles.Enabled:= active;
  BtnModifier.Enabled:= active;
  BtnAjouter.Enabled:= active;
  BtnSupprimer.Enabled:= active;
end;

{ ****************************************************************************
  *** Permet de tester si les champs sont remplis                          ***
  **************************************************************************** }
procedure TFrmGestionSalles.testEdit();
Begin
  if (Length(edtNomSalle.Text) > 0) and (Length(edtPlacesMax.Text) > 0) then
    BtnValiderModification.Enabled:= true
  else
    BtnValiderModification.Enabled:= false;
end;

{ ****************************************************************************
  *** Charge et affiche les salles depuis un fichier csv                   ***   
  **************************************************************************** }
procedure TFrmGestionSalles.chargeListeSalles();
var
  ligneFormate : String;
  OutPutList : TStringList;
  valeur: TValeur;
  i: integer;
Begin
  LbxListeSalles.Clear;
  SetLength(listeSalles, 250);

  // Charge les valeurs du ficheir salles
  valeur:= lireFichier(FICHIER_SALLES);
  for i:= 1 to length(valeur) do
  Begin
    // Test s'il y a une valeur
    if valeur[i] = '' then
      break;

    // Split la ligne
    OutPutList:= Split(valeur[i], ';');

    // Formate le text pour l'affichage
    ligneFormate:= ajusterText(OutPutList[0], 20) + AjoutEspace(28);
    ligneFormate:= ligneFormate + AjoutEspace(38) + OutPutList[1];
    LbxListeSalles.Items.Add(ligneFormate);

    //Met les données dans la liste
    listeSalles[i - 1].NomSalle:= OutPutList[0];
    listeSalles[i - 1].Places:= OutPutList[1];
  end;

end;

{ ****************************************************************************
  *** Annule les modification                                              ***
  **************************************************************************** }
procedure TFrmGestionSalles.BtnAnuulerClick(Sender: TObject);
begin
  changeEtat(true);
  self.Height:= FRM_HEIGHT_MIN;
end;

{ ****************************************************************************
  *** Ouvre les paramètres de modifications                                ***
  **************************************************************************** }
procedure TFrmGestionSalles.BtnModifierClick(Sender: TObject);
var
  index: integer;
begin
  // Récupère l'indice
  index:= LbxListeSalles.ItemIndex;

  // Affiche les données dans les bon champs
  edtNomSalle.Text:= listeSalles[index].NomSalle;
  edtPlacesMax.Text:= listeSalles[index].Places;

  changeEtat(false);
  self.Height:= FRM_HEIGHT_MAX;
end;

{ ****************************************************************************
  *** Ouvre la fenêtre pour ajouter une salles                             ***
  **************************************************************************** }
procedure TFrmGestionSalles.BtnAjouterClick(Sender: TObject);
var
  valeurs: array [0..1] of string;
begin
  with FrmAjouterSalle do
  Begin
    edtNomSalle.Text:= '';
    edtPlacesMax.Text:= '1';
  end;
  
  if FrmAjouterSalle.showModal = mrOk then
  Begin
    // Initialise les valeurs
    valeurs[0]:= FrmAjouterSalle.edtNomSalle.Text;
    valeurs[1]:= FrmAjouterSalle.edtPlacesMax.Text;

    if ajoutUneLigne(valeurs, FICHIER_SALLES) then
      ShowMessage('Salle ajoutée avec succès !')
    else
      ShowMessage('Une erreur est survenue lors de la suppression !');

    chargeListeSalles();
  end;
end;

{ ****************************************************************************
  *** Procédure lors d'un changement dans un edit                          ***
  **************************************************************************** }
procedure TFrmGestionSalles.edtNomSalleChange(Sender: TObject);
begin
  if (Sender as TEdit).Name = 'edtPlacesMax' then
    if StrToInt((Sender as TEdit).Text) > 500 then
      (Sender as TEdit).Text:= '50';

  testEdit();
end;

{ ****************************************************************************
  *** Filtre les caractères d'un champ text                                ***
  **************************************************************************** }
procedure TFrmGestionSalles.edtPlacesMaxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in['0'..'9']) then
    key:= #0;
end;

{ ****************************************************************************
  *** Procedure de la validation de la modification                        ***
  **************************************************************************** }
procedure TFrmGestionSalles.BtnValiderModificationClick(Sender: TObject);
var
  index, i: integer;
  valeurs: TValeurs;
begin
  index:= LbxListeSalles.ItemIndex;
  setLength(valeurs, length(listeSalles) + 1, 2);

  // Récupère les informations du film modifier et les mets dans le tableau
  listeSalles[index].NomSalle:= edtNomSalle.Text;
  listeSalles[index].Places:= edtPlacesMax.Text;

  // Initialise le tableau pour écrire dans le fichier
  valeurs[0][0]:= 'NomSalle';
  valeurs[0][1]:= 'Places';
  for i:= 0 to length(listeSalles) - 1 do
  Begin
    valeurs[i + 1][0]:= listeSalles[i].NomSalle;
    valeurs[i + 1][1]:= listeSalles[i].Places;
  end;

  if ecritDansFichier(valeurs, FICHIER_SALLES) then
    ShowMessage('Modification effectuée avec succès !')
  else
    ShowMessage('Une erreur est survenue lors de la suppression !');

  chargeListeSalles(); // Charge la nouvelle liste
  
  // Remet la fenêtre comme elle se trouve au départ
  changeEtat(true);
  self.Height:= FRM_HEIGHT_MIN;
end;

{ ****************************************************************************
  *** Procedure de la suppression                                          ***
  **************************************************************************** }
procedure TFrmGestionSalles.BtnSupprimerClick(Sender: TObject);
var
  index, i: integer;
  valeurs: TValeurs;
begin
  // Initialisation des variables
  setLength(valeurs, length(listeSalles) + 1, 2);
  index:= LbxListeSalles.ItemIndex;

  // "Suppresion" du film
  listeSalles[index].NomSalle:= '';
  listeSalles[index].Places:= '';

  index:= 0;
  valeurs[0][0]:= 'NomSalle';
  valeurs[0][1]:= 'Places';

  // Nettoyage du tableau (Enlève l'élément vide)
  for i:= 0 to length(listeSalles) - 1 do
  Begin
    if listeSalles[i].NomSalle <> '' then
    Begin
      valeurs[index + 1][0]:= listeSalles[i].NomSalle;
      valeurs[index + 1][1]:= listeSalles[i].Places;
      inc(index);
    end;
  end;

  if ecritDansFichier(valeurs, FICHIER_SALLES) then
    ShowMessage('La salle a bien étée supprimée !')
  else
    ShowMessage('Une erreur est survenue lors de la suppression !');

  chargeListeSalles();
end;

end.
