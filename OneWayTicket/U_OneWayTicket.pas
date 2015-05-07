{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : OneWay Tickets est un logiciel de billetteries***
  ***                        séance                                        ***
  *** Version              : 1.0                                           ***
  *** Date de création     : 30.04.2015                                    ***
  ***         Modification :                                               ***
  ***         05.05.2015 - Ajout de l'accès au login administarteur        ***
  ***                      Ajout l'accès au menu réservation en avance     ***
  **************************************************************************** }
unit U_OneWayTicket;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, U_ImageBouton, IniFiles;

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
    procedure chargeToutesLesSeances();
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    function Split(chaine: String; delimiteur: string): TStringList;
    procedure Reservation(film, horaire, salle : string);
  end;

Type
  TSeance = record
    section  : String;
    film     : String;
    salle    : String;
    jourDiff : String;
    heure1   : String;
    heure2   : String;
    heure3   : String;
    heure4   : String;
    diffuser : String;
  end;

Type
  TListSeance = array [0..250] of array [0..3] of String;

var
  FrmOneWayTickets: TFrmOneWayTickets;
  listImageBouton : TList; // Liste qui contient tous les bouton
  listSeances : array of TSeance;
  nbImageBouton : integer = 11;
  jourActuelle : String;
  prix         : array [0..2] of real;

CONST
  START           : integer = 10;
  ECART_X         : integer = 10;
  ECART_Y         : integer = 10;
  TAILLE_WIDTH    : integer = 193;
  TAILLE_HEIGHT   : integer = 57;
  MDP_ADMIN       : String  = 'Neko1';
  FICHIER_STATS   : String  = './Res/statistiques.csv';
  FICHIER_SEANCES : String = './Res/seances.ini';
  FIHCIER_FILMS   : String = './Res/films.csv';
  FICHIER_SALLES  : String = './Res/salles.csv';
  FICHIER_PRIX    : String = './Res/prixBillets.csv';

implementation

uses U_OneWayTickets_Reservation, U_OneWayTickets_ReservationAvance,
  U_OneWayTickets_Login, U_OneWayTickets_MenuAdministrateur;

{$R *.DFM}


{ ****************************************************************************
  *** Split une chaine de caractère                                        ***
  *** Code trouvé sur le web, utilisateur qui donne le code : Aos          ***
  *** http://www.developpez.net/forums/d639683/environnements-developpement***
  *** /delphi/debutant/fonction-split-delphi/                              ***
  *** @params String chaine - Chaine a splitée                             ***
  *** @params String delimiteur - Délimiteur pour le split                 ***
  *** @Result TStringList - List des éléments splité                       ***
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
  *** Traduit les jours de diffusion (1 -> Lundi, etc.)                    ***
  *** @params String jour - Suite de nombre qui compose les jours          ***
  *** @params String caracSeparation - Caracère qui sépare les jours       ***
  *** @Result string - Chaine comportant les jours                         ***
  **************************************************************************** }
function assembleJour(jour, caracSeparation : String): String;
var
  j, tmpJour: integer;
  jourDiff: string;
Begin
  jourDiff:= '';
  
  // Boucle qui parcoure tous les jours
  for j:= 1 to length(jour) do
  Begin
    tmpJour:= StrToInt(jour[j]); // Récupère la valeur au point j et le traduit en integer
    case tmpJour of
      1 : jourDiff:= jourDiff + 'lundi';
      2 : jourDiff:= jourDiff + 'mardi';
      3 : jourDiff:= jourDiff + 'mercredi';
      4 : jourDiff:= jourDiff + 'jeudi';
      5 : jourDiff:= jourDiff + 'vendredi';
      6 : jourDiff:= jourDiff + 'samedi';
      7 : jourDiff:= jourDiff + 'dimanche';
    end;

    if j < length(jour) then
      jourDiff:= jourDiff + caracSeparation;
  end;

  Result:= jourDiff;
end;

{ ****************************************************************************
  *** Transforme le texte en heure                                         ***
  *** @params String horaire - Text a faire passer en heure                ***
  *** @Result TTime - Heure                                                ***
  **************************************************************************** }
function TextEnHeure(horaire : String): TTime;
var
  h, m: word;
Begin
  h:= StrToInt(horaire[1] + horaire[2]) ;
  m:= StrToInt(horaire[4] + horaire[5]);
  Result:= EncodeTime(h, m, 0, 0);
end;

{ ****************************************************************************
  *** Charge les séances a afficher en séparant les heures                 ***
  *** @params array of TSeance - liste des séances                         ***
  *** @Result TListSeance - Renvoi la liste des séances                    ***
  **************************************************************************** }
function chargeListDifferentHoraire(list: array of TSeance): TListSeance;
var
  x, i: integer;
  ajout: boolean;
  seances: TListSeance;
