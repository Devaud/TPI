program P_OneWayTicket;

uses
  Forms,
  U_OneWayTicket in 'U_OneWayTicket.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
