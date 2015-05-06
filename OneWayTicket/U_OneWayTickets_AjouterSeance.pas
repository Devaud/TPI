{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Fenêtre              : AjouterSeance                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : Permet d'ajouter une séances                  ***
  *** Version              : 1.0                                           ***
  *** Date de création     : 05.05.2015                                    ***
  ***         Modification :                                               ***
  ***           06.05.2015 - AD -                                          ***
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
    CbxLundi: TCheckBox;
    CbxSamedi: TCheckBox;
    CbxVendredi: TCheckBox;
    CbxDimanche: TCheckBox;
    CbxMardi: TCheckBox;
    CbxMercredi: TCheckBox;
    CbxJeudi: TCheckBox;
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
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmAjouterSeance: TFrmAjouterSeance;

implementation

{$R *.DFM}

end.
