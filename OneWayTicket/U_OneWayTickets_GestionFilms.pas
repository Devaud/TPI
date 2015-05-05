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
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmGestionFilms: TFrmGestionFilms;

implementation

{$R *.DFM}

end.
