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
% package org.allbinary.game.ag.ai
% import javax.microedition.lcdui.Canvas
% import org.allbinary.ai.ArtificialIntelligenceInterface
% import org.allbinary.direction.Direction
% import org.allbinary.direction.DirectionFactory
% import org.allbinary.direction.DirectionalCompositeInterface
% import org.allbinary.direction.DirectionalInterface
% import org.allbinary.game.ai.BasicAI
% import org.allbinary.game.combat.destroy.event.DestroyedEvent
% import org.allbinary.game.combat.destroy.event.DestroyedEventHandler
% import org.allbinary.game.combat.destroy.event.DestroyedEventListenerInterface
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.physics.velocity.BasicVelocityProperties
% import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface
% import org.allbinary.game.tracking.TrackingEvent
% import org.allbinary.game.tracking.TrackingEventHandler
% import org.allbinary.game.tracking.TrackingEventListenerInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.math.MathUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.logic.util.visitor.Visitor
% import org.allbinary.time.GameTickTimeDelayHelper
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('DiveAndDirectionalTrackingAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TrackingEventListenerInterface
% implements DestroyedEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicAI', Function, Arguments).

init_fields(This) ->
    put({This, mathUtil}, 'MathUtil':getInstance()),
    put({This, directionFactory}, 'DirectionFactory':getInstance()),
    put({This, gameTickTimeDelayHelper}, 'GameTickTimeDelayHelperFactory':getInstance()),
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(500)),
    put({This, list}, 'BasicArrayListD':new()),
    put({This, directionalInterface}, undefined),
    put({This, velocityInterface}, undefined),
    put({This, directionToKeyMap}, array:from_list([get({'Canvas', 'LEFT'}), get({'Canvas', 'DOWN'}), get({'Canvas', 'UP'}), get({'Canvas', 'RIGHT'})])),
    put({This, initialDropped}, false),
    put({This, diveP}, false),
    put({This, directionOfTarget}, 'Direction':getInstance(0)),
    put({This, 'MIN_DISTANCE'}, 40),
    put({This, lastTrackingLayerInterface}, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})),
    put({This, artificialIntelligenceInterface}, undefined),
    put({This, aiVistor}, undefined),
    put({This, lastDirection}, get({'DirectionFactory':getInstance(), 'NO_DIRECTION'})),
    ok.


new(OwnerLayerInterface, ArtificialIntelligenceInterface, GameInput, Visitor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, OwnerLayerInterface, ArtificialIntelligenceInterface, GameInput, Visitor),
    This.

'$init'(This, OwnerLayerInterface, ArtificialIntelligenceInterface, GameInput, Visitor) ->
        'BasicAI':'$init'(This, OwnerLayerInterface, GameInput),
        init_fields(This),
        put({This, aiVistor}, Visitor),
        put({This, artificialIntelligenceInterface}, ArtificialIntelligenceInterface),
        DirectionalCompositeInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        put({This, directionalInterface}, (get({DirectionalCompositeInterface, '$class'})):getDirectionalInterface(DirectionalCompositeInterface)),
        VelocityInterfaceCompositeInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        put({This, velocityInterface}, (get({VelocityInterfaceCompositeInterface, '$class'})):getVelocityProperties(VelocityInterfaceCompositeInterface)),
        (fun(Target_N67530) -> (get({Target_N67530, '$class'})):addListenerInterface(Target_N67530, This) end)('DestroyedEventHandler':getInstance()),
        (get({This, '$class'})):init(This).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        case (get({This, '$class'})):isBeyondTarget(This) of
            true ->
            (get({This, '$class'})):init(This),
            (get({get({This, velocityInterface}), '$class'})):zero(get({This, velocityInterface}));
            false -> ok
        end,
        case (not get({This, diveP})) of
            true ->
            (get({This, '$class'})):target(This, AllBinaryLayerManager);
            false ->
            (get({This, '$class'})):dive(This),
            (get({This, '$class'})):attack(This)
        end,
        (get({get({This, list}), '$class'})):clear(get({This, list})).

