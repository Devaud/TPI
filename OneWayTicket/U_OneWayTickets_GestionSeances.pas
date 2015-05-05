unit U_OneWayTickets_GestionSeances;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrmGestionSeances = class(TForm)
    Label1: TLabel;
    LbxListeSeances: TListBox;
    BtnModifier: TButton;
    BtnSupprimer: TButton;
    BtnAjouter: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    BtnValiderModification: TButton;
    BtnAnuuler: TButton;
    Label3: TLabel;
    CbxFilm: TComboBox;
    CbxSalle: TComboBox;
    GroupBox2: TGroupBox;
    CbxLundi: TCheckBox;
    CbxSamedi: TCheckBox;
    CbxVendredi: TCheckBox;
    CbxDimanche: TCheckBox;
    CbxMardi: TCheckBox;
    CbxMercredi: TCheckBox;
    CbxJeudi: TCheckBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    edtHeure1: TEdit;
    edtHeure2: TEdit;
    Label5: TLabel;
    edtHeure3: TEdit;
    Label6: TLabel;
    edtHeure4: TEdit;
    Label7: TLabel;
    procedure BtnModifierClick(Sender: TObject);
    procedure BtnAnuulerClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmGestionSeances: TFrmGestionSeances;

const
  FRM_WIDTH_MAX : integer = 580;
  FRM_WIDTH_MIN : integer = 359;

implementation

uses U_OneWayTickets_AjouterSeance;

{$R *.DFM}

procedure TFrmGestionSeances.BtnModifierClick(Sender: TObject);
begin
  self.Height:= FRM_WIDTH_MAX;
end;

procedure TFrmGestionSeances.BtnAnuulerClick(Sender: TObject);
begin
  self.Height:= FRM_WIDTH_MIN;
end;

procedure TFrmGestionSeances.BtnAjouterClick(Sender: TObject);
begin
  FrmAjouterSeance.showModal;
end;

end.
