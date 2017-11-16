-module(area_server_final).
-author("ltoddy").

%% API
-export([start/0, area/2, loop/0]).

start() -> spawn(area_server_final, loop(), []).

area(Pid, What) ->
  rpc(Pid, What).

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} -> Response
  end.

loop() ->
  receive
    {From, {rectangle, Width, Height}} -> From ! {self(), Width * Height}, loop();
    {From, {circle, R}} -> From ! {self(), math:pow(R, 2) * math:pi()}, loop();
    {From, Other} -> From ! {self(), {error, Other}}, loop()
  end.