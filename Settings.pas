unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Oscill;

type
  TSettingForm = class(TForm)
    Label1: TLabel;
    Bottom: TPanel;
    Memo: TMemo;
    Bevel1: TBevel;
    Button: TButton;
    Button2: TButton;
    procedure MemoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BottomResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FSetterName: String;
    procedure SetSetterName( const AValue: String );
    procedure SetValue( index: Integer; const AValue: String );
    function GetValue( index: Integer ): String;
  public
    property SetterName: String read FSetterName write SetSetterName;
    property Value[ index: Integer ]: String read GetValue write SetValue; default;
    procedure LoadSineFromOsc( AOsc: TOscillation );
    procedure LoadCosineFromOsc( AOsc: TOscillation );
  end;

var
  SettingForm: TSettingForm;

implementation

procedure TSettingForm.SetSetterName(const AValue: string);
begin
  FSetterName := AValue;
  Caption := AValue + ' festlegen';
  Label1.Caption := 'Werte für ' + AValue + ' festlegen';
end;

procedure TSettingForm.BottomResize(Sender: TObject);
begin
  Button.Left := ClientWidth - Button.Width - 8;
end;

procedure TSettingForm.FormCreate(Sender: TObject);
begin
  if Screen.Fonts.IndexOf('Segoe UI') > -1 then
    Font.Name := 'Segoe UI';
  with Label1.Font do
  begin
    Size := 12;
    Color := clHotLight;
  end;
end;

procedure TSettingForm.FormResize(Sender: TObject);
begin
  Memo.Height := ClientHeight - Memo.Top - Bottom.Height - 16;
  Memo.Width := ClientWidth - 32;
end;

function TSettingForm.GetValue(index: Integer): String;
begin
  Result := Memo.Lines[ index ];
end;

procedure TSettingForm.SetValue(index: Integer; const AValue: string);
begin
  Memo.Lines[ index ] := AValue;
end;

procedure TSettingForm.LoadSineFromOsc(AOsc: TOscillation);
var
  I: Integer;
begin
  Memo.Clear;
  for I := 1 to Lastosc do
    Memo.Lines.Add( FloatToStr( AOsc.Sines[ I ] ) );
end;

procedure TSettingForm.MemoChange(Sender: TObject);
begin
  Button.Enabled := Memo.Lines.Count = LastOsc;
end;

procedure TSettingForm.LoadCosineFromOsc(AOsc: TOscillation);
var
  I: Integer;
begin
  Memo.Clear;
  for I := 1 to Lastosc do
    Memo.Lines.Add( FloatToStr( AOsc.CoSines[ I ] ) );
end;

{$R *.dfm}

end.