Begin
  // Charge la liste des séances avec leurs heures différentes
  x:= 0;
  for i:= 0 to length(listSeances) do
  Begin
    if listSeances[i].film = '' then
      break;
      
    ajout:= true;
    while ajout do
    Begin

      // Test si l'heure exist et si la séance n'est pas déjà passée
      if (listSeances[i].heure1 <> '') and (TextEnHeure(listSeances[i].heure1) > TextEnHeure(TimeToStr(now()))) then
      Begin
        Seances[x][2]:= listSeances[i].section;
        Seances[x][1]:= listSeances[i].heure1;
        Seances[x][0]:= listSeances[i].film;
        Seances[x][3]:= listSeances[i].salle;
        inc(x);
      end
      else
        ajout:= false;

      if (listSeances[i].heure2 <> '') and (TextEnHeure(listSeances[i].heure2) > TextEnHeure(TimeToStr(now()))) then
      Begin
        Seances[x][2]:= listSeances[i].section;
        Seances[x][1]:= listSeances[i].heure2;
        Seances[x][0]:= listSeances[i].film;
        Seances[x][3]:= listSeances[i].salle;
        inc(x);
      end
      else
        ajout:= false;

      if (listSeances[i].heure3 <> '') and (TextEnHeure(listSeances[i].heure3) > TextEnHeure(TimeToStr(now()))) then
      Begin
        Seances[x][2]:= listSeances[i].section;
        Seances[x][1]:= listSeances[i].heure3;
        Seances[x][0]:= listSeances[i].film;
        Seances[x][3]:= listSeances[i].salle;
        inc(x);
      end
      else
        ajout:= false;

      if (listSeances[i].heure4 <> '') and (TextEnHeure(listSeances[i].heure4) > TextEnHeure(TimeToStr(now()))) then
      Begin
        Seances[x][2]:= listSeances[i].section;
        Seances[x][1]:= listSeances[i].heure4;
        Seances[x][0]:= listSeances[i].film;
        Seances[x][3]:= listSeances[i].salle;
        inc(x);
      end
      else
        ajout:= false;

      if x mod 4 = 0 then
        ajout:= false;
    end;
  end;

  Result:= seances;
end;

