unit Akui_data_suhu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPort, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ComPort1: TComPort;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
  private
    { Private declarations }
  public
    val:string;
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
   ComPort1.ShowSetupDialog;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ComPort1.Open;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ComPort1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComPort1.Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ComPort1.Close;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ComPort1.WriteStr('A');
end;

procedure TForm1.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  buffer : string;
  hdr : Char;
  i : Integer;
begin
  ComPort1.ReadStr(buffer, Count);
  for i := 1 to Count do
  begin
   hdr := buffer [i];
   if hdr = '*' then
   val := ''
   else if hdr = '#' then
   begin
     Label1.Caption := val;
     val := ''
  end
  else
  val := val + hdr;
  end;
end;

end.
