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
% import org.allbinary.game.input.form.PrimaryWaypointHelper
% import org.allbinary.game.layer.AdvancedRTSGameLayer
% import org.allbinary.game.layer.RTSLayerEvent
% import org.allbinary.game.layer.SensorAction
% import org.allbinary.game.layer.SensorActionFactory
% import org.allbinary.game.layer.WaypointBehaviorBase
% import org.allbinary.game.layer.building.BuildingLayer
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.game.layer.waypoint.event.WaypointEventListenerInterface
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
% import org.allbinary.string.CommonSeps
% import org.allbinary.time.TimeDelayHelper
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil

-module('UnitWaypointBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements WaypointEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('WaypointBehaviorBase', Function, Arguments).

static_init() ->
    put({?MODULE, 'PATHING'}, "Pathing"),
    ok.

init_fields(This) ->
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, longWeaponRange}, 0),
    put({This, sensorAction}, get({'SensorActionFactory':getInstance(), 'ATTACK'})),
    put({This, completeTimeDelayHelper}, undefined),
    put({This, currentGeographicMapCellHistoryP}, undefined),
    put({This, lastPathGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, currentPathGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, 'FAKE_WAYPOINT_LAYER'}, undefined),
    put({This, targetList}, undefined),
    put({This, possibleTargetList}, undefined),
    put({This, associatedAdvancedRTSGameLayer}, undefined),
    put({This, moving}, false),
    put({This, movingFromStopped}, false),
    put({This, waypointPathsListP}, (fun(Target_N66913) -> (get({Target_N66913, '$class'})):getImmutableInstance(Target_N66913) end)('BasicArrayListUtil':getInstance())),
    put({This, currentTargetDistance}, get({'Integer', 'MAX_VALUE'})),
    put({This, currentTargetLayerInterfaceP}, 'CollidableDestroyableDamageableLayer':getNullInstance()),
    put({This, trackingWaypoint}, false),
    put({This, repeatedToLong}, 'TimeDelayHelper':new(22000)),
    ok.


new(AssociatedAdvancedRTSGameLayer, FakeWaypoint) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AssociatedAdvancedRTSGameLayer, FakeWaypoint),
    This.

'$init'(This, AssociatedAdvancedRTSGameLayer, FakeWaypoint) ->
    'WaypointBehaviorBase':'$init'(This),
    init_fields(This),
        put({This, associatedAdvancedRTSGameLayer}, AssociatedAdvancedRTSGameLayer),
        put({This, completeTimeDelayHelper}, 'TimeDelayHelper':new(30000)),
        put({This, targetList}, 'BasicArrayListD':new()),
        put({This, possibleTargetList}, 'BasicArrayListD':new()),
        (get({This, '$class'})):setWaypointPathsList(This, (fun(Target_N67220) -> (get({Target_N67220, '$class'})):getImmutableInstance(Target_N67220) end)('BasicArrayListUtil':getInstance())),
        put({This, currentGeographicMapCellHistoryP}, 'GeographicMapCellHistory':new()),
        put({This, 'FAKE_WAYPOINT_LAYER'}, FakeWaypoint).

initRange(This, WeaponRange) when is_integer(WeaponRange) ->
        put({This, longWeaponRange}, (WeaponRange div 2)).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

% throws Exception
onWaypointEvent(This, Event) ->
        AdvancedRTSGameLayer = (get({Event, '$class'})):getRtsLayer(Event),
        (get({get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), '$class'})):onWaypointEvent(get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), get({This, associatedAdvancedRTSGameLayer}), AdvancedRTSGameLayer),
        case (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):isSelected(get({This, associatedAdvancedRTSGameLayer})) of
            true ->
            (get({This, '$class'})):addWaypointFromUser(This, AdvancedRTSGameLayer);
            false ->
            case (get({AdvancedRTSGameLayer, '$class'})):shouldAddWaypointFromBuilding(AdvancedRTSGameLayer) of
            true ->
            (get({This, '$class'})):addWaypointFromBuilding(This, AdvancedRTSGameLayer);
            false -> ok
        end
        end.

% throws Exception
addWaypointFromUser(This, AdvancedRTSGameLayer) ->
        ok.

% throws Exception
addWaypointFromBuilding(This, AdvancedRTSGameLayer) ->
        case ((AdvancedRTSGameLayer =:= (fun(Target_N67955) -> (get({Target_N67955, '$class'})):getWaypointLayer(Target_N67955) end)('PrimaryWaypointHelper':getInstance())) orelse ((get({AdvancedRTSGameLayer, '$class'})):getParentLayer(AdvancedRTSGameLayer) =:= (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getParentLayer(get({This, associatedAdvancedRTSGameLayer})))) of
            true ->
            case (not (get({get({This, targetList}), '$class'})):contains(get({This, targetList}), AdvancedRTSGameLayer)) of
                true ->
                (get({get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), '$class'})):addWaypointFromBuilding(get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), get({This, associatedAdvancedRTSGameLayer}), AdvancedRTSGameLayer),
                case (get({AdvancedRTSGameLayer, '$class'})):isDestroyed(AdvancedRTSGameLayer) of
                    true ->
                    erlang:error({'Exception', lists:concat(["Trying to add a dead: ", AdvancedRTSGameLayer])});
                    false -> ok
                end,
                (get({get({This, targetList}), '$class'})):add(get({This, targetList}), AdvancedRTSGameLayer),
                (get({get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), '$class'})):addWaypointFromBuildingList(get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), get({This, associatedAdvancedRTSGameLayer}), AdvancedRTSGameLayer, get({This, targetList}));
                false -> ok
            end;
            false -> ok
        end.

