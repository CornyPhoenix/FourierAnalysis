program Fourieranalyse;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  Settings in 'Settings.pas' {SettingForm},
  Oscill in 'Oscill.pas',
  PrintFrm in 'PrintFrm.pas' {PrintForm},
  ValueEditor in 'ValueEditor.pas' {ValueForm},
  Exporting in 'Exporting.pas' {ExportForm},
  Sound in 'Sound.pas' {SoundForm},
  GlobalFunctions in 'GlobalFunctions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Fourier-Analyse';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSettingForm, SettingForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TValueForm, ValueForm);
  Application.CreateForm(TExportForm, ExportForm);
  Application.Run;
end.