init(This) ->
        put({This, diveP}, false),
        put({This, directionOfTarget}, get({'DirectionFactory':getInstance(), 'NOT_BORDERED_WITH'})),
        (fun(Target_N67988) -> (get({Target_N67988, '$class'})):addListenerInterface(Target_N67988, This) end)('TrackingEventHandler':getInstance()).

% throws Exception
target(This, AllBinaryLayerManager) ->
        try
        case ((get({get({This, list}), '$class'})):size(get({This, list})) =:= 0) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        LastTrackingEvent = (get({get({This, list}), '$class'})):removeAt(get({This, list}), 0),
        put({This, lastTrackingLayerInterface}, (get({LastTrackingEvent, '$class'})):getLayerInterface(LastTrackingEvent)),
        LayerInterface = get({This, lastTrackingLayerInterface}),
        OwnerLayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        case ((get({LayerInterface, '$class'})):getGroupInterface(LayerInterface) =:= (get({OwnerLayerInterface, '$class'})):getGroupInterface(OwnerLayerInterface)) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        X = (get({get({This, lastTrackingLayerInterface}), '$class'})):getXP(get({This, lastTrackingLayerInterface})),
        Y = (get({get({This, lastTrackingLayerInterface}), '$class'})):getYP(get({This, lastTrackingLayerInterface})),
        YDistance = (((get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface) - Y) - (get({OwnerLayerInterface, '$class'})):getHeight(OwnerLayerInterface)),
        XDistance = (((get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface) - X) - (get({OwnerLayerInterface, '$class'})):getWidth(OwnerLayerInterface)),
        DirectionFactory = 'DirectionFactory':getInstance(),
        case ((get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), YDistance) > (get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), XDistance)) of
            true ->
            case (YDistance > get({This, 'MIN_DISTANCE'})) of
                true ->
                put({This, directionOfTarget}, get({DirectionFactory, 'UP'}));
                false ->
                case (YDistance < (-get({This, 'MIN_DISTANCE'}))) of
                true ->
                put({This, directionOfTarget}, get({DirectionFactory, 'DOWN'}));
                false -> ok
            end
            end;
            false ->
            case (XDistance > get({This, 'MIN_DISTANCE'})) of
                true ->
                put({This, directionOfTarget}, get({DirectionFactory, 'LEFT'}));
                false ->
                case (XDistance < (-get({This, 'MIN_DISTANCE'}))) of
                true ->
                put({This, directionOfTarget}, get({DirectionFactory, 'RIGHT'}));
                false -> ok
            end
            end
        end,
        case ((not get({This, initialDropped})) andalso (get({This, directionOfTarget}) =/= get({DirectionFactory, 'NOT_BORDERED_WITH'}))) of
            true ->
            (get({This, '$class'})):drop(This);
            false -> ok
        end,
        case get({This, initialDropped}) of
            true ->
            case ((get({This, directionOfTarget}) =:= get({DirectionFactory, 'UP'})) orelse (get({This, directionOfTarget}) =:= get({DirectionFactory, 'DOWN'}))) of
                true ->
                (get({This, '$class'})):verticalTargeting(This, X);
                false ->
                case ((get({This, directionOfTarget}) =:= get({DirectionFactory, 'LEFT'})) orelse (get({This, directionOfTarget}) =:= get({DirectionFactory, 'RIGHT'}))) of
                true ->
                (get({This, '$class'})):horizontalTargeting(This, Y);
                false ->
                (get({get({This, artificialIntelligenceInterface}), '$class'})):processAI(get({This, artificialIntelligenceInterface}), AllBinaryLayerManager)
            end
            end;
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
verticalTargeting(This, X) when is_integer(X) ->
        OwnerLayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        case ((get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface) < X) of
            true ->
            (get({This, '$class'})):moveRight(This);
            false -> ok
        end,
        case ((get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface) > X) of
            true ->
            (get({This, '$class'})):moveLeft(This);
            false -> ok
        end,
        case (((get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface) > (X - 3)) andalso ((get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface) < (X + 3))) of
            true ->
            (get({This, '$class'})):setDive(This);
            false -> ok
        end.

