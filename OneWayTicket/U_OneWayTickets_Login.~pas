{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Fenêtre              : Login                                         ***
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : Permet de se connecter en tant qu'admin       ***
  *** Version              : 1.0                                           ***
  *** Date de création     : 05.05.2015                                    ***
  **************************************************************************** }
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
    procedure edtMdpAdminChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.DFM}

{ ****************************************************************************
  *** Vérifie si le champ text a du contenu à chaque changement            ***
  **************************************************************************** }
procedure TFrmLogin.edtMdpAdminChange(Sender: TObject);
var
  mdp : string;
begin
  mdp:= edtMdpAdmin.Text;
  
  if Length(mdp) >= 1 then
    BtnConnexion.Enabled:= true
  else
    BtnConnexion.Enabled:= false;
end;

end.
