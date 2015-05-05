{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : OneWay Tickets est un logiciel de billetteries***
  ***                        séance                                        ***
  *** Version              : 1.0                                           ***
  *** Date de création     : 30.04.2015                                    ***
  ***         Modification :                                               ***
  ***         05.05.2015 - Ajout de l'accès au login administarteur        ***
  ***                      Ajout l'accès au menu réservation en avance     ***
  **************************************************************************** }
unit U_OneWayTicket;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, U_ImageBouton;

type
  TFrmOneWayTickets = class(TForm)
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Quitter1: TMenuItem;
    Administration1: TMenuItem;
    N1: TMenuItem;
    Connexion1: TMenuItem;
    Aproposde1: TMenuItem;
    BtnSeancePrecedente: TButton;
    BtnSeanceSuivante: TButton;
    BtnReserverAvance: TButton;
    Timer1: TTimer;
    lblHeureCourante: TLabel;
    Label2: TLabel;
    procedure Quitter1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Initialisation();
    procedure BtnReserverAvanceClick(Sender: TObject);
    procedure Connexion1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmOneWayTickets: TFrmOneWayTickets;
  listImageBouton : TList; // Liste qui contient tous les bouton
  nbImageBouton : integer = 11;

CONST
  START          : integer = 10;
  ECART_X        : integer = 10;
  ECART_Y        : integer = 10;
  TAILLE_WIDTH   : integer = 193;
  TAILLE_HEIGHT  : integer = 57;
  MDP_ADMIN      : String = 'Neko1';

implementation

uses U_OneWayTickets_Reservation, U_OneWayTickets_ReservationAvance,
  U_OneWayTickets_Login, U_OneWayTickets_MenuAdministrateur;

{$R *.DFM}

{ ****************************************************************************
  *** Initialisation de l'affichage                                        ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Initialisation();
var
  i, x, y: integer;
Begin
  //Initialisation des boutons
  x:= START; // Position X de départ du bouton
  y:= START; // Position Y de départ du bouton

  // Crée la liste des bouton
  listImageBouton:= TList.Create();
  for i:= 0 to nbImageBouton do
  Begin
    listImageBouton.add(TImageBouton.Create(FrmOneWayTickets, IntToStr(i), '14:00 - 17:00', x, y));
    x := x + TAILLE_WIDTH + ECART_X; // Déplace le prochain bouton sur la droite

    // Regare s'il y a déjà trois bouton sur une ligne
    if listImageBouton.Count mod 3 = 0 then
    Begin
      y:= y + TAILLE_HEIGHT + ECART_X; // Déplace les prochain bouton sur la seconde ligne
      x:= START; // Redémare la ligne au début
    end;
  end;
end;

{ ****************************************************************************
  *** Quitter l'application                                                ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Quitter1Click(Sender: TObject);
begin
  close;
end;

{ ****************************************************************************
  *** Affiche l'heure courante                                             ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Timer1Timer(Sender: TObject);
begin
  lblHeureCourante.Caption:= TimeToStr(now());
end;

{ ****************************************************************************
  *** Evènement au démarrage de l'application                              ***
  **************************************************************************** }
procedure TFrmOneWayTickets.FormCreate(Sender: TObject);
begin
  Initialisation();
end;

{ ****************************************************************************
  *** Réservation en avance                                                ***
  **************************************************************************** }
procedure TFrmOneWayTickets.BtnReserverAvanceClick(Sender: TObject);
begin
  FrmReservationAvance.CbxFilm.ItemIndex:= 0;
  FrmReservationAvance.showModal;
end;

{ ****************************************************************************
  *** Permet la connexion en tant qu'administrateur                        ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Connexion1Click(Sender: TObject);
var
  mdp : string;
begin
  // Vide le champ text du mot de passe
  FrmLogin.edtMdpAdmin.Text:= '';

  // Traitement de la fenêtre à la validation de la connexion
  if FrmLogin.showModal = mrOk then
  Begin
    mdp:= FrmLogin.edtMdpAdmin.Text;

    // Test si le mot de passe est valide
    if mdp = MDP_ADMIN then
    Begin
      FrmOneWayTickets.Visible:= false;

      // Initialisation des labels du menu administrateur
      FrmMenuAdministrateur.lblBilletTotalVendu.Caption:= '0';
      FrmMenuAdministrateur.lblBilletVenduMoisCourrant.Caption:= '0';
      FrmMenuAdministrateur.lblBilletEnfantsVendu.Caption:= '0';
      FrmMenuAdministrateur.lblBilletAdultesVendu.Caption:= '0';
      FrmMenuAdministrateur.lblBilletEtudiantsVendu.Caption:= '0';
      FrmMenuAdministrateur.lblFilmPlusVu.Caption:= 'Aucun film';
      
      FrmMenuAdministrateur.Visible:= true; // Affiche la fenêtre administrateur
    end
    else
    Begin
      // Message d'erreur
      ShowMessage('Connexion refusée ! Mot de passe administrateur refusé !');
    end;
  end;
end;

end.
