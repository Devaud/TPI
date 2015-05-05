{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Fenêtre              : GestionFilms                                  *** 
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : Donne accès au fonctionnalité de la gestion   ***
  ***                        des films                                     ***
  *** Version              : 1.0                                           ***
  *** Date de création     : 05.05.2015                                    ***
  **************************************************************************** }
unit U_OneWayTickets_GestionFilms;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

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
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnAnuulerClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure chargeListeFilm(); // Est disponible depuis l'extérieur
  end;

Type
  TFilm = record
    NomFilm  : String;
    Duree    : String;
    Prix     : String;
    Synopsis : String;
  end;

var
  FrmGestionFilms      : TFrmGestionFilms;
  listeFilms           : array of TFilm;

const
  FRM_HEIGHT_MAX : integer = 527;
  FRM_HEIGHT_MIN : integer = 358;
  FICHIER_FILMS  : String  = './Res/films.csv';

implementation

uses U_OneWayTickets_AjouterFilm, U_OneWayTicket;

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
        ligneFormate:= ajusterText(OutPutList[0], 10) + AjoutEspace(10);
        ligneFormate:= ligneFormate + AjoutEspace(10) + OutPutList[1] + AjoutEspace(10);
        ligneFormate:= ligneFormate + AjoutEspace(10) + ajusterText(OutPutList[2], 32) + AjoutEspace(10);
        ligneFormate:= ligneFormate + AjoutEspace(10) + OutPutList[3];

        // Assigne les films a la liste
        listeFilms[i].NomFilm:= OutPutList[0];
        listeFilms[i].Duree:= OutPutList[1];
        listeFilms[i].Synopsis:= OutPutList[2];
        listeFilms[i].Prix:= OutPutList[3];

        LbxListeFilms.Items.Add(ligneFormate);
      end;
        
    until eof(f);

    OutPutList.free;

    CloseFile(f);
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

  self.Height:= FRM_HEIGHT_MAX;
end;

{ ****************************************************************************
  *** Annule les modification                                              ***
  **************************************************************************** }
procedure TFrmGestionFilms.BtnAnuulerClick(Sender: TObject);
begin
  self.Height:= FRM_HEIGHT_MIN;
end;

{ ****************************************************************************
  *** Ouvre la fenêtre pour ajouter un film                               ***
  **************************************************************************** }
procedure TFrmGestionFilms.BtnAjouterClick(Sender: TObject);
var
  film: String; // Contient tous les éléments prêt pour être mis dans un fichier text
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
    // Initialise la ligne qui sera enregistrée dans le fichier
    film:= FrmAjouterFilm.edtNomFilm.Text + ';' + FrmAjouterFilm.edtDureeFilm.Text + ';' +
      FrmAjouterFilm.MmoSynopsis.Text + ';' + FrmAjouterFilm.edtPrixFilm.Text;

    // Test si le fichier existe
    if FileExists(FICHIER_FILMS) then
    Begin
      AssignFile(f, FICHIER_FILMS);
      Append(f);
      Writeln(f, film);
      CloseFile(f);
      ShowMessage('Film ajouté avec succès !');
    end;

    chargeListeFilm();
  end;
end;

end.
