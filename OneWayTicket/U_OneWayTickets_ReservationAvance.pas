unit U_OneWayTickets_ReservationAvance;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrmReservationAvance = class(TForm)
    Label1: TLabel;
    CbxFilm: TComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblNomFilm: TLabel;
    lblDuree: TLabel;
    mmoSynopsis: TMemo;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblPrixEnfants: TLabel;
    lblPrixAdultes: TLabel;
    lblPrixEAA: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblSalle: TLabel;
    lblHoraire: TLabel;
    lblPlacesRestantes: TLabel;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmReservationAvance: TFrmReservationAvance;

implementation

{$R *.DFM}

end.
