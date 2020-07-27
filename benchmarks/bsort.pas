{$librarypath 'zlibs'}

unit bsort;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../inc/interface.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

uses counter;

procedure benchmark;
var
  i         : byte absolute $F0;
  n1        : byte absolute $F1;
  n2        : byte absolute $F2;
  tmp       : byte absolute $F3;
  size      : byte absolute $F4;
  sorttable : array[0..254] of byte;
begin
  size := 254; tmp := 255;
  while size<>0 do begin
    for i := 0 to 253 do begin
      n1 := sorttable[i];
      n2 := sorttable[i+1];
      if n1>n2 then begin
        sorttable[i] := n2;
        sorttable[i+1] := n1;
      end;
    end;
    dec(size);
  end;
end;

procedure rewriteCounter;
begin
end;

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Bubble Sort: 255 elements'~;
end.
