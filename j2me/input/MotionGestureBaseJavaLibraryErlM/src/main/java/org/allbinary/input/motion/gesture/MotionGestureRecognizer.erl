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
% import org.allbinary.graphics.Line
% import org.allbinary.graphics.PointFactory
% import org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration
% import org.allbinary.input.motion.gesture.configuration.MotionGestureConfigurationFactory
% import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler
% import org.allbinary.input.motion.gesture.observer.MotionEventCircularPool
% import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
% import org.allbinary.input.motion.gesture.observer.MovedMotionGesturesHandler
% import org.allbinary.input.motion.gesture.observer.ScrolledMotionGesturesHandler
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.J2SEMath
% import org.allbinary.logic.util.event.handler.BasicEventHandler
% import org.allbinary.string.CommonStrings

-module('MotionGestureRecognizer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, j2seMath}, 'J2SEMath':getInstance()),
    put({This, origin}, get({'PointFactory':getInstance(), 'ZERO_ZERO'})),
    put({This, previous}, get({This, origin})),
    put({This, intermediate}, get({This, origin})),
    put({This, line}, 'Line':new(get({This, origin}), get({This, origin}))),
    put({This, motionGesturesHandler}, undefined),
    put({This, movedMotionGesturesHandler}, undefined),
    put({This, scrolledMotionGesturesHandler}, undefined),
    put({This, motionEventCircularPool}, undefined),
    ok.


new(Id) when is_integer(Id) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Id),
    This.

