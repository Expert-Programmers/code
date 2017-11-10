-module(attrs).
-author("me").
-vsn(1234).
-purpose("example of attributes").

%% API
-export([fac/1]).

fac(1) -> 1;
fac(N) -> N * fac(N - 1).

%%  2> attrs:module_info().
%%  [{module,attrs},
%%  {exports,[{fac,1},{module_info,0},{module_info,1}]},
%%  {attributes,[{author,"me"},
%%  {vsn,[1234]},
%%  {purpose,"example of attributes"}]},
%%  {compile,[{options,[]},
%%  {version,"6.0.3"},
%%  {time,{2017,11,10,14,23,19}},
%%  {source,"/home/me/IdeaProjects/code/src/attrs.erl"}]},
%%  {md5,<<206,189,170,36,103,236,83,182,14,45,135,93,102,1,
%%  177,185>>}]

%%  3> beam_lib:chunks("attrs.beam", [attributes]).
%%  {ok,{attrs,[{attributes,[{author,"me"},
%%  {purpose,"example of attributes"},
%%  {vsn,[1234]}]}]}}