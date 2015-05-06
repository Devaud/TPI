unit U_OneWayTickets_AjouterSalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TFrmAjouterSalle = class(TForm)
    Label1: TLabel;
    edtNomSalle: TEdit;
    Label2: TLabel;
    edtPlacesMax: TEdit;
    BtnAnnuler: TButton;
    BtnAjouter: TButton;
    UDPlacesMax: TUpDown;
    procedure edtNomSalleChange(Sender: TObject);
    procedure edtPlacesMaxKeyPress(Sender: TObject; var Key: Char);
    procedure testEdit();
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmAjouterSalle: TFrmAjouterSalle;

implementation

{$R *.DFM}

{ ****************************************************************************
  *** Permet de tester si les champs sont remplis                          ***
  **************************************************************************** }
procedure TFrmAjouterSalle.testEdit();
Begin
  if (Length(edtNomSalle.Text) > 0) and (Length(edtPlacesMax.Text) > 0) then
    BtnAjouter.Enabled:= true
  else
    BtnAjouter.Enabled:= false;
end;

{ ****************************************************************************
  *** Procédure lors d'un changement dans un edit                          ***
  **************************************************************************** }
procedure TFrmAjouterSalle.edtNomSalleChange(Sender: TObject);
begin
  if (Sender as TEdit).Name = 'edtPlacesMax' then
    if StrToInt((Sender as TEdit).Text) > 500 then
      (Sender as TEdit).Text:= '50';

  testEdit();
end;

{ ****************************************************************************
  *** Filtre les caractères d'un champ text                                ***
  **************************************************************************** }
procedure TFrmAjouterSalle.edtPlacesMaxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in['0'..'9']) then
    key:= #0;
end;

end.
