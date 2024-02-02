object Form1: TForm1
  Left = 466
  Top = 145
  Width = 569
  Height = 418
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 137
    Height = 217
    Caption = 'PORT SERIAL'
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 16
      Width = 105
      Height = 25
      Caption = 'PORT SETTING'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 48
      Width = 105
      Height = 25
      Caption = 'OPEN PORT'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 16
      Top = 80
      Width = 105
      Height = 25
      Caption = 'CLOSE PORT'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 152
    Top = 8
    Width = 393
    Height = 361
    Caption = 'GroupBox2'
    TabOrder = 1
    object Button4: TButton
      Left = 8
      Top = 16
      Width = 89
      Height = 25
      Caption = 'PERINTAH-1'
      TabOrder = 0
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 8
      Top = 48
      Width = 89
      Height = 25
      Caption = 'PERINTAH-2'
      TabOrder = 1
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 8
      Top = 80
      Width = 89
      Height = 25
      Caption = 'PERINTAH-3'
      TabOrder = 2
      OnClick = Button6Click
    end
    object Memo1: TMemo
      Left = 112
      Top = 16
      Width = 273
      Height = 337
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
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
    Left = 56
    Top = 136
  end
  object ComDataPacket1: TComDataPacket
    ComPort = ComPort1
    IncludeStrings = True
    StartString = '#'
    StopString = '/'
    OnPacket = ComDataPacket1Packet
    Left = 192
    Top = 136
  end
end
