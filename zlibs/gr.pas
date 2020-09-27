unit gr;

//---------------------- INTERFACE ---------------------------------------------

interface

const
  counterLms = $20;
  lms        = $a010;

  procedure mode8;
  procedure mode4;
  procedure counterRow;

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

const
  dl8: array [0..205] of byte = (
    $70,$70,$70,
    $42,counterLms,$00,
    $70,
    $4f,lo(lms),hi(lms),
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,
    $4f,lo(lms)-$10,hi(lms)+$10,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$41,
    lo(word(@dl8)),
    hi(word(@dl8))
  );

  dl4: array [0..46] of byte = (
    $70,$70,$70,
    $42,counterLms,$00,
    $70,
    $49,lo(lms),hi(lms),
    $09,$09,$09,$09,$09,$09,$09,$09,
    $09,$09,$09,$09,$09,$09,$09,$09,
    $09,$09,$09,$09,$09,$09,$09,$09,
    $09,$09,$09,$09,$09,$09,$09,$09,
    $09,$09,
    $41,lo(word(@dl4)),hi(word(@dl4))
  );

  dlCounter: array [0..8] of byte = (
    $70,$70,$70,
    $42,counterLms,$00,
    $41,lo(word(@dlCounter)),hi(word(@dlCounter))
  );

var
  sdlstl : word absolute $D402;


procedure mode8;
begin
  sdlstl := word(@dl8)
end;

procedure mode4;
begin
  sdlstl := word(@dl4)
end;

procedure counterRow;
begin
  sdlstl := word(@dlCounter)
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization

end.
