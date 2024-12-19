%%%-------------------------------------------------------------------
%%% @author
%%% @doc
%%% Zadanie 4 - Serwer oblicza kwadraty i odsyła wyniki do klienta.
%%%-------------------------------------------------------------------

-module(zadanie4).
-export([server1/0, start1/0, client1/1]).

%% Serwer: odbiera liczby, oblicza kwadrat i odsyła wynik
recvMsg(Results) ->
  receive
    {client1, From, Number} ->
      Square = Number * Number,
      io:format("Serwer: Otrzymano ~p, wysyłam ~p~n", [Number, Square]),
      From ! {server1, Square},
      recvMsg([Square | Results]); %% Zapisz wynik i kontynuuj
    stop ->
      io:format("Serwer kończy działanie.~nOstateczne wyniki: ~p~n", [lists:reverse(Results)]);
    _ ->
      io:format("Serwer: Nieznany komunikat.~n"),
      recvMsg(Results)
  after 3000 -> %% 3 sekundy timeout
    io:format("Serwer kończy działanie z powodu braku komunikatów.~nOstateczne wyniki: ~p~n", [lists:reverse(Results)])
  end.

server1() ->
  io:format("Serwer wystartował.~n", []),
  recvMsg([]). %% Rozpocznij z pustą listą wyników

%% Klient: wysyła liczby do serwera
client1(Server_PID) ->
  Numbers = [1, 2, 3,4,5,6,7,8,9], %% Lista liczb do wysłania
  lists:foreach(
    fun(Number) ->
      Server_PID ! {client1, self(), Number}, %% Wyślij liczbę do serwera
      receive
        {server1, Square} ->
          io:format("Klient dostał ~p.~n",  [Square])
      after 3000 -> %% 3 sekundy timeout
        io:format("Klient: Brak odpowiedzi od serwera.~n", [])
      end
    end,
    Numbers
  ).

%% Funkcja startowa
start1() ->
  Server_PID = spawn(zadanie4, server1, []), %% Start serwera
  io:format("Start serwera, PID = ~p.~n", [Server_PID]),
  spawn(zadanie4, client, [Server_PID]).    %% Start klienta







-module (zadanie4).
-export ([start2/0, client2/2, server2/0]).

client2(ServerPID, [Head|Tail]) ->
  ServerPID ! [self(), Head],
  receive
    N ->
      io:format("~p~n",[N]),
      client2(ServerPID, Tail)
  end;
client2(ServerPID, []) -> 1=1.

server2() ->
  receive
    [ClientPID, N] ->
      ClientPID ! (N*N),
      server2()
  after 3000 ->
    io:format("koniec")
  end.

start2() ->
  ServerPID = spawn(zad4, server2, []),
  io:format("~p~n", [ServerPID]),
  ClientPID = spawn(zad4, client2, [ServerPID, [7,8,9]]),
  io:format("~p~n", [ClientPID]).

