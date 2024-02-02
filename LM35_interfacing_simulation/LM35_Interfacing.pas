unit LM35_Interfacing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ULBasicControl, ILSegmentIndicator, ILSegmentGauge, LPControl,
  SLControlCollection, LPControlDrawLayers, LPTransparentControl,
  ILAnalogInstrument, ILThermometer, CPort, ExtCtrls, Menus, StrUtils;

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
    seg_thermo: TILSegmentGauge;
    procedure Ports1Click(Sender: TObject);
    procedure Connect1Click(Sender: TObject);
    procedure Disconnect1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  first,last:Integer;
  data:Real;
  temp:string;

implementation

{$R *.dfm}

procedure TForm1.Ports1Click(Sender: TObject);
begin
  ComPort1.ShowSetupDialog;  
end;

procedure TForm1.Connect1Click(Sender: TObject);
begin
  ComPort1.Open;
  if ComPort1.Connected then
  begin
    Timer1.Enabled:=True;
  end;
end;

procedure TForm1.Disconnect1Click(Sender: TObject);
begin
  Timer1.Enabled:=False;
  ComPort1.Close;
  seg_thermo.Value:=0;
  ILThermometer1.Value:=0;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ComPort1.WriteStr('*');
end;

procedure TForm1.ComDataPacket1Packet(Sender: TObject; const Str: String);
begin
  first:=Pos('#', Str);
  last:=Pos('/', Str);
  temp:=MidStr(Str, first+1, 3);

  try
    data:=StrToFloat(temp);
    except
      on E:EConvertError do
      begin

      end;
  end;

  ILThermometer1.Value:=data;
  seg_thermo.Value:=data;
end;

end.
