unit Oscill;

interface

  uses Types;

  var
    LastOsc: Integer;

  type
    TOscillation = record
      Sines, Cosines: array of Single;
      Offset: Single;
      Calc: array of TPoint;
      name: string;
    end;

    TOscs = array of TOscillation;

  procedure AddCalc( var AOsc: TOscillation; X, Y: Integer );
  procedure ClearCalc( var AOsc: TOscillation );

implementation

  procedure AddCalc( var AOsc: TOscillation; X, Y: Integer );
  var
    L: Integer;
  begin
    L := Length( AOsc.Calc );
    Setlength( AOsc.Calc, L + 1 );
    AOsc.Calc[ L ] := Point( X, Y );
  end;

  procedure ClearCalc( var AOsc: TOscillation );
  begin
    Setlength( AOsc.Calc, 0 );
  end;

end.
