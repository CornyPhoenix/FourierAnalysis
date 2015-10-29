object SoundForm: TSoundForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Toneinstellungen'
  ClientHeight = 258
  ClientWidth = 369
  Color = clWindow
  Constraints.MaxHeight = 296
  Constraints.MinHeight = 296
  Constraints.MinWidth = 385
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Heading: TLabel
    Left = 16
    Top = 16
    Width = 93
    Height = 13
    Caption = 'Soundkonfiguration'
  end
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 55
    Height = 13
    Caption = '&Lautst'#228'rke:'
    FocusControl = Volume
  end
  object labVolume: TLabel
    Left = 319
    Top = 56
    Width = 40
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '100%'
  end
  object Label2: TLabel
    Left = 16
    Top = 105
    Width = 49
    Height = 13
    Caption = '&Frequenz:'
    FocusControl = Frequency
  end
  object labFreq: TLabel
    Left = 313
    Top = 105
    Width = 40
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '100%'
  end
  object Label3: TLabel
    Left = 16
    Top = 157
    Width = 26
    Height = 13
    Caption = 'Modi:'
  end
  object Panel: TPanel
    Left = 0
    Top = 217
    Width = 369
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    OnResize = PanelResize
    object Bevel: TBevel
      Left = 0
      Top = 0
      Width = 369
      Height = 2
      Align = alTop
      Shape = bsTopLine
      ExplicitLeft = 320
      ExplicitTop = 16
      ExplicitWidth = 50
    end
    object btnTurnOff: TButton
      Left = 8
      Top = 8
      Width = 89
      Height = 25
      Action = MainForm.acTurnOff
      TabOrder = 0
    end
    object btnOK: TButton
      Left = 286
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
  object Volume: TTrackBar
    Left = 106
    Top = 42
    Width = 201
    Height = 45
    Max = 100
    Frequency = 10
    ShowSelRange = False
    TabOrder = 1
    TickMarks = tmBoth
    OnChange = VolumeChange
  end
  object Frequency: TTrackBar
    Left = 106
    Top = 93
    Width = 201
    Height = 45
    Max = 1000
    Min = 50
    Frequency = 50
    Position = 50
    ShowSelRange = False
    TabOrder = 2
    TickMarks = tmBoth
    OnChange = FrequencyChange
  end
  object btnSong: TButton
    Left = 106
    Top = 152
    Width = 121
    Height = 25
    Action = MainForm.acAlleMeineEntchen
    TabOrder = 3
  end
  object Button1: TButton
    Left = 106
    Top = 183
    Width = 121
    Height = 25
    Action = MainForm.acSlide
    TabOrder = 4
  end
  object Timer: TTimer
    Enabled = False
    Interval = 400
    OnTimer = TimerTimer
    Left = 232
    Top = 152
  end
end
