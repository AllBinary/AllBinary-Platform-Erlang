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
% package org.allbinary.input.motion.gesture
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.input.motion.gesture.observer.MotionEventCircularPool
% import org.allbinary.input.motion.gesture.observer.MotionGestureEvent

-module('MirrorMotionGestureEventUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MirrorMotionGestureEventUtil':new()),
    ok.

init_fields(This) ->
    put({This, motionEventCircularPool}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, motionEventCircularPool}, 'MotionEventCircularPool':createPool(get({'Integer', 'MAX_VALUE'}))).

% throws Exception
mirrorVerticle(This, MotionGestureEvent, HalfWidth) when is_integer(HalfWidth) ->
        Event = (get({get({This, motionEventCircularPool}), '$class'})):getInstance(get({This, motionEventCircularPool}), (get({MotionGestureEvent, '$class'})):getMotionGesture(MotionGestureEvent)),
        PreviousNewX = (get({This, '$class'})):getNewX(This, (fun(Target_N65989) -> (get({Target_N65989, '$class'})):getX(Target_N65989) end)((get({MotionGestureEvent, '$class'})):getPreviousPoint(MotionGestureEvent)), HalfWidth),
        CurrentNewX = (get({This, '$class'})):getNewX(This, (fun(Target_N66065) -> (get({Target_N66065, '$class'})):getX(Target_N66065) end)((get({MotionGestureEvent, '$class'})):getCurrentPoint(MotionGestureEvent)), HalfWidth),
        PointFactory = 'PointFactory':getInstance(),
        MirroredPreviousPoint = (get({PointFactory, '$class'})):createXY(PointFactory, PreviousNewX, (fun(Target_N66204) -> (get({Target_N66204, '$class'})):getY(Target_N66204) end)((get({MotionGestureEvent, '$class'})):getPreviousPoint(MotionGestureEvent))),
        MirroredCurrentPoint = (get({PointFactory, '$class'})):createXY(PointFactory, CurrentNewX, (fun(Target_N66289) -> (get({Target_N66289, '$class'})):getY(Target_N66289) end)((get({MotionGestureEvent, '$class'})):getCurrentPoint(MotionGestureEvent))),
        (get({Event, '$class'})):setPreviousPoint(Event, MirroredPreviousPoint),
        (get({Event, '$class'})):setCurrentPoint(Event, MirroredCurrentPoint),
        Event.

getNewX(This, X, HalfWidth) when is_integer(X), is_integer(HalfWidth) ->
        put({local, newX}, 0),
        case (X > HalfWidth) of
            true ->
            put({local, newX}, (HalfWidth - ((X - HalfWidth))));
            false ->
            put({local, newX}, (HalfWidth + ((HalfWidth - X))))
        end,
        get({local, newX}).

getInstance() ->
        get({'MirrorMotionGestureEventUtil', instance}).

