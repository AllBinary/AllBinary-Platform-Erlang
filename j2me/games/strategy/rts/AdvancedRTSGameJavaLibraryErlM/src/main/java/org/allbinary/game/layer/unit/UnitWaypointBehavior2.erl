% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.layer.unit
% import org.allbinary.J2MEUtil
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.layer.SteeringVisitor
% import org.allbinary.game.layer.AdvancedRTSGameLayer
% import org.allbinary.game.layer.MultipassWaypointPathRunnable
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.WaypointPathRunnable
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.layer.WaypointPathRunnableBase
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.game.layer.waypoint.WaypointBase
% import org.allbinary.game.tracking.TrackingEventHandler
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.math.LayerDistanceUtil
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
% import org.allbinary.thread.PathFindingThreadPool
% import org.allbinary.thread.ThreadPool
% import org.allbinary.time.TimeDelayHelper

-module('UnitWaypointBehavior2').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('UnitWaypointBehavior', Function, Arguments).

static_init() ->
    put({?MODULE, runningWaypointPathList}, 'BasicArrayListD':new()),
    put({?MODULE, 'TARGET_DISTANCE'}, "Target Distance"),
    put({?MODULE, 'TARGET_LAYER'}, "Target Layer"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, unitWaypointStrings}, 'UnitWaypointStrings':getInstance()),
    put({This, basicColorFactory}, 'BasicColorFactory':getInstance()),
    put({This, layerDistanceUtil}, 'LayerDistanceUtil':getInstance()),
    put({This, pathFindingThreadPool}, 'PathFindingThreadPool':getInstance()),
    put({This, progressTimeDelayHelper}, undefined),
    put({This, wanderPathsList}, undefined),
    put({This, waypointPathRunnable}, undefined),
    put({This, sensorRange}, 0),
    put({This, closeRange}, 0),
    put({This, nextUnvisitedPathGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, afterNextUnvisitedPathGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, waitingOnTargetPath}, false),
    put({This, waitingOnWaypointPath}, false),
    put({This, targetWithoutCachedPathLayerInterface}, 'CollidableDestroyableDamageableLayer':getNullInstance()),
    put({This, buildingSteeringVisitor}, 'BuildingSteeringVisitor':new()),
    ok.


new(OwnerAdvancedRTSGameLayer, FakeWaypoint) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, OwnerAdvancedRTSGameLayer, FakeWaypoint),
    This.

'$init'(This, OwnerAdvancedRTSGameLayer, FakeWaypoint) ->
        'UnitWaypointBehavior':'$init'(This, OwnerAdvancedRTSGameLayer, FakeWaypoint),
        init_fields(This),
        put({This, progressTimeDelayHelper}, 'TimeDelayHelper':new(5000)),
        put({This, wanderPathsList}, 'BasicArrayListD':new()),
        Features = 'Features':getInstance(),
        put({This, waypointPathRunnable}, case 'J2MEUtil':isHTML() of true -> 'MultipassWaypointPathRunnable':new(); false -> 'WaypointPathRunnable':new() end).

initRange(This, WeaponRange) when is_integer(WeaponRange) ->
        'UnitWaypointBehavior':initRange(This, WeaponRange),
        put({This, closeRange}, WeaponRange),
        put({This, sensorRange}, (WeaponRange * 4)),
        (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):initRange(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), get({This, closeRange}), get({This, sensorRange})).

getNextUnvisitedPathGeographicMapCellPosition(This) ->
        get({This, nextUnvisitedPathGeographicMapCellPosition}).

isRunning(This) ->
        try
        case (get({get({This, waypointPathRunnable}), '$class'})):isRunning(get({This, waypointPathRunnable})) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
processTick(This, AllBinaryLayerManager) ->
        try
        case (get({get({This, waypointPathRunnable}), '$class'})):isRunning(get({This, waypointPathRunnable})) of
            true ->
            case (get({This, waypointPathsListP}) =/= get({'UnitWaypointBehavior2', runningWaypointPathList})) of
                true ->
                (get({get({This, waypointPathRunnable}), '$class'})):setRunning(get({This, waypointPathRunnable}), false),
                case get({This, waitingOnTargetPath}) of
                    true ->
                    (get({This, '$class'})):setTargetPath(This);
                    false ->
                    case get({This, waitingOnWaypointPath}) of
                    true ->
                    (get({This, '$class'})):setWaypointPath(This, (get({get({This, waypointPathRunnable}), '$class'})):getTargetLayer(get({This, waypointPathRunnable})));
                    false ->
                    erlang:error({'Exception', "Should not happen"})
                end
                end;
                false ->
                throw({'$return', ok})
            end;
            false -> ok
        end,
        (get({This, '$class'})):processTargetList(This),
        case (not (get({get({This, waypointPathRunnable}), '$class'})):isRunning(get({This, waypointPathRunnable}))) of
            true ->
            (get({This, '$class'})):processWaypoint(This);
            false ->
            throw({'$return', ok})
        end,
        case (not (get({get({This, waypointPathRunnable}), '$class'})):isRunning(get({This, waypointPathRunnable}))) of
            true ->
            (get({This, '$class'})):processTargeting(This);
            false ->
            throw({'$return', ok})
        end,
        case (not (get({get({This, waypointPathRunnable}), '$class'})):isRunning(get({This, waypointPathRunnable}))) of
            true ->
            (get({This, '$class'})):teleportIfNoProgress(This);
            false ->
            throw({'$return', ok})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
