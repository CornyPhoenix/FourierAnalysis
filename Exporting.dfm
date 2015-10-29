object ExportForm: TExportForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Exportieren'
  ClientHeight = 306
  ClientWidth = 329
  Color = clWhite
  Constraints.MaxHeight = 344
  Constraints.MinHeight = 344
  Constraints.MinWidth = 345
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
    Left = 24
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Breite:'
  end
  object Label2: TLabel
    Left = 24
    Top = 75
    Width = 29
    Height = 13
    Caption = 'H'#246'he:'
  end
  object Label3: TLabel
    Left = 24
    Top = 209
    Width = 61
    Height = 13
    Caption = 'Dateiformat:'
  end
  object Label4: TLabel
    Left = 24
    Top = 118
    Width = 59
    Height = 13
    Caption = 'Linienbreite:'
  end
  object Bevel1: TBevel
    Left = 16
    Top = 99
    Width = 209
    Height = 8
    Shape = bsBottomLine
  end
  object Label5: TLabel
    Left = 24
    Top = 145
    Width = 55
    Height = 13
    Caption = 'X-Ma'#223'stab:'
  end
  object Label6: TLabel
    Left = 24
    Top = 172
    Width = 55
    Height = 13
    Caption = 'Y-Ma'#223'stab:'
  end
  object Bevel2: TBevel
    Left = 16
    Top = 192
    Width = 209
    Height = 8
    Shape = bsBottomLine
  end
  object Label7: TLabel
    Left = 24
    Top = 234
    Width = 51
    Height = 13
    Caption = 'Auf Alpha:'
  end
  object Head: TLabel
    Left = 16
    Top = 16
    Width = 104
    Height = 13
    Caption = 'Als Grafik exportieren'
  end
  object edtW: TEdit
    Left = 112
    Top = 45
    Width = 81
    Height = 21
    TabOrder = 0
    Text = '400'
  end
  object edtH: TEdit
    Left = 112
    Top = 72
    Width = 81
    Height = 21
    TabOrder = 1
    Text = '300'
  end
  object edtFormat: TComboBox
    Left = 112
    Top = 206
    Width = 193
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = 'Portable Network Graphic (PNG)'
    OnChange = edtFormatChange
    Items.Strings = (
      'Portable Network Graphic (PNG)'
      'Windows Bitmap (BMP)'
      'JPEG (JPG)')
  end
  object edtLWidth: TEdit
    Left = 112
    Top = 113
    Width = 57
    Height = 21
    TabOrder = 3
    Text = '1'
  end
  object edtX: TEdit
    Left = 112
    Top = 140
    Width = 57
    Height = 21
    TabOrder = 4
    Text = '40'
  end
  object edtY: TEdit
    Left = 112
    Top = 167
    Width = 57
    Height = 21
    TabOrder = 5
    Text = '40'
  end
  object edtAlpha: TCheckBox
    Left = 112
    Top = 233
    Width = 57
    Height = 17
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = 0
    Top = 265
    Width = 329
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 7
    object Bevel3: TBevel
      Left = 0
      Top = 0
      Width = 329
      Height = 2
      Align = alTop
      Shape = bsTopLine
      ExplicitWidth = 177
    end
    object btnOK: TButton
      Left = 239
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Abbrechen'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
