-module(area_server1).
-author("ltoddy").

%% API
-export([rpc/2, loop/0]).

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    Response ->
      Response
  end.

loop() ->
  receive
    {From, {rectangle, Width, Height}} ->
      From ! Width * Height,
      loop();
    {From, {square, Side}} ->
      From ! Side * Side,
      loop();
    {From, Other} ->
      From ! {error, Other},
      loop()
  end.