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
  StdCtrls, ComCtrls;

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

// Information sur une salle
Type
  TSalle = Record
    NomSalle : String;
    Places   : String;
  end;

var
  FrmGestionSalles : TFrmGestionSalles;
  listeSalles       : array of TSalle;

const
  FRM_HEIGHT_MAX : integer = 487;
  FRM_HEIGHT_MIN : integer = 358;
  FICHIER_SALLES : String  = './Res/salles.csv';

implementation

uses U_OneWayTickets_AjouterSalle, U_OneWayTicket;

{$R *.DFM}

{ ****************************************************************************
  *** Ajout un nombre d'espace avant ou après le text                      ***
  *** @params String text - Text qui va prendre des espaces                ***
  *** @params Boolean avant - La modification doit être placée avant ou    ***
  ***                         apres                                        ***
  *** @params Integer tailleEspace - Nombre d'espace souhaité              ***
  *** @Result string - Retourne le text modifié                            ***
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
  *** @params String text - Text qui va être ajusté                        ***
  *** @params Integer taille - Taille final souhaitée                      ***
  *** @Result string - Retourne le text modifié                            ***
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
  *** Ecrit dans le fichier text                                           ***
  *** @params array of TFilm films - Liste des films qui seront écrit      ***
  *** @params string fichier - Chemin du fichier                           ***
  *** @Result Boolean - Retourne vrai si l'écriture c'est bien passée      ***
  **************************************************************************** }
function ecritDansFichier(salles: array of TSalle; fichier: string):Boolean;
var
  f: TextFile;
  salle: string;
  index: integer;
  success: boolean;
Begin
  success:= false;
  
  if FileExists(fichier) then
  Begin
    AssignFile(f, fichier);
    rewrite(f);
    writeln(f, 'NomSalle;Places'); // Ecrit la première ligne
    index:= 0;

    // Parcoure le tableau et écrit les films dane le fichier
    while (salles[index].NomSalle <> '') and (index < length(salles)) do
    Begin
      salle:= salles[index].NomSalle + ';' + salles[index].Places;
      writeln(f, salle);
      inc(index);
    end;

    CloseFile(f);

    success:= true;
  end;

  Result:= success;
end;

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
  f: TextFile;
  ligne, ligneFormate : String;
  OutPutList : TStringList;
  premiereLigne : boolean;
  i: integer;
Begin
  premiereLigne:= true;
  LbxListeSalles.Clear;
  SetLength(listeSalles, 250);
  i:= 0;
  
  // Test si le fichier existe
  if FileExists(FICHIER_SALLES) then
  Begin
    // Assigne le fichier
    AssignFile(f, FICHIER_SALLES);
    Reset(f);
    repeat
      Readln(f, ligne);

      if premiereLigne then
        premiereLigne:= false
      else
      Begin
        OutPutList:= FrmOneWayTickets.Split(ligne, ';');

        // Formate le text
        ligneFormate:= ajusterText(OutPutList[0], 20) + AjoutEspace(28);
        ligneFormate:= ligneFormate + AjoutEspace(38) + OutPutList[1];

        // Assigne les films a la liste
        listeSalles[i].NomSalle:= OutPutList[0];
        listeSalles[i].Places:= OutPutList[1];

        LbxListeSalles.Items.Add(ligneFormate);
        inc(i);
      end;
        
    until eof(f);

    OutPutList.free;

    CloseFile(f);
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
  salle : string;
  f: TextFile;
begin
  with FrmAjouterSalle do
  Begin
    edtNomSalle.Text:= '';
    edtPlacesMax.Text:= '1';
  end;
  
  if FrmAjouterSalle.showModal = mrOk then
  Begin
    // Initialise la ligne qui sera enregistrée dans le fichier
    salle:= FrmAjouterSalle.edtNomSalle.Text + ';' + FrmAjouterSalle.edtPlacesMax.Text;

    // Test si le fichier existe
    if FileExists(FICHIER_SALLES) then
    Begin
      AssignFile(f, FICHIER_SALLES);
      Append(f);
      Writeln(f, salle);
      CloseFile(f);
      ShowMessage('Salle ajoutée avec succès !');
    end;

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
  index: integer;
begin
  index:= LbxListeSalles.ItemIndex;

  // Récupère les informations du film modifier et les mets dans le tableau
  listeSalles[index].NomSalle:= edtNomSalle.Text;
  listeSalles[index].Places:= edtPlacesMax.Text;

  if ecritDansFichier(listeSalles, FICHIER_SALLES) then
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
  tabPropre: array of TSalle;
begin
  // Initialisation des variables
  SetLength(tabPropre, length(listeSalles));
  index:= LbxListeSalles.ItemIndex;

  // "Suppresion" du film
  listeSalles[index].NomSalle:= '';
  listeSalles[index].Places:= '';

  index:= 0;
  // Nettoyage du tableau (Enlève l'élément vide)
  for i:= 0 to length(listeSalles) - 1 do
  Begin
    if listeSalles[i].NomSalle <> '' then
    Begin
      tabPropre[index].NomSalle:= listeSalles[i].NomSalle;
      tabPropre[index].Places:= listeSalles[i].Places;
      inc(index);
    end;
  end;

  if ecritDansFichier(tabPropre, FICHIER_SALLES) then
    ShowMessage('La salle a bien étée supprimée !')
  else
    ShowMessage('Une erreur est survenue lors de la suppression !');

  chargeListeSalles();
end;

end.