onEnemyMovement(This, LayerInterface) ->
        AnotherTargetDistance = (get({get({This, layerDistanceUtil}), '$class'})):getDistance(get({This, layerDistanceUtil}), get({This, associatedAdvancedRTSGameLayer}), LayerInterface),
        case (LayerInterface =:= get({This, currentTargetLayerInterfaceP})) of
            true ->
            (get({This, '$class'})):setCurrentTargetDistance(This, AnotherTargetDistance);
            false ->
            (get({This, '$class'})):processPossibleTarget(This, LayerInterface, AnotherTargetDistance)
        end.

% throws Exception
processPossibleTarget(This, LayerInterface, AnotherTargetDistance) when is_integer(AnotherTargetDistance) ->
        IsShorterThanCurrentTargetDistance = ((get({This, '$class'})):getCurrentTargetDistance(This) > AnotherTargetDistance),
        IsCurrentTargetDestroyed = ((get({This, currentTargetLayerInterfaceP}) =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) andalso (get({get({This, currentTargetLayerInterfaceP}), '$class'})):isDestroyed(get({This, currentTargetLayerInterfaceP}))),
        (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):processPossibleTarget(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), This, LayerInterface, AnotherTargetDistance, IsShorterThanCurrentTargetDistance, IsCurrentTargetDestroyed),
        case (((get({This, '$class'})):isWaypointListEmptyOrOnlyTargets(This) andalso (get({This, '$class'})):isInSensorRange(This, LayerInterface, AnotherTargetDistance)) andalso ((IsShorterThanCurrentTargetDistance orelse IsCurrentTargetDestroyed))) of
            true ->
            (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):processSetTarget(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), This, LayerInterface, AnotherTargetDistance),
            (get({This, '$class'})):setTarget(This, LayerInterface, AnotherTargetDistance);
            false ->
            case ((get({This, '$class'})):isCloseRange(This, LayerInterface, AnotherTargetDistance) andalso ((IsShorterThanCurrentTargetDistance orelse IsCurrentTargetDestroyed))) of
            true ->
            (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):processPossibleTargetCloser(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), This, LayerInterface, AnotherTargetDistance),
            (get({This, '$class'})):setTarget(This, LayerInterface, AnotherTargetDistance);
            false -> ok
        end
        end.

