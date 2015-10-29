unit Export;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFormExport = class(TForm)
    Label1: TLabel;
    edtW: TEdit;
    Label2: TLabel;
    edtH: TEdit;
    Label3: TLabel;
    edtFormat: TComboBox;
    edtLWidth: TEdit;
    Label4: TLabel;
    Bevel1: TBevel;
    edtX: TEdit;
    Label5: TLabel;
    edtY: TEdit;
    Label6: TLabel;
    Bevel2: TBevel;
    Label7: TLabel;
    edtAlpha: TCheckBox;
    Panel1: TPanel;
    Bevel3: TBevel;
    Button1: TButton;
    Button2: TButton;
    procedure edtFormatChange(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormExport: TFormExport;

implementation

{$R *.dfm}

procedure TFormExport.edtFormatChange(Sender: TObject);
begin
  if edtFormat.ItemIndex = 0 then
    edtAlpha.Enabled := True
  else
  begin
    edtAlpha.Enabled := False;
    edtAlpha.Checked := False;
  end;
end;

end.
