% Generated Code Do Not Modify
% package org.allbinary.game

-module('BasicGameInfoFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'BasicGameInfoFactory':new()),
    ok.

init_fields(This) ->
    put({This, currentReleaseIndex}, 0),
    put({This, currentDestroyIndex}, 0),
    put({This, total}, 0),
    ok.


getInstance() ->
        get({'BasicGameInfoFactory', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

init(This, Total) when is_integer(Total) ->
        put({This, currentReleaseIndex}, 0),
        put({This, currentDestroyIndex}, 0),
        put({This, total}, Total).

isPeaked(This) ->
        try
        case (get({This, currentDestroyIndex}) >= get({This, total})) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

howManyLeft(This) ->
        (get({This, total}) - get({This, currentDestroyIndex})).

