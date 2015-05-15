{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Fenêtre              : OneWayTickets_ReservationAvance               ***
  *** Description          : Pas implémentée                               ***
  *** Version              : 1.0                                           ***
  *** Date de création     : 12.05.2015                                    ***
  **************************************************************************** }
unit U_OneWayTickets_ReservationAvance;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

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
    EdtNbBilletsEnfants: TEdit;
    UDNBilletsEnfants: TUpDown;
    EdtNbBilletsAdultes: TEdit;
    UDNBilletsAdultes: TUpDown;
    EdtNbBilletsEAA: TEdit;
    UDNBilletsEAA: TUpDown;
    LbxSeance: TListBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    BtnValider: TButton;
    BtnAnnuler: TButton;
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