{ ****************************************************************************
  *** Ouvre la fenêtre de réservation                                      ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Reservation(film, horaire, salle : string);
var
  ligne : string;
  f: TextFile;
  OutPutList: TStringList;
Begin

  // Charge les informations du film
  if FileExists(FICHIER_FILMS) then
  Begin
    OutPutList:= TStringList.Create;
    AssignFile(f, FICHIER_FILMS);
    Reset(f);
    
    repeat
      Readln(f, ligne);
      OutPutList:= Split(ligne, ';');

      if OutPutList[0] = film then
      Begin
        FrmReservation.lblNomFilm.Caption:= film;
        FrmReservation.lblDuree.Caption:= OutPutList[1];
        FrmReservation.mmoSynopsis.Clear;
        FrmReservation.mmoSynopsis.Text:= OutPutList[2];
        Break;
      end;

    until eof(f);

    OutPutList.Free;
    closeFile(f);
  end;

  // Charge les informations de la séacne
  if FileExists(FICHIER_SALLES) then
  Begin
    OutPutList:= TStringList.Create;
    AssignFile(f, FICHIER_SALLES);
    Reset(f);

    repeat
      Readln(f, ligne);
      OutPutList:= Split(ligne, ';');

      if OutPutList[0] = salle then
      Begin
        FrmReservation.lblSalle.Caption:= salle;
        FrmReservation.lblHoraire.Caption:= horaire;
        FrmReservation.lblPlacesRestantes.Caption:= '0';
        Break;
      end;
    until eof(f);

    OutPutList.Free;
    CloseFile(f);
  end;

  // Charge les prix
  FrmReservation.lblPrixEnfants.Caption:= 'x ' + FloatToStr(prix[1]) + ' CHF';
  FrmReservation.lblPrixAdultes.Caption:= 'x ' + FloatToStr(prix[0]) + ' CHF';
  FrmReservation.lblPrixEAA.Caption:= 'x ' + FloatToStr(prix[2]) + ' CHF';
    
  if FrmReservation.ShowModal = mrOk then
  Begin

  end;
end;


{ ****************************************************************************
  *** Charge toutes les séances depuis le fichier ini                      ***
  **************************************************************************** }
procedure TFrmOneWayTickets.chargeToutesLesSeances();
var
  i, x, index: integer;
  fichierIni: TIniFile;
  Sections, dataSections : TStringList;
  listjour : TStringList;
  jourDiff: String;
Begin
  fichierIni:= TIniFile.Create(FICHIER_SEANCES);
  Sections:= TStringList.Create;
  dataSections:= TStringList.Create;

  fichierIni.ReadSections(Sections);
  index:= 0;

  // Parcoure toutes les sections
  for i:= 0 to Sections.Count - 1 do
  Begin

    fichierIni.ReadSection(Sections[i], dataSections);
    jourDiff:= fichierIni.ReadString(Sections[i], dataSections[2], 'N/A');

    jourDiff:= assembleJour(jourDiff, ',');
    listJour:= Split(jourDiff, ',');

    for x:= 0 to listjour.count - 1 do
    Begin
      // Test si le jour correspond et ajoute la séance dans la liste des séances
      if listJour[x] = jourActuelle then
      Begin
        listSeances[index].section:= Sections[i];
        listSeances[index].film:= fichierIni.ReadString(Sections[i], dataSections[0], 'N/A');
        listSeances[index].salle:= fichierIni.ReadString(Sections[i], dataSections[1], 'N/A');
        listSeances[index].jourDiff:= fichierIni.ReadString(Sections[i], dataSections[2], 'N/A');
        listSeances[index].heure1:= fichierIni.ReadString(Sections[i], dataSections[3], 'N/A');
        listSeances[index].heure2:= fichierIni.ReadString(Sections[i], dataSections[4], 'N/A');
        listSeances[index].heure3:= fichierIni.ReadString(Sections[i], dataSections[5], 'N/A');
        listSeances[index].heure4:= fichierIni.ReadString(Sections[i], dataSections[6], 'N/A');
        listSeances[index].diffuser:= fichierIni.ReadString(Sections[i], dataSections[7], 'N/A');
        inc(index);
        break;
      end;
    end;
  end;

  fichierIni.free;
end;

{ ****************************************************************************
  *** Initialisation de l'affichage                                        ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Initialisation();
var
  i, x, y: integer;
  Seances: TListSeance;
  f: TextFile;
  ligne: string;
  OutPutList: TStringList;
Begin
  jourActuelle:= FormatDateTime('dddd', now());
  
  // Initialisation des seances
  SetLength(listSeances, 250);
  chargeToutesLesSeances();
  // Charge la liste des séances avec leurs heures différentes
  Seances:= chargeListDifferentHoraire(listSeances);
  
  //Initialisation des boutons
  x:= START; // Position X de départ du bouton
  y:= START; // Position Y de départ du bouton

  // Crée la liste des bouton
  listImageBouton:= TList.Create();
  for i:= 0 to nbImageBouton do
  Begin
    listImageBouton.add(TImageBouton.Create(FrmOneWayTickets, seances[i][0], seances[i][1], seances[i][2], seances[i][3], x, y));

    x := x + TAILLE_WIDTH + ECART_X; // Déplace le prochain bouton sur la droite

    // Regare s'il y a déjà trois bouton sur une ligne
    if listImageBouton.Count mod 3 = 0 then
    Begin
      y:= y + TAILLE_HEIGHT + ECART_X; // Déplace les prochain bouton sur la seconde ligne
      x:= START; // Redémare la ligne au début
    end;
  end;

  // Récupère les prix
  if FileExists(FICHIER_PRIX) then
  Begin
    OutPutList:= TStringList.Create;
    AssignFile(f, FICHIER_PRIX);
    Reset(f);

    i:= 0;

    repeat
      Readln(f, ligne);

      OutPutList:= Split(ligne, ';');

      prix[i]:= StrToInt(OutPutList[1]);
      prix[i]:= StrToInt(OutPutList[1]);
      prix[i]:= StrToInt(OutPutList[1]);

      inc(i);
    until eof(f);

    OutPutList.Free;
    CloseFile(f);
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
  *** Evènement au démarrage de l'application                              ***
  **************************************************************************** }
procedure TFrmOneWayTickets.FormCreate(Sender: TObject);
begin
  Initialisation();
end;

{ ****************************************************************************
  *** Réservation en avance                                                ***
  **************************************************************************** }
procedure TFrmOneWayTickets.BtnReserverAvanceClick(Sender: TObject);
begin
  FrmReservationAvance.CbxFilm.ItemIndex:= 0;
  FrmReservationAvance.showModal;
end;

{ ****************************************************************************
  *** Permet la connexion en tant qu'administrateur et initialise les      ***
  *** données de statistiques                                              ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Connexion1Click(Sender: TObject);
var
  mdp, ligne : string;
  OutPutList : TStringList;
  f: TextFile;
begin
  // Vide le champ text du mot de passe
  FrmLogin.edtMdpAdmin.Text:= '';

  // Traitement de la fenêtre à la validation de la connexion
  if FrmLogin.showModal = mrOk then
  Begin
    mdp:= FrmLogin.edtMdpAdmin.Text;

    // Test si le mot de passe est valide
    if mdp = MDP_ADMIN then
    Begin
    
      // Test si le fichier existe
      if FileExists(FICHIER_STATS) then
      Begin
        OutPutList:= TStringList.Create; // Crée la liste pour le split

        // Assigne le fichier a lire
        AssignFile(f, FICHIER_STATS);
        Reset(f);
        repeat
          Readln(f, ligne);
          OutPutList:= Split(ligne, ';');

          // Initialisation des labels du menu administrateur
          // Test quel label il faut mettre à jour
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

        OutPutList.free; // Libère la liste
        CloseFile(f); // Ferme le flux entre le fichier et le programe
      end
      else
      Begin
        ShowMessage('Fichier des statistiques manquantes');
      end;

      FrmOneWayTickets.Visible:= false;
      FrmMenuAdministrateur.Visible:= true; // Affiche la fenêtre administrateur
      
    end
    else
    Begin
      // Message d'erreur
      ShowMessage('Connexion refusée ! Mot de passe administrateur refusé !');
    end;
  end;
end;

end.
