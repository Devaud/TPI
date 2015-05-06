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
  FRM_WIDTH_MAX  : integer = 580;
  FRM_WIDTH_MIN  : integer = 359;
  FICHIER_FILMS  : String  = './Res/films.csv';
  FICHIER_SALLES : String = './Res/salles.csv';

implementation

uses U_OneWayTickets_AjouterSeance, U_OneWayTicket;

{$R *.DFM}

{ ****************************************************************************
  *** Ecrit les données d'un fichier dans un combobox                      ***
  *** @params TCombobox cbs - Combobox qui reçois les données              ***
  *** @params string fichier - Chemin du fichier                           ***
  **************************************************************************** }
procedure donneDansComboBox(cbx: TComboBox; fichier: String);
var
  f: TextFile;
  ligne: string;
  OutPutList : TStringList;
  premiereLigne: Boolean;
Begin
  premiereLigne:= true;
  cbx.Clear;

  // Test si le fichier existe
  if FileExists(fichier) then
  Begin
    AssignFile(f, fichier);
    reset(f);

    repeat
      readln(f, ligne);
      
      if premiereLigne then
        premiereLigne:= false
      else
      Begin
        OutPutList:= FrmOneWayTickets.Split(ligne, ';');
        cbx.Items.Add(OutPutList[0]); // Met les données dans la combobox
      end;

    until eof(f);

    OutPutList.free;
    CloseFile(f);
    cbx.ItemIndex:= 0;
  end;
end;

procedure TFrmGestionSeances.BtnModifierClick(Sender: TObject);
begin
  self.Height:= FRM_WIDTH_MAX;
end;

procedure TFrmGestionSeances.BtnAnuulerClick(Sender: TObject);
begin
  self.Height:= FRM_WIDTH_MIN;
end;

{ ****************************************************************************
  *** Ouvre la fenêtre pour ajouter une séance                             ***
  **************************************************************************** }
procedure TFrmGestionSeances.BtnAjouterClick(Sender: TObject);
begin

  donneDansComboBox(FrmAjouterSeance.CbxFilms, FICHIER_FILMS);
  donneDansComboBox(FrmAjouterSeance.CbxSalles, FICHIER_SALLES);

  
  FrmAjouterSeance.showModal;
end;

end.
