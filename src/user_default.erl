-module(user_default).
-author("ltoddy").

-compile(export_all).

%% API
hello() ->
  "Hello toddy how are you".

awat(Time) ->
  io:format("toddy is away and will be back in ~w minutes~n", [Time]).