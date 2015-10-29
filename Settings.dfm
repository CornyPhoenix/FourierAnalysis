object SettingForm: TSettingForm
  Left = 0
  Top = 0
  Caption = 'festlegen'
  ClientHeight = 363
  ClientWidth = 298
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 138
    Height = 13
    Caption = 'Werte f'#252'r Kosinus festlegen:'
  end
  object Bottom: TPanel
    Left = 0
    Top = 322
    Width = 298
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    OnResize = BottomResize
    ExplicitTop = 310
    ExplicitWidth = 273
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 298
      Height = 2
      Align = alTop
      Shape = bsTopLine
      ExplicitWidth = 265
    end
    object Button: TButton
      Left = 215
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Speichern'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Abbrechen'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Memo: TMemo
    Left = 16
    Top = 48
    Width = 273
    Height = 266
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    OnChange = MemoChange
  end
end