% throws Exception
teleportIfNoProgress(This) ->
        case ((get({This, '$class'})):isTrackingWaypoint(This) orelse (fun(Target_N69145) -> (get({Target_N69145, '$class'})):isDestroyed(Target_N69145) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getParentLayer(get({This, associatedAdvancedRTSGameLayer})))) of
            true ->
            case ((get({get({This, progressTimeDelayHelper}), '$class'})):isTimeTNT(get({This, progressTimeDelayHelper})) andalso (get({This, nextUnvisitedPathGeographicMapCellPosition}) =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'}))) of
                true ->
                (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):teleportTo(get({This, associatedAdvancedRTSGameLayer}), get({This, nextUnvisitedPathGeographicMapCellPosition}));
                false -> ok
            end,
            case (fun(Target_N69289) -> (get({Target_N69289, '$class'})):isTimeTNT(Target_N69289) end)((get({This, '$class'})):getCompleteTimeDelayHelper(This)) of
                true ->
                GeographicMapCellPosition = (fun(Target_N69334) -> (get({Target_N69334, '$class'})):get(Target_N69334, ((get({get({This, currentGeographicMapCellHistoryP}), '$class'})):getSize(get({This, currentGeographicMapCellHistoryP})) - 1)) end)((get({get({This, currentGeographicMapCellHistoryP}), '$class'})):getTracked(get({This, currentGeographicMapCellHistoryP}))),
                (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):teleportTo(get({This, associatedAdvancedRTSGameLayer}), GeographicMapCellPosition);
                false -> ok
            end;
            false -> ok
        end.

% throws Exception
setTarget(This, LayerInterface, AnotherTargetDistance) when is_integer(AnotherTargetDistance) ->
        (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):setTarget(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), This, LayerInterface, AnotherTargetDistance),
        (fun(Target_N69564) -> (get({Target_N69564, '$class'})):update(Target_N69564, get({get({This, unitWaypointStrings}), 'TARGET'}), get({'BasicColorFactory':getInstance(), 'GREEN'})) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCaptionAnimationHelper(get({This, associatedAdvancedRTSGameLayer}))),
        (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):setLoad(get({This, associatedAdvancedRTSGameLayer}), 0),
        (get({This, '$class'})):setCurrentTargetDistance(This, AnotherTargetDistance),
        (get({This, '$class'})):setCurrentTargetLayerInterface(This, LayerInterface),
        (get({This, '$class'})):setTrackingWaypoint(This, false),
        (get({get({This, targetList}), '$class'})):clear(get({This, targetList})),
        case ((not (get({This, '$class'})):isCloseRange(This, LayerInterface, AnotherTargetDistance)) andalso (get({This, '$class'})):canInsertWaypoint(This, 0, get({This, currentTargetLayerInterfaceP}))) of
            true ->
            GeographicMapCellPosition = (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCurrentGeographicMapCellPosition(get({This, associatedAdvancedRTSGameLayer})),
            PathFindingLayerInterface = (get({This, currentTargetLayerInterfaceP})),
            Waypoint = (fun(Target_N69986) -> (get({Target_N69986, '$class'})):getWaypoint(Target_N69986) end)((get({PathFindingLayerInterface, '$class'})):getWaypointBehavior(PathFindingLayerInterface)),
            List = (get({Waypoint, '$class'})):getPathsListFromCacheOnly(Waypoint, GeographicMapCellPosition),
            (get({This, '$class'})):setWaypointPathsList(This, List),
            case (get({This, waypointPathsListP}) =:= undefined) of
                true ->
                put({This, targetWithoutCachedPathLayerInterface}, get({This, currentTargetLayerInterfaceP}));
                false ->
                case ((get({get({This, waypointPathsListP}), '$class'})):size(get({This, waypointPathsListP})) =/= 0) of
                true ->
                (get({This, '$class'})):setTargetPath(This);
                false -> ok
            end
            end;
            false -> ok
        end.

% throws Exception
setTargetPath(This) ->
        try
        case (get({This, currentTargetLayerInterfaceP}) =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) of
            true ->
            case (get({get({This, currentTargetLayerInterfaceP}), '$class'})):isDestroyed(get({This, currentTargetLayerInterfaceP})) of
                true ->
                (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):setTargetPath(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer})),
                (fun(Target_N70437) -> (get({Target_N70437, '$class'})):update(Target_N70437, get({get({This, unitWaypointStrings}), 'KILL'}), get({get({This, basicColorFactory}), 'ORANGE'})) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCaptionAnimationHelper(get({This, associatedAdvancedRTSGameLayer}))),
                (get({This, '$class'})):clearTarget(This),
                throw({'$return', ok});
                false -> ok
            end,
            case (get({This, currentTargetLayerInterfaceP}) =:= (get({get({This, waypointPathRunnable}), '$class'})):getTargetLayer(get({This, waypointPathRunnable}))) of
                true ->
                (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):setTargetPathIgnoreNewPath(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), This),
                (get({This, '$class'})):insertWaypoint(This, 0, get({This, currentTargetLayerInterfaceP})),
                (get({This, '$class'})):setRandomGeographicMapCellHistory(This, get({This, waypointPathsListP}));
                false -> ok
            end;
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
setGeographicMapCellHistoryPath(This, GeographicMapCellPositionBasicArrayList) ->
        (get({This, '$class'})):setCurrentPathGeographicMapCellPosition(This, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
        put({This, nextUnvisitedPathGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
        'UnitWaypointBehavior':setGeographicMapCellHistoryPath(This, GeographicMapCellPositionBasicArrayList).

% throws Exception
processWaypoint(This) ->
        try
        Size = (get({get({This, targetList}), '$class'})):size(get({This, targetList})),
        case (Size > 0) of
            true ->
            TargetLayer = (get({get({This, targetList}), '$class'})):get(get({This, targetList}), 0),
            (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):processWaypoint(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), This, TargetLayer, Size),
            case (get({TargetLayer, '$class'})):isDestroyed(TargetLayer) of
                true ->
                (fun(Target_N72005) -> (get({Target_N72005, '$class'})):update(Target_N72005, get({get({This, unitWaypointStrings}), 'WAYPOINT_DESTROYED_SHORT'}), get({get({This, basicColorFactory}), 'YELLOW'})) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCaptionAnimationHelper(get({This, associatedAdvancedRTSGameLayer}))),
                (get({This, '$class'})):removeWaypoint(This, TargetLayer, get({get({This, unitWaypointStrings}), 'WAYPOINT_DESTROYED'}));
                false ->
                GeographicMapCellPosition = (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCurrentGeographicMapCellPosition(get({This, associatedAdvancedRTSGameLayer})),
                case (get({This, '$class'})):isTrackingWaypoint(This) of
                    true ->
                    (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):processWaypointTracked(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), This),
                    case (get({This, '$class'})):visitIfAtMidPoint(This, GeographicMapCellPosition) of
                        true ->
                        (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):processWaypointTrackedVisit(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), GeographicMapCellPosition);
                        false -> ok
                    end,
                    case ((get({get({This, currentGeographicMapCellHistoryP}), '$class'})):isAllVisited2(get({This, currentGeographicMapCellHistoryP})) andalso (get({This, currentTargetLayerInterfaceP}) =/= 'CollidableDestroyableDamageableLayer':getNullInstance())) of
                        true ->
                        OldWaypointLayer = get({This, currentTargetLayerInterfaceP}),
                        (fun(Target_N71806) -> (get({Target_N71806, '$class'})):visit(Target_N71806, get({This, associatedAdvancedRTSGameLayer})) end)((fun(Target_N71813) -> (get({Target_N71813, '$class'})):getWaypoint(Target_N71813) end)((get({OldWaypointLayer, '$class'})):getWaypointBehavior(OldWaypointLayer))),
                        (fun(Target_N71860) -> (get({Target_N71860, '$class'})):update(Target_N71860, get({get({This, unitWaypointStrings}), 'ALL_VISITED_SHORT'}), get({get({This, basicColorFactory}), 'GREEN'})) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCaptionAnimationHelper(get({This, associatedAdvancedRTSGameLayer}))),
                        (get({This, '$class'})):removeWaypoint(This, get({This, currentTargetLayerInterfaceP}), get({get({This, unitWaypointStrings}), 'ALL_VISITED'}));
                        false -> ok
                    end;
                    false ->
                    case ((get({This, currentTargetLayerInterfaceP}) =:= undefined) orelse get({This, waypointOverridesAttacking})) of
                    true ->
                    List = (fun(Target_N71262) -> (get({Target_N71262, '$class'})):getPathsListFromCacheOnly(Target_N71262, GeographicMapCellPosition) end)((fun(Target_N71269) -> (get({Target_N71269, '$class'})):getWaypoint(Target_N71269) end)((get({TargetLayer, '$class'})):getWaypointBehavior(TargetLayer))),
                    (get({This, '$class'})):setWaypointPathsList(This, List),
                    case (get({This, waypointPathsListP}) =:= undefined) of
                        true ->
                        put({This, waitingOnWaypointPath}, true),
                        (fun(Target_N71405) -> (get({Target_N71405, '$class'})):update(Target_N71405, get({get({This, unitWaypointStrings}), 'THINKING'}), get({get({This, basicColorFactory}), 'GREEN'})) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCaptionAnimationHelper(get({This, associatedAdvancedRTSGameLayer}))),
                        (get({This, '$class'})):runWaypointPathTask(This, TargetLayer),
                        throw({'$return', ok});
                        false -> ok
                    end,
                    (get({This, '$class'})):setWaypointPath(This, TargetLayer);
                    false -> ok
                end
                end
            end;
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
wander(This) ->
        case (get({get({This, currentGeographicMapCellHistoryP}), '$class'})):isAllVisited2(get({This, currentGeographicMapCellHistoryP})) of
            true ->
            (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):wander(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer})),
            (fun(Target_N72240) -> (get({Target_N72240, '$class'})):update(Target_N72240, get({get({This, unitWaypointStrings}), 'WANDERING'}), get({get({This, basicColorFactory}), 'RED'})) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCaptionAnimationHelper(get({This, associatedAdvancedRTSGameLayer}))),
            (get({get({This, wanderPathsList}), '$class'})):clear(get({This, wanderPathsList})),
            (get({get({This, wanderPathsList}), '$class'})):add(get({This, wanderPathsList}), (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getSurroundingGeographicMapCellPositionList(get({This, associatedAdvancedRTSGameLayer}))),
            (get({This, '$class'})):setRandomGeographicMapCellHistory(This, get({This, wanderPathsList}));
            false -> ok
        end,
        (get({This, '$class'})):visitIfAtMidPoint(This, (get({This, '$class'})):getCurrentPathGeographicMapCellPosition(This)),
        (get({This, '$class'})):updateCurrentPathGeographicMapCellPosition(This),
        (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):trackTo(get({This, associatedAdvancedRTSGameLayer}), get({get({This, unitWaypointStrings}), 'NEXT_PATH_NODE'})).

visitIfAtMidPoint(This, GeographicMapCellPosition) ->
        try
        UnitLayer = get({This, associatedAdvancedRTSGameLayer}),
        case ((GeographicMapCellPosition =/= get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})) andalso (get({This, nextUnvisitedPathGeographicMapCellPosition}) =:= GeographicMapCellPosition)) of
            true ->
            Point = (get({GeographicMapCellPosition, '$class'})):getMidPoint(GeographicMapCellPosition),
            AfterNextPoint = (get({get({This, afterNextUnvisitedPathGeographicMapCellPosition}), '$class'})):getMidPoint(get({This, afterNextUnvisitedPathGeographicMapCellPosition})),
            put({local, beyondMidPoint}, true),
            case ((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition) =:= (get({get({This, afterNextUnvisitedPathGeographicMapCellPosition}), '$class'})):getColumn(get({This, afterNextUnvisitedPathGeographicMapCellPosition}))) of
                true ->
                ok;
                false ->
                case ((get({Point, '$class'})):getX(Point) < (get({AfterNextPoint, '$class'})):getX(AfterNextPoint)) of
                true ->
                case (((get({UnitLayer, '$class'})):getXP(UnitLayer) + (get({UnitLayer, '$class'})):getHalfWidth(UnitLayer)) < (get({Point, '$class'})):getX(Point)) of
                    true ->
                    put({local, beyondMidPoint}, false);
                    false -> ok
                end;
                false ->
                case (((get({UnitLayer, '$class'})):getXP(UnitLayer) + (get({UnitLayer, '$class'})):getHalfWidth(UnitLayer)) > (get({Point, '$class'})):getX(Point)) of
                    true ->
                    put({local, beyondMidPoint}, false);
                    false -> ok
                end
            end
            end,
            case ((get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition) =:= (get({get({This, afterNextUnvisitedPathGeographicMapCellPosition}), '$class'})):getRow(get({This, afterNextUnvisitedPathGeographicMapCellPosition}))) of
                true ->
                ok;
                false ->
                case ((get({Point, '$class'})):getY(Point) < (get({AfterNextPoint, '$class'})):getY(AfterNextPoint)) of
                true ->
                case (((get({UnitLayer, '$class'})):getYP(UnitLayer) + (get({UnitLayer, '$class'})):getHalfHeight(UnitLayer)) < (get({Point, '$class'})):getY(Point)) of
                    true ->
                    put({local, beyondMidPoint}, false);
                    false -> ok
                end;
                false ->
                case (((get({UnitLayer, '$class'})):getYP(UnitLayer) + (get({UnitLayer, '$class'})):getHalfHeight(UnitLayer)) > (get({Point, '$class'})):getY(Point)) of
                    true ->
                    put({local, beyondMidPoint}, false);
                    false -> ok
                end
            end
            end,
            case get({local, beyondMidPoint}) of
                true ->
                throw({'$return', (get({get({This, currentGeographicMapCellHistoryP}), '$class'})):visit(get({This, currentGeographicMapCellHistoryP}), GeographicMapCellPosition)});
                false -> ok
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
processTargetList(This) ->
        put({This, targetWithoutCachedPathLayerInterface}, 'CollidableDestroyableDamageableLayer':getNullInstance()),
        lists:foreach(fun(Index) ->
            LayerInterface = (fun(Target_N73521) -> (get({Target_N73521, '$class'})):get(Target_N73521, Index) end)((get({This, '$class'})):getPossibleTargetList(This)),
            case (get({LayerInterface, '$class'})):isDestroyed(LayerInterface) of
                true ->
                (fun(Target_N73636) -> (get({Target_N73636, '$class'})):remove(Target_N73636, LayerInterface) end)((get({This, '$class'})):getPossibleTargetList(This));
                false ->
                (get({This, '$class'})):onEnemyMovement(This, LayerInterface)
            end
        end, lists:seq(((fun(Target_N73707) -> (get({Target_N73707, '$class'})):size(Target_N73707) end)((get({This, '$class'})):getPossibleTargetList(This)) - 1), 0, -1)),
        case (get({This, targetWithoutCachedPathLayerInterface}) =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) of
            true ->
            put({This, waitingOnTargetPath}, true),
            (fun(Target_N73827) -> (get({Target_N73827, '$class'})):update(Target_N73827, get({get({This, unitWaypointStrings}), 'THINKING_ABOUT_TARGET'}), get({get({This, basicColorFactory}), 'GREEN'})) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCaptionAnimationHelper(get({This, associatedAdvancedRTSGameLayer}))),
            (get({This, '$class'})):runWaypointPathTask(This, get({This, currentTargetLayerInterfaceP}));
            false -> ok
        end,
        (fun(Target_N73947) -> (get({Target_N73947, '$class'})):clear(Target_N73947) end)((get({This, '$class'})):getPossibleTargetList(This)).

