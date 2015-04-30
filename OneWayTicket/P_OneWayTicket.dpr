program P_OneWayTicket;

uses
  Forms,
  U_OneWayTicket in 'U_OneWayTicket.pas' {FrmOneWayTickets},
  U_OneWayTickets_Reservation in 'U_OneWayTickets_Reservation.pas' {FrmReservation},
  U_ImageBouton in 'U_ImageBouton.pas',
  U_OneWayTickets_ReservationAvance in 'U_OneWayTickets_ReservationAvance.pas' {FrmReservationAvance};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmOneWayTickets, FrmOneWayTickets);
  Application.CreateForm(TFrmReservation, FrmReservation);
  Application.CreateForm(TFrmReservationAvance, FrmReservationAvance);
  Application.Run;
end.
