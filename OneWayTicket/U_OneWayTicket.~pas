unit U_OneWayTicket;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
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
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Quitter1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  lblHeureCourante.Caption:= TimeToStr(now());
end;

end.
