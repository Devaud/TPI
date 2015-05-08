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
  Menus, StdCtrls, ExtCtrls, U_ImageBouton, IniFiles, U_FP;

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
    procedure BtnReserverAvanceClick(Sender: TObject);
    procedure Connexion1Click(Sender: TObject);
    procedure chargeToutesLesSeances();
    procedure changeSecances(incremente: integer);
    procedure BtnSeanceSuivanteClick(Sender: TObject);
    procedure BtnSeancePrecedenteClick(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    procedure Reservation(film, horaire, salle, section : string; placesRestant: integer);
    procedure Initialisation();
  end;

Type
  TListSeance = array [0..250] of array [0..3] of String;

var
  FrmOneWayTickets : TFrmOneWayTickets;
  listImageBouton  : TList; // Liste qui contient tous les bouton
  listSeances      : array of TSeance;
  nbImageBouton    : integer = 11;
  jourActuelle     : String;
  prix             : array [0..2] of real;
  temp             : integer;
  secance          : integer = 0; // La s�cances des s�ances a afficher

CONST
  START           : integer = 10;
  ECART_X         : integer = 10;
  ECART_Y         : integer = 10;
  TAILLE_WIDTH    : integer = 193;
  TAILLE_HEIGHT   : integer = 57;
  MDP_ADMIN       : String  = 'Neko1';


implementation

uses U_OneWayTickets_Reservation, U_OneWayTickets_ReservationAvance,
  U_OneWayTickets_Login, U_OneWayTickets_MenuAdministrateur;

{$R *.DFM}

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
  *** Charge les s�ances a afficher en s�parant les heures                 ***
  *** @params array of TSeance - liste des s�ances                         ***
  *** @Result TListSeance - Renvoi la liste des s�ances                    ***
  **************************************************************************** }
function chargeListDifferentHoraire(list: array of TSeance): TListSeance;
var
  x, i: integer;
  ajout: boolean;
  seances: TListSeance;
Begin
  // Charge la liste des s�ances avec leurs heures diff�rentes
  x:= 0;
  for i:= 0 to length(listSeances) do
  Begin
    if listSeances[i].film = '' then
      break;
      
    ajout:= true;
    while ajout do
    Begin

      // Test si l'heure exist et si la s�ance n'est pas d�j� pass�e
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
  *** Met � jour les statistique                                           ***
  **************************************************************************** }
procedure statistique();
var
  valeur: TValeur;
  valeurs : TValeurs;
  nbBilletTotal, i: integer;
  OutPutList : TStringList;
begin
  // Initialise les variables
  nbBilletTotal:= 0;
  SetLength(valeurs, 6, 2);

  //R�cup�re les informations du fichier de r�servation
  valeur:= lireFichier(FICHIER_RESERV);
  
  // Calcul le nombre de billet vendu au total
  for i:= 1 to length(valeur) do
  Begin
    if valeur[i] = '' then
      Break;

    OutPutList:= Split(valeur[i], ';');
    nbBilletTotal:= nbBilletTotal + StrToInt(OutPutList[7]);

  end;

  valeurs[0][0]:= 'BilletTotal';
  valeurs[0][1]:= IntToStr(nbBilletTotal);
  nbBilletTotal:= 0;

  // Calcul le nombre de billet vendu se mois
  for i:= 1 to length(valeur) do
  Begin
    if valeur[i] = '' then
      Break;

     OutPutList:= Split(valeur[i], ';');

     if FormatDateTime('mmmm', StrToDate(OutPutList[0])) = FormatDateTime('mmmm', now) then
       nbBilletTotal:= nbBilletTotal + StrToInt(OutPutList[7]);
  end;

  valeurs[1][0]:= 'BilletTotalMois';
  valeurs[1][1]:= IntToStr(nbBilletTotal);

  //Calcul le nombre de billet vendu par enfant
  {for i:= 1 to length(valeur) do
  Begin
    if valeur[i] = '' then
      Break;

    OutPutList(valeur[i], ';');
    
  end; }

  ecritDansFichier(valeurs, FICHIER_STATS);
end;

procedure TFrmOneWayTickets.changeSecances(incremente: integer);
Begin
  secance:= secance + incremente;
  Initialisation();
end;

{ ****************************************************************************
  *** Ouvre la fen�tre de r�servation                                      ***
  **************************************************************************** }
procedure TFrmOneWayTickets.Reservation(film, horaire, salle, section : string; placesRestant: integer);
var
  OutPutList: TStringList;
  NbBilletsEnfants, NbBilletsEAA, NbBilletsAdultes, PrixTotal, Date: String;
  places: string;
  valeur: TValeur;
  i: integer;
  reservations: array [0..7] of String;
