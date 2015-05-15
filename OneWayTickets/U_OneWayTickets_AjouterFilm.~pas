unit U_OneWayTickets_AjouterFilm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TFrmAjouterFilm = class(TForm)
    Label1: TLabel;
    edtNomFilm: TEdit;
    Label2: TLabel;
    edtDureeFilm: TEdit;
    Label3: TLabel;
    MmoSynopsis: TMemo;
    BtnAnnuler: TButton;
    BtnAjouter: TButton;
    Label4: TLabel;
    edtPrixFilm: TEdit;
    UDDuree: TUpDown;
    UDPrix: TUpDown;
    procedure edtDureeFilmChange(Sender: TObject);
    procedure edtDureeFilmKeyPress(Sender: TObject; var Key: Char);
    procedure testEdit();
    procedure MmoSynopsisChange(Sender: TObject);
    procedure BtnAnnulerClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmAjouterFilm: TFrmAjouterFilm;

implementation

{$R *.DFM}

{ ****************************************************************************
  *** Permet de tester si les champs sont remplis                          ***
  **************************************************************************** }
procedure TFrmAjouterFilm.testEdit();
Begin
  if (Length(edtNomFilm.Text) > 0) and (Length(edtDureeFilm.Text) > 0) and
    (Length(edtPrixFilm.Text) > 0) and (Length(MmoSynopsis.Text) > 0) then
    BtnAjouter.Enabled:= true
  else
    BtnAjouter.Enabled:= false;
end;

{ ****************************************************************************
  *** Test de la valeur d'un champ text                                    ***
  **************************************************************************** }
procedure TFrmAjouterFilm.edtDureeFilmChange(Sender: TObject);
begin
  if ((Sender as TEdit).Name = 'edtDureeFilm') or ((Sender as TEdit).Name = 'edtPrixFilm') then
    if StrToInt((Sender as TEdit).Text) > 400 then
      (Sender as TEdit).Text:= '10';

  testEdit();
end;

{ ****************************************************************************
  *** Filtre les caractères d'un champ text                                ***
  **************************************************************************** }
procedure TFrmAjouterFilm.edtDureeFilmKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in['0'..'9']) then
    key:= #0;  
end;


{ ****************************************************************************
  *** Procédure lors d'un changement dans le memo                          ***
  **************************************************************************** }
procedure TFrmAjouterFilm.MmoSynopsisChange(Sender: TObject);
begin
  testEdit();
end;

{ ****************************************************************************
  *** Procedure d'annulation                                               ***
  **************************************************************************** }
procedure TFrmAjouterFilm.BtnAnnulerClick(Sender: TObject);
var
  reponse : word;
begin
  reponse:= MessageDlg('Etes vous sûr de vouloir annuler l''ajout ?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);

  if reponse = mrYes then
    ModalResult:= mrCancel;
end;

end.
