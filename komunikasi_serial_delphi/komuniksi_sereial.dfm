object Form1: TForm1
  Left = 736
  Top = 120
  Width = 437
  Height = 476
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 401
    Height = 417
    Color = clHotLight
    TabOrder = 0
    object Memo1: TMemo
      Left = 8
      Top = 8
      Width = 385
      Height = 305
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
    end
    object Button1: TButton
      Left = 16
      Top = 320
      Width = 75
      Height = 25
      Caption = 'Setting'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 352
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 16
      Top = 384
      Width = 75
      Height = 25
      Caption = 'Disconnect'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 168
      Top = 336
      Width = 75
      Height = 25
      Caption = 'Send'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 168
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 5
      OnClick = Button5Click
    end
    object ILLed1: TILLed
      Left = 96
      Top = 352
      Width = 25
      Height = 25
      Border.BevelOuter.Width.Value = 0.100000001490116100
      Border.BevelInner.Width.Value = 0.100000001490116100
      Border.Width._Floats = (
        (
          Value
          0.000000000000000000))
      Border.CornerRadius.Value = 0.300000011920929000
      Background.UseParentColor = True
      Background.Color = clHotLight
    end
    object ILLed2: TILLed
      Left = 96
      Top = 384
      Width = 25
      Height = 25
      Border.BevelOuter.Width.Value = 0.100000001490116100
      Border.BevelInner.Width.Value = 0.100000001490116100
      Border.Width._Floats = (
        (
          Value
          0.000000000000000000))
      Border.CornerRadius.Value = 0.300000011920929000
      Color = -65536
      Background.UseParentColor = True
      Background.Color = clHotLight
    end
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = False
    Left = 328
    Top = 328
  end
  object ComDataPacket1: TComDataPacket
    ComPort = ComPort1
    IncludeStrings = True
    StartString = '#'
    StopString = '/'
    OnPacket = ComDataPacket1Packet
    Left = 328
    Top = 376
  end
end
