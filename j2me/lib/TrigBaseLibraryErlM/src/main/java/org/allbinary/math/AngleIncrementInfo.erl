%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% 
% Created By: Travis Berthelot
%  
% Generated Code Do Not Modify
% package org.allbinary.math
% import jsinterop.annotations.JsType
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import jsinterop.annotations.JsProperty
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor

-module('AngleIncrementInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'INCREMENT'}, "Inc: "),
    ok.

init_fields(This) ->
    put({This, angleIncrement}, 0),
    put({This, 'DOWN_FRAME'}, undefined),
    put({This, 'UP_FRAME'}, undefined),
    put({This, 'LEFT_FRAME'}, undefined),
    put({This, 'RIGHT_FRAME'}, undefined),
    put({This, frameUtil}, 'FrameUtil':getInstance()),
    ok.


new(AngleIncrement) when is_integer(AngleIncrement) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AngleIncrement),
    This.

init(This, AngleIncrement) when is_integer(AngleIncrement) ->
    init_fields(This),
        put({This, angleIncrement}, AngleIncrement),
        AngleFactory = 'AngleFactory':getInstance(),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        put({This, 'DOWN_FRAME'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, ((get({get({AngleFactory, 'DOWN'}), '$class'})):getValue(get({AngleFactory, 'DOWN'})) / get({This, angleIncrement})))),
        put({This, 'UP_FRAME'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, trunc((get({get({AngleFactory, 'UP'}), '$class'})):getValue(get({AngleFactory, 'UP'}))))),
        put({This, 'LEFT_FRAME'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, ((get({get({AngleFactory, 'LEFT'}), '$class'})):getValue(get({AngleFactory, 'LEFT'})) / get({This, angleIncrement})))),
        put({This, 'RIGHT_FRAME'}, (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, ((get({get({AngleFactory, 'RIGHT'}), '$class'})):getValue(get({AngleFactory, 'RIGHT'})) / get({This, angleIncrement})))).

getFrameAngle(This, Frame) when is_integer(Frame) ->
        (get({get({This, frameUtil}), '$class'})):getFrameAngle(get({This, frameUtil}), Frame, get({This, angleIncrement})).

getAngleIncrement(This) ->
        get({This, angleIncrement}).

toString(This) ->
        (fun(Target_N66686) -> (get({Target_N66686, '$class'})):toString(Target_N66686) end)((fun(Target_N66693) -> (get({Target_N66693, '$class'})):appendshort(Target_N66693, get({This, angleIncrement})) end)((fun(Target_N66700) -> (get({Target_N66700, '$class'})):append(Target_N66700, get({'AngleIncrementInfo', 'INCREMENT'})) end)('StringMaker':new()))).

getClosestGeneralDirection(This, Angle) when is_integer(Angle) ->
        put({local, closestDirection}, (fun(Target_N66808) -> (get({Target_N66808, '$class'})):getAt(Target_N66808, 360) end)('SmallIntegerSingletonFactory':getInstance())),
        case (((get({get({This, 'UP_FRAME'}), '$class'})):intValue(get({This, 'UP_FRAME'})) - Angle) < ((get({get({local, closestDirection}), '$class'})):intValue(get({local, closestDirection})) - Angle)) of
            true ->
            put({local, closestDirection}, get({This, 'UP_FRAME'}));
            false -> ok
        end,
        case (((get({get({This, 'DOWN_FRAME'}), '$class'})):intValue(get({This, 'DOWN_FRAME'})) - Angle) < ((get({get({local, closestDirection}), '$class'})):intValue(get({local, closestDirection})) - Angle)) of
            true ->
            put({local, closestDirection}, get({This, 'DOWN_FRAME'}));
            false -> ok
        end,
        case (((get({get({This, 'LEFT_FRAME'}), '$class'})):intValue(get({This, 'LEFT_FRAME'})) - Angle) < ((get({get({local, closestDirection}), '$class'})):intValue(get({local, closestDirection})) - Angle)) of
            true ->
            put({local, closestDirection}, get({This, 'LEFT_FRAME'}));
            false -> ok
        end,
        case (((get({get({This, 'RIGHT_FRAME'}), '$class'})):intValue(get({This, 'RIGHT_FRAME'})) - Angle) < ((get({get({local, closestDirection}), '$class'})):intValue(get({local, closestDirection})) - Angle)) of
            true ->
            put({local, closestDirection}, get({This, 'RIGHT_FRAME'}));
            false -> ok
        end,
        (get({get({local, closestDirection}), '$class'})):intValue(get({local, closestDirection})).

