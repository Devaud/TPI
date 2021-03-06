{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Fen�tre              : Menu administrateur                           *** 
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : Permet la gestion admin et de visionner les   ***
  ***                        statistique de vente                          ***
  *** Version              : 1.0                                           ***
  *** Date de cr�ation     : 05.05.2015                                    ***
  **************************************************************************** }
unit U_OneWayTickets_MenuAdministrateur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus;

type
  TFrmMenuAdministrateur = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblBilletTotalVendu: TLabel;
    lblBilletVenduMoisCourrant: TLabel;
    lblBilletEnfantsVendu: TLabel;
    lblBilletAdultesVendu: TLabel;
    lblBilletEtudiantsVendu: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    lblFilmPlusVu: TLabel;
    BtnDeconnexion: TButton;
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Gestion1: TMenuItem;
    Dconnexion1: TMenuItem;
    Films1: TMenuItem;
    Salles1: TMenuItem;
    Seance1: TMenuItem;
    procedure Films1Click(Sender: TObject);
    procedure Salles1Click(Sender: TObject);
    procedure Seance1Click(Sender: TObject);
    procedure BtnDeconnexionClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  FrmMenuAdministrateur: TFrmMenuAdministrateur;

const
  FRM_MODAL_HEIGHT : integer = 359; // Hauteur d'une fen�tre modal

implementation

uses U_OneWayTickets_GestionFilms, U_OneWayTickets_GestionSalles,
  U_OneWayTickets_GestionSeances, U_OneWayTicket;

{$R *.DFM}


{ ****************************************************************************
  *** Affiche la fen�tre de gestion des films                              ***
  **************************************************************************** }
procedure TFrmMenuAdministrateur.Films1Click(Sender: TObject);
begin
  // Initialise la fen�tre
  FrmGestionFilms.Height:= FRM_MODAL_HEIGHT;
  FrmGestionFilms.chargeListeFilm();
  FrmGestionFilms.LbxListeFilms.ItemIndex:= 0;
  FrmGestionFilms.Visible:= true;
end;

{ ****************************************************************************
  *** Affiche la fen�tre de gestion des salles                             ***
  **************************************************************************** }
procedure TFrmMenuAdministrateur.Salles1Click(Sender: TObject);
begin
  FrmGestionSalles.Height:= FRM_MODAL_HEIGHT; // Initialise la taille de la fen�tre
  FrmGestionSalles.chargeListeSalles();
  FrmGestionSalles.LbxListeSalles.ItemIndex:= 0;
  FrmGestionSalles.Visible:= true;
end;

{ ****************************************************************************
  *** Affichage de la gestion des s�ances                                  ***
  **************************************************************************** }
procedure TFrmMenuAdministrateur.Seance1Click(Sender: TObject);
begin
  FrmGestionSeances.Height:= FRM_MODAL_HEIGHT; // Initialise la taille de la fen�tre
  FrmGestionSeances.chargeListeSeances();
  FrmGestionSeances.LbxListeSeances.ItemIndex:= 0;
  FrmGestionSeances.showModal;
end;


{ ****************************************************************************
  *** D�connecte l'administrateur pour afficher le menu utilisateur        ***
  **************************************************************************** }
procedure TFrmMenuAdministrateur.BtnDeconnexionClick(Sender: TObject);
begin
  FrmOneWayTickets.Initialisation();
  FrmMenuAdministrateur.Visible:= false;
  FrmOneWayTickets.Visible:= true;
end;

{ ****************************************************************************
  *** Affiche le menu utilisateur                                          ***
  **************************************************************************** }
procedure TFrmMenuAdministrateur.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmOneWayTickets.Visible:= true;
end;

end.
