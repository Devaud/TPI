program P_OneWayTicket;

uses
  Forms,
  U_OneWayTicket in 'U_OneWayTicket.pas' {FrmOneWayTickets},
  U_OneWayTickets_Reservation in 'U_OneWayTickets_Reservation.pas' {FrmReservation},
  U_ImageBouton in 'U_ImageBouton.pas',
  U_OneWayTickets_ReservationAvance in 'U_OneWayTickets_ReservationAvance.pas' {FrmReservationAvance},
  U_OneWayTickets_Login in 'U_OneWayTickets_Login.pas' {FrmLogin},
  U_OneWayTickets_MenuAdministrateur in 'U_OneWayTickets_MenuAdministrateur.pas' {FrmMenuAdministrateur},
  U_OneWayTickets_GestionFilms in 'U_OneWayTickets_GestionFilms.pas' {FrmGestionFilms},
  U_OneWayTickets_AjouterFilm in 'U_OneWayTickets_AjouterFilm.pas' {FrmAjouterFilm},
  U_OneWayTickets_GestionSalles in 'U_OneWayTickets_GestionSalles.pas' {FrmGestionSalles},
  U_OneWayTickets_AjouterSalle in 'U_OneWayTickets_AjouterSalle.pas' {FrmAjouterSalle},
  U_OneWayTickets_GestionSeances in 'U_OneWayTickets_GestionSeances.pas' {FrmGestionSeances},
  U_OneWayTickets_AjouterSeance in 'U_OneWayTickets_AjouterSeance.pas' {FrmAjouterSeance},
  U_FP in 'U_FP.pas',
  U_OneWayTickets_Impression in 'U_OneWayTickets_Impression.pas' {FrmImpressionEnCours};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmOneWayTickets, FrmOneWayTickets);
  Application.CreateForm(TFrmReservation, FrmReservation);
  Application.CreateForm(TFrmReservationAvance, FrmReservationAvance);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmMenuAdministrateur, FrmMenuAdministrateur);
  Application.CreateForm(TFrmGestionFilms, FrmGestionFilms);
  Application.CreateForm(TFrmAjouterFilm, FrmAjouterFilm);
  Application.CreateForm(TFrmGestionSalles, FrmGestionSalles);
  Application.CreateForm(TFrmAjouterSalle, FrmAjouterSalle);
  Application.CreateForm(TFrmGestionSeances, FrmGestionSeances);
  Application.CreateForm(TFrmAjouterSeance, FrmAjouterSeance);
  Application.CreateForm(TFrmImpressionEnCours, FrmImpressionEnCours);
  Application.Run;
end.
