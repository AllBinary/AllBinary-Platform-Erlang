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
% package org.allbinary.game.displayable.canvas
% import javax.microedition.lcdui.Canvas
% import org.allbinary.game.input.GameInputStrings
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.displayable.MyCanvas
% import org.allbinary.input.motion.gesture.MotionGestureInput
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.math.RectangleCollisionUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.BasicArrayList

-module('PopupMenuInputProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicMenuInputProcessor', Function, Arguments).

init_fields(This) ->
    put({This, rectangleCollisionUtil}, 'RectangleCollisionUtil':getInstance()),
    put({This, 'CLICK_DELAY'}, 120),
    put({This, clickTimeHelper}, 'TimeDelayHelper':new(get({This, 'CLICK_DELAY'}))),
    put({This, rectangle}, undefined),
    ok.


new(GameKeyEventList, PlayerInputId, GameCanvas, Rectangle) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GameKeyEventList, PlayerInputId, GameCanvas, Rectangle),
    This.

init(This, GameKeyEventList, PlayerInputId, GameCanvas, Rectangle) when is_integer(PlayerInputId) ->
        'BasicMenuInputProcessor':init(This, GameKeyEventList, PlayerInputId, GameCanvas),
        init_fields(This),
        put({This, rectangle}, Rectangle).

init(This, Rectangle) ->
        put({This, rectangle}, Rectangle).

% throws Exception
processInput(This, Key) when is_integer(Key) ->
        try
        case (Key =:= get({'Canvas', 'KEY_STAR'})) of
            true ->
            GameCanvas = (get({This, '$class'})):getCanvas(This),
            (get({GameCanvas, '$class'})):toggleMenu(GameCanvas),
            throw({'$return', 1});
            false -> ok
        end,
        0
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
processInputList(This) ->
        try
        try
            MotionInputsIndex = (get({This, '$class'})):processMotionInputs(This),
            List = (get({This, '$class'})):getGameKeyEventList(This),
            Size = (get({List, '$class'})):size(List),
            put({local, key}, 0),
            put({local, gameKeyEvent}, undefined),
            lists:foreach(fun(Index) ->
                put({local, gameKeyEvent}, array:get(Index, get({List, objectArray}))),
                case (get({local, gameKeyEvent}) =/= undefined) of
                    true ->
                    put({local, key}, (get({get({local, gameKeyEvent}), '$class'})):getKey(get({local, gameKeyEvent}))),
                    case ((get({This, '$class'})):processInput(This, get({local, key})) =:= 1) of
                        true ->
                        throw('$break');
                        false -> ok
                    end;
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            (get({This, '$class'})):clear(This),
            case ((Size > 0) orelse (MotionInputsIndex >= 0)) of
                true ->
                throw({'$return', 1});
                false ->
                throw({'$return', (-1)})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({'GameInputStrings':getInstance(), 'PROCESS_INPUT'}), E),
            (-1)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
processMotionInputs(This) ->
        LastIndex = ((get({get({This, motionGestureEventList}), '$class'})):size(get({This, motionGestureEventList})) - 1),
        case (LastIndex >= 0) of
            true ->
            MotionGestureEvent = array:get(LastIndex, get({get({This, motionGestureEventList}), objectArray})),
            (get({This, '$class'})):processMotionInput(This, MotionGestureEvent);
            false -> ok
        end,
        (get({get({This, motionGestureEventList}), '$class'})):clear(get({This, motionGestureEventList})),
        LastIndex.

% throws Exception
processMotionInput(This, MotionGestureEvent) ->
        try
        case (MotionGestureEvent =:= undefined) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Exception: Bug", This, get({get({This, gameInputStrings}), 'PROCESS_MOTION_INPUT'})),
            throw({'$return', ok});
            false -> ok
        end,
        TouchMotionGestureFactory = 'TouchMotionGestureFactory':getInstance(),
        MotionGestureInput = (get({MotionGestureEvent, '$class'})):getMotionGesture(MotionGestureEvent),
        case (MotionGestureInput =:= get({TouchMotionGestureFactory, 'RELEASED'})) of
            true ->
            Point = (get({MotionGestureEvent, '$class'})):getCurrentPoint(MotionGestureEvent),
            RectPoint = (get({get({This, rectangle}), '$class'})):getPoint(get({This, rectangle})),
            case (get({get({This, rectangleCollisionUtil}), '$class'})):isInside(get({This, rectangleCollisionUtil}), (get({RectPoint, '$class'})):getX(RectPoint), (get({RectPoint, '$class'})):getY(RectPoint), ((get({get({This, rectangle}), '$class'})):getMaxX(get({This, rectangle})) + 20), (get({get({This, rectangle}), '$class'})):getMaxY(get({This, rectangle})), (get({Point, '$class'})):getX(Point), (get({Point, '$class'})):getY(Point)) of
                true ->
                case (get({get({This, clickTimeHelper}), '$class'})):isTimeTNT(get({This, clickTimeHelper})) of
                    true ->
                    GameCanvas = (get({This, '$class'})):getCanvas(This),
                    (get({GameCanvas, '$class'})):toggleMenu(GameCanvas);
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

