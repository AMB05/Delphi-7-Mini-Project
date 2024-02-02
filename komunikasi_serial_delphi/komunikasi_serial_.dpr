program komunikasi_serial_;

uses
  Forms,
  komuniksi_sereial in 'komuniksi_sereial.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
