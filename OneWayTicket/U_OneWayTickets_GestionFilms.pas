{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Fen�tre              : GestionFilms                                  *** 
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : Donne acc�s au fonctionnalit� de la gestion   ***
  ***                        des films                                     ***
  *** Version              : 1.0                                           ***
  *** Date de cr�ation     : 05.05.2015                                    ***
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
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    procedure chargeListeFilm(); // Est disponible depuis l'ext�rieur
  end;

var
  FrmGestionFilms: TFrmGestionFilms;

const
  FRM_HEIGHT_MAX : integer = 527;
  FRM_HEIGHT_MIN : integer = 358;
  FICHIER_FILMS   : String  = './Res/films.csv';

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
  i, aAjouter: integer;
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
  *** Charge et affiche les films depuis un fichier csv                    ***   
  **************************************************************************** }
procedure TFrmGestionFilms.chargeListeFilm();
var
  f: TextFile;
  ligne, ligneFormate : String;
  OutPutList : TStringList;
  premiereLigne : boolean;
Begin
  premiereLigne:= true;
  LbxListeFilms.Clear;
  
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
        ligneFormate:= OutPutList[0] + AjoutEspace(10);
        ligneFormate:= ligneFormate + AjoutEspace(10) + OutPutList[1] + AjoutEspace(10);
        ligneFormate:= ligneFormate + AjoutEspace(10) + OutPutList[2] + AjoutEspace(10) ;
        ligneFormate:= ligneFormate + AjoutEspace(10) + OutPutList[3];
        
        LbxListeFilms.Items.Add(ligneFormate);
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
begin
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

end.
