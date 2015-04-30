{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : OneWay Tickets est un logiciel de billetteries***
  ***                        séance                                        ***
  *** Version              : 1.0                                           ***
  *** Date de création     : 30.04.2015                                    ***
  ***         Modification :                                               ***
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
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Initialisation();
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

implementation

uses U_OneWayTickets_Reservation;

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

procedure TFrmOneWayTickets.Quitter1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmOneWayTickets.Timer1Timer(Sender: TObject);
begin
  lblHeureCourante.Caption:= TimeToStr(now());
end;

procedure TFrmOneWayTickets.Button1Click(Sender: TObject);
begin
  FrmReservation.showModal;
end;

procedure TFrmOneWayTickets.FormCreate(Sender: TObject);
begin
  Initialisation();
end;

end.
