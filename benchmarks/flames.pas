unit flames;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

const
  base: array[0..13] of byte = (
    170,150,144,144,122,122,110,110,94,94,86,86,82,80
  );
  fireScreen   = lms + $400;
  fireCharset  = lms - $10;

var
  pOff     : pointer absolute $e8;
  pOn      : pointer absolute $ea;
  color4   : byte absolute $d01a;
  gprior   : byte absolute $d01b;

procedure g9off; assembler; interrupt;
asm
{
  pha
  mva #0 GPRIOR
  mva #$22 DMACTL
  mva #>gr.counterCharset CHBASE
  mwa pOn __dlivec
  pla
};
end;

procedure g9on; assembler; interrupt;
asm
{
  pha
  mva #$40 GPRIOR
  mva #$21 DMACTL
  mva #>fireCharset CHBASE
  mwa pOff __dlivec
  pla
};
end;


procedure benchmark;
var
  zc         : byte absolute counterLms + $23;
  zd         : byte absolute counterLms + $24;
  ze         : byte absolute counterLms + $25;
  zf         : byte absolute counterLms + $26;
  zg         : byte absolute counterLms + $27;
  b0i        : byte absolute $e0;
  b1i        : byte absolute $e1;
  tmp        : byte absolute $e2;
  p0, p1, p2 : PByte;

  colheight: array[0..13] of byte;

begin
  pOff := @g9off; pOn := @g9on;
  EnableDLI(pOff); mode2;
  gprior := $40; color4 := $20; tmp := 0;

  p0 := pointer(fireCharset);
  for b0i := 0 to $f do begin
    for b1i := 0 to 7 do p0[b1i] := tmp;
    inc(tmp,$11); inc(p0,8);
  end;

  FillChar(pointer(counterLms + $23), 5, 0);

  rtclok := 0;
  while rtclok < 250 do begin
  //while true do begin

    p0 := pointer(fireScreen - 31);
    p1 := pointer(fireScreen - 31 + $100);
    p2 := pointer(fireScreen - 31 + $200);

    for b0i := 255 downto 0 do begin
      p0^ := byte(p0[30] + p0[31] + p0[32] + p0[63]) shr 2;
      p1^ := byte(p1[30] + p1[31] + p1[32] + p1[63]) shr 2;
      p2^ := byte(p2[30] + p2[31] + p2[32] + p2[63]) shr 2;

      inc(p0); inc(p1); inc(p2);
    end;
    //colbk := 10; pause;

    p0 := pointer(fireScreen + $2e0);
    for b0i := $1f downto 0 do p0[b0i] := rnd and 15;

    inc(zg);
    if zg = 10 then begin inc(zf); zg := 0 end;
    if zf = 10 then begin inc(ze); zf := 0 end;
    if ze = 10 then begin inc(zd); ze := 0 end;
    if zd = 10 then begin inc(zc); zd := 0 end;
  end;

  DisableDLI; gprior := 0; dmactl := $22;
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Flames GR2 250 frames'~;
  isRewritable := true;
end.