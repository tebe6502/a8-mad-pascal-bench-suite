{$librarypath 'zlibs'}

//---------------------- INTERFACE ---------------------------------------------

interface
  procedure benchmark;
  procedure rewriteCounter;
  procedure run;

  var
    name   : string[25];

implementation

uses counter;