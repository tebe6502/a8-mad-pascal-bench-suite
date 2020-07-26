{$librarypath 'zlibs'}

unit montecarlo;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../includes/interface.inc'}

var
  score     : word absolute $ec;

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

uses counter;

procedure benchmark;
var
  rnd       : byte absolute $D20A;
  i         : word absolute $e0;
  r         : word absolute $e2;
  x         : word absolute $e4;
  y         : word absolute $e6;
  bingo     : word absolute $e8;
  probe     : word absolute $ea;
  n         : byte absolute $ee;
begin
  bingo := 0;
  r := 127 * 127;
  probe := 9999;
  for i := probe downto 0 do begin
    n := rnd;
    if (n > 127) then n:= n xor %10000000;
    x := n * n;
    n := rnd;
    if (n > 127) then n:= n xor %10000000;
    y := n * n;
    if (x + y) <= r then inc(bingo);
  end;
  score := 4 * bingo;
end;

procedure run;
begin
  counter.prepare(name);
  counter.stop := false;
  benchmark;
  counter.stop := true;
  pause(50);
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'MonteCarlo'~;
end.
