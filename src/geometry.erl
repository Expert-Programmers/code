-module(geometry).
-author("ltoddy").

%% API
-export([area/1]).


area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side.