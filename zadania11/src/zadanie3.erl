-module(zadanie3).
-export([start/0, server/0, client/2]).

server() ->
  receive
    koniec ->
      io:format("<client> List end~n");
    N ->
      io:format("~p~n", [N * N]),
      server()
  end.

client(Pid, []) ->
  Pid ! koniec;
client(Pid, [N |Ns]) ->
  Pid ! N,
  client(Pid, Ns).

start() ->
  Srv = spawn(zadanie3, server, []),
  spawn(zadanie3, client, [Srv, [1,2,3,4]]).