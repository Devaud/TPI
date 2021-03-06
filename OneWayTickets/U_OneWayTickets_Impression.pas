{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Fen�tre              : OneWayTickets_Impression                      ***
  *** Description          : Permet d'inform� que l'impression est en corus***
  *** Version              : 1.0                                           ***
  *** Date de cr�ation     : 12.05.2015                                    ***
  **************************************************************************** }
unit U_OneWayTickets_Impression;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TFrmImpressionEnCours = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    maxSecond: integer;
    second: integer;
  end;

var
  FrmImpressionEnCours: TFrmImpressionEnCours;

implementation

{$R *.DFM}

{ ****************************************************************************
  *** Procedure du timer                                                   ***
  **************************************************************************** }
procedure TFrmImpressionEnCours.Timer1Timer(Sender: TObject);
begin
  if second = maxSecond then
  Begin
    Timer1.Enabled:= false;
    self.Visible:= false;
  end;
  inc(second);
  
end;

end.