isWaypointListEmptyOrOnlyTargets(This) ->
        false.

% throws Exception
insertWaypoint(This, Index, RtsLayer) when is_integer(Index) ->
        try
        case (get({This, '$class'})):canInsertWaypoint(This, Index, RtsLayer) of
            true ->
            (get({get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), '$class'})):insertWaypoint(get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), get({This, associatedAdvancedRTSGameLayer}), Index, RtsLayer, (get({This, '$class'})):getName(This)),
            case (get({RtsLayer, '$class'})):isDestroyed(RtsLayer) of
                true ->
                erlang:error({'Exception', lists:concat(["Trying to add a dead: ", RtsLayer])});
                false -> ok
            end,
            (get({get({This, targetList}), '$class'})):addAt(get({This, targetList}), Index, RtsLayer),
            (get({get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), '$class'})):insertWaypointList(get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), get({This, associatedAdvancedRTSGameLayer}), Index, RtsLayer, (get({This, '$class'})):getName(This), get({This, targetList})),
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

move(This) ->
        case (get({This, '$class'})):isMoving(This) of
            true ->
            (get({This, '$class'})):setMovingFromStopped(This, false);
            false ->
            (get({This, '$class'})):setMovingFromStopped(This, true)
        end,
        (get({This, '$class'})):setMoving(This, false).

% throws Exception
setRandomGeographicMapCellHistory(This, PathsList) ->
        Size = (get({PathsList, '$class'})):size(PathsList),
        (get({get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), '$class'})):setRandomGeographicMapCellHistoryList(get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), get({This, associatedAdvancedRTSGameLayer}), PathsList),
        case (Size > 0) of
            true ->
            GeographicMapCellPositionBasicArrayList = (fun(Target_N69063) -> (get({Target_N69063, '$class'})):getRandom(Target_N69063, PathsList) end)('BasicArrayListUtil':getInstance()),
            (get({This, '$class'})):setGeographicMapCellHistoryPath(This, GeographicMapCellPositionBasicArrayList);
            false -> ok
        end.

