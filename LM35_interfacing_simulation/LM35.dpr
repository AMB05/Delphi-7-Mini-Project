program LM35;

uses
  Forms,
  LM35_Interfacing in 'LM35_Interfacing.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
