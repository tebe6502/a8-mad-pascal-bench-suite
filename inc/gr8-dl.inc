const
  dl: array [0..205] of byte = (
    $70,$70,$70,
    $42,counter.lms,$00,
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
    lo(word(@dl)),
    hi(word(@dl))
  );

procedure gr8;
begin
  sdlstl := word(@dl)
end;