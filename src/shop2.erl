-module(shop2).
-author("ltoddy").
-import(lists, [map/2, sum/1]).

%% API
-export([]).

total(L) ->
  sum(map(fun({What, N}) -> shop:cost(What) * N end, L)).