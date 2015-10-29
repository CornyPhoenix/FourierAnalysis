unit PrintFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Printers, PNGImage, PNGFuncs;

type
  TPrintForm = class(TForm)
    Preview: TImage;
    Label1: TLabel;
    edtLW: TEdit;
    Label2: TLabel;
    Bottom: TPanel;
    Button1: TButton;
    Bevel1: TBevel;
    Button2: TButton;
    Button3: TButton;
    Label3: TLabel;
    Label4: TLabel;
    edtXP: TEdit;
    Label5: TLabel;
    edtYP: TEdit;
    Label6: TLabel;
    PrevPan: TPanel;
    procedure FormShow(Sender: TObject);
    procedure edtLWKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
  private
    procedure RefreshPreview;
    function GetMyLineWidth: Integer;
    function GetMyXPeriod: Integer;
    function GetMyYPeriod: Integer;
  public
    property MyLineWidth: Integer read GetMyLineWidth;
    property MyXPeriod: Integer read GetMyXPeriod;
    property MyYPeriod: Integer read GetMyYPeriod;
  end;

var
  PrintForm: TPrintForm;

const
  PageW = 297;
  PageH = 210;

implementation

uses
  Main;

{$R *.dfm}

function MMToPix( AMili: Single ): Integer; overload;
begin
  Result := Trunc( AMili * Printer.PageWidth / PageW );
end;

function MMToPix( const AMiliString: String ): Integer; overload;
begin
  Result := MMToPix( StrToFloatDef( AMiliString, 0 ) );
end;

procedure TPrintForm.Button2Click(Sender: TObject);
begin
  RefreshPreview;
end;

procedure TPrintForm.edtLWKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet( Key, ['0'..'9',',',#8,#46] ) then
    Key := #0;
end;

procedure TPrintForm.FormShow(Sender: TObject);
begin
  RefreshPreview;
end;

procedure TPrintForm.RefreshPreview;
var
  Page: TPoint;
  I: Integer;
  PNG: TPNG;

  procedure Prepare;
  begin
    // Seitenausmaße ermitteln
    Page.X := Printer.PageWidth;
    Page.Y := Printer.PageHeight;
    MainForm.LineWidth := PrintForm.MyLineWidth;
    MainForm.XPeriod := PrintForm.MyXPeriod;
    MainForm.YPeriod := PrintForm.MyYPeriod;
  end;

begin
  PNG := TPNG.CreateBlank( COLOR_RGBALPHA, 8, Printer.PageWidth, Printer.PageHeight );
  try
    // Alphachannel füllen
    PNG.FillAlpha;
    // Querformat
    Printer.Orientation := poLandscape;
    Printer.BeginDoc;
    // Vorbereitung
    Prepare;
    // Zeichnen
    MainForm.CoordinateSys( PNG.Canvas, True, PNG.Width, PNG.Height );
    // Berechnen
    for I := 0 to MainForm.OscCount-1 do
      MainForm.CalculateOsc(I, True);
    // Graphen auftragen
    MainForm.DrawGraphs( PNG.Canvas );
    // Verwerfen
    Printer.Abort;
    // Standardwerte
    MainForm.DefaultValues;
    // Antialias
    PNG.Resize( Preview.Width, Preview.Height );
    // Altes Bild löschen
    Preview.Picture := nil;
    // Aufzeichnen
    PNG.Draw( Preview.Canvas, Rect( 0, 0, Preview.Width, Preview.Height ) );
  finally
    PNG.Free;
  end;
end;

function TPrintForm.GetMyLineWidth;
begin
  Result := MMToPix( edtLW.Text );
end;

function TPrintForm.GetMyXPeriod;
begin
  Result := MMToPix( edtXP.Text );
end;

function TPrintForm.GetMyYPeriod;
begin
  Result := MMToPix( edtYP.Text );
end;

end.
