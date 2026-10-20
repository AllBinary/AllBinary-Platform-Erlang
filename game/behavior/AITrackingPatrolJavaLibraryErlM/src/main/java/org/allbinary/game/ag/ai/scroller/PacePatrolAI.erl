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
% package org.allbinary.game.ag.ai.scroller
% import javax.microedition.lcdui.Canvas
% import org.allbinary.direction.Direction
% import org.allbinary.direction.DirectionCompositeInterface
% import org.allbinary.direction.DirectionFactory
% import org.allbinary.game.input.GameInput
% import org.allbinary.game.tracking.TrackingEvent
% import org.allbinary.game.tracking.TrackingEventHandler
% import org.allbinary.game.tracking.TrackingEventListenerInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.layer.LayerInterface
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('PacePatrolAI').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TrackingEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasePatrolAI', Function, Arguments).

init_fields(This) ->
    put({This, trackingList}, undefined),
    put({This, firingDistance}, 0),
    put({This, isFollowLimitedByTerrain}, false),
    ok.


new(Hashtable, OwnerLayerInterface, GameInput) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Hashtable, OwnerLayerInterface, GameInput),
    This.

'$init'(This, Hashtable, OwnerLayerInterface, GameInput) ->
        'BasePatrolAI':'$init'(This, Hashtable, OwnerLayerInterface, GameInput),
        init_fields(This),
        (fun(Target_N66223) -> (get({Target_N66223, '$class'})):addListenerInterface(Target_N66223, This) end)('TrackingEventHandler':getInstance()),
        put({This, trackingList}, 'BasicArrayListD':new()).

% throws Exception
processAI(This, AllBinaryLayerManager) ->
        (get({This, '$class'})):update(This),
        Direction = (get({This, '$class'})):setFiringDirectionForTargetIfInRange(This),
        DirectionFactory = 'DirectionFactory':getInstance(),
        case (Direction =:= get({DirectionFactory, 'LEFT'})) of
            true ->
            case ((get({This, lastKeyDirection}) =/= get({This, keyDirection})) orelse (not get({This, isFollowLimitedByTerrain}))) of
                true ->
                'BasePatrolAI':processKeyAI(This, get({'Canvas', 'LEFT'}));
                false -> ok
            end,
            put({This, keyDirection}, get({'Canvas', 'LEFT'})),
            put({This, lastKeyDirection}, get({This, keyDirection})),
            put({This, xTotalDistance}, 0),
            'BasePatrolAI':processKeyAI(This, get({'Canvas', 'KEY_NUM1'}));
            false ->
            case (Direction =:= get({DirectionFactory, 'RIGHT'})) of
            true ->
            case ((get({This, lastKeyDirection}) =/= get({This, keyDirection})) orelse (not get({This, isFollowLimitedByTerrain}))) of
                true ->
                'BasePatrolAI':processKeyAI(This, get({'Canvas', 'RIGHT'}));
                false -> ok
            end,
            put({This, keyDirection}, get({'Canvas', 'RIGHT'})),
            put({This, lastKeyDirection}, get({This, keyDirection})),
            put({This, xTotalDistance}, 0),
            'BasePatrolAI':processKeyAI(This, get({'Canvas', 'KEY_NUM1'}));
            false ->
            'BasePatrolAI':processKeyAI(This, get({This, keyDirection}))
        end
        end.

setFiringDirectionForTargetIfInRange(This) ->
        DirectionFactory = 'DirectionFactory':getInstance(),
        OwnerLayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        put({local, direction}, get({DirectionFactory, 'NOT_BORDERED_WITH'})),
        put({local, lastTrackingEvent}, undefined),
        put({local, lastTrackingLayerInterface}, undefined),
        put({local, directionCompositeInterface}, undefined),
        Size = (get({get({This, trackingList}), '$class'})):size(get({This, trackingList})),
        lists:foreach(fun(Index) ->
            put({local, lastTrackingEvent}, (get({get({This, trackingList}), '$class'})):get(get({This, trackingList}), 0)),
            put({local, lastTrackingLayerInterface}, (get({get({local, lastTrackingEvent}), '$class'})):getLayerInterface(get({local, lastTrackingEvent}))),
            X = (get({get({local, lastTrackingLayerInterface}), '$class'})):getXP(get({local, lastTrackingLayerInterface})),
            Y = (get({get({local, lastTrackingLayerInterface}), '$class'})):getYP(get({local, lastTrackingLayerInterface})),
            YDistance = (((get({OwnerLayerInterface, '$class'})):getYP(OwnerLayerInterface) - Y) - (get({OwnerLayerInterface, '$class'})):getHeight(OwnerLayerInterface)),
            XDistance = (((get({OwnerLayerInterface, '$class'})):getXP(OwnerLayerInterface) - X) - (get({OwnerLayerInterface, '$class'})):getWidth(OwnerLayerInterface)),
            AbsXDistance = erlang:abs(XDistance),
            AbsYDistance = erlang:abs(YDistance),
            case (AbsYDistance =< 100) of
                true ->
                case (AbsXDistance < ((get({This, '$class'})):getFiringDistance(This) div 2)) of
                    true ->
                    put({local, directionCompositeInterface}, (get({This, '$class'})):getOwnerLayerInterface(This)),
                    case ((XDistance < 0) andalso ((get({get({local, directionCompositeInterface}), '$class'})):getDirection(get({local, directionCompositeInterface})) =:= get({DirectionFactory, 'RIGHT'}))) of
                        true ->
                        put({local, direction}, get({DirectionFactory, 'RIGHT'}));
                        false ->
                        case ((XDistance > 0) andalso ((get({get({local, directionCompositeInterface}), '$class'})):getDirection(get({local, directionCompositeInterface})) =:= get({DirectionFactory, 'LEFT'}))) of
                        true ->
                        put({local, direction}, get({DirectionFactory, 'LEFT'}));
                        false -> ok
                    end
                    end;
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        get({local, direction}).

disable(This) ->
        ok.

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onMovement(This, TrackingEvent) ->
        (get({get({This, trackingList}), '$class'})):clear(get({This, trackingList})),
        (get({get({This, trackingList}), '$class'})):add(get({This, trackingList}), TrackingEvent).

getFiringDistance(This) ->
        get({This, firingDistance}).

setFiringDistance(This, FiringDistance) when is_integer(FiringDistance) ->
        put({This, firingDistance}, FiringDistance).

