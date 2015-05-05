unit U_OneWayTickets_MenuAdministrateur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus;

type
  TFrmMenuAdministrateur = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblBilletTotalVendu: TLabel;
    BilletVenduMoisCourrant: TLabel;
    BilletEnfantsVendu: TLabel;
    BilletAdultesVendu: TLabel;
    BilletEtudiantsVendu: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    lblFilmPlusVu: TLabel;
    BtnDeconnexion: TButton;
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Gestion1: TMenuItem;
    Dconnexion1: TMenuItem;
    Films1: TMenuItem;
    Salles1: TMenuItem;
    Sance1: TMenuItem;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmMenuAdministrateur: TFrmMenuAdministrateur;

implementation

{$R *.DFM}

end.
