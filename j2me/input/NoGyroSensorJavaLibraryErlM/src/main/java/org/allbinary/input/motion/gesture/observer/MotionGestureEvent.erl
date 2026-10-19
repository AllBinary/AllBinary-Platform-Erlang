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
% package org.allbinary.input.motion.gesture.observer
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.input.motion.gesture.MotionGestureInput
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.TsUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.string.CommonLabels

-module('MotionGestureEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

static_init() ->
    put({?MODULE, 'PREVIOUS'}, " Previous: "),
    put({?MODULE, 'HASHCODE'}, " hashcode: "),
    ok.

init_fields(This) ->
    put({This, motionGesture}, get({'TouchMotionGestureFactory':getInstance(), 'NO_MOTION'})),
    put({This, id}, 0),
    put({This, previousPoint}, get({'PointFactory':getInstance(), 'ZERO_ZERO'})),
    put({This, currentPoint}, get({'PointFactory':getInstance(), 'ZERO_ZERO'})),
    put({This, commonLabels}, 'CommonLabels':getInstance()),
    ok.


new(Source, Id, MotionGesture) when is_integer(Id) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Source, Id, MotionGesture),
    This.

init(This, Source, Id, MotionGesture) when is_integer(Id) ->
        'AllBinaryEventObject':init(This, Source),
        init_fields(This),
        put({This, id}, Id),
        (get({This, '$class'})):setMotionGesture(This, MotionGesture).

getMotionGesture(This) ->
        get({This, motionGesture}).

setMotionGesture(This, MotionGesture) ->
        put({This, motionGesture}, MotionGesture).

getPreviousPoint(This) ->
        get({This, previousPoint}).

setPreviousPoint(This, PreviousPoint) ->
        put({This, previousPoint}, PreviousPoint).

getCurrentPoint(This) ->
        get({This, currentPoint}).

setCurrentPoint(This, CurrentPoint) ->
        put({This, currentPoint}, CurrentPoint).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        StringUtil = 'StringUtil':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, get({This, motionGesture}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonLabels}), 'CURRENT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, get({This, currentPoint}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'MotionGestureEvent', 'PREVIOUS'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, get({This, previousPoint}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'MotionGestureEvent', 'HASHCODE'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N67105) -> (get({Target_N67105, '$class'})):hashCode(Target_N67105, This) end)('TsUtil':getInstance()))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

getId(This) ->
        get({This, id}).

