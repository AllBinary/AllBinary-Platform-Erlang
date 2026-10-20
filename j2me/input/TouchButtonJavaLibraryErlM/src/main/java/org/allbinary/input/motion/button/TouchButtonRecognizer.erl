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
% package org.allbinary.input.motion.button
% import org.allbinary.game.input.event.DownGameKeyEventHandler
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.UpGameKeyEventHandler
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.Rectangle
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.math.RectangleCollisionUtil
% import org.allbinary.util.BasicArrayList

-module('TouchButtonRecognizer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, rectangleCollisionUtil}, 'RectangleCollisionUtil':getInstance()),
    put({This, upGameKeyEventHandler}, 'UpGameKeyEventHandler':getInstance()),
    put({This, downGameKeyEventHandler}, 'DownGameKeyEventHandler':getInstance()),
    put({This, lastPressedTouchButtonInput}, get({'BasicTouchInputFactory':getInstance(), 'NONE'})),
    put({This, currentlyPressedTouchButtonSingleton}, 'CurrentlyPressedTouchButtonSingleton':getInstance()),
    put({This, releaseHelper}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        case (fun(Target_N67464) -> (get({Target_N67464, '$class'})):isMultiTouch(Target_N67464) end)('TouchScreenFactory':getInstance()) of
            true ->
            put({This, releaseHelper}, 'MultitouchReleaseHelper':new(This));
            false ->
            put({This, releaseHelper}, 'ReleaseHelper':new(This))
        end.

% throws Exception
processRelease(This, TouchButtonInput, DeviceId) when is_integer(DeviceId) ->
        (get({get({This, releaseHelper}), '$class'})):release(get({This, releaseHelper}), TouchButtonInput, DeviceId),
        GameKeyEvent = (get({TouchButtonInput, '$class'})):getGameKeyEvent(TouchButtonInput),
        (get({get({This, upGameKeyEventHandler}), '$class'})):fireEvent(get({This, upGameKeyEventHandler}), GameKeyEvent),
        (fun(Target_N67746) -> (get({Target_N67746, '$class'})):fireEvent(Target_N67746, GameKeyEvent) end)((get({get({This, upGameKeyEventHandler}), '$class'})):getInstanceForDevice(get({This, upGameKeyEventHandler}), DeviceId)),
        (get({get({This, currentlyPressedTouchButtonSingleton}), '$class'})):remove(get({This, currentlyPressedTouchButtonSingleton}), TouchButtonInput).

% throws Exception
releaseTouchButtonInput(This, X, Y, DeviceId) when is_integer(X), is_integer(Y), is_integer(DeviceId) ->
        try
        put({local, touchButtonInput}, get({This, lastPressedTouchButtonInput})),
        case (get({get({This, currentlyPressedTouchButtonSingleton}), '$class'})):contains(get({This, currentlyPressedTouchButtonSingleton}), get({local, touchButtonInput})) of
            true ->
            put({This, lastPressedTouchButtonInput}, get({'BasicTouchInputFactory':getInstance(), 'NONE'})),
            (get({This, '$class'})):processRelease(This, get({local, touchButtonInput}), DeviceId),
            throw({'$return', true});
            false ->
            List = (fun(Target_N68012) -> (get({Target_N68012, '$class'})):getList(Target_N68012) end)('TouchButtonFactory':getInstance()),
            put({local, rectangle}, undefined),
            put({local, point}, undefined),
            put({local, touchButton}, undefined),
            lists:foreach(fun(Index) ->
                put({local, touchButton}, array:get(Index, get({List, objectArray}))),
                put({local, rectangle}, (get({get({local, touchButton}), '$class'})):getRectangle(get({local, touchButton}))),
                put({local, point}, (get({get({local, rectangle}), '$class'})):getPoint(get({local, rectangle}))),
                case (get({get({This, rectangleCollisionUtil}), '$class'})):isInside(get({This, rectangleCollisionUtil}), (get({get({local, point}), '$class'})):getX(get({local, point})), (get({get({local, point}), '$class'})):getY(get({local, point})), (get({get({local, rectangle}), '$class'})):getMaxX(get({local, rectangle})), (get({get({local, rectangle}), '$class'})):getMaxY(get({local, rectangle})), X, Y) of
                    true ->
                    put({local, touchButtonInput}, (get({get({local, touchButton}), '$class'})):getTouchButtonInput(get({local, touchButton}))),
                    (get({This, '$class'})):processRelease(This, get({local, touchButtonInput}), DeviceId),
                    throw({'$return', true});
                    false -> ok
                end
            end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1))
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
pressTouchButtonInput(This, X, Y, DeviceId) when is_integer(X), is_integer(Y), is_integer(DeviceId) ->
        try
        List = (fun(Target_N68752) -> (get({Target_N68752, '$class'})):getList(Target_N68752) end)('TouchButtonFactory':getInstance()),
        put({local, rectangle}, undefined),
        put({local, point}, undefined),
        put({local, touchButton}, undefined),
        put({local, touchButtonInput}, undefined),
        put({local, gameKeyEvent}, undefined),
        lists:foreach(fun(Index) ->
            put({local, touchButton}, array:get(Index, get({List, objectArray}))),
            put({local, rectangle}, (get({get({local, touchButton}), '$class'})):getRectangle(get({local, touchButton}))),
            put({local, point}, (get({get({local, rectangle}), '$class'})):getPoint(get({local, rectangle}))),
            case (get({get({This, rectangleCollisionUtil}), '$class'})):isInside(get({This, rectangleCollisionUtil}), (get({get({local, point}), '$class'})):getX(get({local, point})), (get({get({local, point}), '$class'})):getY(get({local, point})), (get({get({local, rectangle}), '$class'})):getMaxX(get({local, rectangle})), (get({get({local, rectangle}), '$class'})):getMaxY(get({local, rectangle})), X, Y) of
                true ->
                put({local, touchButtonInput}, (get({get({local, touchButton}), '$class'})):getTouchButtonInput(get({local, touchButton}))),
                case (not (get({get({This, currentlyPressedTouchButtonSingleton}), '$class'})):contains(get({This, currentlyPressedTouchButtonSingleton}), get({local, touchButtonInput}))) of
                    true ->
                    (get({get({This, releaseHelper}), '$class'})):release(get({This, releaseHelper}), get({local, touchButtonInput}), DeviceId),
                    put({This, lastPressedTouchButtonInput}, get({local, touchButtonInput})),
                    (get({get({This, currentlyPressedTouchButtonSingleton}), '$class'})):add(get({This, currentlyPressedTouchButtonSingleton}), get({local, touchButtonInput})),
                    put({local, gameKeyEvent}, (get({get({local, touchButtonInput}), '$class'})):getGameKeyEvent(get({local, touchButtonInput}))),
                    (get({get({This, downGameKeyEventHandler}), '$class'})):fireEvent(get({This, downGameKeyEventHandler}), get({local, gameKeyEvent})),
                    (fun(Target_N69430) -> (get({Target_N69430, '$class'})):fireEvent(Target_N69430, get({local, gameKeyEvent})) end)((get({get({This, downGameKeyEventHandler}), '$class'})):getInstanceForDevice(get({This, downGameKeyEventHandler}), DeviceId));
                    false -> ok
                end,
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.
% Java nested class ReleaseHelper: move it to its own module 'ReleaseHelper'
% Java nested class MultitouchReleaseHelper: move it to its own module 'MultitouchReleaseHelper'

