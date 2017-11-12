-module(test3).
-author("ltoddy").

%% API
-export([factorial/1, test/0]).

factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).

test() -> factorial(-5).