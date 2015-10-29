unit Main;

//
//
// this is a
// XEONLAB DEVELOPMENT FILE
//
// Language:   Delphi/Pascal
// Title:      "Main
// Developer:  Konstantin S. M. Möllers
// Contact:    http://xeonlab.com
// Published:  07-02-2010
//
// Copyright © 2010 xeonlab.
//
// All rights reserved.
//
//
interface

  uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
    ActnList, Menus, ComCtrls, Oscill, Printers, ImgList, Math, PngFuncs, FMOD, fmodpresets, fmodtypes, fmoderrors,
    fmod_synthutils;

  type
    TLineType = ( ltYAxis, ltThin, ltFat );

    TMainForm = class( TForm )
      {$REGION 'Components'}
      Controlling: TPanel;
      Bevel1: TBevel;
      btnExport: TButton;
      Label1: TLabel;
      Button1: TButton;
      Actions: TActionList;
      acClose: TAction;
      acPrint: TAction;
      Menue: TMainMenu;
      Datei1: TMenuItem;
      Drucken1: TMenuItem;
      Drucken2: TMenuItem;
      Clip: TImage;
      btnReset: TButton;
      acReset: TAction;
      Schwingungen1: TMenuItem;
      Zurcksetzen1: TMenuItem;
      acDreieck: TAction;
      N2: TMenuItem;
      Dreiecksschwingung1: TMenuItem;
      Selection: TPanel;
      Bevel3: TBevel;
      Ansicht1: TMenuItem;
      Sele: TMenuItem;
      acNewOwn: TAction;
      NeueeigeneSchwingung1: TMenuItem;
      acSetSines: TAction;
      Werte1: TMenuItem;
      SinusWertesetzen1: TMenuItem;
      acSetCosines: TAction;
      KosinusWertesetzen1: TMenuItem;
      acSetOffset: TAction;
      YVerschiebungsetzen1: TMenuItem;
      acSetName: TAction;
      N3: TMenuItem;
      Schwingungsnamendern1: TMenuItem;
      Box: TListView;
      N4: TMenuItem;
      acSinus: TAction;
      Sinusfunktion1: TMenuItem;
      Print: TPrintDialog;
      acDelete: TAction;
      Button3: TButton;
      acSägezahn: TAction;
      N5: TMenuItem;
      Lschen1: TMenuItem;
      img16: TImageList;
      img32: TImageList;
      Sgezahnschwingung1: TMenuItem;
      acRechteck: TAction;
      Rechtecksschwingung1: TMenuItem;
      acExport: TAction;
      Exportieren1: TMenuItem;
      Save: TSaveDialog;
      FreqBar: TTrackBar;
      labFreq: TLabel;
      acTurnOn: TAction;
      N6: TMenuItem;
      acSelection: TAction;
      acToolBar: TAction;
      oolbar1: TMenuItem;
      acNoise: TAction;
      Rauschen1: TMenuItem;
      N7: TMenuItem;
      acBeats: TAction;
      acBeats1: TMenuItem;
      acTurnOff: TAction;
      Sound1: TMenuItem;
      Einschalten1: TMenuItem;
      Ausschalten1: TMenuItem;
      N1: TMenuItem;
      SoundKonfiguration1: TMenuItem;
      acAlleMeineEntchen: TAction;
      N8: TMenuItem;
      AllemeineEntchen1: TMenuItem;
      acSlide: TAction;
      FreqSlider: TTimer;
      FrequenzSlide1: TMenuItem;
      {$ENDREGION}
      procedure FormCreate( Sender: TObject );
      procedure FormDestroy( Sender: TObject );
      procedure FormResize( Sender: TObject );
      procedure acCloseExecute( Sender: TObject );
      procedure acResetExecute( Sender: TObject );
      procedure acDreieckExecute( Sender: TObject );
      procedure acNewOwnExecute( Sender: TObject );
      procedure acSetSinesExecute( Sender: TObject );
      procedure acSetCosinesExecute( Sender: TObject );
      procedure acSetOffsetExecute( Sender: TObject );
      procedure acSetNameExecute( Sender: TObject );
      procedure BoxSelectItem( Sender: TObject; Item: TListItem; Selected: Boolean );
      procedure BoxCustomDrawItem( Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
        var DefaultDraw: Boolean );
      procedure FormMouseWheelUp( Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean );
      procedure FormMouseWheelDown( Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean );
      procedure acSinusExecute( Sender: TObject );
      procedure acPrintExecute( Sender: TObject );
      procedure acDeleteExecute( Sender: TObject );
      procedure acSägezahnExecute( Sender: TObject );
      procedure acRechteckExecute( Sender: TObject );
      procedure acExportExecute( Sender: TObject );
      procedure FreqBarChange( Sender: TObject );
      procedure acTurnOnExecute( Sender: TObject );
      procedure acSelectionExecute( Sender: TObject );
      procedure acToolBarExecute( Sender: TObject );
      procedure acNoiseExecute( Sender: TObject );
      procedure acBeatsExecute( Sender: TObject );
      procedure acTurnOffExecute( Sender: TObject );
      procedure acSoundOptionsExecute( Sender: TObject );
      procedure acAlleMeineEntchenExecute( Sender: TObject );
      procedure acSlideExecute( Sender: TObject );
      procedure FreqSliderTimer( Sender: TObject );
    private
      Buffer, Coord: TBitmap;
      FLessColor, FZero: Integer;
      FDrawLock: Boolean;
      FAccuracy: Integer;
      Margins: TRect;
      FDivider: Single;
      // Properties
      FLineWidth, FXPeriod, FYPeriod: Integer;
      // Oscillators
      FOscs: TOscs;
      FCurrent: Integer;
      // Counters
      DreieckCounter, OwnCounter, SinusCounter, SägezahnC, RechteckC: Integer;
      // Sound-Engine
      FChannel, FFrequency, FSlideDir: Integer;
      FSoundEnabled, FAcceptedHearingWarning, FPausing: Boolean;
      FStream: PFSoundStream;
      { ProcFunc }
      procedure DrawBuffer;
      procedure InitBuffer;
      procedure DrawXAxis( ACanvas: TCanvas; const XTxt: string );
      procedure DrawXMarc( ACanvas: TCanvas; APos: Integer; const YTxt: string; AType: TLineType );
      procedure DrawYRaster( ACanvas: TCanvas; APos, ALineWidth, AYPeriod: Integer );
      function Fourier( Input: TOscillation; Pos: Integer ): Single;
      procedure UpdateBox;
      procedure ResetOsc( AId: Integer = -1 );
      procedure SetSizes;
      procedure DrawOscillation( ACanvas: TCanvas; AOsc: TOscillation; AColor: TColor );
      procedure DisableSound;
      function EnableSound: Boolean;
    protected
      { Write }
      procedure SetCurrent( Value: Integer ); virtual;
      procedure SetVolume( const AValue: Byte ); virtual;
      procedure SetFrequency( const AValue: Integer ); virtual;
      procedure SetPausing( const AValue: Boolean ); virtual;
      { Read }
      function GetOscCount: Integer; virtual;
      function GetVolume: Byte; virtual;
    public
      procedure RefreshBuffer( Redraw: Boolean );
      procedure CoordinateSys( ACanvas: TCanvas; ARedraw: Boolean; AWidth, AHeight: Integer );
      procedure DrawGraphs( ACanvas: TCanvas );
      procedure CalculateAll;
      procedure CalculateOsc( AId: Integer = -1; NoRefresh: Boolean = false );
      procedure AddOsc( const AName: string );
      procedure DefaultValues;

      { Properties }
      property XPeriod: Integer read FXPeriod write FXPeriod;
      property YPeriod: Integer read FYPeriod write FYPeriod;
      property LineWidth: Integer read FLineWidth write FLineWidth;
      property OscCount: Integer read GetOscCount;
      property SoundEnabled: Boolean read FSoundEnabled;
      property Current: Integer read FCurrent write SetCurrent;
      property Volume: Byte read GetVolume write SetVolume;
      property Frequency: Integer read FFrequency write SetFrequency;
      property Pausing: Boolean read FPausing write SetPausing;
    end;

  var
    MainForm: TMainForm;
    // Zeichenfaktoren
    YMid, Marg, HalfMarg, ArBd, Periods: Integer;
    // Sound
    Pos: Single;
    LastFreq, NewFreq: Integer;

  const
    SamplingRate = 44100;
    Colors: array [ 0 .. 7 ] of TColor = ( clRed, clBlue, clGreen, $0000C8FF, clPurple, clGray, $00003DC3, 0 );