Begin

  // Charge les informations du film
  valeur:= lireFichier(FICHIER_FILMS);
  for i:= 0 to length(valeur) - 1 do
  Begin
    OutPutList:= Split(valeur[i], ';');
    if OutPutList[0] = film then
    Begin
      FrmReservation.lblNomFilm.Caption:= film;
      FrmReservation.lblDuree.Caption:= OutPutList[1];
      FrmReservation.mmoSynopsis.Clear;
      FrmReservation.mmoSynopsis.Text:= OutPutList[2];
      Break;
    end;
  end;

  // Charge les informations de la s�acne
  valeur:= lireFichier(FICHIER_SALLES);
  for i:= 0 to length(valeur) - 1 do
  Begin
    OutPutList:= Split(valeur[i], ';');
    if OutPutList[0] = salle then
    Begin
      FrmReservation.lblSalle.Caption:= salle;
      FrmReservation.lblHoraire.Caption:= horaire;
      FrmReservation.lblPlacesRestantes.Caption:= '0';
      Break;
    end;
  end;

  // Charge les prix
  FrmReservation.lblPrixEnfants.Caption:= 'x ' + FloatToStr(prix[1]) + ' CHF';
  FrmReservation.lblPrixAdultes.Caption:= 'x ' + FloatToStr(prix[0]) + ' CHF';
  FrmReservation.lblPrixEAA.Caption:= 'x ' + FloatToStr(prix[2]) + ' CHF';
  FrmReservation.PrixEnfant:= prix[1];
  FrmReservation.PrixEAA:= prix[2];
  FrmReservation.PrixAdulte:= prix[0];
  FrmReservation.prixTotal:= prix[0];
  FrmReservation.calculTotal();

  // Initialisation des champs
  FrmReservation.EdtNbBilletsEnfants.Text:= '0';
  FrmReservation.EdtNbBilletsAdultes.Text:= '1';
  FrmReservation.EdtNbBilletsEAA.Text:= '0';
  FrmReservation.lblPlacesRestantes.Caption:= IntToStr(placesRestant);

  if FrmReservation.ShowModal = mrOk then
  Begin
    // R�cup�ration des �l�ments
    NbBilletsEnfants:= FrmReservation.EdtNbBilletsEnfants.Text;
    NbBilletsAdultes:= FrmReservation.EdtNbBilletsAdultes.Text;
    NbBilletsEAA:= FrmReservation.EdtNbBilletsEAA.Text;
    PrixTotal:= FloatToStr(FrmReservation.prixTotal);
    Date:= DateToStr(now);
    places:= IntToStr(StrToInt(NbBilletsEnfants) + StrToInt(NbBilletsAdultes)
      + StrToInt(NbBilletsEAA));

    // Initialise le tableau de valeur
    reservations[0]:= Date;
    reservations[1]:= horaire;
    reservations[2]:= section;
    reservations[3]:= NbBilletsEnfants;
    reservations[4]:= NbBilletsAdultes;
    reservations[5]:= NbBilletsEAA;
    reservations[6]:= PrixTotal;
    reservations[7]:= places;

    if ajoutUneLigne(reservations, FICHIER_RESERV)then
      ShowMessage('Reservation effectu�e avec succ�s !')
    else
      ShowMessage('Une erreur est survenue lors de la suppression !');

    // Met a jour les statistiques
    statistique();

  end;

  Initialisation();
end;


