% Generated Code Do Not Modify
% package org.allbinary.game.input.analog
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('AnalogLocationInputFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AnalogLocationInputFactory':new()),
    ok.

init_fields(This) ->
    put({This, list}, 'BasicArrayListD':new()),
    ok.


getInstance() ->
        get({'AnalogLocationInputFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

addPlayer(This, PlayerInputId) when is_integer(PlayerInputId) ->
        put({local, analogLocationInput}, get({'AnalogLocationInput', 'NULL_ANALOG_LOCATION_INPUT'})),
        case (PlayerInputId < (get({get({This, list}), '$class'})):size(get({This, list}))) of
            true ->
            put({local, analogLocationInput}, (get({get({This, list}), '$class'})):get(get({This, list}), PlayerInputId));
            false -> ok
        end,
        case (get({local, analogLocationInput}) =:= get({'AnalogLocationInput', 'NULL_ANALOG_LOCATION_INPUT'})) of
            true ->
            put({local, analogLocationInput}, 'AnalogLocationInput':new(PlayerInputId)),
            (get({get({This, list}), '$class'})):add(get({This, list}), get({local, analogLocationInput}));
            false -> ok
        end.

getInstanceForPlayer(This, PlayerInputId) when is_integer(PlayerInputId) ->
        (get({get({This, list}), '$class'})):get(get({This, list}), PlayerInputId).

getList(This) ->
        get({This, list}).

