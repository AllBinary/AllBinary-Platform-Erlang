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
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor

-module('FrameUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FrameUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'FrameUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getFrameForAngle(This, Angle, AngleIncrement) when is_integer(Angle), is_integer(AngleIncrement) ->
        ((get({This, '$class'})):adjustAngleToFrameAngle(This, Angle) div AngleIncrement).

getFrameAngle(This, Frame, AngleIncrement) when is_integer(Frame), is_integer(AngleIncrement) ->
        FrameAngle = ((AngleIncrement * Frame) - 90),
        (get({This, '$class'})):adjustAngleToFrameAngle(This, FrameAngle).

adjustAngleToFrameAngle(This, CurrentAngle) when is_integer(CurrentAngle) ->
        put({local, currentAngle}, CurrentAngle),
        AngleFactory = 'AngleFactory':getInstance(),
        case (get({local, currentAngle}) > 359) of
            true ->
            put({local, currentAngle}, ((get({local, currentAngle}) - get({AngleFactory, 'TOTAL_ANGLE'})))),
            (fun Loop() -> case (get({local, currentAngle}) > 359) of true ->
                put({local, currentAngle}, ((get({local, currentAngle}) - get({AngleFactory, 'TOTAL_ANGLE'})))),
                Loop();
            false -> ok end end)();
            false -> ok
        end,
        case (get({local, currentAngle}) < 0) of
            true ->
            put({local, currentAngle}, ((get({local, currentAngle}) + get({AngleFactory, 'TOTAL_ANGLE'})))),
            (fun Loop() -> case (get({local, currentAngle}) < 0) of true ->
                put({local, currentAngle}, ((get({local, currentAngle}) + get({AngleFactory, 'TOTAL_ANGLE'})))),
                Loop();
            false -> ok end end)();
            false -> ok
        end,
        get({local, currentAngle}).

