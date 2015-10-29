object PrintForm: TPrintForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Drucken'
  ClientHeight = 482
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 615
    Top = 24
    Width = 55
    Height = 13
    Caption = 'Liniendicke:'
  end
  object Label2: TLabel
    Left = 744
    Top = 24
    Width = 16
    Height = 13
    Caption = 'mm'
  end
  object Label3: TLabel
    Left = 615
    Top = 51
    Width = 55
    Height = 13
    Caption = 'X-Ma'#223'stab:'
  end
  object Label4: TLabel
    Left = 744
    Top = 51
    Width = 16
    Height = 13
    Caption = 'mm'
  end
  object Label5: TLabel
    Left = 744
    Top = 78
    Width = 16
    Height = 13
    Caption = 'mm'
  end
  object Label6: TLabel
    Left = 615
    Top = 78
    Width = 55
    Height = 13
    Caption = 'Y-Ma'#223'stab:'
  end
  object edtLW: TEdit
    Left = 676
    Top = 21
    Width = 62
    Height = 21
    Alignment = taRightJustify
    TabOrder = 0
    Text = '0,5'
    OnKeyPress = edtLWKeyPress
  end
  object Bottom: TPanel
    Left = 0
    Top = 441
    Width = 769
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 769
      Height = 2
      Align = alTop
      Shape = bsTopLine
      ExplicitLeft = 296
      ExplicitTop = 8
      ExplicitWidth = 50
    end
    object Button1: TButton
      Left = 687
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Drucken'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 606
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Aktualisieren'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Abbrechen'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object edtXP: TEdit
    Left = 676
    Top = 48
    Width = 62
    Height = 21
    Alignment = taRightJustify
    TabOrder = 2
    Text = '25'
    OnKeyPress = edtLWKeyPress
  end
  object edtYP: TEdit
    Left = 676
    Top = 75
    Width = 62
    Height = 21
    Alignment = taRightJustify
    TabOrder = 3
    Text = '20'
    OnKeyPress = edtLWKeyPress
  end
  object PrevPan: TPanel
    Left = 8
    Top = 8
    Width = 598
    Height = 424
    BevelOuter = bvLowered
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 4
    object Preview: TImage
      Left = 2
      Top = 2
      Width = 594
      Height = 420
      Align = alClient
      ExplicitLeft = -32
      ExplicitTop = -379
    end
  end
end
