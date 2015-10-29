unit ValueEditor;

interface

  uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Spin, StdCtrls,
    Oscill;

  type
    TValueForm = class( TForm )
      Label1: TLabel;
      Label2: TLabel;
      edtValue: TEdit;
      SpinValue: TSpinButton;
      Panel: TPanel;
      Bevel2: TBevel;
      btnOK: TButton;
      Button2: TButton;
      edtAmp: TEdit;
      Label3: TLabel;
      SpinAmp: TSpinButton;
      procedure SpinValueDownClick( Sender: TObject );
      procedure SpinValueUpClick( Sender: TObject );
      procedure edtValueKeyPress( Sender: TObject; var Key: Char );
      procedure SpinAmpUpClick( Sender: TObject );
      procedure SpinAmpDownClick( Sender: TObject );
      procedure btnOKClick( Sender: TObject );
      procedure FormCreate( Sender: TObject );
      procedure PanelResize( Sender: TObject );
      procedure FormResize( Sender: TObject );
    private
      FSubject: string;
      procedure SetSubject( const AValue: string );
      function GetValue: Integer;
      function GetAmp: Integer;
    public
      property Subject: string read FSubject write SetSubject;
      property Value: Integer read GetValue;
      property Amplitude: Integer read GetAmp;
    end;

  function ValueEdit( const ASubject: string ): Integer;

  var
    ValueForm: TValueForm;

implementation

  uses GlobalFunctions;

  procedure TValueForm.SetSubject( const AValue: string );
  begin
    FSubject := AValue;
    Caption := AValue + ' implementieren';
    Label2.Caption := 'Bitte geben Sie die Anzahl der Berechnungen für eine ' + AValue + ' ein:';
  end;

  procedure TValueForm.SpinAmpDownClick( Sender: TObject );
  var
    V: Integer;
  begin
    V := StrToInt( edtAmp.Text );
    Dec( V );
    edtAmp.Text := IntToStr( V );
  end;

  procedure TValueForm.SpinAmpUpClick( Sender: TObject );
  var
    V: Integer;
  begin
    V := StrToInt( edtAmp.Text );
    Inc( V );
    edtAmp.Text := IntToStr( V );
  end;

  procedure TValueForm.SpinValueDownClick( Sender: TObject );
  var
    V: Integer;
  begin
    V := StrToInt( edtValue.Text );
    Dec( V );
    if V < 1 then
      Inc( V );
    edtValue.Text := IntToStr( V );
  end;

  procedure TValueForm.SpinValueUpClick( Sender: TObject );
  var
    V: Integer;
  begin
    V := StrToInt( edtValue.Text );
    Inc( V );
    if V > LastOsc then
      Dec( V );
    edtValue.Text := IntToStr( V );
  end;

  procedure TValueForm.btnOKClick( Sender: TObject );
  begin
    if Amplitude = 0 then
      TaskMessageDlg( 'Fehler', 'Sie haben die Amplitude gleich Null gesetzt.', mtError, [ mbOK ], 0 )
    else
      ModalResult := mrOK;
  end;

  procedure TValueForm.edtValueKeyPress( Sender: TObject; var Key: Char );
  begin
    if not CharInSet( Key, [ '0' .. '9', '-', #46, #8 ] ) then
      Key := #0;
  end;

  procedure TValueForm.FormCreate( Sender: TObject );
  begin
    edtValue.Text := IntToStr( LastOsc );
    // Design einschalten
    DesignForm( Self );
  end;

  procedure TValueForm.FormResize( Sender: TObject );
  begin
    // Edits verschieben
    edtValue.Left := ( ClientWidth - edtValue.Width ) div 2;
    edtAmp.Left := edtValue.Left;
    // Spinner verschieben
    SpinValue.Left := edtValue.Left + edtValue.Width + 8;
    SpinAmp.Left := SpinValue.Left;
    // Labels verschieben
    Label1.Left := edtValue.Left - Label1.Width - 8;
    Label3.Left := Label1.Left;
  end;

  function TValueForm.GetValue;
  begin
    Result := StrTOIntDef( edtValue.Text, 0 );
  end;

  procedure TValueForm.PanelResize( Sender: TObject );
  begin
    btnOK.Left := ClientWidth - btnOK.Width - 8;
  end;

  function ValueEdit( const ASubject: string ): Integer;
  begin
    ValueForm.Subject := ASubject;
    if ValueForm.ShowModal = mrCancel then
      Result := -1
    else
      Result := ValueForm.Value;
  end;

  function TValueForm.GetAmp;
  begin
    Result := StrTOIntDef( edtAmp.Text, 1 );
  end;
  {$R *.dfm}

end.
