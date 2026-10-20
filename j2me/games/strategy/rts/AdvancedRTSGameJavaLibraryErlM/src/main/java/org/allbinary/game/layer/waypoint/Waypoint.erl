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
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.layer.RTSLayerEvent
% import org.allbinary.game.layer.building.event.BuildingEventListenerInterface
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.game.layer.unit.UnitWaypointBehavior
% import org.allbinary.game.media.graphics.geography.map.racetrack.PathFindingInfoFactory
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.media.audio.Sound
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
% import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGenerator
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap
% import org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapExtractedPathsCacheFactory
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo
% import org.allbinary.media.graphics.geography.pathfinding.PathGenerator
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('Waypoint').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BuildingEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('WaypointBase', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    put({This, ownerLayer}, undefined),
    put({This, endList}, (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))),
    put({This, paths}, get({get({This, basicArrayListUtil}), 'NULL_ARRAY_OF_ARRAY'})),
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
        'WaypointBase':setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager),
        GeographicMapCompositeInterface = AllBinaryGameLayerManager,
        GeographicMapInterface = array:get(0, (get({GeographicMapCompositeInterface, '$class'})):getGeographicMapInterface(GeographicMapCompositeInterface)),
        TiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        case (get({This, paths}) =/= get({get({This, basicArrayListUtil}), 'NULL_ARRAY_OF_ARRAY'})) of
            true ->
            erlang:error({'RuntimeException'});
            false -> ok
        end,
        put({This, endList}, (get({get({This, ownerLayer}), '$class'})):getEndGeographicMapCellPositionList(get({This, ownerLayer}))),
        put({This, paths}, array:new((get({TiledLayer, '$class'})):getColumns(TiledLayer), {default, array:new((get({TiledLayer, '$class'})):getRows(TiledLayer), {default, undefined})})),
        (get({This, '$class'})):clearPaths(This).

releaseCachedPaths(This) ->
        put({local, columnIndex}, array:size(get({This, paths}))),
        (fun Loop() -> case (begin put({local, columnIndex}, get({local, columnIndex}) - 1), get({local, columnIndex}) end >= 0) of true ->
            put({local, rowIndex}, array:size(get({This, paths}))),
            (fun Loop() -> case (begin put({local, rowIndex}, get({local, rowIndex}) - 1), get({local, rowIndex}) end >= 0) of true ->
                PathsList = array:get(get({local, rowIndex}), array:get(get({local, columnIndex}), get({This, paths}))),
                case (PathsList =/= (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))) of
                    true ->
                    (fun(Target_N67447) -> (get({Target_N67447, '$class'})):release(Target_N67447, PathsList) end)('BasicGeographicMapExtractedPathsCacheFactory':getInstance());
                    false -> ok
                end,
                Loop();
            false -> ok end end)(),
            Loop();
        false -> ok end end)().

% throws Exception
getPathsListFromCacheOnly(This, GeographicMapCellPosition) ->
        array:get((get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition), array:get((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition), get({This, paths}))).

% throws Exception
getPathsListRunnable(This, GeographicMapCellPosition) ->
        put({local, pathsList}, array:get((get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition), array:get((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition), get({This, paths})))),
        case (get({local, pathsList}) =:= (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))) of
            true ->
            put({local, pathsList}, (get({This, '$class'})):createPaths(This, GeographicMapCellPosition)),
            put({This, paths}, array:set((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition), array:set((get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition), get({local, pathsList}), array:get((get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition), get({This, paths}))), get({This, paths})));
            false -> ok
        end,
        get({local, pathsList}).

getEndGeographicMapCellPosition(This, StartGeographicMapCellPosition) ->
        put({local, endGeographicMapCellPosition}, (get({get({This, basicArrayListUtil}), '$class'})):getRandom(get({This, basicArrayListUtil}), get({This, endList}))),
        case (StartGeographicMapCellPosition =:= get({local, endGeographicMapCellPosition})) of
            true ->
            lists:foreach(fun(Index) ->
                put({local, endGeographicMapCellPosition}, (get({get({This, endList}), '$class'})):get(get({This, endList}), Index)),
                case (StartGeographicMapCellPosition =/= get({local, endGeographicMapCellPosition})) of
                    true ->
                    throw('$break');
                    false -> ok
                end
            end, lists:seq(((get({get({This, endList}), '$class'})):size(get({This, endList})) - 1), 0, -1));
            false -> ok
        end,
        get({local, endGeographicMapCellPosition}).

