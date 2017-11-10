-module(abc).
-author("me").

-import(lists, [map/2]).

%% API
-export([f/1]).

f(L) ->
  L1 = map(fun(X) -> 2 * X end, L),
  lists:sum(L1).