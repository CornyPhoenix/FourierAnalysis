unit GlobalFunctions;

interface

  uses StdCtrls, Forms, Graphics;

  procedure DesignForm( const AForm: TForm );
  procedure DesignLabel( const ALabel: TLabel );

implementation

  procedure DesignForm( const AForm: TForm );
  const
    FName = 'Segoe UI';
  begin
    if Screen.Fonts.IndexOf( FName ) > -1 then
      AForm.Font.name := FName;
    AForm.Font.Size := 9;
  end;

  procedure DesignLabel( const ALabel: TLabel );
  begin
    with ALabel.Font do
      begin
        Size := 12;
        Color := clHotLight;
      end;
  end;

end.
