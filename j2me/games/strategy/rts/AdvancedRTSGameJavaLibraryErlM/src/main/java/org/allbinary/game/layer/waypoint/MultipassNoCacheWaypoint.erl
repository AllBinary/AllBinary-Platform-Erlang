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
% package org.allbinary.game.layer.waypoint
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.layer.RTSLayerEvent
% import org.allbinary.game.layer.building.event.BuildingEventListenerInterface
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.game.layer.unit.UnitWaypointBehavior
% import org.allbinary.game.media.graphics.geography.map.racetrack.PathFindingInfoFactory
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.media.audio.Sound
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGenerator
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap
% import org.allbinary.media.graphics.geography.pathfinding.MultipassState
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo
% import org.allbinary.media.graphics.geography.pathfinding.PathGenerator
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('MultipassNoCacheWaypoint').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BuildingEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('WaypointBase', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, ownerLayer}, undefined),
    ok.


new(OwnerLayer, Sound) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, OwnerLayer, Sound),
    This.

'$init'(This, OwnerLayer, Sound) ->
        'WaypointBase':'$init'(This, Sound),
        init_fields(This),
        put({This, ownerLayer}, OwnerLayer).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        'WaypointBase':setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager).

releaseCachedPaths(This) ->
        ok.

% throws Exception
getPathFindingInfo(This, GeographicMapCellPosition) ->
        try
        StartGeographicMapCellPosition = GeographicMapCellPosition,
        EndGeographicMapCellPosition = (get({This, '$class'})):getEndGeographicMapCellPosition(This, StartGeographicMapCellPosition),
        case (EndGeographicMapCellPosition =:= undefined) of
            true ->
            throw({'$return', get({'PathFindingInfo', 'NULL_PATH_FINDING_INFO'})});
            false -> ok
        end,
        case (StartGeographicMapCellPosition =:= EndGeographicMapCellPosition) of
            true ->
            case (get({get({This, ownerLayer}), '$class'})):shouldHandleStartSameAsEnd(get({This, ownerLayer})) of
                true ->
                throw({'$return', get({'PathFindingInfo', 'NULL_PATH_FINDING_INFO'})});
                false ->
                erlang:error({'Exception', lists:concat(["Start should not be End: ", EndGeographicMapCellPosition])})
            end;
            false -> ok
        end,
        GeographicMapCompositeInterface = get({This, allBinaryGameLayerManagerP}),
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        RaceTrackGeographicMap = GeographicMapInterface,
        RaceTrackGeographicMapCellTypeFactory = (get({RaceTrackGeographicMap, '$class'})):getGeographicMapCellTypeFactory(RaceTrackGeographicMap),
        CustomMapGenerator = (get({RaceTrackGeographicMap, '$class'})):getCustomMapGenerator(RaceTrackGeographicMap),
        (get({CustomMapGenerator, '$class'})):copyMapIntoCustomMap(CustomMapGenerator),
        CustomMapArray = (get({CustomMapGenerator, '$class'})):getCustomMapArray(CustomMapGenerator),
        array:set((get({StartGeographicMapCellPosition, '$class'})):getRow(StartGeographicMapCellPosition), array:set((get({StartGeographicMapCellPosition, '$class'})):getColumn(StartGeographicMapCellPosition), (get({RaceTrackGeographicMapCellTypeFactory, '$class'})):getStartType(RaceTrackGeographicMapCellTypeFactory), array:get((get({StartGeographicMapCellPosition, '$class'})):getRow(StartGeographicMapCellPosition), CustomMapArray)), CustomMapArray),
        array:set((get({EndGeographicMapCellPosition, '$class'})):getRow(EndGeographicMapCellPosition), array:set((get({EndGeographicMapCellPosition, '$class'})):getColumn(EndGeographicMapCellPosition), (get({RaceTrackGeographicMapCellTypeFactory, '$class'})):getEndType(RaceTrackGeographicMapCellTypeFactory), array:get((get({EndGeographicMapCellPosition, '$class'})):getRow(EndGeographicMapCellPosition), CustomMapArray)), CustomMapArray),
        PathFindingInfo = (fun(Target_N67635) -> (get({Target_N67635, '$class'})):getInstancePathFindingInfo(Target_N67635, RaceTrackGeographicMap, CustomMapArray) end)('PathFindingInfoFactory':getInstance()),
        PathFindingInfo
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getPathsList(This, GeographicMapCellPosition, PathFindingInfo, MultipassState) ->
        try
        try
            case (PathFindingInfo =:= undefined) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["pathFindingInfo: ", PathFindingInfo]), This, "getPathsList"),
                throw({'$return', (fun(Target_N67870) -> (get({Target_N67870, '$class'})):getImmutableInstance(Target_N67870) end)('BasicArrayListUtil':getInstance())});
                false -> ok
            end,
            GeographicMapCompositeInterface = get({This, allBinaryGameLayerManagerP}),
            GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
            List = (fun(Target_N68035) -> (get({Target_N68035, '$class'})):createN(Target_N68035, GeographicMapInterface, PathFindingInfo, 2, MultipassState) end)('PathGenerator':getInstance()),
            case ((List =/= undefined) andalso (List =/= (fun(Target_N68145) -> (get({Target_N68145, '$class'})):getImmutableInstance(Target_N68145) end)('BasicArrayListUtil':getInstance()))) of
                true ->
                case ((get({List, '$class'})):size(List) < 1) of
                    true ->
                    erlang:error({'Exception', "Path may have been cleared by clearing caching"});
                    false -> ok
                end,
                throw({'$return', List});
                false -> ok
            end,
            (fun(Target_N68257) -> (get({Target_N68257, '$class'})):getImmutableInstance(Target_N68257) end)('BasicArrayListUtil':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "getPathsList", E),
            (fun(Target_N68404) -> (get({Target_N68404, '$class'})):getImmutableInstance(Target_N68404) end)('BasicArrayListUtil':getInstance())
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getEndGeographicMapCellPosition(This, StartGeographicMapCellPosition) ->
        EndList = (get({get({This, ownerLayer}), '$class'})):getEndGeographicMapCellPositionList(get({This, ownerLayer})),
        put({local, endGeographicMapCellPosition}, (fun(Target_N68645) -> (get({Target_N68645, '$class'})):getRandom(Target_N68645, EndList) end)('BasicArrayListUtil':getInstance())),
        case (StartGeographicMapCellPosition =:= get({local, endGeographicMapCellPosition})) of
            true ->
            lists:foreach(fun(Index) ->
                put({local, endGeographicMapCellPosition}, (get({EndList, '$class'})):get(EndList, Index)),
                case (StartGeographicMapCellPosition =/= get({local, endGeographicMapCellPosition})) of
                    true ->
                    throw('$break');
                    false -> ok
                end
            end, lists:seq(((get({EndList, '$class'})):size(EndList) - 1), 0, -1));
            false -> ok
        end,
        get({local, endGeographicMapCellPosition}).

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

