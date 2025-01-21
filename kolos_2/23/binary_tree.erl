%%% Moduł tworzący drzewo binarne procesów.
-module(binary_tree).
-export([start/2, process/3]).

%%% Funkcja start(N, X) inicjalizuje pierwszy proces.
start(N, X) ->
    spawn(?MODULE, process, [N, X, self()]).

%%% Funkcja process(N, X, Parent) tworzy dwa procesy potomne, zbiera wyniki
%%% i wypisuje listę.
process(N, X, Parent) ->
    if
        N > 0 ->
            LeftChild = spawn(?MODULE, process, [N - 1, 2 * X, self()]),
            RightChild = spawn(?MODULE, process, [N - 1, 2 * X + 1, self()]),
            Results = [receive {Child, Result} -> Result end || Child <- [LeftChild, RightChild]],
            FullList = [X | lists:concat(Results)],
            io:format("~p~n", [FullList]),
            Parent ! {self(), FullList};
        N =:= 0 ->
            io:format("~p~n", [[X]]),
            Parent ! {self(), [X]}
    end.