{ ****************************************************************************
  *** Charge toutes les s�ances depuis le fichier ini                      ***
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
      // Test si le jour correspond et ajoute la s�ance dans la liste des s�ances
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
  i, x, y, index, j: integer;
  Seances: TListSeance;
  OutPutList: TStringList;
  nbPlacesTotal, nbPlacesVendu, nbPlacesRestant: Integer;
  bouton: TImageBouton;
  valeur: TValeur;
Begin
  jourActuelle:= FormatDateTime('dddd', now());
  temp:= 0; // Recommence le compte
  nbPlacesTotal:= 0;
  
  // Initialisation des seances
  SetLength(listSeances, 250);
  chargeToutesLesSeances();
  // Charge la liste des s�ances avec leurs heures diff�rentes
  Seances:= chargeListDifferentHoraire(listSeances);
  
  //Initialisation des boutons
  x:= START; // Position X de d�part du bouton
  y:= START; // Position Y de d�part du bouton
  index:= secance;

  // Cr�e la liste des bouton
  listImageBouton:= TList.Create();
  for i:= 0 to nbImageBouton do
  Begin
    bouton:= TImageBouton.Create(FrmOneWayTickets, seances[index][0], seances[index][1], seances[index][2], seances[index][3], x, y);

    // Ouvre le fichier des salles pour r�cup�rer le nombre de place
    valeur:= lireFichier(FICHIER_SALLES);
    for j:= 0 to length(valeur) - 1 do
    Begin
      if valeur[j] = '' then
        Break;
      OutPutList:= Split(valeur[j], ';');
      if OutPutList[0] = seances[index][3] then
      Begin
        nbPlacesTotal:= StrToInt(OutPutList[1]);
        Break;
      end;
    end;

    // Ouvre le fichier des reservation pour r�cup�rer le nombre de place vendu
    nbPlacesVendu:= 0;
    valeur:= lireFichier(FICHIER_RESERV);
    for j:= 1 to length(valeur) do
    Begin
      if valeur[j] = '' then
        Break;

      OutPutList:= Split(valeur[j], ';');
      if (OutPutList[0] = DateToStr(now)) and (OutPutList[1] = seances[index][1])
        and (OutPutList[2] = seances[index][2]) then
      Begin
        nbPlacesVendu:= StrToInt(OutPutList[7]) + nbPlacesVendu;
      end;
    end;

    // Calcule le nombre de place restante
    nbPlacesRestant:= nbPlacesTotal - nbPlacesVendu;
    bouton.pPlaces:= nbPlacesRestant;

    if nbPlacesRestant <= 0 then
    begin
      bouton.Complet();
    end;

    listImageBouton.add(bouton);
    

    x := x + TAILLE_WIDTH + ECART_X; // D�place le prochain bouton sur la droite

    // Regare s'il y a d�j� trois bouton sur une ligne
    if listImageBouton.Count mod 3 = 0 then
    Begin
      y:= y + TAILLE_HEIGHT + ECART_X; // D�place les prochain bouton sur la seconde ligne
      x:= START; // Red�mare la ligne au d�but
    end;

    inc(index);
  end;

  // R�cup�re les prix
  valeur:= lireFichier(FICHIER_PRIX);
  OutPutList:= TStringList.Create;
  for i:= 0 to length(valeur) - 1 do
  Begin
    if valeur[i] = '' then
        Break;

    OutPutList:= Split(valeur[i], ';');
    prix[i]:= StrToInt(OutPutList[1]);
    prix[i]:= StrToInt(OutPutList[1]);
    prix[i]:= StrToInt(OutPutList[1]);
  end;
  OutPutList.Free;
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

  if temp = 100 then
    Initialisation()
  else
    inc(temp);
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
  mdp : string;
  OutPutList : TStringList;
  valeur : TValeur;
  i: integer;
begin
  // Vide le champ text du mot de passe
  FrmLogin.edtMdpAdmin.Text:= '';
  valeur:= nil;
  
  // Traitement de la fen�tre � la validation de la connexion
  if FrmLogin.showModal = mrOk then
  Begin
    mdp:= FrmLogin.edtMdpAdmin.Text;

    // Test si le mot de passe est valide
    if mdp = MDP_ADMIN then
    Begin
      valeur:= lireFichier(FICHIER_STATS);
      OutPutList:= TStringList.create;
      for i:= 0 to length(valeur) do
      Begin
        if valeur[i] = '' then
          break;

        OutPutList:= Split(valeur[i], ';');
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

        if OutPutList[0] = 'BilletTotalMois' then
          FrmMenuAdministrateur.lblBilletVenduMoisCourrant.Caption:= OutPutList[1];

        if OutPutList[0] = 'FilmPlusVu' then
          FrmMenuAdministrateur.lblFilmPlusVu.Caption:= OutPutList[1];
      end;
      OutPutList.Free;

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

{ ****************************************************************************
  *** Procedure pour voir les s�ances futur                                ***
  **************************************************************************** }
procedure TFrmOneWayTickets.BtnSeanceSuivanteClick(Sender: TObject);
begin
  changeSecances(nbImageBouton);

  if secance > 0 then
    BtnSeancePrecedente.Enabled:= true
end;

{ ****************************************************************************
  *** Procedure pour afficher les s�ances pr�c�dente                       ***
  **************************************************************************** }
procedure TFrmOneWayTickets.BtnSeancePrecedenteClick(Sender: TObject);
begin
  changeSecances(nbImageBouton * (-1));
  
  if secance <= 0 then
    BtnSeancePrecedente.Enabled:= false;
end;

end.
