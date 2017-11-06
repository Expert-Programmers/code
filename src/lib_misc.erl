-module(lib_misc).
-author("ltoddy").

%% API
-export([for/3, qsort/1, pythag/1, perms/1]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].

qsort([]) -> [];
qsort([Pivot | T]) ->
  qsort([X || X <- T, X < Pivot]) ++ [Pivot] ++ qsort([X || X <- T, X >= Pivot]).

%% 1> L = [23, 6, 2, 9, 27, 400, 78, 45, 61, 82, 14].
%% [23,6,2,9,27,400,78,45,61,82,14]
%% 2> lib_misc:qsort(L).
%% [2,6,9,14,23,27,45,61,78,82,400]


pythag(N) ->
  [
    {A, B, C} ||
    A <- lists:seq(1, N),
    B <- lists:seq(2, N),
    C <- lists:seq(3, N),
    A + B + C =< N,
    A * A + B * B =:= C * C
  ].

%% 1> lib_misc:pythag(16).
%% [{3,4,5},{4,3,5}]
%% 2> lib_misc:pythag(30).
%% [{3,4,5},{4,3,5},{5,12,13},{6,8,10},{8,6,10},{12,5,13}]


perms([]) -> [[]];
perms(L) -> [[H | T] || H <- L, T <- perms(L--[H])].

%% 2> lib_misc:perms("123").
%% ["123","132","213","231","312","321"]
%% 3> lib_misc:perms("cats").
%% ["cats","cast","ctas","ctsa","csat","csta","acts","acst",
%% "atcs","atsc","asct","astc","tcas","tcsa","tacs","tasc",
%% "tsca","tsac","scat","scta","sact","satc","stca","stac"]