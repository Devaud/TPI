program P_OneWayTicket;

uses
  Forms,
  U_OneWayTicket in 'U_OneWayTicket.pas' {FrmOneWayTickets},
  U_OneWayTickets_Reservation in 'U_OneWayTickets_Reservation.pas' {FrmReservation};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmOneWayTickets, FrmOneWayTickets);
  Application.CreateForm(TFrmReservation, FrmReservation);
  Application.Run;
end.
