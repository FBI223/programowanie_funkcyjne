-module(zadanie2).
-export([start/0, procesA/1, procesB/0]).

procesB() -> receive
               czesc ->
                 io:format("Proces B otrzymal atom czesc.~n")
             end.

procesA(PID) -> PID ! czesc,
  io:format("Proces A wyslal atom czesc do B.~n").

start() -> BPID = spawn(zadanie2, procesB, []),
  io:format("Start procesu B, PID = ~p.~n", [BPID]),
  APID = spawn(zadanie2, procesA, [BPID]),
  io:format("Start procesu A, PID = ~p.~n", [APID]).