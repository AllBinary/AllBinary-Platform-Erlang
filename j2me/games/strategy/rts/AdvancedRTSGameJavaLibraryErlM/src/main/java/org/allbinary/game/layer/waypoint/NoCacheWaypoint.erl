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
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.media.audio.Sound
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGenerator
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo
% import org.allbinary.media.graphics.geography.pathfinding.PathGenerator
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('NoCacheWaypoint').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BuildingEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('WaypointBase', Function, Arguments).

init_fields(This) ->
    put({This, ownerLayer}, undefined),
    ok.


new(OwnerLayer, Sound) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, OwnerLayer, Sound),
    This.

init(This, OwnerLayer, Sound) ->
        'WaypointBase':init(This, Sound),
        init_fields(This),
        put({This, ownerLayer}, OwnerLayer).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        'WaypointBase':setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager).

releaseCachedPaths(This) ->
        ok.

% throws Exception
getPathsListFromCacheOnly(This, GeographicMapCellPosition) ->
        (fun(Target_N66677) -> (get({Target_N66677, '$class'})):getImmutableInstance(Target_N66677) end)('BasicArrayListUtil':getInstance()).

% throws Exception
getPathsListRunnable(This, GeographicMapCellPosition) ->
        (get({This, '$class'})):createPaths(This, GeographicMapCellPosition).

% throws Exception
getEndGeographicMapCellPosition(This, StartGeographicMapCellPosition) ->
        EndList = (get({get({This, ownerLayer}), '$class'})):getEndGeographicMapCellPositionList(get({This, ownerLayer})),
        put({local, endGeographicMapCellPosition}, (fun(Target_N66953) -> (get({Target_N66953, '$class'})):getRandom(Target_N66953, EndList) end)('BasicArrayListUtil':getInstance())),
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

% throws Exception
createPaths(This, StartGeographicMapCellPosition) ->
        try
        EndGeographicMapCellPosition = (get({This, '$class'})):getEndGeographicMapCellPosition(This, StartGeographicMapCellPosition),
        case (EndGeographicMapCellPosition =:= undefined) of
            true ->
            throw({'$return', (fun(Target_N67398) -> (get({Target_N67398, '$class'})):getImmutableInstance(Target_N67398) end)('BasicArrayListUtil':getInstance())});
            false -> ok
        end,
        case (StartGeographicMapCellPosition =:= EndGeographicMapCellPosition) of
            true ->
            case (get({get({This, ownerLayer}), '$class'})):shouldHandleStartSameAsEnd(get({This, ownerLayer})) of
                true ->
                throw({'$return', (fun(Target_N67536) -> (get({Target_N67536, '$class'})):getImmutableInstance(Target_N67536) end)('BasicArrayListUtil':getInstance())});
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
        PathFindingInfo = (fun(Target_N68112) -> (get({Target_N68112, '$class'})):getInstancePathFindingInfo(Target_N68112, RaceTrackGeographicMap, CustomMapArray) end)('PathFindingInfoFactory':getInstance()),
        List = (fun(Target_N68189) -> (get({Target_N68189, '$class'})):getInstanceNoCache(Target_N68189, GeographicMapInterface, PathFindingInfo, 2) end)('PathGenerator':getInstance()),
        case ((get({List, '$class'})):size(List) < 1) of
            true ->
            erlang:error({'Exception', "Path may have been cleared by clearing caching"});
            false -> ok
        end,
        List
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

% throws Exception
onBuildingEvent(This, Event) ->
        ok.

reset(This) ->
        (fun(Target_N68593) -> (get({Target_N68593, '$class'})):clear(Target_N68593) end)((get({This, '$class'})):getConnectedWaypointList(This)).

% throws Exception
visit(This, UnitLayer) ->
        try
        case (array:get(0, (get({UnitLayer, '$class'})):getGroupInterface(UnitLayer)) =/= array:get(0, (get({get({This, ownerLayer}), '$class'})):getGroupInterface(get({This, ownerLayer})))) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        Size = (fun(Target_N68741) -> (get({Target_N68741, '$class'})):size(Target_N68741) end)((get({This, '$class'})):getConnectedWaypointList(This)),
        case (Size > 0) of
            true ->
            UnitWaypointBehavior = (get({UnitLayer, '$class'})):getWaypointBehavior(UnitLayer),
            (fun Loop() -> case ((fun(Target_N69093) -> (get({Target_N69093, '$class'})):size(Target_N69093) end)((get({This, '$class'})):getConnectedWaypointList(This)) > 0) of true ->
                RtsLayer = (fun(Target_N68888) -> (get({Target_N68888, '$class'})):get(Target_N68888, 0) end)((get({This, '$class'})):getConnectedWaypointList(This)),
                case (get({RtsLayer, '$class'})):isDestroyed(RtsLayer) of
                    true ->
                    (fun(Target_N69053) -> (get({Target_N69053, '$class'})):remove(Target_N69053, RtsLayer) end)((get({This, '$class'})):getConnectedWaypointList(This));
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

