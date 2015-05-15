{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Fen�tre              : AjouterSeance                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : Permet d'ajouter une s�ances                  ***
  *** Version              : 1.0                                           ***
  *** Date de cr�ation     : 05.05.2015                                    ***
  **************************************************************************** }
unit U_OneWayTickets_AjouterSeance;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrmAjouterSeance = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    CbxFilms: TComboBox;
    CbxSalles: TComboBox;
    GroupBox2: TGroupBox;
    ChxLundi: TCheckBox;
    ChxSamedi: TCheckBox;
    ChxVendredi: TCheckBox;
    ChxDimanche: TCheckBox;
    ChxMardi: TCheckBox;
    ChxMercredi: TCheckBox;
    ChxJeudi: TCheckBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtHeure1: TEdit;
    edtHeure2: TEdit;
    edtHeure3: TEdit;
    edtHeure4: TEdit;
    BtnAnnuler: TButton;
    BtnValider: TButton;
    procedure edtHeure1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtHeure1KeyPress(Sender: TObject; var Key: Char);
    procedure edtHeure1Change(Sender: TObject);
    procedure BtnAnnulerClick(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  FrmAjouterSeance: TFrmAjouterSeance;

implementation

{$R *.DFM}

{ ****************************************************************************
  *** Procedure au relachement d'une touche                                ***
  **************************************************************************** }
procedure TFrmAjouterSeance.edtHeure1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  text: string;
begin
  // Test si l'edit a 2 caract�re et que la touche press�e n'est pas la touche VK_BACk
  if (Length((Sender as TEdit).Text) = 2) and (not(key = ord(chr(VK_BACK)))) then
  Begin
    text:= (Sender as TEdit).Text;
    (Sender as TEdit).Text:= text[1] + text[2] + ':';
  end;
end;

{ ****************************************************************************
  *** Filtre les caract�res                                                ***   
  **************************************************************************** }
procedure TFrmAjouterSeance.edtHeure1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in['0'..'9', Chr(VK_BACK)]) then
    key:= #0;
end;

{ ****************************************************************************
  *** Test de la valeur des champs text                                    ***
  **************************************************************************** }
procedure TFrmAjouterSeance.edtHeure1Change(Sender: TObject);
begin
  if ((length(edtHeure1.Text) > 0) or (length(edtHeure2.Text) > 0) or
    (length(edtHeure3.Text) > 0) or (length(edtHeure4.Text) > 0)) and
      (ChxLundi.Checked or ChxMardi.Checked or ChxMercredi.Checked or ChxJeudi.Checked
        or ChxVendredi.Checked or ChxSamedi.Checked or ChxDimanche.Checked) then
    BtnValider.Enabled:= true
  else
    BtnValider.Enabled:= false;
end;

{ ****************************************************************************
  *** Procedure d'annulation                                               ***
  **************************************************************************** }
procedure TFrmAjouterSeance.BtnAnnulerClick(Sender: TObject);
var
  reponse : word;
begin
  reponse:= MessageDlg('Etes vous s�r de vouloir annuler l''ajout ?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);

  if reponse = mrYes then
    ModalResult:= mrCancel;
end;

end.