'$init'(This, Id) when is_integer(Id) ->
    init_fields(This),
        put({This, motionEventCircularPool}, 'MotionEventCircularPool':createPool(Id)),
        put({local, motionGesturesHandler}, 'BasicEventHandler':new()),
        put({local, movedMotionGesturesHandler}, get({local, motionGesturesHandler})),
        put({local, scrolledMotionGesturesHandler}, get({local, motionGesturesHandler})),
        try
            put({local, motionGesturesHandler}, 'BasicMotionGesturesHandler':getInstance()),
            put({local, movedMotionGesturesHandler}, 'MovedMotionGesturesHandler':getInstance()),
            put({local, scrolledMotionGesturesHandler}, 'ScrolledMotionGesturesHandler':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CONSTRUCTOR'}), E)
        end,
        put({This, motionGesturesHandler}, get({local, motionGesturesHandler})),
        put({This, movedMotionGesturesHandler}, get({local, movedMotionGesturesHandler})),
        put({This, scrolledMotionGesturesHandler}, get({local, scrolledMotionGesturesHandler})).

% throws Exception
processPressedMotionEvent(This, Current, DeviceId, Button) when is_integer(DeviceId), is_integer(Button) ->
        put({This, intermediate}, get({This, origin})),
        put({This, previous}, get({This, origin})),
        Event = (get({get({This, motionEventCircularPool}), '$class'})):getInstance(get({This, motionEventCircularPool}), get({'TouchMotionGestureFactory':getInstance(), 'PRESSED'})),
        (get({Event, '$class'})):setPreviousPoint(Event, get({This, previous})),
        (get({Event, '$class'})):setCurrentPoint(Event, Current),
        (get({get({This, motionGesturesHandler}), '$class'})):fireEvent(get({This, motionGesturesHandler}), Event),
        true.

% throws Exception
processReleasedMotionEvent(This, Current, DeviceId, Button) when is_integer(DeviceId), is_integer(Button) ->
        Event = (get({get({This, motionEventCircularPool}), '$class'})):getInstance(get({This, motionEventCircularPool}), get({'TouchMotionGestureFactory':getInstance(), 'RELEASED'})),
        (get({Event, '$class'})):setPreviousPoint(Event, get({This, previous})),
        (get({Event, '$class'})):setCurrentPoint(Event, Current),
        (get({get({This, motionGesturesHandler}), '$class'})):fireEvent(get({This, motionGesturesHandler}), Event),
        true.

% throws Exception
processDraggedMotionEvent(This, Current, DeviceId, ButtonMask) when is_integer(DeviceId), is_integer(ButtonMask) ->
        try
        case ((get({This, previous}) =:= get({This, origin})) orelse (get({This, intermediate}) =:= get({This, origin}))) of
            true ->
            put({This, previous}, Current),
            put({This, intermediate}, Current),
            throw({'$return', ok});
            false -> ok
        end,
        (get({get({This, line}), '$class'})):setP1(get({This, line}), get({This, previous})),
        (get({get({This, line}), '$class'})):setP2(get({This, line}), Current),
        MinimumMotionGesture = (fun(Target_N67977) -> (get({Target_N67977, '$class'})):getMinimumMotionGesture(Target_N67977) end)('MotionGestureConfigurationFactory':getInstance()),
        case (((get({get({This, j2seMath}), '$class'})):abs(get({This, j2seMath}), float((get({get({This, line}), '$class'})):getDeltaX(get({This, line})))) < MinimumMotionGesture) andalso ((get({get({This, j2seMath}), '$class'})):abs(get({This, j2seMath}), float((get({get({This, line}), '$class'})):getDeltaY(get({This, line})))) < MinimumMotionGesture)) of
            true ->
            put({This, intermediate}, Current),
            throw({'$return', ok});
            false -> ok
        end,
        Gradient = (get({get({This, line}), '$class'})):getGradient(get({This, line})),
        AbsGradient = float((get({get({This, j2seMath}), '$class'})):abs(get({This, j2seMath}), Gradient)),
        Conf = 'MotionGestureConfigurationFactory':getInstance(),
        TouchMotionGestureFactory = 'TouchMotionGestureFactory':getInstance(),
        put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'NO_MOTION'})),
        put({local, diagonalToleranceHigher}, 12.0),
        put({local, diagonalToleranceLower}, 12.0),
        case (get({Conf, '$class'})):isDiagonalMotionGestureAllowed(Conf) of
            true ->
            put({local, diagonalToleranceHigher}, float(((90 - (get({Conf, '$class'})):getDiagonalTolerance(Conf))))),
            put({local, diagonalToleranceLower}, float((get({Conf, '$class'})):getDiagonalTolerance(Conf)));
            false -> ok
        end,
        case (AbsGradient > math:tan(((get({local, diagonalToleranceHigher})) * math:pi() / 180))) of
            true ->
            case ((get({get({This, line}), '$class'})):getDeltaY(get({This, line})) > 0) of
                true ->
                put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'UP'}));
                false ->
                put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'DOWN'}))
            end;
            false ->
            case (AbsGradient < math:tan(((get({local, diagonalToleranceLower})) * math:pi() / 180))) of
                true ->
                case ((get({get({This, line}), '$class'})):getDeltaX(get({This, line})) > 0) of
                    true ->
                    put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'LEFT'}));
                    false ->
                    put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'RIGHT'}))
                end;
                false ->
                case (Gradient > 0.0) of
                    true ->
                    case ((get({get({This, line}), '$class'})):getDeltaX(get({This, line})) > 0) of
                        true ->
                        put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'DIAGONAL_UP_LEFT'}));
                        false ->
                        put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'DIAGONAL_DOWN_RIGHT'}))
                    end;
                    false ->
                    case ((get({get({This, line}), '$class'})):getDeltaX(get({This, line})) > 0) of
                        true ->
                        put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'DIAGONAL_DOWN_LEFT'}));
                        false ->
                        put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'DIAGONAL_UP_RIGHT'}))
                    end
                end
            end
        end,
        put({This, previous}, Current),
        put({This, intermediate}, Current),
        Event = (get({get({This, motionEventCircularPool}), '$class'})):getInstance(get({This, motionEventCircularPool}), get({local, newMotionGesture})),
        (get({Event, '$class'})):setPreviousPoint(Event, get({This, previous})),
        (get({Event, '$class'})):setCurrentPoint(Event, Current),
        (get({get({This, motionGesturesHandler}), '$class'})):fireEvent(get({This, motionGesturesHandler}), Event),
        ok
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
processMovedMotionEvent(This, Current, DeviceId, Button) when is_integer(DeviceId), is_integer(Button) ->
        Event = (get({get({This, motionEventCircularPool}), '$class'})):getInstance(get({This, motionEventCircularPool}), get({'TouchMotionGestureFactory':getInstance(), 'NO_MOTION'})),
        (get({Event, '$class'})):setPreviousPoint(Event, get({This, previous})),
        (get({Event, '$class'})):setCurrentPoint(Event, Current),
        (get({get({This, movedMotionGesturesHandler}), '$class'})):fireEvent(get({This, movedMotionGesturesHandler}), Event),
        true.

% throws Exception
processScrolledMotionEvent(This, Current, DeviceId, Button) when is_integer(DeviceId), is_integer(Button) ->
        TouchMotionGestureFactory = 'TouchMotionGestureFactory':getInstance(),
        put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'NO_MOTION'})),
        case (Button > 0) of
            true ->
            put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'SCROLL_UP'}));
            false ->
            case (Button < 0) of
            true ->
            put({local, newMotionGesture}, get({TouchMotionGestureFactory, 'SCROLL_DOWN'}));
            false -> ok
        end
        end,
        Event = (get({get({This, motionEventCircularPool}), '$class'})):getInstance(get({This, motionEventCircularPool}), get({local, newMotionGesture})),
        (get({Event, '$class'})):setPreviousPoint(Event, get({This, previous})),
        (get({Event, '$class'})):setCurrentPoint(Event, Current),
        (get({get({This, scrolledMotionGesturesHandler}), '$class'})):fireEvent(get({This, scrolledMotionGesturesHandler}), Event),
        true.

getMotionGesturesHandler(This) ->
        get({This, motionGesturesHandler}).

