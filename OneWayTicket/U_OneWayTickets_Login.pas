unit U_OneWayTickets_Login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrmLogin = class(TForm)
    Label1: TLabel;
    edtMdpAdmin: TEdit;
    BtnConnexion: TButton;
    BtnAnnuler: TButton;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.DFM}

end.
