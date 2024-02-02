unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ILLed, StdCtrls, ILAngularGauge, ULBasicControl,
  ILSegmentIndicator, ILSegmentGauge, LPControl, SLControlCollection,
  LPControlDrawLayers, LPTransparentControl, ILAnalogInstrument,
  ILThermometer, CPort, ExtCtrls, Menus, StrUtils;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Setting1: TMenuItem;
    Ports1: TMenuItem;
    Connect1: TMenuItem;
    Disconnect1: TMenuItem;
    Exit1: TMenuItem;
    Timer1: TTimer;
    ComPort1: TComPort;
    ComDataPacket1: TComDataPacket;
    ILThermometer1: TILThermometer;
    ILSegmentGauge1: TILSegmentGauge;
    ILAngularGauge1: TILAngularGauge;
    Button1: TButton;
    ILLed1: TILLed;
    ILLed2: TILLed;
    Button2: TButton;
    ComDataPacket2: TComDataPacket;
    procedure Ports1Click(Sender: TObject);
    procedure Connect1Click(Sender: TObject);
    procedure Disconnect1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: String);
    procedure ComDataPacket2Packet(Sender: TObject; const Str: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  first,last:Integer;
  data1, data2:Real;
  temp, distance:string;

implementation

{$R *.dfm}

procedure TForm1.Ports1Click(Sender: TObject);
begin
  ComPort1.ShowSetupDialog;
end;

procedure TForm1.Connect1Click(Sender: TObject);
begin
  ComPort1.Open;
end;

procedure TForm1.Disconnect1Click(Sender: TObject);
begin
  ComPort1.Close;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if ComPort1.Connected then
  begin
    ComPort1.WriteStr('*');
  end;



end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ComPort1.Connected then
  begin
    ComPort1.WriteStr('&');
  end;
  
end;

procedure TForm1.ComDataPacket1Packet(Sender: TObject; const Str: String);
begin
  first:=Pos('#', Str);
  last:=Pos('/', Str);
  temp:=MidStr(Str, first+1, 3);

  try
    data1:=StrToFloat(temp);
    except
      on E:EConvertError do
      begin

      end;
  end;

  ILThermometer1.Value:=data1;
  ILSegmentGauge1.Value:=data1;
  
end;

procedure TForm1.ComDataPacket2Packet(Sender: TObject; const Str: String);
begin
  first:=Pos('$', Str);
  last:=Pos('@', Str);
  distance:=MidStr(Str, first+1, 4);

  try
    data2:=StrToFloat(distance);
    except
      on E:EConvertError do
      begin

      end;
  end;

  ILAngularGauge1.Value:=data2;
end;

end.