% throws Exception
processTargeting(This) ->
        try
        case ((get({This, currentTargetLayerInterfaceP}) =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) andalso (((get({This, '$class'})):isInSensorRange(This, get({This, currentTargetLayerInterfaceP}), (get({This, '$class'})):getCurrentTargetDistance(This)) orelse (get({This, '$class'})):isTrackingWaypoint(This)))) of
            true ->
            case (get({get({This, currentTargetLayerInterfaceP}), '$class'})):isDestroyed(get({This, currentTargetLayerInterfaceP})) of
                true ->
                (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):targetDestroyed(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer})),
                (fun(Target_N74379) -> (get({Target_N74379, '$class'})):update(Target_N74379, get({get({This, unitWaypointStrings}), 'KILL'}), get({get({This, basicColorFactory}), 'ORANGE'})) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCaptionAnimationHelper(get({This, associatedAdvancedRTSGameLayer}))),
                (get({This, '$class'})):clearTarget(This),
                throw({'$return', ok});
                false -> ok
            end,
            put({local, dx}, 0),
            put({local, dy}, 0),
            case (get({This, '$class'})):isTrackingWaypoint(This) of
                true ->
                (get({This, '$class'})):updateCurrentPathGeographicMapCellPosition(This),
                Point = (get({get({This, nextUnvisitedPathGeographicMapCellPosition}), '$class'})):getMidPoint(get({This, nextUnvisitedPathGeographicMapCellPosition})),
                put({local, dx}, (((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getXP(get({This, associatedAdvancedRTSGameLayer})) + (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getHalfWidth(get({This, associatedAdvancedRTSGameLayer}))) - (get({Point, '$class'})):getX(Point))),
                put({local, dy}, (((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getYP(get({This, associatedAdvancedRTSGameLayer})) + (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getHalfHeight(get({This, associatedAdvancedRTSGameLayer}))) - (get({Point, '$class'})):getY(Point))),
                (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):processTargeting(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), get({local, dx}), get({local, dy}));
                false ->
                (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):processTargetingNonWayPoint(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), get({local, dx}), get({local, dy})),
                put({local, dx}, ((((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getXP(get({This, associatedAdvancedRTSGameLayer})) + (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getHalfWidth(get({This, associatedAdvancedRTSGameLayer})))) - (((get({get({This, currentTargetLayerInterfaceP}), '$class'})):getXP(get({This, currentTargetLayerInterfaceP})) + (get({get({This, currentTargetLayerInterfaceP}), '$class'})):getHalfWidth(get({This, currentTargetLayerInterfaceP})))))),
                put({local, dy}, ((((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getYP(get({This, associatedAdvancedRTSGameLayer})) + (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getHalfHeight(get({This, associatedAdvancedRTSGameLayer})))) - (((get({get({This, currentTargetLayerInterfaceP}), '$class'})):getYP(get({This, currentTargetLayerInterfaceP})) + (get({get({This, currentTargetLayerInterfaceP}), '$class'})):getHalfHeight(get({This, currentTargetLayerInterfaceP}))))))
            end,
            (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):trackToDXY(get({This, associatedAdvancedRTSGameLayer}), get({local, dx}), get({local, dy}));
            false ->
            case (fun(Target_N74111) -> (get({Target_N74111, '$class'})):isDestroyed(Target_N74111) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getParentLayer(get({This, associatedAdvancedRTSGameLayer}))) of
                true ->
                (get({This, '$class'})):wander(This);
                false ->
                case get({get({This, associatedAdvancedRTSGameLayer}), showMoreCaptionStates}) of
                    true ->
                    (fun(Target_N74173) -> (get({Target_N74173, '$class'})):update(Target_N74173, get({get({This, unitWaypointStrings}), 'STOP'}), get({get({This, basicColorFactory}), 'YELLOW'})) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCaptionAnimationHelper(get({This, associatedAdvancedRTSGameLayer})));
                    false -> ok
                end,
                (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):allStop(get({This, associatedAdvancedRTSGameLayer}))
            end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

updateCurrentPathGeographicMapCellPosition(This) ->
        (get({This, '$class'})):setLastPathGeographicMapCellPosition(This, (get({This, '$class'})):getCurrentPathGeographicMapCellPosition(This)),
        (get({This, '$class'})):setCurrentPathGeographicMapCellPosition(This, get({This, nextUnvisitedPathGeographicMapCellPosition})),
        put({This, nextUnvisitedPathGeographicMapCellPosition}, (get({get({This, currentGeographicMapCellHistoryP}), '$class'})):getFirstUnvisited(get({This, currentGeographicMapCellHistoryP}))),
        put({This, afterNextUnvisitedPathGeographicMapCellPosition}, (get({get({This, currentGeographicMapCellHistoryP}), '$class'})):getAfterIfNotLast(get({This, currentGeographicMapCellHistoryP}), get({This, nextUnvisitedPathGeographicMapCellPosition}))),
        case ((get({This, '$class'})):getCurrentPathGeographicMapCellPosition(This) =/= get({This, nextUnvisitedPathGeographicMapCellPosition})) of
            true ->
            (get({get({This, progressTimeDelayHelper}), '$class'})):setStartTimeTNT(get({This, progressTimeDelayHelper}));
            false -> ok
        end.

% throws Exception
setWaypointPath(This, WaypointLayer) ->
        case ((get({get({This, waypointPathsListP}), '$class'})):size(get({This, waypointPathsListP})) =/= 0) of
            true ->
            (get({This, '$class'})):setCurrentTargetLayerInterface(This, WaypointLayer),
            MAX = get({'Integer', 'MAX_VALUE'}),
            (get({This, '$class'})):setCurrentTargetDistance(This, MAX),
            (get({This, '$class'})):setRandomGeographicMapCellHistory(This, get({This, waypointPathsListP}));
            false ->
            (fun(Target_N75500) -> (get({Target_N75500, '$class'})):visit(Target_N75500, get({This, associatedAdvancedRTSGameLayer})) end)((fun(Target_N75507) -> (get({Target_N75507, '$class'})):getWaypoint(Target_N75507) end)((get({WaypointLayer, '$class'})):getWaypointBehavior(WaypointLayer))),
            (fun(Target_N75554) -> (get({Target_N75554, '$class'})):update(Target_N75554, get({get({This, unitWaypointStrings}), 'ALREADY_THERE_SHORT'}), get({get({This, basicColorFactory}), 'YELLOW'})) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCaptionAnimationHelper(get({This, associatedAdvancedRTSGameLayer}))),
            (get({This, '$class'})):removeWaypoint(This, WaypointLayer, get({get({This, unitWaypointStrings}), 'ALREADY_THERE'}))
        end.

% throws Exception
runWaypointPathTask(This, WaypointLayer) ->
        (get({This, '$class'})):setWaypointPathsList(This, get({'UnitWaypointBehavior2', runningWaypointPathList})),
        case (get({get({This, waypointPathRunnable}), '$class'})):isRunning(get({This, waypointPathRunnable})) of
            true ->
            erlang:error({'Exception', "Should never be running here"});
            false -> ok
        end,
        (get({get({This, waypointPathRunnable}), '$class'})):setRunning(get({This, waypointPathRunnable}), true),
        (get({get({This, waypointPathRunnable}), '$class'})):setUnitLayer(get({This, waypointPathRunnable}), get({This, associatedAdvancedRTSGameLayer})),
        (get({get({This, waypointPathRunnable}), '$class'})):setTargetLayer(get({This, waypointPathRunnable}), WaypointLayer),
        (get({get({This, pathFindingThreadPool}), '$class'})):runTask(get({This, pathFindingThreadPool}), get({This, waypointPathRunnable})).

% throws Exception
removeWaypoint(This, WaypointLayer, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
        (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):removeWaypoint(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), This, WaypointLayer, Reason),
        (get({get({This, targetList}), '$class'})):remove(get({This, targetList}), WaypointLayer),
        (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):removeWaypointList(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), This, get({This, targetList})),
        case (get({This, currentTargetLayerInterfaceP}) =:= WaypointLayer) of
            true ->
            (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):removeWaypointClear(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer})),
            (get({This, '$class'})):clearTarget(This);
            false -> ok
        end.

% throws Exception
clearTarget(This) ->
        (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):clearTarget(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer})),
        (get({This, '$class'})):setCurrentTargetLayerInterface(This, 'CollidableDestroyableDamageableLayer':getNullInstance()),
        (get({This, '$class'})):setTrackingWaypoint(This, false),
        MAX = get({'Integer', 'MAX_VALUE'}),
        (get({This, '$class'})):setCurrentTargetDistance(This, MAX),
        (fun(Target_N76725) -> (get({Target_N76725, '$class'})):fireEvent(Target_N76725, (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getTrackingEvent(get({This, associatedAdvancedRTSGameLayer}))) end)('TrackingEventHandler':getInstance()).

isWaypointListEmptyOrOnlyTargets(This) ->
        try
        List = get({This, targetList}),
        case ((get({List, '$class'})):size(List) =:= 0) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        lists:foreach(fun(Index) ->
            LayerInterface = (get({List, '$class'})):get(List, Index),
            case (get({LayerInterface, '$class'})):isWaypointListEmptyOrOnlyTargets(LayerInterface) of
                true ->
                throw({'$return', false});
                false -> ok
            end
        end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isCloseRange(This, LayerInterface, TargetDistance) when is_integer(TargetDistance) ->
        (TargetDistance < (get({This, closeRange}) + (get({LayerInterface, '$class'})):getHalfHeight(LayerInterface))).

isInSensorRange(This, LayerInterface, TargetDistance) when is_integer(TargetDistance) ->
        (TargetDistance < (get({This, sensorRange}) + (get({LayerInterface, '$class'})):getHalfHeight(LayerInterface))).

getCurrentTargetingStateString(This) ->
        StringBuffer = 'StringMaker':new(),
        case (get({This, currentTargetLayerInterfaceP}) =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'UnitWaypointBehavior2', 'TARGET_LAYER'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, currentTargetLayerInterfaceP}), '$class'})):getName(get({This, currentTargetLayerInterfaceP}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, " with "),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'UnitWaypointBehavior2', 'TARGET_DISTANCE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({This, '$class'})):getCurrentTargetDistance(This)));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

% throws Exception
addWaypointFromUser(This, AdvancedRTSGameLayer) ->
        case (get({AdvancedRTSGameLayer, '$class'})):isDestroyed(AdvancedRTSGameLayer) of
            true ->
            erlang:error({'Exception', lists:concat(["Trying to add a dead: ", AdvancedRTSGameLayer])});
            false -> ok
        end,
        (get({get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), '$class'})):addWaypointFromUser(get({get({This, associatedAdvancedRTSGameLayer}), waypoint2LogHelperP}), get({This, associatedAdvancedRTSGameLayer}), AdvancedRTSGameLayer),
        (get({get({This, targetList}), '$class'})):clear(get({This, targetList})),
        (get({get({This, targetList}), '$class'})):add(get({This, targetList}), AdvancedRTSGameLayer),
        (get({This, '$class'})):clearTarget(This).

