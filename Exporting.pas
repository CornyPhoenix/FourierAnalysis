unit Exporting;

interface

  uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls;

  type
    TExportForm = class( TForm )
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
      btnOK: TButton;
      btnCancel: TButton;
      Head: TLabel;
      procedure edtFormatChange( Sender: TObject );
      procedure FormResize( Sender: TObject );
      procedure FormCreate( Sender: TObject );
    private
    { Private-Deklarationen }
    public
    { Public-Deklarationen }
    end;

  var
    ExportForm: TExportForm;

implementation

  uses GlobalFunctions;
  {$R *.dfm}

  procedure TExportForm.edtFormatChange( Sender: TObject );
  begin
    if edtFormat.ItemIndex = 0 then
      edtAlpha.Enabled := True
    else
      begin
        edtAlpha.Enabled := False;
        edtAlpha.Checked := False;
      end;
  end;

  procedure TExportForm.FormCreate( Sender: TObject );
  begin
    DesignForm( Self );
    DesignLabel( Head );
  end;

  procedure TExportForm.FormResize( Sender: TObject );
  begin
    Bevel1.Width := ClientWidth - 32;
    Bevel2.Width := Bevel1.Width;
    edtFormat.Width := ClientWidth - edtFormat.Left - 24;
    btnOK.Left := ClientWidth - btnOK.Width - 8;
  end;

end.
