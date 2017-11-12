-module(walks).
-author("ltoddy").

%% API
-export([plan_route/2, plan_route1/2]).

-spec plan_route(From :: point(), To :: point()) -> route().
%% 调用plan_route/2函数时使用了两个类型为point()的参数,此函数就会返回一个类型为route()的对象.


-type direction() :: north | south | east | west.
%% 引入一个名为direction()的新类型,它的值是下列原子之一: north | south | east | west.
-type point() :: {integer(), integer()}.
%% point()类型是一个包含两个整数的元组(integer()是预定义类型).
-type route() :: [{go, direction(), integer()}].
%% route()类型定义为一个由三元组构成的列表,每个元组都包含一个原子go,一个类型为direction的对象和一个整数.


plan_route({X1, Y1}, {X2, Y2}) -> [].


-type angle() :: {Degress :: 0..360, Minutes :: 0..60, Seconds :: 0..60}.
-type position() :: {latitude | longitude, angle()}.
-spec plan_route1(From :: position(), To :: position()) -> [].


plan_route1(_, _) -> a.