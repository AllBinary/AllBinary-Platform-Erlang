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
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor

-module('AngleInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'ANGLE'}, "Angle: "),
    ok.

init_fields(This) ->
    put({This, angleIncrementInfo}, undefined),
    put({This, angle}, 0),
    put({This, frameUtil}, 'FrameUtil':getInstance()),
    ok.


getInstance(AngleIncrement) when is_integer(AngleIncrement) ->
        'AngleInfo':new((fun(Target_N65815) -> (get({Target_N65815, '$class'})):getAt(Target_N65815, AngleIncrement) end)('AngleIncrementInfoFactory':getInstance())).

new(AngleIncrementInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AngleIncrementInfo),
    This.

'$init'(This, AngleIncrementInfo) ->
    init_fields(This),
        put({This, angleIncrementInfo}, AngleIncrementInfo).

adjustAngle(This, Frame) when is_integer(Frame) ->
        NewAngle = (((get({get({This, angleIncrementInfo}), '$class'})):getAngleIncrement(get({This, angleIncrementInfo})) * Frame) - 90),
        (get({This, '$class'})):setAngle(This, trunc((get({get({This, frameUtil}), '$class'})):adjustAngleToFrameAngle(get({This, frameUtil}), NewAngle))).

getAngle(This) ->
        get({This, angle}).

setAngle(This, Angle) when is_integer(Angle) ->
        put({This, angle}, Angle).

getAngleIncrementInfo(This) ->
        get({This, angleIncrementInfo}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AngleInfo', 'ANGLE'})),
        (get({StringBuffer, '$class'})):appendshort(StringBuffer, get({This, angle})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66676) -> (get({Target_N66676, '$class'})):toString(Target_N66676, (get({This, '$class'})):getAngleIncrementInfo(This)) end)('StringUtil':getInstance())),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

