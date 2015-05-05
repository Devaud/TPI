{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : OneWay Tickets est un logiciel de billetteries***
  ***                        s�ance                                        ***
  *** Version              : 1.0                                           ***
  *** Date de cr�ation     : 30.04.2015                                    ***
  ***         Modification :                                               ***
  ***         05.05.2015 - Ajout de l'acc�s au login administarteur        ***
  ***                      Ajout l'acc�s au menu r�servation en avance     ***
  **************************************************************************** }
unit U_OneWayTicket;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, U_ImageBouton;

type
  TFrmOneWayTickets = class(TForm)
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Quitter1: TMenuItem;
    Administration1: TMenuItem;
    N1: TMenuItem;
    Connexion1: TMenuItem;
    Aproposde1: TMenuItem;
    BtnSeancePrecedente: TButton;
    BtnSeanceSuivante: TButton;
    BtnReserverAvance: TButton;
    Timer1: TTimer;
    lblHeureCourante: TLabel;
    Label2: TLabel;
    procedure Quitter1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Initialisation();
    procedure BtnReserverAvanceClick(Sender: TObject);
    procedure Connexion1Click(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    function Split(chaine: String; delimiteur: string): TStringList;
  end;

var
  FrmOneWayTickets: TFrmOneWayTickets;
  listImageBouton : TList; // Liste qui contient tous les bouton
  nbImageBouton : integer = 11;

CONST
  START          : integer = 10;
  ECART_X        : integer = 10;
  ECART_Y        : integer = 10;
  TAILLE_WIDTH   : integer = 193;
  TAILLE_HEIGHT  : integer = 57;
  MDP_ADMIN      : String  = 'Neko1';
  FICHIER_STATS  : String  = './Res/statistiques.csv';

implementation

uses U_OneWayTickets_Reservation, U_OneWayTickets_ReservationAvance,
  U_OneWayTickets_Login, U_OneWayTickets_MenuAdministrateur;

{$R *.DFM}


{ ****************************************************************************
  *** Split une chaine de caract�re                                        ***
  *** Code trouv� sur le web, utilisateur qui donne le code : Aos          ***
  *** http://www.developpez.net/forums/d639683/environnements-developpement***
  *** /delphi/debutant/fonction-split-delphi/                              ***
  *** @params String chaine - Chaine a split�e                             ***
  *** @params String delimiteur - D�limiteur pour le split                 ***
  *** @Result TStringList - List des �l�ments split�                       ***
  **************************************************************************** }
function TFrmOneWayTickets.Split(chaine: String; delimiteur: string): TStringList;
var
  L : TStringList;
Begin
  L:= TStringList.Create;
  L.Text:= StringReplace(chaine, delimiteur, #13#10, [rfReplaceAll]);
  Split:= L;
end;

{ ****************************************************************************
  *** Initialisation de l'affichage                                        ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Initialisation();
var
  i, x, y: integer;
Begin
  //Initialisation des boutons
  x:= START; // Position X de d�part du bouton
  y:= START; // Position Y de d�part du bouton

  // Cr�e la liste des bouton
  listImageBouton:= TList.Create();
  for i:= 0 to nbImageBouton do
  Begin
    listImageBouton.add(TImageBouton.Create(FrmOneWayTickets, IntToStr(i), '14:00 - 17:00', x, y));
    x := x + TAILLE_WIDTH + ECART_X; // D�place le prochain bouton sur la droite

    // Regare s'il y a d�j� trois bouton sur une ligne
    if listImageBouton.Count mod 3 = 0 then
    Begin
      y:= y + TAILLE_HEIGHT + ECART_X; // D�place les prochain bouton sur la seconde ligne
      x:= START; // Red�mare la ligne au d�but
    end;
  end;
end;

{ ****************************************************************************
  *** Quitter l'application                                                ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Quitter1Click(Sender: TObject);
begin
  close;
end;

{ ****************************************************************************
  *** Affiche l'heure courante                                             ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Timer1Timer(Sender: TObject);
begin
  lblHeureCourante.Caption:= TimeToStr(now());
end;

{ ****************************************************************************
  *** Ev�nement au d�marrage de l'application                              ***
  **************************************************************************** }
procedure TFrmOneWayTickets.FormCreate(Sender: TObject);
begin
  Initialisation();
end;

{ ****************************************************************************
  *** R�servation en avance                                                ***
  **************************************************************************** }
procedure TFrmOneWayTickets.BtnReserverAvanceClick(Sender: TObject);
begin
  FrmReservationAvance.CbxFilm.ItemIndex:= 0;
  FrmReservationAvance.showModal;
end;

{ ****************************************************************************
  *** Permet la connexion en tant qu'administrateur et initialise les      ***
  *** donn�es de statistiques                                              ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Connexion1Click(Sender: TObject);
var
  mdp, ligne : string;
  OutPutList : TStringList;
  i: integer;
  f: TextFile;
begin
  // Vide le champ text du mot de passe
  FrmLogin.edtMdpAdmin.Text:= '';

  // Traitement de la fen�tre � la validation de la connexion
  if FrmLogin.showModal = mrOk then
  Begin
    mdp:= FrmLogin.edtMdpAdmin.Text;

    // Test si le mot de passe est valide
    if mdp = MDP_ADMIN then
    Begin
    
      // Test si le fichier existe
      if FileExists(FICHIER_STATS) then
      Begin
        OutPutList:= TStringList.Create; // Cr�e la liste pour le split

        // Assigne le fichier a lire
        AssignFile(f, FICHIER_STATS);
        Reset(f);
        repeat
          Readln(f, ligne);
          OutPutList:= Split(ligne, ';');

          // Initialisation des labels du menu administrateur
          // Test quel label il faut mettre � jour
          if OutPutList[0] = 'BilletTotal' then
            FrmMenuAdministrateur.lblBilletTotalVendu.Caption:= OutPutList[1];

          if OutPutList[0] = 'BilletEnfants' then
            FrmMenuAdministrateur.lblBilletEnfantsVendu.Caption:= OutPutList[1];

          if OutPutList[0] = 'BilletAdults' then
            FrmMenuAdministrateur.lblBilletAdultesVendu.Caption:= OutPutList[1];

          if OutPutList[0] = 'BilletEtudiants' then
            FrmMenuAdministrateur.lblBilletEtudiantsVendu.Caption:= OutPutList[1];

          if OutPutList[0] = 'BilletParMois' then
            FrmMenuAdministrateur.lblBilletVenduMoisCourrant.Caption:= OutPutList[1];

          if OutPutList[0] = 'FilmPlusVu' then
            FrmMenuAdministrateur.lblFilmPlusVu.Caption:= OutPutList[1];
            
        until eof(f);

        OutPutList.free; // Lib�re la liste
        CloseFile(f); // Ferme le flux entre le fichier et le programe
      end
      else
      Begin
        ShowMessage('Fichier des statistiques manquantes');
      end;

      FrmOneWayTickets.Visible:= false;
      FrmMenuAdministrateur.Visible:= true; // Affiche la fen�tre administrateur
      
    end
    else
    Begin
      // Message d'erreur
      ShowMessage('Connexion refus�e ! Mot de passe administrateur refus� !');
    end;
  end;
end;

end.
