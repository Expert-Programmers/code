-module(area_server2).
-author("ltoddy").

%% API
-export([rpc/2, loop/0]).

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} ->
      Response
  end.

loop() ->
  receive
    {From, {rectangle, Width, Height}} ->
      From ! {self(), Width * Height},
      loop();
    {From, {circle, R}} ->
      From ! {self(), R * R * math:pi()};
    {From, Other} ->
      From ! {self(), {error, Other}},
      loop()
  end.