% throws Exception
createPaths(This, StartGeographicMapCellPosition) ->
        try
        case ((get({get({This, endList}), '$class'})):size(get({This, endList})) =:= 0) of
            true ->
            throw({'$return', (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))});
            false -> ok
        end,
        EndGeographicMapCellPosition = (get({This, '$class'})):getEndGeographicMapCellPosition(This, StartGeographicMapCellPosition),
        case (EndGeographicMapCellPosition =:= undefined) of
            true ->
            throw({'$return', (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))});
            false -> ok
        end,
        case (StartGeographicMapCellPosition =:= EndGeographicMapCellPosition) of
            true ->
            case (get({get({This, ownerLayer}), '$class'})):shouldHandleStartSameAsEnd(get({This, ownerLayer})) of
                true ->
                throw({'$return', (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))});
                false ->
                erlang:error({'Exception', lists:concat(["Start should not be End: ", (get({get({This, endList}), '$class'})):size(get({This, endList}))])})
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
        PathFindingInfo = (fun(Target_N69317) -> (get({Target_N69317, '$class'})):getInstancePathFindingInfo(Target_N69317, RaceTrackGeographicMap, CustomMapArray) end)('PathFindingInfoFactory':getInstance()),
        List = (fun(Target_N69394) -> (get({Target_N69394, '$class'})):getInstanceNoCache(Target_N69394, GeographicMapInterface, PathFindingInfo, 2) end)('PathGenerator':getInstance()),
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
        (get({This, '$class'})):clearPaths(This).

clearPaths(This) ->
        put({local, columnIndex}, array:size(get({This, paths}))),
        (fun Loop() -> case (begin put({local, columnIndex}, get({local, columnIndex}) - 1), get({local, columnIndex}) end >= 0) of true ->
            put({local, rowIndex}, array:size(get({This, paths}))),
            (fun Loop() -> case (begin put({local, rowIndex}, get({local, rowIndex}) - 1), get({local, rowIndex}) end >= 0) of true ->
                put({This, paths}, array:set(get({local, columnIndex}), array:set(get({local, rowIndex}), (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil})), array:get(get({local, columnIndex}), get({This, paths}))), get({This, paths}))),
                Loop();
            false -> ok end end)(),
            Loop();
        false -> ok end end)().

reset(This) ->
        (fun(Target_N70057) -> (get({Target_N70057, '$class'})):clear(Target_N70057) end)((get({This, '$class'})):getConnectedWaypointList(This)),
        (get({This, '$class'})):releaseCachedPaths(This).

% throws Exception
visit(This, UnitLayer) ->
        try
        case (array:get(0, (get({UnitLayer, '$class'})):getGroupInterface(UnitLayer)) =/= array:get(0, (get({get({This, ownerLayer}), '$class'})):getGroupInterface(get({This, ownerLayer})))) of
            true ->
            throw({'$return', ok});
            false -> ok
        end,
        Size = (fun(Target_N70220) -> (get({Target_N70220, '$class'})):size(Target_N70220) end)((get({This, '$class'})):getConnectedWaypointList(This)),
        case (Size > 0) of
            true ->
            UnitWaypointBehavior = (get({UnitLayer, '$class'})):getWaypointBehavior(UnitLayer),
            (fun Loop() -> case ((fun(Target_N70572) -> (get({Target_N70572, '$class'})):size(Target_N70572) end)((get({This, '$class'})):getConnectedWaypointList(This)) > 0) of true ->
                RtsLayer = (fun(Target_N70367) -> (get({Target_N70367, '$class'})):get(Target_N70367, 0) end)((get({This, '$class'})):getConnectedWaypointList(This)),
                case (get({RtsLayer, '$class'})):isDestroyed(RtsLayer) of
                    true ->
                    (fun(Target_N70532) -> (get({Target_N70532, '$class'})):remove(Target_N70532, RtsLayer) end)((get({This, '$class'})):getConnectedWaypointList(This));
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

