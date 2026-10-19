% Generated Code Do Not Modify
% package org.allbinary.game.input.analog
% import org.allbinary.graphics.CustomGPoint

-module('AnalogLocationInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_ANALOG_LOCATION_INPUT'}, 'AnalogLocationInput':new((-1))),
    ok.

init_fields(This) ->
    put({This, playerId}, 0),
    put({This, customGPoint}, undefined),
    put({This, rz}, 0),
    put({This, rightTrigger}, 0),
    put({This, leftTrigger}, 0),
    ok.


new(PlayerId) when is_integer(PlayerId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PlayerId),
    This.

init(This, PlayerId) when is_integer(PlayerId) ->
    init_fields(This),
        put({This, playerId}, PlayerId),
        put({This, customGPoint}, 'CustomGPoint':new(0, 0, 0)).

getPlayerId(This) ->
        get({This, playerId}).

getCustomGPoint(This) ->
        get({This, customGPoint}).

getRz(This) ->
        get({This, rz}).

setRz(This, Rz) when is_integer(Rz) ->
        put({This, rz}, Rz).

getRightTrigger(This) ->
        get({This, rightTrigger}).

setRightTrigger(This, RightTrigger) when is_integer(RightTrigger) ->
        put({This, rightTrigger}, RightTrigger).

getLeftTrigger(This) ->
        get({This, leftTrigger}).

setLeftTrigger(This, LeftTrigger) when is_integer(LeftTrigger) ->
        put({This, leftTrigger}, LeftTrigger).

