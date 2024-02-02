unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPort, StdCtrls, StrUtils;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    ComPort1: TComPort;
    ComDataPacket1: TComDataPacket;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  first,last,width_data:Integer;
  data:string;

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

procedure TForm1.Button4Click(Sender: TObject);
begin
  if ComPort1.Connected then
  begin
    ComPort1.WriteStr('A');
  end;
  
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if ComPort1.Connected then
  begin
    ComPort1.WriteStr('B');
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if ComPort1.Connected then
  begin
    ComPort1.WriteStr('C');
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ComPort1.Close;
end;

procedure TForm1.ComDataPacket1Packet(Sender: TObject; const Str: String);
begin
  first:=Pos('#', Str);
  last:=Pos('/', Str);
  width_data:=last-first-1;
  data:=MidStr(Str, first+1, width_data);

  Memo1.Lines.Add(data);
end;

end.
