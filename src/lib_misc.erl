-module(lib_misc).
-author("ltoddy").

%% API
-export([for/3, qsort/1, pythag/1, perms/1, odds_and_evens1/1, odds_and_evens2/1, sqrt/1, sum/1, sleep/1, flush_buffer/0, priority_receive/0, on_exit/2]).

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


odds_and_evens1(L) ->
  Odds = [X || X <- L, (X rem 2) =:= 1],
  Evens = [X || X <- L, (X rem 2) =:= 0],
  {Odds, Evens}.

%% 2> lib_misc:odds_and_evens1([1,2,3,4,5,6]).
%% {[1,3,5],[2,4,6]}

odds_and_evens2(L) -> odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H | T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc(T, [H | Odds], Evens);
    0 -> odds_and_evens_acc(T, Odds, [H | Evens])
  end;
odds_and_evens_acc([], Odds, Evens) ->
  {lists:reverse(Odds), lists:reverse(Evens)}.

%% 2> lib_misc:odds_and_evens2([1,2,3,4,5,6]).
%% {[5,3,1],[6,4,2]}

%% 2> lib_misc:odds_and_evens2([1,2,3,4,5,6]).
%% {[1,3,5],[2,4,6]}

sqrt(X) when X < 0 ->
  error({squareRootNegativeArgument, X});
sqrt(X) ->
  math:sqrt(X).

%%  1> math:sqrt(-1).
%%  ** exception error: an error occurred when evaluating an arithmetic expression
%%  in function  math:sqrt/1
%%  called as math:sqrt(-1)
%%  2> c(lib_misc).
%%  {ok,lib_misc}
%%  3> li
%%  lib         lib_misc    lists
%%  3> lib
%%  lib         lib_misc
%%  3> lib_misc:sqrt(-1).
%%  ** exception error: {squareRootNegativeArgument,-1}
%%  in function  lib_misc:sqrt/1 (lib_misc.erl, line 72)

sum(L) -> sum(L, 0).

sum([], N) -> N;
sum([H | T], N) ->
  sum(T, N + H).


sleep(T) ->
  receive
  after T ->
    true
  end.

flush_buffer() ->
  receive
    _Any ->
      flush_buffer()
  after 0 ->
    true
  end.

priority_receive() ->
  receive
    {alarm, X} ->
      {alarm, X}
  after 0 ->
    receive
      Any ->
        Any
    end
  end.

on_exit(Pid, Fun) ->
  spawn(
    fun() ->
      Ref = monitor(processe, Pid),
      receive
        {'DOWN', Ref, process, Pid, Why} ->
          Fun(Why)
      end
    end).