% throws Exception
addBuildingChase(This, AllbinaryLayer, CellPosition) ->
        case (not (fun(Target_N79048) -> (get({Target_N79048, '$class'})):contains(Target_N79048, AllbinaryLayer) end)((get({get({This, buildingSteeringVisitor}), '$class'})):getList(get({This, buildingSteeringVisitor})))) of
            true ->
            (fun(Target_N79095) -> (get({Target_N79095, '$class'})):add(Target_N79095, AllbinaryLayer) end)((get({get({This, buildingSteeringVisitor}), '$class'})):getList(get({This, buildingSteeringVisitor}))),
            (fun(Target_N79137) -> (get({Target_N79137, '$class'})):add(Target_N79137, CellPosition) end)((get({get({This, buildingSteeringVisitor}), '$class'})):getPositionList(get({This, buildingSteeringVisitor})));
            false -> ok
        end,
        case (not (fun(Target_N79190) -> (get({Target_N79190, '$class'})):contains(Target_N79190, get({This, buildingSteeringVisitor})) end)((get({This, '$class'})):getSteeringVisitorList(This))) of
            true ->
            (fun(Target_N79232) -> (get({Target_N79232, '$class'})):add(Target_N79232, get({This, buildingSteeringVisitor})) end)((get({This, '$class'})):getSteeringVisitorList(This));
            false -> ok
        end.

% throws Exception
buildingChase(This, AllbinaryLayer, CellPosition) ->
        (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):buildingChase(get({This, associatedAdvancedRTSGameLayer}), AllbinaryLayer, CellPosition).
% Java nested class BuildingSteeringVisitor: move it to its own module 'BuildingSteeringVisitor'

