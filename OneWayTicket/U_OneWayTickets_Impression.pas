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
    { Déclarations privées }
  public
    { Déclarations publiques }
    maxSecond: integer;
    second: integer;
  end;

var
  FrmImpressionEnCours: TFrmImpressionEnCours;

implementation

{$R *.DFM}

procedure TFrmImpressionEnCours.Timer1Timer(Sender: TObject);
begin
    //
  if second = maxSecond then
  Begin
    Timer1.Enabled:= false;
    self.Visible:= false;
  end;
  inc(second);
  
end;

end.
