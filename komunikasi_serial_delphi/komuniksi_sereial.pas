unit komuniksi_sereial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPort, LPControl, SLControlCollection, LPControlDrawLayers,
  LPTransparentControl, ULBasicControl, ILLed, StdCtrls, ExtCtrls, StrUtils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ILLed1: TILLed;
    ILLed2: TILLed;
    ComPort1: TComPort;
    ComDataPacket1: TComDataPacket;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: String);
    procedure Button5Click(Sender: TObject);
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
  ILLed1.Value:=True;
  ILLed2.Value:=False;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ComPort1.Close;
  ILLed1.Value:=False;
  ILLed2.Value:=True;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if ComPort1.Connected then
  begin
    ComPort1.WriteStr('*');
  end;
end;

procedure TForm1.ComDataPacket1Packet(Sender: TObject; const Str: String);
begin
  first:=Pos('#', Str);
  last:=Pos('/', Str);
  width_data:=last-first-1;
  data:=MidStr(Str, first+1, width_data);

  Memo1.Lines.Add(data);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Memo1.Clear;
end;

end.
