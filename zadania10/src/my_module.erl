%%%-------------------------------------------------------------------
%%% @author msztu223
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%% Moduł zawiera funkcje do obliczania współczynników dwumianowych,
%%% sprawdzania wartości oraz prosty komunikat powitalny.
%%% @end
%%% Created : 12. gru 2024 10:34
%%%-------------------------------------------------------------------
-module(my_module).
-author("msztu223").

%% Eksportowane funkcje
-export([binom/2, isZero/1, hello/0, silnia/1, fib/1, srednia/1, suma/1, length/1, posNeg/3, classify/1, split/1, rownanieKwadratowe/3, all_sublists/1, sublists/2, rownanieKwadratowe2/3]).

%% Funkcja silnia (factorial)
silnia(0) -> 1;
silnia(N) when N > 0 -> N * silnia(N - 1);
silnia(_) -> erlang:error(badarg). % Obsługa błędnych argumentów

%% Funkcja binom (współczynnik dwumianowy)
binom(N, K) when N >= 0, K >= 0, K =< N -> silnia(N) div (silnia(K) * silnia(N - K));
binom(_, _) -> erlang:error(badarg). % Obsługa błędnych argumentów

%% Funkcja isZero (sprawdza, czy liczba jest zerem)
isZero(0) -> yes;
isZero(_) -> no.

%% Funkcja hello (wyświetla komunikat powitalny)
hello() -> io:format("Hello, Erlang!~n").

%% Funkcja fib (ciąg Fibonacciego)
fib(0) -> 1;
fib(1) -> 1;
fib(N) when N >= 2 -> fib(N - 1) + fib(N - 2).

%% Funkcja suma (sumuje elementy listy)
suma([]) -> 0;
suma([A | Reszta]) -> A + suma(Reszta).

%% Funkcja length (oblicza długość listy)
length([]) -> 0;
length([_ | Reszta]) -> 1 + my_module:length(Reszta).

%% Funkcja srednia (średnia arytmetyczna listy)
srednia([]) -> -1;
srednia([A]) -> A;
srednia(Lista) -> suma(Lista) / my_module:length(Lista).




posNeg([],A,B) -> {A,B};
posNeg([EL | Rest] ,A , B )  when EL > 0 -> posNeg( Rest,A+1,B );
posNeg([EL | Rest] , A , B)  when EL < 0 -> posNeg( Rest,A,B+1 );
posNeg([_ | Rest] , A , B) -> posNeg( Rest,A,B ).



%% Funkcja główna
classify_elements(List) ->
  classify_elements(List, [], []).

%% Rekurencja ogonowa z akumulatorami
classify_elements([], Integers, Others) ->
  {lists:(Integers), lists:(Others)};
classify_elements([H | T], Integers, Others) ->
  case H of
    _ when is_integer(H) -> classify_elements(T, [H | Integers], Others)
  end.


classify(List) ->
  Integers = lists:filter(fun(X) -> is_integer(X) end, List),
  Others = lists:filter(fun(X) -> not is_integer(X) end, List),
  {Integers, Others}.


split (L) -> {lists:filter(fun (X) -> is_integer (X) end, L)  ,  lists:filter(fun (X) -> not is_integer(X) end, L)}.



rownanieKwadratowe2(A, B, C) ->
  D = B * B - 4 * A * C,
  if D < 0 ->
    brakRozwiazan;
    D == 0 ->
      -B / (2 * A);
    true ->
      {(-B - math:sqrt(D)) / (2 * A), (-B + math:sqrt(D)) / (2 * A)}
  end.

rownanieKwadratowe(A, B, _) when A =:= 0, B =:= 0 -> "Brak rozwiazan";
rownanieKwadratowe(A, B, C) when A =:= 0 -> -C / B;
rownanieKwadratowe(A, B, C) -> Delta = B * B - 4 * A * C,
  rozwiazanie(A, B, Delta).


rozwiazanie(_, _, Delta) when Delta < 0 -> "Brak rozwiazan";
rozwiazanie(A, B, 0) -> -B / (2 * A);
rozwiazanie(A, B, Delta) when Delta > 0 -> Root = math:sqrt(Delta), {(-B + Root) / (2 * A), (-B - Root) / (2 * A)}.






-export([sublists/2]).

all_sublists([]) -> [[]];
all_sublists([H | T]) -> Podxs = all_sublists(T), Podxs ++ [ [H | Sub] || Sub <- Podxs ].

has_length(Len, List) -> erlang:length(List) =:= Len.

sublists(Len, List) ->
  Sublists = all_sublists(List),
  lists:filter(fun(Sub) -> has_length(Len, Sub) end, Sublists).