% throws Exception
horizontalTargeting(This, Y) when is_integer(Y) ->
        OwnerLayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        case ((get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface) < Y) of
            true ->
            (get({This, '$class'})):moveDown(This);
            false -> ok
        end,
        case ((get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface) > Y) of
            true ->
            (get({This, '$class'})):moveUp(This);
            false -> ok
        end,
        case (((get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface) > (Y - 3)) andalso ((get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface) < (Y + 3))) of
            true ->
            (get({This, '$class'})):setDive(This);
            false -> ok
        end.

setDive(This) ->
        put({This, diveP}, true),
        (get({get({This, velocityInterface}), '$class'})):zero(get({This, velocityInterface})),
        (fun(Target_N70065) -> (get({Target_N70065, '$class'})):removeListener(Target_N70065, This) end)('TrackingEventHandler':getInstance()).

% throws Exception
moveRight(This) ->
        (get({This, '$class'})):setLastDirection(This, get({get({This, directionFactory}), 'RIGHT'})),
        (get({get({This, directionalInterface}), '$class'})):setFrameByDirection(get({This, directionalInterface}), get({This, lastDirection})),
        (get({get({This, aiVistor}), '$class'})):visit(get({This, aiVistor}), This).

% throws Exception
moveLeft(This) ->
        (get({This, '$class'})):setLastDirection(This, get({get({This, directionFactory}), 'LEFT'})),
        (get({get({This, directionalInterface}), '$class'})):setFrameByDirection(get({This, directionalInterface}), get({This, lastDirection})),
        (get({get({This, aiVistor}), '$class'})):visit(get({This, aiVistor}), This).

% throws Exception
moveDown(This) ->
        (get({This, '$class'})):setLastDirection(This, get({get({This, directionFactory}), 'DOWN'})),
        (get({get({This, directionalInterface}), '$class'})):setFrameByDirection(get({This, directionalInterface}), get({This, lastDirection})),
        (get({get({This, aiVistor}), '$class'})):visit(get({This, aiVistor}), This).

% throws Exception
moveUp(This) ->
        (get({This, '$class'})):setLastDirection(This, get({get({This, directionFactory}), 'UP'})),
        (get({get({This, directionalInterface}), '$class'})):setFrameByDirection(get({This, directionalInterface}), get({This, lastDirection})),
        (get({get({This, aiVistor}), '$class'})):visit(get({This, aiVistor}), This).

% throws Exception
dive(This) ->
        (get({get({This, directionalInterface}), '$class'})):setFrameByDirection(get({This, directionalInterface}), get({This, directionOfTarget})),
        (get({get({This, aiVistor}), '$class'})):visit(get({This, aiVistor}), This).

% throws Exception
attack(This) ->
        'BasicAI':processKeyAI(This, get({'Canvas', 'KEY_NUM1'})).

% throws Exception
drop(This) ->
        case (get({get({This, timeDelayHelper}), '$class'})):isTime(get({This, timeDelayHelper}), get({get({This, gameTickTimeDelayHelper}), startTime})) of
            true ->
            put({This, initialDropped}, true),
            (get({get({This, aiVistor}), '$class'})):visit(get({This, aiVistor}), This);
            false -> ok
        end.