implementation

  uses Settings, Printfrm, ValueEditor, Exporting, GlobalFunctions, Sound;
  {$R *.dfm}

  function StreamCallback( Stream: PFSoundStream; Buff: Pointer; Len, Param: Integer ): ByteBool; stdcall;
  var
    I, J, Count: Integer;
    Buffer: PSmallInt;
    Calc: SmallInt;
    Divider, a, b, Multiplicator: Single;
  const
    Omega = 2 * Pi;
  begin
    NewFreq := MainForm.FFrequency;
    Buffer := PSmallInt( Buff );
    Count := 0;

    while Count < ( Len shr 2 ) do { >>2 = 16bit stereo (4 bytes per sample) }
      begin
        // LastFreq := NewFreq;
        if Pos >= SamplingRate / LastFreq then // 2*Pi/SR*f*p >= 2*Pi
          begin
            Pos := Pos - SamplingRate / ( LastFreq );
            if ( LastFreq <> NewFreq ) then
              begin
                LastFreq := NewFreq;
                Pos := 0.0;
              end;
          end;

        Calc := 0;
        // Prüfe, ob es Schwingungen gibt
        if ( Length( MainForm.FOscs ) > 0 ) then
          begin
            // Standart-Teiler
            Divider := Omega * LastFreq * Pos / SamplingRate;
            // Mutliplikator
            Multiplicator := ( 32767.0 / 2.0 );
            // Alle Schwingungen abklappern
            for J := 0 to high( MainForm.FOscs ) do
              for I := 1 to LastOsc - 1 do
                begin
                  a := MainForm.FOscs[ J ].Sines[ I ];
                  b := MainForm.FOscs[ J ].CoSines[ I ];
                  if a <> 0 then
                    inc( Calc, Trunc( a * Sin( I * Divider ) * Multiplicator ) );
                  if b <> 0 then
                    inc( Calc, Trunc( b * Cos( I * Divider ) * Multiplicator ) );
                end;
          end;

        Buffer^ := Calc;
        inc( Buffer );
        Buffer^ := Calc;
        inc( Buffer );

        inc( Count );
        Pos := Pos + 1;
      end;

    Result := True;
  end;

  procedure TMainForm.AddOsc( const AName: string );
  var
    L: Integer;
  begin
    L := Length( FOscs );
    Setlength( FOscs, L + 1 );
    Current := L;
    FOscs[ L ].name := AName;
    Setlength( FOscs[ L ].Sines, LastOsc );
    Setlength( FOscs[ L ].CoSines, LastOsc );
    UpdateBox;
  end;

  procedure TMainForm.DefaultValues;
  begin
    // Anfangswerte
    LineWidth := 2;
    XPeriod := 200;
    YPeriod := 200;
  end;

  function TMainForm.EnableSound: Boolean;
  const
    Err2 = 'Das Soundsystem konnte nicht initiliasiert werden.';
    Err3 = 'Der Audio-Stream konnte nicht erstellt werden.';
    ErrH = 'Sound-Fehler';
    Err1 = 'Die Soundkarte konnte nicht geladen werden.';
  begin
    // Öffnen
    LastFreq := FreqBar.Position;
    Pos := 0;
    // FMOD starten
    FSoundEnabled := OpenFMOD;
    if FSoundEnabled then
      begin
        if not FSOUND_Init( SamplingRate, 16, 0 ) then
          begin
            FSoundEnabled := false;
            TaskMessageDlg( ErrH, Err2, mtError, [ mbOK ], 0 );
            // Beenden
            CloseFMOD;
            Exit( false );
          end;
        FStream := FSOUND_Stream_Create( StreamCallback, 2500 * 2 * 2, FSOUND_NORMAL or FSOUND_16BITS or FSOUND_STEREO,
          SamplingRate, 12345 );
        if FStream = nil then
          begin
            FSoundEnabled := false;
            TaskMessageDlg( ErrH, Err3, mtError, [ mbOK ], 0 );
            // Beenden
            FSOUND_Stream_Close( FStream );
            CloseFMOD;
            Exit( false );
          end;
        // Sound abspielen
        FChannel := FSOUND_Stream_Play( FSOUND_FREE, FStream );
        Result := True;
      end
    else
      begin
        TaskMessageDlg( ErrH, Err1, mtError, [ mbOK ], 0 );
        Result := false;
      end;
  end;

  procedure TMainForm.DisableSound;
  begin
    if FSoundEnabled then
      FSOUND_Stream_Close( FStream );
    CloseFMOD;
    FSoundEnabled := false;
  end;

  procedure TMainForm.BoxCustomDrawItem( Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
    var DefaultDraw: Boolean );
  begin
    if Item.index = Current then
      Box.Canvas.Font.Style := [ fsBold ];

    Box.Canvas.Font.Color := Colors[ Item.index ];
  end;

  procedure TMainForm.BoxSelectItem( Sender: TObject; Item: TListItem; Selected: Boolean );
  begin
    Current := Box.ItemIndex;
    if Current < 0 then
      Current := 0;
    acDelete.Enabled := True;
  end;

  procedure GetRGB( AColor: Integer; out R, G, b: Integer );
  begin
    AColor := ColorToRGB( AColor );
    R := Byte( AColor );
    G := Byte( AColor shr 8 );
    b := Byte( AColor shr 16 );
  end;

  function Farblauf( Start, Ende: TColor; Position: Integer ): TColor;
  var
    R, G, b: Integer;
    R1, G1, B1, R2, G2, B2: Integer;
  begin
    if Start = Ende then
      begin
        Result := Start;
        Exit;
      end;

    if Position <= 0 then
      begin
        Result := Start;
        Exit;
      end
    else if Position >= 1000 then
      begin
        Result := Ende;
        Exit;
      end;

    GetRGB( Start, R1, G1, B1 );
    GetRGB( Ende, R2, G2, B2 );

  asm
    MOV EBX, Position

      { Rot }
      MOV EAX, R1
      MOV EDX, R2

      IMUL EDX, EBX
      MOV ECX, 1000
      SUB ECX, EBX
      IMUL EAX, ECX

      ADD EAX, EDX
      MOV R, EAX

      { Grün }
      MOV EAX, G1
      MOV EDX, G2

      IMUL EDX, EBX
      MOV ECX, 1000
      SUB ECX, EBX
      IMUL EAX, ECX

      ADD EAX, EDX
      MOV G, EAX

      { Blau }
      MOV EAX, B1
      MOV EDX, B2

      IMUL EDX, EBX
      MOV ECX, 1000
      SUB ECX, EBX
      IMUL EAX, ECX

      ADD EAX, EDX
      MOV B, EAX

  end
    ;

    R := Round( R / 1000 );
    G := Round( G / 1000 );
    b := Round( b / 1000 );

    Result := RGB( R, G, b );
  end;

  procedure TMainForm.acAlleMeineEntchenExecute( Sender: TObject );
  begin
    SoundForm.Timer.Enabled := True;
    SoundForm.FCurNote := 0;
  end;

  procedure TMainForm.acBeatsExecute( Sender: TObject );
  var
    I: Integer;
  begin
    Randomize;
    inc( OwnCounter );
    AddOsc( 'Eigene Schwingung ' + IntToStr( OwnCounter ) );
    with FOscs[ Current ] do
      for I := 1 to LastOsc do
        begin
          CoSines[ I ] := 0;
          if I in [ 9, 10 ] then
            Sines[ I ] := 0.5
          else
            Sines[ I ] := 0;
        end;
    CalculateOsc;
  end;

  procedure TMainForm.acCloseExecute( Sender: TObject );
  begin
    Application.Terminate;
  end;

  procedure TMainForm.FormCreate( Sender: TObject );
  const
    UI = 'Segoe UI';
  begin
    // Anzahl an Berechnungen setzen
    LastOsc := 500;
    // Standardwerte setzen
    DefaultValues;
    InitBuffer;
    DreieckCounter := 0;
    OwnCounter := 0;
    SinusCounter := 0;
    SägezahnC := 0;
    RechteckC := 0;
    // Aktuelel Schwingung
    SetCurrent( -1 );
    // Caption
    FreqBarChange( Sender );
    // Gehörsturzmeldung
    FAcceptedHearingWarning := false;
    // Design
    DesignForm( Self );
    // Startfrequenz
    SoundForm := TSoundForm.Create( Self );
    SetFrequency( 440 );
  end;

  procedure TMainForm.FormDestroy( Sender: TObject );
  begin
    DisableSound;
    FDrawLock := True;
    Buffer.Destroy;
    Coord.Destroy;
  end;

  procedure TMainForm.FormMouseWheelDown( Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean );
  begin
    if ssCtrl in Shift then
      Dec( FYPeriod, 5 )
    else
      Dec( FXPeriod, 5 );

    if FXPeriod < 20 then
      FXPeriod := 20;
    if FYPeriod < 20 then
      FYPeriod := 20;
    CalculateAll;
  end;

  procedure TMainForm.FormMouseWheelUp( Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean );
  begin
    if ssCtrl in Shift then
      inc( FYPeriod, 5 )
    else
      inc( FXPeriod, 5 );

    if FXPeriod > ClientWidth div 2 then
      Dec( FXPeriod, 5 );
    CalculateAll;
  end;

  procedure TMainForm.FormResize( Sender: TObject );
  begin
    Clip.Picture := nil;
    // Zeichenfläche wurde verändert -> neuzeichnen
    CalculateAll;
    // Copyright
    Label1.Visible := Width > 1000;
  end;

  procedure TMainForm.DrawBuffer;
  begin
    Clip.Canvas.Draw( 0, 0, Buffer );
  end;

  procedure TMainForm.acDeleteExecute( Sender: TObject );
  var
    I, L: Integer;
    OldVolume: Byte;
  begin
    if FCurrent > -1 then
      begin
        // Stream anhalten
        if FSoundEnabled then
          begin
            OldVolume := GetVolume;
            FSOUND_Stream_Stop( FStream );
          end
        else
          OldVolume := 255;
        // Löschen
        L := Length( FOscs ) - 1;
        for I := FCurrent to L - 1 do
          FOscs[ I ] := FOscs[ I + 1 ];
        Setlength( FOscs, L );
        RefreshBuffer( false );
        UpdateBox;
        SetCurrent( FCurrent - 1 );
        SetPausing( false );
        // Sound abspielen
        if FSoundEnabled then
          begin
            FChannel := FSOUND_Stream_Play( FSOUND_FREE, FStream );
            SetVolume( OldVolume );
          end;
      end;
  end;

  procedure TMainForm.acDreieckExecute( Sender: TObject );
  var
    I, Max: Integer;
    F: Single;
  begin
    Max := ValueEdit( 'Dreiecksschwingung' );
    if Max = -1 then
      Exit;
    inc( DreieckCounter );
    AddOsc( 'Dreiecksschwingung ' + IntToStr( DreieckCounter ) );
    F := ( -1 ) * ( 8 / ( Pi * Pi ) ) * ValueForm.Amplitude;
    with FOscs[ Current ] do
      for I := 1 to LastOsc do
        begin
          Sines[ I ] := 0;
          if ( I mod 2 = 1 ) and ( I < Max ) then
            CoSines[ I ] := F / ( I * I )
          else
            CoSines[ I ] := 0;
        end;
    CalculateOsc;
  end;

  procedure TMainForm.acExportExecute( Sender: TObject );
  var
    I, W, H, LW, X, Y, F: Integer;
    a: Boolean;
    PNG: TPNG;
  const
    Filter: array [ 0 .. 2 ] of string = ( '*.png', '*.bmp', '*.jpg' );
    DefExt: array [ 0 .. 2 ] of string = ( '.png', '.bmp', '.jpg' );
  begin
    if ExportForm.ShowModal = mrCancel then
      Exit;

    W := StrToIntDef( ExportForm.edtW.Text, 300 );
    H := StrToIntDef( ExportForm.edtH.Text, 200 );
    X := StrToIntDef( ExportForm.edtX.Text, 40 );
    Y := StrToIntDef( ExportForm.edtY.Text, 40 );
    LW := StrToIntDef( ExportForm.edtLWidth.Text, 1 );
    F := ExportForm.edtFormat.ItemIndex;
    a := ExportForm.edtAlpha.Checked;

    PNG := TPNG.CreateBlank( COLOR_RGB, 8, W * 2, H * 2 );
    try
      // Werte setzen
      XPeriod := X * 2;
      YPeriod := Y * 2;
      LineWidth := LW * 2;
      // Koordinatensystem
      CoordinateSys( PNG.Canvas, True, PNG.Width, PNG.Height );
      // Berechnen
      for I := 0 to MainForm.OscCount - 1 do
        CalculateOsc( I, True );
      // Graphen auftragen
      DrawGraphs( PNG.Canvas );
      // Standardwerte
      DefaultValues;
      // Speichern
      Save.Filter := ExportForm.edtFormat.Items[ F ] + '|' + Filter[ F ];
      Save.DefaultExt := DefExt[ F ];
      // Antialiasing
      PNG.Resize( W, H );
      // Alpha setzen
      if a then
        PNG.TransparentColor := clWhite;
      if Save.Execute then
        case F of
          0: PNG.SaveToFile( Save.FileName );
          1: PNG.SaveBMP( Save.FileName );
          2: PNG.SaveJPEG( Save.FileName );
        end;
    finally
      PNG.Free;
    end;
  end;

  procedure TMainForm.acNewOwnExecute( Sender: TObject );
  begin
    inc( OwnCounter );
    AddOsc( 'Eigene Schwingung ' + IntToStr( OwnCounter ) );
  end;

  procedure TMainForm.acNoiseExecute( Sender: TObject );
  var
    I: Integer;
  begin
    Randomize;
    inc( OwnCounter );
    AddOsc( 'Eigene Schwingung ' + IntToStr( OwnCounter ) );
    with FOscs[ Current ] do
      for I := 1 to LastOsc do
        begin
          CoSines[ I ] := 0;
          Sines[ I ] := Random( 50 ) / 100;
        end;
    CalculateOsc;
  end;

  procedure TMainForm.acPrintExecute( Sender: TObject );
  const
    RTop = 250;
    RLeft = 250;
  var
    Page: TPoint;
    I: Integer;

    procedure Prepare;
    begin
      // Seitenausmaße ermitteln
      Page.X := Printer.PageWidth;
      Page.Y := Printer.PageHeight;
      LineWidth := PrintForm.MyLineWidth;
      XPeriod := PrintForm.MyXPeriod;
      YPeriod := PrintForm.MyYPeriod;
    end;

    procedure Copyright;
    begin
      with Printer.Canvas do
        begin
          Brush.Style := bsClear;
          TextOut( Margins.Left + Marg, Margins.Bottom, '© 2010 Konstantin Möllers. Fourier-Analyse' );
        end;
    end;

  begin
    // Dokumenttitel
    Printer.Title := 'Fourier-Analyse';

    if not Print.Execute then
      Exit;

    if PrintForm.ShowModal = mrCancel then
      Exit;

    // Querformat
    Printer.Orientation := poLandscape;
    Printer.BeginDoc;
    // Vorbereitung
    Prepare;
    // Zeichnen
    CoordinateSys( Printer.Canvas, True, Page.X, Page.Y );
    // Berechnen
    for I := 0 to high( FOscs ) do
      CalculateOsc( I, True );
    // Graphen auftragen
    DrawGraphs( Printer.Canvas );
    // Abschicken
    Printer.EndDoc;
    // Standardwerte
    DefaultValues;
  end;

  procedure TMainForm.acRechteckExecute( Sender: TObject );
  var
    I, Max: Integer;
    F: Single;
  begin
    Max := ValueEdit( 'Rechtecksschwingung' );
    if Max = -1 then
      Exit;
    inc( RechteckC );
    AddOsc( 'Rechteck ' + IntToStr( RechteckC ) );
    F := ( 4 / Pi ) * ValueForm.Amplitude;
    with FOscs[ Current ] do
      for I := 1 to LastOsc do
        begin
          CoSines[ I ] := 0;
          if ( I mod 2 = 1 ) and ( I < Max ) then
            Sines[ I ] := F / I
          else
            Sines[ I ] := 0;
        end;
    CalculateOsc;
  end;

  procedure TMainForm.acResetExecute( Sender: TObject );
  begin
    ResetOsc;
  end;

  procedure TMainForm.acSelectionExecute( Sender: TObject );
  begin
    acSelection.Checked := not acSelection.Checked;
    Selection.Visible := acSelection.Checked;
    FormResize( Sender );
  end;

  procedure TMainForm.acSetCosinesExecute( Sender: TObject );
  var
    I: Integer;
  begin
    SettingForm.SetterName := 'Kosinus';
    SettingForm.LoadCoSineFromOsc( FOscs[ Current ] );
    if SettingForm.ShowModal = mrCancel then
      Exit;
    with FOscs[ Current ] do
      for I := 1 to LastOsc do
        CoSines[ I ] := StrToFloat( SettingForm[ I - 1 ] );
    CalculateOsc;
  end;

  procedure TMainForm.acSetNameExecute( Sender: TObject );
  begin
    FOscs[ Current ].name := InputBox( 'Namen ändern', 'Geben Sie einen neuen Namen ein:', FOscs[ Current ].name );
    UpdateBox;
  end;

  procedure TMainForm.acSetOffsetExecute( Sender: TObject );
  var
    New: string;
  begin
    New := InputBox( 'Y-Verschiebung festlegen', 'Geben Sie einen Wert ein:', FloatToStr( FOscs[ Current ].Offset ) );
    FOscs[ Current ].Offset := StrToFloatDef( New, 0 );
    CalculateOsc;
  end;

  procedure TMainForm.acSetSinesExecute( Sender: TObject );
  var
    I: Integer;
  begin
    SettingForm.SetterName := 'Sinus';
    SettingForm.LoadSineFromOsc( FOscs[ Current ] );
    if SettingForm.ShowModal = mrCancel then
      Exit;
    with FOscs[ Current ] do
      for I := 1 to LastOsc do
        Sines[ I ] := StrToFloat( SettingForm[ I - 1 ] );
    CalculateOsc;
  end;

  procedure TMainForm.acSinusExecute( Sender: TObject );
  var
    I: Integer;
  begin
    inc( SinusCounter );
    AddOsc( 'Sinus ' + IntToStr( SinusCounter ) );
    FOscs[ Current ].Sines[ 1 ] := 1;
    FOscs[ Current ].CoSines[ 1 ] := 0;
    for I := 2 to LastOsc do
      begin
        FOscs[ Current ].Sines[ I ] := 0;
        FOscs[ Current ].CoSines[ I ] := 0;
      end;
    CalculateOsc;
  end;

  procedure TMainForm.acSlideExecute( Sender: TObject );
  const
    CapE = 'Frequenz-S&lide';
    CapD = 'S&lide anhalten';
  begin
    if FreqSlider.Enabled then
      begin
        FreqSlider.Enabled := false;
        acSlide.Caption := CapE;
        Exit;
      end;

    if FFrequency < 500 then
      begin
        SetFrequency( 50 );
        FSlideDir := 1;
      end
    else
      begin
        SetFrequency( 1000 );
        FSlideDir := -1;
      end;
    FreqSlider.Enabled := True;
    acSlide.Caption := CapD;
  end;

  procedure TMainForm.acSoundOptionsExecute( Sender: TObject );
  begin
    // Ton einschalten wenn er es noch nicht ist
    if not FSoundEnabled then
      acTurnOnExecute( Sender );
    // Konfiguration öffnen
    if FSoundEnabled then
      SoundForm.Show;
  end;

  procedure TMainForm.acTurnOffExecute( Sender: TObject );
  begin
    // Aktionen umstellen
    acTurnOn.Enabled := True;
    acTurnOff.Enabled := false;
    acAlleMeineEntchen.Enabled := acTurnOff.Enabled;
    acSlide.Enabled := acTurnOff.Enabled;
    // SOund-Konfiguration ausblenden
    if SoundForm.Visible then
      SoundForm.Close;
    // Ton ausschalten
    DisableSound;
  end;

  procedure TMainForm.acTurnOnExecute( Sender: TObject );
  const
    Warn1 = 'Achtung! Gehörsturz-Gefahr!';
    Warn2 = 'Bitte überpüfen Sie die Soundeinstellungen an ihrer Soundkarte und an ihren Lautsprechern! Ein falcher ' +
      'Frequenzbereich kann zu erheblichen Schäden an Ihren Lautsprechern und vor allem an Ihrem Gehör führen! ' +
      'Der Frequenzbereich ist zwar eingeschränkt, allerdings empfiehlt es sich, vorher die Einstellungen zu prüfen.'#13#10#13#10
      + 'Möchten Sie trotzdem fortfahren?';
  begin
    // Hörsturz-Warnung
    if not FAcceptedHearingWarning then
      FAcceptedHearingWarning := TaskMessageDlg( Warn1, Warn2, mtWarning, mbYesNo, 0 ) = mrYes;
    // Bestätigung abfangen
    if FAcceptedHearingWarning then
      acTurnOn.Enabled := not EnableSound
    else
      acTurnOn.Enabled := True;
    // Aktion umstellen
    acTurnOff.Enabled := not acTurnOn.Enabled;
    acAlleMeineEntchen.Enabled := acTurnOff.Enabled;
    acSlide.Enabled := acTurnOff.Enabled;
  end;

  procedure TMainForm.acSägezahnExecute( Sender: TObject );
  var
    I, Max: Integer;
    F: Single;
  begin
    Max := ValueEdit( 'Sägezahnschwingung' );
    if Max = -1 then
      Exit;
    inc( SägezahnC );
    AddOsc( 'Sägezahn ' + IntToStr( SägezahnC ) );
    F := ( -2 / Pi ) * ValueForm.Amplitude;
    with FOscs[ Current ] do
      for I := 1 to LastOsc do
        begin
          CoSines[ I ] := 0;
          if ( I < Max ) then
            Sines[ I ] := power( -1, I - 1 ) * F / I
          else
            Sines[ I ] := 0;
        end;
    CalculateOsc;
  end;

  procedure TMainForm.acToolBarExecute( Sender: TObject );
  begin
    acToolBar.Checked := not acToolBar.Checked;
    Controlling.Visible := acToolBar.Checked;
    FormResize( Sender );
  end;

  procedure TMainForm.CoordinateSys( ACanvas: TCanvas; ARedraw: Boolean; AWidth, AHeight: Integer );
  const
    XTxt = 'x';
    Pis = 'π';
    Format1 = '%.1f' + Pis;
    Format2 = '%.0f' + Pis;
  var
    I: Integer;
    C: Single;
    YTxt, Fmt: string;
    HalfDraw: Boolean;
    CurType: TLineType;

    procedure Defaults;
    begin
      // Außenabstände
      Marg := 4 * FLineWidth;
      HalfMarg := Marg div 2;

      if AWidth = -1 then
        AWidth := Clip.Width; // Bufferbreite
      if AHeight = -1 then
        AHeight := Clip.Height; // Bufferhöhe
      YMid := AHeight div 2; // Mittelhöhe

      // Pfeilausmaße
      ArBd := FLineWidth * 3;

      Margins := Rect( Marg, Marg, AWidth - Marg, AHeight - Marg );

      // Paramter speichern
      FZero := FXPeriod * 2 + 5 * Marg;
    end;

    procedure ResetOpts( ACanvas: TCanvas );
    begin
      with ACanvas do
        begin
          // Weiß färben
          Brush.Style := bsSolid;
          Brush.Color := Color;
          Pen.Color := Color;
          Rectangle( 0, 0, AWidth, AHeight );
          Brush.Style := bsClear;
          Pen.Width := FLineWidth;
          Pen.Color := 0;
          // Schriftart
          with Font do
            begin
              Style := [ ];
              Height := 10 * FLineWidth;
              name := 'Arial';
            end;
          Dec( Margins.Right, TextWidth( XTxt ) + Marg );
          // Linker Abstand
          Margins.Left := 5 * Marg;
          // Perioden, die gemalt werden
          Periods := ( Margins.Right - Margins.Left ) div FXPeriod;
        end;
    end;

  begin

    if not ARedraw then
      Exit;

    // Standards setzen
    Defaults;
    // Canvas-Optionen setzen
    ResetOpts( ACanvas );

    with ACanvas do
      begin
        // Markierung zeichnen
        C := -1.5;
        HalfDraw := ( FXPeriod > 80 );
        // Schriftformatierung ermitteln
        if HalfDraw then
          Fmt := Format1
        else
          Fmt := Format2;
        Margins.Top := 2 * Marg + Textheight( 'f(x)' );
        for I := 0 to Periods do
          begin
            CurType := ltThin;
            YTxt := '';
            C := C + 0.5;
            case I of
              0: begin
                  YTxt := '-' + Pis;
                  CurType := ltFat;
                end;
              2: begin
                  YTxt := 'f(x)';
                  CurType := ltYAxis;
                end;
              4: begin
                  YTxt := Pis;
                  CurType := ltFat;
                end;
            else if ( I mod 2 = 0 ) then
                begin
                  YTxt := Format( Fmt, [ C ] );
                  CurType := ltFat;
                end
              else if HalfDraw then
                YTxt := Format( Fmt, [ C ] );
            end;
            DrawXMarc( ACanvas, FXPeriod * I + Margins.Left, YTxt, CurType );
          end;
      end;

    // X-Achse
    DrawXAxis( ACanvas, XTxt );
    Margins.Left := Marg;
  end;

  procedure TMainForm.RefreshBuffer( Redraw: Boolean );
  begin
    // Darf gezeichnet werden?
    if FDrawLock then
      Exit;
    // Nebenfarbe bestimmen
    FLessColor := Farblauf( Color, 0, 200 );
    // Größen der Grafiken aktualiiseren
    if Redraw then
      SetSizes;
    // Koordinatensystem zeichnen
    CoordinateSys( Coord.Canvas, Redraw, -1, -1 );
    Buffer.Canvas.Draw( 0, 0, Coord );
    // Schwingung zeichnen
    DrawGraphs( Buffer.Canvas );
    // Zeichnen
    DrawBuffer;
  end;

  procedure TMainForm.InitBuffer;
  begin
    // Buffer erstellen
    Buffer := TBitmap.Create;
    Coord := TBitmap.Create;
    // Genauigkeit
    FAccuracy := 2;
    // Drawlock entfernen
    FDrawLock := false;
    // Zeichnen
    RefreshBuffer( True );
  end;

  procedure TMainForm.DrawXAxis( ACanvas: TCanvas; const XTxt: string );
  begin
    with ACanvas do
      begin
        // X-Achse Zeichnen
        MoveTo( Marg, YMid );
        LineTo( Margins.Right, YMid );
        // X-Achsen-Pfeil
        MoveTo( Margins.Right - ArBd, YMid - ArBd );
        LineTo( Margins.Right, YMid );
        LineTo( Margins.Right - ArBd, YMid + ArBd );
        TextOut( Margins.Right + Marg, YMid - Textheight( XTxt ) div 2, XTxt );
      end;
  end;

  procedure TMainForm.DrawYRaster( ACanvas: TCanvas; APos, ALineWidth, AYPeriod: Integer );
  var
    I, Max, Y1, Y2: Integer;
    RTxt: string;
  begin
    with ACanvas do
      begin
        // Raster
        TextOut( APos - Marg - TextWidth( '0' ), YMid + HalfMarg, '0' );
        Pen.Color := FLessColor;
        Pen.Width := ALineWidth div 2;
        Max := ( YMid - Margins.Top ) div AYPeriod;
        for I := 1 to Max do
          begin
            Y1 := YMid - AYPeriod * I;
            Y2 := YMid + AYPeriod * I;
            if I mod 2 = 0 then
              Pen.Width := FLineWidth
            else
              Pen.Width := FLineWidth div 2;
            MoveTo( Marg, Y1 );
            LineTo( Margins.Right, Y1 );
            MoveTo( Marg, Y2 );
            LineTo( Margins.Right, Y2 );
            if ( FYPeriod > 80 ) or ( I mod 2 = 0 ) then
              begin
                RTxt := FloatToStr( I / 2 );
                TextOut( APos - Marg - TextWidth( RTxt ), Y1 + HalfMarg, RTxt );
                TextOut( APos - Marg - TextWidth( '-' + RTxt ), Y2 + HalfMarg, '-' + RTxt );
              end;
          end;
        Pen.Width := ALineWidth;
        Pen.Color := 0;
      end;
  end;

  procedure TMainForm.DrawXMarc( ACanvas: TCanvas; APos: Integer; const YTxt: string; AType: TLineType );
  var
    TxtPos: TPoint;
  begin
    with ACanvas do
      begin
        // Start/Anfang ermitteln
        if AType = ltYAxis then
          begin
            TxtPos := Point( APos - TextWidth( YTxt ) div 2, Marg );
            // Raster zeichnen
            DrawYRaster( ACanvas, APos, FLineWidth, FYPeriod );
            // Linie zeichnen
            MoveTo( APos, Margins.Top );
            LineTo( APos, Margins.Bottom );
            // Pfeil zeichnen
            MoveTo( APos - ArBd, Margins.Top + ArBd );
            LineTo( APos, Margins.Top );
            LineTo( APos + ArBd, Margins.Top + ArBd );
          end
        else
          begin
            TxtPos := Point( APos - TextWidth( YTxt ) - Marg, YMid + HalfMarg );
            // Raster
            Pen.Color := FLessColor;
            case AType of
              ltThin: Pen.Width := FLineWidth div 2;
              ltFat: Pen.Width := FLineWidth;
            end;
            MoveTo( APos, Margins.Top );
            LineTo( APos, Margins.Bottom );
            Pen.Width := FLineWidth;
            Pen.Color := 0;
          end;
        if YTxt <> '' then
          // Text zeichnen
          TextOut( TxtPos.X, TxtPos.Y, YTxt );
      end;
  end;

  function TMainForm.Fourier( Input: TOscillation; Pos: Integer ): Single;
  var
    X, Cur, Sine, Cosine: Single;
    I: Integer;
  begin
    X := ( FZero - Pos ) * FDivider;
    Result := Input.Offset;
    for I := 1 to LastOsc do
      begin
        Cur := I * X;
        Sine := Input.Sines[ I ] * Sin( Cur );
        Cosine := Input.CoSines[ I ] * Cos( Cur );
        Result := Result + Cosine + Sine;
      end;
  end;

  procedure TMainForm.FreqBarChange( Sender: TObject );
  begin
    if Sender = FreqBar then
      SetFrequency( FreqBar.Position );
  end;

  procedure TMainForm.FreqSliderTimer( Sender: TObject );
  begin
    // Frequenz hochschrauben
    SetFrequency( FFrequency + FSlideDir );
    if ( FFrequency = 1000 ) or ( FFrequency = 50 ) then
      begin
        FreqSlider.Enabled := false;
        acSlide.Caption := 'Frequenz-S&lide';
      end;
  end;

  procedure TMainForm.DrawOscillation( ACanvas: TCanvas; AOsc: TOscillation; AColor: TColor );
  begin
    with ACanvas do
      begin
        // Pen einstellen
        Pen.Width := FLineWidth;
        Pen.Color := AColor;
        // Perioden auftragen
        PolyLine( AOsc.Calc );
      end;
  end;

  procedure TMainForm.CalculateOsc( AId: Integer = -1; NoRefresh: Boolean = false );
  var
    X: Integer;
  begin
    FDivider := Pi / ( 2 * FXPeriod );
    if AId = -1 then
      AId := FCurrent;
    // Alte Berechnugnen löschen
    ClearCalc( FOscs[ AId ] );
    for X := Margins.Left to Margins.Right do
      if X mod FAccuracy = 0 then
        // Berechnung hinzufügen
        AddCalc( FOscs[ AId ], X, Round( Fourier( FOscs[ AId ], X ) * FYPeriod * 2 ) + YMid );

    if not NoRefresh then
      RefreshBuffer( false );
  end;

  procedure TMainForm.DrawGraphs( ACanvas: TCanvas );
  var
    I: Integer;
  begin
    for I := 0 to high( FOscs ) do
      DrawOscillation( ACanvas, FOscs[ I ], Colors[ I ] );
  end;

  procedure TMainForm.UpdateBox;
  var
    I: Integer;
  begin
    Box.Clear;
    for I := 0 to high( FOscs ) do
      with Box.Items.ADD do
        Caption := FOscs[ I ].name;
  end;

  procedure TMainForm.ResetOsc( AId: Integer = -1 );
  var
    I: Integer;
  begin
    if AId = -1 then
      AId := Current;
    with FOscs[ AId ] do
      begin
        Offset := 0;
        for I := 1 to LastOsc do
          begin
            Sines[ I ] := 0;
            CoSines[ I ] := 0;
          end;
      end;
    CalculateOsc;
  end;

  procedure TMainForm.CalculateAll;
  var
    I: Integer;
  begin
    if FDrawLock then
      Exit;
    // Größen ändern
    SetSizes;
    // Koordinatensystem überschreiben
    CoordinateSys( Coord.Canvas, True, -1, -1 );
    // Neu berechnen
    for I := 0 to high( FOscs ) do
      CalculateOsc( I, True );
    // Zeichnen
    RefreshBuffer( false );
  end;

  procedure TMainForm.SetSizes;
  begin
    Buffer.SetSize( Clip.Width, Clip.Height );
    Coord.SetSize( Clip.Width, Clip.Height );
  end;

  function TMainForm.GetOscCount;
  begin
    Result := Length( FOscs );
  end;

  procedure TMainForm.SetCurrent( Value: Integer );
  var
    ToolsEnabled: Boolean;
  begin
    if Value < -1 then
      Value := -1;
    if Value >= GetOscCount then
      Value := GetOscCount - 1;
    FCurrent := Value;
    ToolsEnabled := Value > -1;
    acSetSines.Enabled := ToolsEnabled;
    acSetCosines.Enabled := ToolsEnabled;
    acSetName.Enabled := ToolsEnabled;
    acDelete.Enabled := ToolsEnabled;
    acSetOffset.Enabled := ToolsEnabled;
    acReset.Enabled := ToolsEnabled;
  end;

  procedure TMainForm.SetVolume( const AValue: Byte );
  begin
    if FSoundEnabled then
      begin
        // Channel-Lautstärke verändern
        FSOUND_SetVolume( FChannel, AValue );
        // Label verändern
        SoundForm.labVolume.Caption := Format( '%d %%', [ MulDiv( AValue, 100, 255 ) ] );
      end;
  end;

  function TMainForm.GetVolume;
  begin
    if FSoundEnabled then
      Result := FSOUND_GetVolume( FChannel )
    else
      Result := 0;
  end;

  procedure TMainForm.SetFrequency( const AValue: Integer );
  begin
    // Bereich eingrenzen
    if AValue < 50 then
      FFrequency := 50
    else if AValue > 1000 then
      FFrequency := 1000
    else
      FFrequency := AValue;
    // Labels aktualisieren
    labFreq.Caption := Format( 'Frequenz: %d Hz', [ AValue ] );
    SoundForm.labFreq.Caption := Format( '%d Hz', [ AValue ] );
    // Bar aktualisieren
    FreqBar.Position := AValue;
    SoundForm.Frequency.Position := AValue;
  end;

  procedure TMainForm.SetPausing( const AValue: Boolean );
  begin
    // Sound aktiviert?
    if not FSoundEnabled then
      Exit;
    // Pausieren
    FSOUND_SetPaused( FChannel, AValue );
    FPausing := AValue;
  end;

end.
