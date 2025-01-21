
%% c('tree').
%% wejscie -> tree:start(2, 2, 1).                                                                                                                                          



%%% Moduł tworzący M-arne drzewo procesów o wysokości N.
-module(tree).
-export([start/3, process/4]).

%%% Funkcja start(M, N, X) inicjalizuje pierwszy proces.
start(M, N, X) ->
    Parent = self(),
    spawn(?MODULE, process, [M, N, X, Parent]).

%%% Funkcja process(M, N, X, Parent) tworzy M procesów potomnych, czeka na wyniki
%%% i wysyła wynik do procesu rodzica.
process(M, N, X, Parent) ->
    % Jeśli głębokość mniejsza niż N, twórz potomków.
    if
        N > 0 ->
            Children = spawn_children(M, N, X),
            Results = collect_results(Children),
            ResultList = lists:concat(Results),
            FullList = [X | ResultList],
            io:format("~p~n", [FullList]),
            Parent ! {self(), FullList};
        N =:= 0 ->
            % Na ostatniej głębokości wypisz X i odeślij do rodzica.
            io:format("~p~n", [[X]]),
            Parent ! {self(), [X]}
    end.

%%% Funkcja spawn_children(M, N, X) tworzy M procesów potomnych z odpowiednimi parametrami.
spawn_children(M, N, X) ->
    lists:map(
        fun(Idx) ->
            spawn(?MODULE, process, [M, N - 1, X * M + Idx, self()])
        end,
        lists:seq(0, M - 1)
    ).

%%% Funkcja collect_results(Children) zbiera wyniki od wszystkich potomków.
collect_results(Children) ->
    collect_results(Children, []).

collect_results([], Acc) ->
    lists:reverse(Acc);
collect_results([Child | Rest], Acc) ->
    receive
        {Child, Result} ->
            collect_results(Rest, [Result | Acc])
    end.
