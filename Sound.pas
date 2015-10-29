unit Sound;

interface

  uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls;

  type
    TSoundForm = class( TForm )
      Panel: TPanel;
      Bevel: TBevel;
      Heading: TLabel;
      btnTurnOff: TButton;
      btnOK: TButton;
      Label1: TLabel;
      Volume: TTrackBar;
      labVolume: TLabel;
      Frequency: TTrackBar;
      Label2: TLabel;
      labFreq: TLabel;
      Timer: TTimer;
      btnSong: TButton;
    Button1: TButton;
    Label3: TLabel;
      procedure FormCreate( Sender: TObject );
      procedure btnOKClick( Sender: TObject );
      procedure PanelResize( Sender: TObject );
      procedure FormShow( Sender: TObject );
      procedure VolumeChange( Sender: TObject );
      procedure FormResize( Sender: TObject );
      procedure FrequencyChange( Sender: TObject );
      procedure TimerTimer( Sender: TObject );
    public
      FCurNote: Integer;
    end;

  var
    SoundForm: TSoundForm;

  const
    Notes: array [ 0 .. 37 ] of Integer = ( 297, 330, 352, 396, 440, -1, 440, -1, 495, 495, 495, 495, 440, -1, -1, -1,
      495, 495, 495, 495, 440, -1, -1, -1, 396, 396, 396, 396, 352, -1, 352, -1, 440, 440, 440, 440, 297, -1 );

implementation

  uses Main, GlobalFunctions;
  {$R *.dfm}

  procedure TSoundForm.btnOKClick( Sender: TObject );
  begin
    Close;
  end;

  procedure TSoundForm.FormCreate( Sender: TObject );
  begin
    // Design
    DesignForm( Self );
    DesignLabel( Heading );
  end;

  procedure TSoundForm.FormResize( Sender: TObject );
  begin
    // Lautstärke-Label verscheieben
    labVolume.Left := ClientWidth - labVolume.Width - 16;
    labFreq.Left := labVolume.Left;
    // Breiten einstellen
    Volume.Width := ClientWidth - Volume.Left - labFreq.Width - 24;
    Frequency.Width := Volume.Width;
  end;

  procedure TSoundForm.FormShow( Sender: TObject );
  begin
    // Lautstärke ermitteln
    Volume.Position := MulDiv( MainForm.Volume, 100, 255 );
  end;

  procedure TSoundForm.FrequencyChange( Sender: TObject );
  begin
    if Sender = Frequency then
      MainForm.Frequency := Frequency.Position;
  end;

  procedure TSoundForm.PanelResize( Sender: TObject );
  begin
    btnOK.Left := ClientWidth - btnOK.Width - 8;
  end;

  procedure TSoundForm.TimerTimer( Sender: TObject );
  begin
    inc( FCurNote );
    if FCurNote > 37 then
      begin
        Timer.Enabled := False;
        Exit;
      end;
    if Notes[ FCurNote ] <> -1 then
      begin
        MainForm.Pausing := True;
        MainForm.Frequency := Notes[ FCurNote ];
        Sleep( 100 );
        MainForm.Pausing := False;
      end;
  end;

  procedure TSoundForm.VolumeChange( Sender: TObject );
  begin
    // Lautstärke setzen
    MainForm.Volume := MulDiv( Volume.Position, 255, 100 );
  end;

end.
