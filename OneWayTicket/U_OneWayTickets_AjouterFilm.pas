unit U_OneWayTickets_AjouterFilm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

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
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmAjouterFilm: TFrmAjouterFilm;

implementation

{$R *.DFM}

end.
