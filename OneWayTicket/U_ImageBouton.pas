{ ****************************************************************************
  *** Projet               : OneWayTickets                                 ***
  *** Auteur               : Devaud Alan                                   ***
  *** Description          : ImageBouton permet de créer un bouton coloré  ***
  ***                        qui contient quelques informations sur la     ***
  ***                        séance                                        ***
  *** Version              : 1.0                                           ***
  *** Date de création     : 30.04.2015                                    ***
  ***         Modification :                                               ***
  **************************************************************************** }
unit U_ImageBouton;

interface

uses
  ExtCtrls, StdCtrls, Classes, Forms, graphics;

Type
  TImageBouton = Class(TImage)
  private
    lblNomFilm  : TLabel;
    lblHoraire : TLabel;
  public
    constructor Create(AOwner: TComponent; nomFilm, horaire : String; x, y : integer); overload;
    procedure changeCouleur(couleur: TColor);
    procedure setText(texte: string; objet: string); 
  end;

CONST

  WIDTH_IMAGE   : integer = 193;
  HEIGHT_IMAGE  : integer = 57;
  MIN_CARACTERE : integer = 1;
  MAX_CARACTERE : integer = 20;

implementation

{ ****************************************************************************
  *** Constructeur de ImageBouton                                          ***
  *** Crée et initialise le boutonImage                                    ***
  *** @params TComponent AOwner                                            ***
  *** @params String nomFilm - Nom du film à afficher                      ***
  *** @params String horaire - horaire du film à afficher                  ***
  **************************************************************************** }
constructor TImageBouton.Create(AOwner : TComponent; nomFilm, horaire: String; x, y : integer);
Begin
  inherited Create(AOwner);

  // Initialise les propriétés du bouton
  with self do
  Begin
    Parent:= (AOwner as TForm);
    Width:= WIDTH_IMAGE;
    Height:= HEIGHT_IMAGE;
    Top:= y;
    Left:= x;
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
end;

{ ****************************************************************************
  *** Change la couleur du bouton                                          ***
  *** Crée et initialise le boutonImage                                    ***
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
  *** @params String objet - label qui est concerné par le changement      ***
  ***                     (nom -> nom du film, horaire -> horaire dû film) ***
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

end.
