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
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmGestionSeances: TFrmGestionSeances;

implementation

{$R *.DFM}

end.
