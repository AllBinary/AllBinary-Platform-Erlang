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
% package org.allbinary.input.motion
% import org.allbinary.graphics.CustomGPoint
% import org.allbinary.graphics.GPointCircularPool
% import org.allbinary.input.motion.button.TouchButtonRecognizer
% import org.allbinary.input.motion.gesture.MotionGestureRecognizer
% import org.allbinary.logic.communication.log.LogUtil

-module('AllMotionRecognizer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('MotionRecognizer', Function, Arguments).

static_init() ->
    put({?MODULE, index}, 0),
    put({?MODULE, pointCircularPool}, 'GPointCircularPool':new(40)),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, motionGestureRecognizer}, undefined),
    put({This, touchButtonProcessing}, false),
    put({This, touchButtonRecognizer}, undefined),
    put({This, id}, 0),
    put({This, lastX}, 0),
    put({This, lastY}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'MotionRecognizer':'$init'(This),
    init_fields(This),
        put({This, id}, allbinary_java:first(get({'AllMotionRecognizer', index}), put({'AllMotionRecognizer', index}, get({'AllMotionRecognizer', index}) + 1))),
        put({This, motionGestureRecognizer}, 'MotionGestureRecognizer':new(get({This, id}))),
        put({This, touchButtonRecognizer}, 'TouchButtonRecognizer':new()).

% throws Exception
processStartMotionEvent(This, X, Y, DeviceId, Modifiers) when is_integer(X), is_integer(Y), is_integer(DeviceId), is_integer(Modifiers) ->
        case (get({get({This, touchButtonRecognizer}), '$class'})):pressTouchButtonInput(get({This, touchButtonRecognizer}), X, Y, DeviceId) of
            true ->
            put({This, touchButtonProcessing}, true);
            false -> ok
        end,
        case (not get({This, touchButtonProcessing})) of
            true ->
            Point = (get({get({'AllMotionRecognizer', pointCircularPool}), '$class'})):getNextInstance(get({'AllMotionRecognizer', pointCircularPool})),
            (get({Point, '$class'})):setX(Point, X),
            (get({Point, '$class'})):setY(Point, Y),
            (get({get({This, motionGestureRecognizer}), '$class'})):processPressedMotionEvent(get({This, motionGestureRecognizer}), Point, DeviceId, Modifiers);
            false -> ok
        end.

% throws Exception
processEndMotionEvent(This, X, Y, DeviceId, Modifiers) when is_integer(X), is_integer(Y), is_integer(DeviceId), is_integer(Modifiers) ->
        case (get({get({This, touchButtonRecognizer}), '$class'})):releaseTouchButtonInput(get({This, touchButtonRecognizer}), X, Y, DeviceId) of
            true ->
            ok;
            false -> ok
        end,
        case (not get({This, touchButtonProcessing})) of
            true ->
            Point = (get({get({'AllMotionRecognizer', pointCircularPool}), '$class'})):getNextInstance(get({'AllMotionRecognizer', pointCircularPool})),
            (get({Point, '$class'})):setX(Point, X),
            (get({Point, '$class'})):setY(Point, Y),
            (get({get({This, motionGestureRecognizer}), '$class'})):processReleasedMotionEvent(get({This, motionGestureRecognizer}), Point, DeviceId, Modifiers);
            false -> ok
        end,
        case get({This, touchButtonProcessing}) of
            true ->
            put({This, touchButtonProcessing}, false);
            false -> ok
        end.

% throws Exception
processDraggedMotionEvent(This, X, Y, DeviceId, Modifiers) when is_integer(X), is_integer(Y), is_integer(DeviceId), is_integer(Modifiers) ->
        case get({This, touchButtonProcessing}) of
            true ->
            (get({get({This, touchButtonRecognizer}), '$class'})):pressTouchButtonInput(get({This, touchButtonRecognizer}), X, Y, DeviceId);
            false -> ok
        end,
        case (not get({This, touchButtonProcessing})) of
            true ->
            Point = (get({get({'AllMotionRecognizer', pointCircularPool}), '$class'})):getNextInstance(get({'AllMotionRecognizer', pointCircularPool})),
            (get({Point, '$class'})):setX(Point, X),
            (get({Point, '$class'})):setY(Point, Y),
            (get({get({This, motionGestureRecognizer}), '$class'})):processDraggedMotionEvent(get({This, motionGestureRecognizer}), Point, DeviceId, Modifiers);
            false -> ok
        end.

% throws Exception
processMovedMotionEvent(This, X, Y, DeviceId, Modifiers) when is_integer(X), is_integer(Y), is_integer(DeviceId), is_integer(Modifiers) ->
        case ((X =/= get({This, lastX})) orelse (Y =/= get({This, lastY}))) of
            true ->
            put({This, lastX}, X),
            put({This, lastY}, Y),
            Point = (get({get({'AllMotionRecognizer', pointCircularPool}), '$class'})):getNextInstance(get({'AllMotionRecognizer', pointCircularPool})),
            (get({Point, '$class'})):setX(Point, X),
            (get({Point, '$class'})):setY(Point, Y),
            (get({get({This, motionGestureRecognizer}), '$class'})):processMovedMotionEvent(get({This, motionGestureRecognizer}), Point, DeviceId, Modifiers);
            false -> ok
        end.

% throws Exception
processScrolledMotionEvent(This, X, Y, DeviceId, Modifiers) when is_integer(X), is_integer(Y), is_integer(DeviceId), is_integer(Modifiers) ->
        Point = (get({get({'AllMotionRecognizer', pointCircularPool}), '$class'})):getNextInstance(get({'AllMotionRecognizer', pointCircularPool})),
        (get({Point, '$class'})):setX(Point, X),
        (get({Point, '$class'})):setY(Point, Y),
        (get({get({This, motionGestureRecognizer}), '$class'})):processScrolledMotionEvent(get({This, motionGestureRecognizer}), Point, DeviceId, Modifiers).

getMotionGestureRecognizer(This) ->
        get({This, motionGestureRecognizer}).

