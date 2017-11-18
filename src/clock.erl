-module(clock).
-author("ltoddy").

%% API
-export([start/2, stop/0]).

start(Time, Fun) ->
  register(clock, spawn(fun() -> tick(Time, Fun) end)).

stop() -> clock ! stop.
tick(Time, Fun) ->
  receive
    stop ->
      stop
  after Time ->
    Fun(),
    tick(Time, Fun)
  end.