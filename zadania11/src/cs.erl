%%%-------------------------------------------------------------------
%%% @author msztu223
%%% @doc
%%% Mini client-server example with register/2 and timeout handling.
%%%-------------------------------------------------------------------

-module(cs).
-export([server/0, start/0, client/0, send_message/1]).

%% Server process: handles incoming messages
recvMsg() ->
  receive
    {client, From, Message} ->
      %% Display the received message
      io:format("Server received from ~p: ~p~n", [From, Message]),
      %% Optionally, send a reply
      From ! {server, "Message received"};
    _ ->
      %% Handle unknown messages
      io:format("Server received an unknown message.~n", [])
  after 5000 -> %% 5 seconds timeout
    io:format("Server: No messages received within 5 seconds.~n", [])
  end,
  recvMsg(). %% Continue receiving messages

server() ->
  io:format("Server started.~n", []),
  recvMsg().

%% Client process: sends a message to the registered server
client() ->
  case whereis(server) of
    undefined ->
      io:format("Client: Server is not running or registered.~n", []);
    Server_PID ->
      Server_PID ! {client, self(), "Hello from the client"},
      %% Wait for a reply from the server
      receive
        {server, Reply} ->
          io:format("Client received reply from server: ~p~n", [Reply])
      after 10000 -> %% 3 seconds timeout
        io:format("Client: No reply received within 3 seconds.~n", [])
      end
  end.

%% Helper function to send messages manually
send_message(Message) ->
  case whereis(server) of
    undefined ->
      io:format("No server found.~n", []);
    Server_PID ->
      Server_PID ! {client, self(), Message},
      io:format("Sent message: ~p~n", [Message])
  end.

%% Start function: spawns and registers the server
start() ->
  Server_PID = spawn(cs, server, []), %% Start the server
  register(server, Server_PID),      %% Register the server with the atom `server`
  io:format("Server registered with PID: ~p~n", [Server_PID]),
  spawn(cs, client, []).             %% Start the client
