%%%-------------------------------------------------------------------
%%% @author msztu223
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. gru 2024 10:27
%%%-------------------------------------------------------------------
-module (procesy).
-export ([start/0,hello/2]).
hello(Msg,1) -> io:format("~p~n",[Msg]);
hello(Msg,N) -> io:format("~p~n",[Msg]), hello(Msg,N-1).

start() -> PID1=spawn(procesy,hello,["Proces 1",5]),
           PID2=spawn(procesy,hello,["Proces 2",5]), io:format("PID (Proces 1) = ~p,~nPID (Proces 2) = ~p~n", [PID1,PID2]).




