{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Fenêtre              : Reservation                                   ***
  *** Description          : Permet d'effectuer une réservation            ***
  *** Version              : 1.0                                           ***
  *** Date de création     : 30.04.2015                                    ***
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
    procedure UDNBilletsAdultesClick(Sender: TObject; Button: TUDBtnType);
    procedure BtnAnnulerClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    prixTotal : real;
    prixEnfant, PrixAdulte, PrixEAA: real;
    procedure calculTotal();
  end;

var
  FrmReservation: TFrmReservation;
  

implementation

{$R *.DFM}

procedure TFrmReservation.calculTotal();
Begin
  prixTotal:= StrToFloat(EdtNbBilletsEnfants.Text) * prixEnfant;
  prixTotal:= prixTotal + StrToFloat(EdtNbBilletsAdultes.Text) * PrixAdulte;
  prixTotal:= prixTotal + StrToFloat(EdtNbBilletsEAA.Text) * PrixEAA;

  lblPrixTotal.Caption:= FloatToStr(prixTotal) + ' CHF';
end;

{ ****************************************************************************
  *** Vérifie que les champs on une valeur supérieur à 0                   ***
  **************************************************************************** }
procedure TFrmReservation.EdtNbBilletsEAAChange(Sender: TObject);
var
  places : integer;
begin
  places:= StrToInt(EdtNbBilletsEnfants.Text) + StrToInt(EdtNbBilletsAdultes.Text) + StrToInt(EdtNbBilletsEAA.Text);
 
  if ((StrToInt(EdtNbBilletsEnfants.Text) > 0) or (StrToInt(EdtNbBilletsAdultes.Text) > 0) or
    (StrToInt(EdtNbBilletsEAA.Text) > 0)) and (places <= StrToInt(lblPlacesRestantes.Caption) ) then
    BtnValiderReservation.Enabled:= true
  else
    BtnValiderReservation.Enabled:= false;


end;

{ ****************************************************************************
  *** Procedure d'un bouton UpDown (Calcul le prix total)                  ***
  **************************************************************************** }
procedure TFrmReservation.UDNBilletsAdultesClick(Sender: TObject;
  Button: TUDBtnType);
begin
  calculTotal();
end;

{ ****************************************************************************
  *** Procedure d'annulation                                               ***
  **************************************************************************** }
procedure TFrmReservation.BtnAnnulerClick(Sender: TObject);
var
  reponse: word;
Begin
  reponse:= MessageDlg('Etes vous sûr de vouloir annuler la réservation ?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);

  if reponse = mrYes then
    ModalResult:= mrCancel;
end;

end.
