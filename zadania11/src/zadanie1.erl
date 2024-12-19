%%%-------------------------------------------------------------------
%%% @author msztu223
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. gru 2024 10:45
%%%-------------------------------------------------------------------
-module(zadanie1).
-export([start/1, process/2]).

process(Id, 1) ->
  io:format("Proces ~p~n", [Id]);
process(Id, N) ->
  io:format("Proces ~p~n", [Id]),
  process(Id, N - 1).

start(1) ->
  spawn(zadanie1, process, [1, 5]);
start(N) ->
  spawn(zadanie1, process, [N, 5]),
  start(N-1).