% throws Exception
onBuildingEvent(This, Event) ->
        ok.

reset(This) ->
        (fun(Target_N69193) -> (get({Target_N69193, '$class'})):clear(Target_N69193) end)((get({This, '$class'})):getConnectedWaypointList(This)).

% throws Exception
visit(This, UnitLayer) ->
        try
        case (array:get(0, (get({UnitLayer, '$class'})):getGroupInterface(UnitLayer)) =/= array:get(0, (get({get({This, ownerLayer}), '$class'})):getGroupInterface(get({This, ownerLayer})))) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        Size = (fun(Target_N69341) -> (get({Target_N69341, '$class'})):size(Target_N69341) end)((get({This, '$class'})):getConnectedWaypointList(This)),
        case (Size > 0) of
            true ->
            UnitWaypointBehavior = (get({UnitLayer, '$class'})):getWaypointBehavior(UnitLayer),
            (fun Loop() -> case ((fun(Target_N69693) -> (get({Target_N69693, '$class'})):size(Target_N69693) end)((get({This, '$class'})):getConnectedWaypointList(This)) > 0) of true ->
                RtsLayer = (fun(Target_N69488) -> (get({Target_N69488, '$class'})):get(Target_N69488, 0) end)((get({This, '$class'})):getConnectedWaypointList(This)),
                case (get({RtsLayer, '$class'})):isDestroyed(RtsLayer) of
                    true ->
                    (fun(Target_N69653) -> (get({Target_N69653, '$class'})):remove(Target_N69653, RtsLayer) end)((get({This, '$class'})):getConnectedWaypointList(This));
                    false ->
                    (get({UnitLayer, '$class'})):handleCost(UnitLayer, get({This, ownerLayer})),
                    (get({UnitWaypointBehavior, '$class'})):insertWaypoint(UnitWaypointBehavior, 0, RtsLayer),
                    throw('$break')
                end,
                Loop();
            false -> ok end end)();
            false -> ok
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

