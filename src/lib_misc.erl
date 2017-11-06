-module(lib_misc).
-author("ltoddy").

%% API
-export([for/3, qsort/1]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].

qsort([]) -> [];
qsort([Pivot | T]) ->
  qsort([X || X <- T, X < Pivot]) ++ [Pivot] ++ qsort([X || X <- T, X >= Pivot]).

%% 1> L = [23, 6, 2, 9, 27, 400, 78, 45, 61, 82, 14].
%% [23,6,2,9,27,400,78,45,61,82,14]
%% 2> lib_misc:qsort(L).
%% [2,6,9,14,23,27,45,61,78,82,400]