% throws Exception
setGeographicMapCellHistoryPath(This, GeographicMapCellPositionBasicArrayList) ->
        put({This, lastPathGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
        case get({get({This, associatedAdvancedRTSGameLayer}), showMoreCaptionStates}) of
            true ->
            (fun(Target_N69281) -> (get({Target_N69281, '$class'})):update(Target_N69281, get({'UnitWaypointBehavior', 'PATHING'}), get({'BasicColorFactory':getInstance(), 'GREEN'})) end)((get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCaptionAnimationHelper(get({This, associatedAdvancedRTSGameLayer})));
            false -> ok
        end,
        (get({get({This, currentGeographicMapCellHistoryP}), '$class'})):init(get({This, currentGeographicMapCellHistoryP})),
        (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):init(get({This, associatedAdvancedRTSGameLayer}), get({This, currentGeographicMapCellHistoryP}), GeographicMapCellPositionBasicArrayList),
        (get({This, '$class'})):setTrackingWaypoint(This, true),
        (fun(Target_N69448) -> (get({Target_N69448, '$class'})):setStartTimeTNT(Target_N69448) end)((get({This, '$class'})):getCompleteTimeDelayHelper(This)).

canInsertWaypoint(This, Index, RtsLayer) when is_integer(Index) ->
        try
        case ((get({get({This, targetList}), '$class'})):size(get({This, targetList})) > 4) of
            true ->
            ok;
            false ->
            case (get({get({This, targetList}), '$class'})):contains(get({This, targetList}), RtsLayer) of
            true ->
            ok;
            false ->
            throw({'$return', true})
        end
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
addBuildingChase(This, AllbinaryLayer, CellPosition) ->
        ok.

% throws Exception
moveAwayFromBuilding(This, BuildingLayer) ->
        GeographicMapCellPosition = (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):getCurrentGeographicMapCellPosition(get({This, associatedAdvancedRTSGameLayer})),
        List = (get({get({BuildingLayer, geographicMapCellPositionAreaBase}), '$class'})):getOccupyingGeographicMapCellPositionList(get({BuildingLayer, geographicMapCellPositionAreaBase})),
        case (get({List, '$class'})):contains(List, GeographicMapCellPosition) of
            true ->
            case (get({This, '$class'})):insertWaypoint(This, 0, get({This, 'FAKE_WAYPOINT_LAYER'})) of
                true ->
                (get({get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), '$class'})):moveAwayFromBuilding(get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), get({This, associatedAdvancedRTSGameLayer})),
                (get({This, '$class'})):setCurrentTargetLayerInterface(This, get({This, 'FAKE_WAYPOINT_LAYER'})),
                PathsList = (get({BuildingLayer, '$class'})):getMoveOutOfBuildAreaPath(BuildingLayer, GeographicMapCellPosition),
                (get({get({This, associatedAdvancedRTSGameLayer}), '$class'})):setClosestGeographicMapCellHistory(get({This, associatedAdvancedRTSGameLayer}), PathsList);
                false -> ok
            end;
            false -> ok
        end.

needToMove(This) ->
        try
        (get({get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), '$class'})):needToMove(get({get({This, associatedAdvancedRTSGameLayer}), waypointLogHelperP}), get({This, associatedAdvancedRTSGameLayer}), This),
        case (((get({This, '$class'})):isTrackingWaypoint(This) orelse (get({This, sensorAction}) =:= get({'SensorActionFactory':getInstance(), 'EVADE'}))) orelse (((get({This, currentTargetLayerInterfaceP}) =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) andalso ((get({This, '$class'})):getCurrentTargetDistance(This) >= (get({This, longWeaponRange}) + (get({get({This, currentTargetLayerInterfaceP}), '$class'})):getHalfHeight(get({This, currentTargetLayerInterfaceP}))))))) of
            true ->
            (get({get({This, repeatedToLong}), '$class'})):setStartTimeTNT(get({This, repeatedToLong})),
            throw({'$return', true});
            false -> ok
        end,
        case (get({get({This, repeatedToLong}), '$class'})):isTimeTNT(get({This, repeatedToLong})) of
            true ->
            Message = lists:concat(["Repeating too long: ", (get({This, '$class'})):getMovementLogicAsString(This)]),
            'ForcedLogUtil':log(Message, get({This, associatedAdvancedRTSGameLayer}));
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getMovementLogicAsString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "isTrackingWaypoint: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({This, '$class'})):isTrackingWaypoint(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " sensorAction: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sensorAction}), name})),
        (get({StringBuffer, '$class'})):append(StringBuffer, " getCurrentTargetLayerInterface: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70909) -> (get({Target_N70909, '$class'})):toString(Target_N70909, get({This, currentTargetLayerInterfaceP})) end)('StringUtil':getInstance())),
        case (get({This, currentTargetLayerInterfaceP}) =/= 'CollidableDestroyableDamageableLayer':getNullInstance()) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, " Target Range: "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({This, '$class'})):getCurrentTargetDistance(This)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " >= "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({This, longWeaponRange}) + (get({get({This, currentTargetLayerInterfaceP}), '$class'})):getHalfHeight(get({This, currentTargetLayerInterfaceP})))));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

isMovingFromStopped(This) ->
        get({This, movingFromStopped}).

setMovingFromStopped(This, MovingFromStopped) when is_boolean(MovingFromStopped) ->
        put({This, movingFromStopped}, MovingFromStopped).

setWaypointPathsList(This, WaypointPathsList) ->
        put({This, waypointPathsListP}, WaypointPathsList).

getWaypointPathsList(This) ->
        get({This, waypointPathsListP}).

isMoving(This) ->
        get({This, moving}).

setMoving(This, Moving) when is_boolean(Moving) ->
        put({This, moving}, Moving).

isTrackingWaypoint(This) ->
        get({This, trackingWaypoint}).

getPossibleTargetList(This) ->
        get({This, possibleTargetList}).

setLastPathGeographicMapCellPosition(This, LastPathGeographicMapCellPosition) ->
        put({This, lastPathGeographicMapCellPosition}, LastPathGeographicMapCellPosition).

getLastPathGeographicMapCellPosition(This) ->
        get({This, lastPathGeographicMapCellPosition}).

setCurrentPathGeographicMapCellPosition(This, CurrentPathGeographicMapCellPosition) ->
        put({This, currentPathGeographicMapCellPosition}, CurrentPathGeographicMapCellPosition).

getCurrentPathGeographicMapCellPosition(This) ->
        get({This, currentPathGeographicMapCellPosition}).

setSensorAction(This, SensorAction) ->
        put({This, sensorAction}, SensorAction).

getSensorAction(This) ->
        get({This, sensorAction}).

setCurrentTargetLayerInterface(This, CurrentTargetLayerInterface) ->
        put({This, currentTargetLayerInterfaceP}, CurrentTargetLayerInterface).

getCurrentTargetLayerInterface(This) ->
        get({This, currentTargetLayerInterfaceP}).

setCurrentTargetDistance(This, CurrentTargetDistance) when is_integer(CurrentTargetDistance) ->
        put({This, currentTargetDistance}, CurrentTargetDistance).

getCurrentTargetDistance(This) ->
        get({This, currentTargetDistance}).

getCompleteTimeDelayHelper(This) ->
        get({This, completeTimeDelayHelper}).

getCurrentGeographicMapCellHistory(This) ->
        get({This, currentGeographicMapCellHistoryP}).

setTrackingWaypoint(This, TrackingWaypoint) when is_boolean(TrackingWaypoint) ->
        put({This, trackingWaypoint}, TrackingWaypoint).