isBeyondTarget(This) ->
        try
        case (get({This, directionOfTarget}) =:= get({get({This, directionFactory}), 'DOWN'})) of
            true ->
            case ((fun(Target_N71476) -> (get({Target_N71476, '$class'})):getYP(Target_N71476) end)((get({This, '$class'})):getOwnerLayerInterface(This)) > ((get({get({This, lastTrackingLayerInterface}), '$class'})):getYP(get({This, lastTrackingLayerInterface})) + get({This, 'MIN_DISTANCE'}))) of
                true ->
                throw({'$return', true});
                false ->
                throw({'$return', false})
            end;
            false ->
            case (get({This, directionOfTarget}) =:= get({get({This, directionFactory}), 'UP'})) of
            true ->
            case ((fun(Target_N71375) -> (get({Target_N71375, '$class'})):getYP(Target_N71375) end)((get({This, '$class'})):getOwnerLayerInterface(This)) < ((get({get({This, lastTrackingLayerInterface}), '$class'})):getYP(get({This, lastTrackingLayerInterface})) + get({This, 'MIN_DISTANCE'}))) of
                true ->
                throw({'$return', true});
                false ->
                throw({'$return', false})
            end;
            false ->
            case (get({This, directionOfTarget}) =:= get({get({This, directionFactory}), 'RIGHT'})) of
            true ->
            case ((fun(Target_N71274) -> (get({Target_N71274, '$class'})):getXP(Target_N71274) end)((get({This, '$class'})):getOwnerLayerInterface(This)) > ((get({get({This, lastTrackingLayerInterface}), '$class'})):getXP(get({This, lastTrackingLayerInterface})) + get({This, 'MIN_DISTANCE'}))) of
                true ->
                throw({'$return', true});
                false ->
                throw({'$return', false})
            end;
            false ->
            case (get({This, directionOfTarget}) =:= get({get({This, directionFactory}), 'LEFT'})) of
            true ->
            case ((fun(Target_N71173) -> (get({Target_N71173, '$class'})):getXP(Target_N71173) end)((get({This, '$class'})):getOwnerLayerInterface(This)) < ((get({get({This, lastTrackingLayerInterface}), '$class'})):getXP(get({This, lastTrackingLayerInterface})) + get({This, 'MIN_DISTANCE'}))) of
                true ->
                throw({'$return', true});
                false ->
                throw({'$return', false})
            end;
            false ->
            throw({'$return', false})
        end
        end
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onMovement(This, TrackingEvent) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), TrackingEvent).

onDestroyed(This, DestroyedEvent) ->
        case ((get({This, '$class'})):getOwnerLayerInterface(This) =:= (get({DestroyedEvent, '$class'})):getLayerInterface(DestroyedEvent)) of
            true ->
            (fun(Target_N71830) -> (get({Target_N71830, '$class'})):removeListener(Target_N71830, This) end)('TrackingEventHandler':getInstance()),
            (fun(Target_N71864) -> (get({Target_N71864, '$class'})):removeListener(Target_N71864, This) end)('DestroyedEventHandler':getInstance());
            false -> ok
        end.

setLastDirection(This, LastDirection) ->
        put({This, lastDirection}, LastDirection),
        Value = (fun(Target_N71993) -> (get({Target_N71993, '$class'})):getValue(Target_N71993) end)((get({This, '$class'})):getLastDirection(This)),
        case (Value < 4) of
            true ->
            'BasicAI':setLastKey(This, array:get(Value, get({This, directionToKeyMap})));
            false -> ok
        end.

setLastKey(This, LastKey) when is_integer(LastKey) ->
        'BasicAI':setLastKey(This, LastKey),
        case ((get({This, '$class'})):getLastKey(This) =:= get({'Canvas', 'LEFT'})) of
            true ->
            put({This, lastDirection}, get({'DirectionFactory':getInstance(), 'LEFT'}));
            false ->
            case ((get({This, '$class'})):getLastKey(This) =:= get({'Canvas', 'DOWN'})) of
            true ->
            put({This, lastDirection}, get({'DirectionFactory':getInstance(), 'DOWN'}));
            false ->
            case ((get({This, '$class'})):getLastKey(This) =:= get({'Canvas', 'UP'})) of
            true ->
            put({This, lastDirection}, get({'DirectionFactory':getInstance(), 'UP'}));
            false ->
            case ((get({This, '$class'})):getLastKey(This) =:= get({'Canvas', 'RIGHT'})) of
            true ->
            put({This, lastDirection}, get({'DirectionFactory':getInstance(), 'RIGHT'}));
            false -> ok
        end
        end
        end
        end.

getLastDirection(This) ->
        get({This, lastDirection}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, 'BasicAI':toString(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " LastDirection: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N72733) -> (get({Target_N72733, '$class'})):toString(Target_N72733, (get({This, '$class'})):getLastDirection(This)) end)('StringUtil':getInstance())),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

