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
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    procedure Quitter1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmOneWayTickets: TFrmOneWayTickets;

implementation

uses U_OneWayTickets_Reservation;

{$R *.DFM}

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
var
  Test: TImageBouton;
begin
  Test := TImageBouton.Create(FrmOneWayTickets, 'The hobbit', 'dasa');
  

end;

end.
