-module(kvs).
-author("ltoddy").

%% API
-export([start/0, store/2, lookup/1]).


start() ->
  register(kvs, spawn(fun() -> loop() end)).


store(Key, Value) ->
  rpc({store, Key, Value}).


lookup(Key) -> rpc({lookup, Key}).

rpc(Q) ->
  kvs ! {self(), Q},
  receive
    {kvs, Reply} ->
      Reply
  end.

loop() ->
  receive
    {From, {store, Key, Value}} ->
      put(Key, {ok, Value}),
      From ! {kvs, true},
      loop();
    {From, {lookup, Key}} ->
      From ! {kvs, get(Key)},
      loop()
  end.

%%  2> kvs:start().
%%  true
%%  3> kvs:store({location, joe}, "Stockholm").
%%  true
%%  4> kvs:store(weather, raining).
%%  true
%%  5> kvs:lookup(weather).
%%  {ok,raining}
%%  6> kvs:lookup({location, joe}).
%%  {ok,"Stockholm"}
%%  7> kvs:lookup({location, jane}).
%%  undefined
