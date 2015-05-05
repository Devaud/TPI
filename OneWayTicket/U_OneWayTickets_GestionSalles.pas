unit U_OneWayTickets_GestionSalles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrmGestionSalles = class(TForm)
    Label2: TLabel;
    LbxListeSalles: TListBox;
    BtnModifier: TButton;
    BtnSupprimer: TButton;
    BtnAjouter: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    edtNomSalle: TEdit;
    edtPlacesMax: TEdit;
    BtnValiderModification: TButton;
    BtnAnuuler: TButton;
    procedure BtnAnuulerClick(Sender: TObject);
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmGestionSalles: TFrmGestionSalles;

const
  FRM_HEIGHT_MAX : integer = 485;
  FRM_HEIGHT_MIN : integer = 358;

implementation

uses U_OneWayTickets_AjouterSalle;

{$R *.DFM}

procedure TFrmGestionSalles.BtnAnuulerClick(Sender: TObject);
begin
  self.Height:= FRM_HEIGHT_MIN;
end;

procedure TFrmGestionSalles.BtnModifierClick(Sender: TObject);
begin
  self.Height:= FRM_HEIGHT_MAX;
end;

procedure TFrmGestionSalles.BtnAjouterClick(Sender: TObject);
begin
  FrmAjouterSalle.showModal;
end;

end.
