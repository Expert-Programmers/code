-module(a).
-author("ltoddy").
-compile(export_all).

%% API
-export([]).

start(Tag) ->
  spawn(fun() -> loop(Tag) end).

loop(Tag) ->
  sleep(),
  Val = b:x(),
  io:format("Vsn! (~p) b:x() = ~p~n", [Tag, Val]),
  loop(Tag).


sleep() ->
  receive after 3000 -> true end.