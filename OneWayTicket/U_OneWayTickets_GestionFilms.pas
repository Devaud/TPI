unit U_OneWayTickets_GestionFilms;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  TFrmGestionFilms = class(TForm)
    Label1: TLabel;
    LbxListeFilms: TListBox;
    BtnModifier: TButton;
    BtnSupprimer: TButton;
    BtnAjouter: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtNomFilm: TEdit;
    edtDureeFilm: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    MmoSynopsis: TMemo;
    BtnValiderModification: TButton;
    BtnAnuuler: TButton;
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnAnuulerClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmGestionFilms: TFrmGestionFilms;

const
  FRM_HEIGHT_MAX : integer = 527;
  FRM_HEIGHT_MIN : integer = 358;

implementation

uses U_OneWayTickets_AjouterFilm;

{$R *.DFM}

procedure TFrmGestionFilms.BtnModifierClick(Sender: TObject);
begin
  self.Height:= FRM_HEIGHT_MAX;
end;

procedure TFrmGestionFilms.BtnAnuulerClick(Sender: TObject);
begin
  self.Height:= FRM_HEIGHT_MIN;
end;

procedure TFrmGestionFilms.BtnAjouterClick(Sender: TObject);
begin
  FrmAjouterFilm.showModal;
end;

end.
