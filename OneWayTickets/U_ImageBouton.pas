{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : ImageBouton permet de cr�er un bouton color�  ***
  ***                        qui contient quelques informations sur la     ***
  ***                        s�ance                                        ***
  *** Version              : 1.0                                           ***
  *** Date de cr�ation     : 30.04.2015                                    ***
  ***         Modification :                                               ***
  ***         07.05.2015 - AD - Modification du constructeur (section)     ***
  ***         08.05.2015 - AD - Ajout de l'etat complet                    ***
  **************************************************************************** }
unit U_ImageBouton;

interface

uses
  ExtCtrls, StdCtrls, Classes, Forms, graphics;

Type
  TImageBouton = Class(TImage)
  private
    lblNomFilm   : TLabel;
    lblHoraire   : TLabel;
    section      : String;
    salle        : string;
    complet_     : boolean;
    places       : integer;
  public
    constructor Create(AOwner: TComponent; nomFilm, horaire, _section, _salle : String; x, y : integer); overload;
    procedure changeCouleur(couleur: TColor);
    procedure setText(texte: string; objet: string);
    procedure Click(Sender: TObject);
    procedure Complet();
    property pSection : string read section write section;
    property pSalle : String read salle write salle;
    property pPlaces : Integer read places write places;
    destructor Destroy; overload;
  end;

CONST
  WIDTH_IMAGE   : integer = 193;
  HEIGHT_IMAGE  : integer = 57;
  MIN_CARACTERE : integer = 1;
  MAX_CARACTERE : integer = 30;

implementation

uses
  U_OneWayTickets_Reservation, U_OneWayTicket;

{ ****************************************************************************
  *** Constructeur de ImageBouton                                          ***
  *** Cr�e et initialise le boutonImage                                    ***
  *** @params TComponent AOwner                                            ***
  *** @params String nomFilm - Nom du film � afficher                      ***
  *** @params String horaire - horaire du film � afficher                  ***
  **************************************************************************** }
constructor TImageBouton.Create(AOwner : TComponent; nomFilm, horaire, _section, _salle: String; x, y : integer);
Begin
  inherited Create(AOwner);

  // Initialise les propri�t�s du bouton
  with self do
  Begin
    Parent:= (AOwner as TForm);
    Width:= WIDTH_IMAGE;
    Height:= HEIGHT_IMAGE;
    Top:= y;
    Left:= x;
    pSection:= _section;
    pSalle:= _salle;
    complet_:= false;
  end;


  self.changeCouleur(clGreen);

  // Initialise le label du nom du film
  lblNomFilm:= TLabel.Create(self.Parent);
  with lblNomFilm do
  Begin
    Parent:= (self.Parent as TForm);
    Transparent:= true;
    AutoSize:= false;

    // Taille et placement
    Width:= self.Width;
    left:= self.Left;
    Top:= self.Top + 4;
    Alignment:= taCenter;

    // Modification de la police
    Font.Size:= 10;
    Font.Style:= [fsBold];
    Font.Name:= 'Arial';
  end;

  // Initialise le label de l'horaire
  lblHoraire:= TLabel.Create(self.Parent);
  with lblHoraire do
  Begin
    Parent:= (self.Parent as TForm);
    Transparent:= true;
    AutoSize:= false;

    // Taille et placement
    Width:= self.Width;
    left:= self.Left;
    Top:= lblNomFilm.Top + 24;
    Alignment:= taCenter;

    // Modification de la police
    Font.Size:= 8;
    Font.Name:= 'Arial';
  end;

  // Initialise le texte des champs
  self.setText(horaire, 'horaire');
  self.setText(nomFilm, 'nom');

  // Ajout d'�v�nement
  OnClick:= Click;
  lblNomFilm.OnClick:= Click;
  lblHoraire.OnClick:= Click;
end;

{ ****************************************************************************
  *** Destructeur de l'objet                                               ***
  **************************************************************************** }
destructor TImageBouton.Destroy();
Begin
  lblNomFilm.Destroy;
  lblHoraire.Destroy;
  inherited Destroy;
end;

{ ****************************************************************************
  *** Procedure si la s�ance est complet                                   ***
  **************************************************************************** }
procedure TImageBouton.Complet();
Begin
  self.changeCouleur(clRed);
  self.complet_:= true;
  self.Enabled:= false;
  self.lblNomFilm.Enabled:= false;
  self.lblHoraire.Enabled:= false;
end;

{ ****************************************************************************
  *** Change la couleur du bouton                                          ***
  *** @params TColor couleur - Couleur du bouton                           ***
  **************************************************************************** }
procedure TImageBouton.changeCouleur(couleur: TColor);
Begin
  with self.Picture do
  Begin
    Canvas.Brush.Color:= couleur;
    Canvas.Rectangle(0, 0, self.Width, self.Height);
  end;
end;

{ ****************************************************************************
  *** Remplace le texte des label avec le text proposer par l'utilisateur  ***
  *** @params String texte - Valeur du texte                               ***
  *** @params String objet - label qui est concern� par le changement      ***
  ***                     (nom -> nom du film, horaire -> horaire d� film) ***
  **************************************************************************** }
procedure TImageBouton.setText(texte: string; objet: string);
Begin
  if (length(texte) >= MIN_CARACTERE) and (length(texte) <= MAX_CARACTERE) then
  Begin
    if objet = 'horaire' then
      lblHoraire.Caption:= texte;

    if objet = 'nom' then
      lblNomFilm.Caption:= texte; 
  end;
end;

{ ****************************************************************************
  *** Ouvre la fen�tre de r�servation                                      ***
  *** @params TObject Sender - Appel l'objet appeler                       ***
  **************************************************************************** }
procedure TImageBouton.Click(Sender: TObject);
Begin
  if not(self = nil) then
  Begin
  if not(self.complet_) or (self.Enabled = false)then
    FrmOneWayTickets.Reservation(self.lblNomFilm.Caption, self.lblHoraire.caption, self.pSalle, self.pSection, self.pPlaces);
  end;
end;

end.
