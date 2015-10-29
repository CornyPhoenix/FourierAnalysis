object FormExport: TFormExport
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Exportieren'
  ClientHeight = 282
  ClientWidth = 177
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Breite:'
  end
  object Label2: TLabel
    Left = 24
    Top = 51
    Width = 29
    Height = 13
    Caption = 'H'#246'he:'
  end
  object Label3: TLabel
    Left = 24
    Top = 185
    Width = 61
    Height = 13
    Caption = 'Dateiformat:'
  end
  object Label4: TLabel
    Left = 24
    Top = 94
    Width = 59
    Height = 13
    Caption = 'Linienbreite:'
  end
  object Bevel1: TBevel
    Left = 16
    Top = 75
    Width = 145
    Height = 8
    Shape = bsBottomLine
  end
  object Label5: TLabel
    Left = 24
    Top = 121
    Width = 55
    Height = 13
    Caption = 'X-Ma'#223'stab:'
  end
  object Label6: TLabel
    Left = 24
    Top = 148
    Width = 55
    Height = 13
    Caption = 'Y-Ma'#223'stab:'
  end
  object Bevel2: TBevel
    Left = 16
    Top = 168
    Width = 145
    Height = 8
    Shape = bsBottomLine
  end
  object Label7: TLabel
    Left = 24
    Top = 210
    Width = 51
    Height = 13
    Caption = 'Auf Alpha:'
  end
  object edtW: TEdit
    Left = 96
    Top = 21
    Width = 57
    Height = 21
    TabOrder = 0
    Text = '300'
  end
  object edtH: TEdit
    Left = 96
    Top = 48
    Width = 57
    Height = 21
    TabOrder = 1
    Text = '200'
  end
  object edtFormat: TComboBox
    Left = 96
    Top = 182
    Width = 57
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = 'PNG'
    OnChange = edtFormatChange
    Items.Strings = (
      'PNG'
      'Bitmap'
      'JPEG')
  end
  object edtLWidth: TEdit
    Left = 96
    Top = 91
    Width = 57
    Height = 21
    TabOrder = 3
    Text = '1'
  end
  object edtX: TEdit
    Left = 96
    Top = 118
    Width = 57
    Height = 21
    TabOrder = 4
    Text = '40'
  end
  object edtY: TEdit
    Left = 96
    Top = 145
    Width = 57
    Height = 21
    TabOrder = 5
    Text = '40'
  end
  object edtAlpha: TCheckBox
    Left = 96
    Top = 209
    Width = 57
    Height = 17
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = 0
    Top = 241
    Width = 177
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 7
    ExplicitLeft = 88
    ExplicitTop = 296
    ExplicitWidth = 185
    object Bevel3: TBevel
      Left = 0
      Top = 0
      Width = 177
      Height = 2
      Align = alTop
      Shape = bsTopLine
    end
    object Button1: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Abbrechen'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
