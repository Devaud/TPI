{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Fen�tre              : Reservation                                   ***
  *** Description          : Permet d'effectuer une r�servation            ***
  *** Version              : 1.0                                           ***
  *** Date de cr�ation     : 30.04.2015                                    ***
  **************************************************************************** }
unit U_OneWayTickets_Reservation;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TFrmReservation = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblNomFilm: TLabel;
    lblDuree: TLabel;
    mmoSynopsis: TMemo;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdtNbBilletsEnfants: TEdit;
    UDNBilletsEnfants: TUpDown;
    EdtNbBilletsAdultes: TEdit;
    UDNBilletsAdultes: TUpDown;
    lblPrixEnfants: TLabel;
    lblPrixAdultes: TLabel;
    lblPrixEAA: TLabel;
    EdtNbBilletsEAA: TEdit;
    UDNBilletsEAA: TUpDown;
    lblPrixTotal: TLabel;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lblSalle: TLabel;
    lblHoraire: TLabel;
    lblPlacesRestantes: TLabel;
    BtnAnnuler: TButton;
    BtnValiderReservation: TButton;
    procedure EdtNbBilletsEAAChange(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    prixTotal : real;
    prixEnfant, PrixAdulte, PrixEAA: real;
  end;

var
  FrmReservation: TFrmReservation;
  

implementation

{$R *.DFM}

{ ****************************************************************************
  *** V�rifie que les champs on une valeur sup�rieur � 0                   ***
  **************************************************************************** }
procedure TFrmReservation.EdtNbBilletsEAAChange(Sender: TObject);
begin
  if (StrToInt(EdtNbBilletsEnfants.Text) > 0) or (StrToInt(EdtNbBilletsAdultes.Text) > 0) or
    (StrToInt(EdtNbBilletsEAA.Text) > 0) then
    BtnValiderReservation.Enabled:= true
  else
    BtnValiderReservation.Enabled:= false;
end;

end.
