-module(walks).
-export([plan_route/2]).

-spec plan_route(point(), point()) -> route().

-type direction() :: north | south | east | west.
-type point()     :: {integer(), integer()}.
-type route()     :: [{go,direction(),integer()}].
%% there is no code here
%% this is deliberate
plan_route({X1,Y1}, {X2, Y2}) -> [].

-type angle()       :: {Degrees::0..360, Minutes::0..60, Seconds::0..60}.
-type position()    :: {latitude | longitude, angle()}.
-spec plan_route1(From::position(), To::position()) -> [].

plan_route1(_,_) -> a.
