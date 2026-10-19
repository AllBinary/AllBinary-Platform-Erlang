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
% package org.allbinary.game.media.graphics.geography.map.racetrack
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory
% import org.allbinary.media.graphics.geography.pathfinding.PathFinder
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactory
% import org.allbinary.util.BasicArrayListS

-module('PathFindingInfoFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasePathFindingInfoFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'PathFindingInfoFactory':new()),
    put({?MODULE, 'MAX'}, 32768),
    ok.

init_fields(This) ->
    put({This, pathFindingInfo}, undefined),
    put({This, pathFinder}, undefined),
    ok.


getInstance() ->
        get({'PathFindingInfoFactory', instance}).

initMax(Max) when is_integer(Max) ->
        put({'PathFindingInfoFactory', 'MAX'}, Max).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'BasePathFindingInfoFactory':init(This),
    init_fields(This),
        put({This, pathFindingInfo}, 'PathFindingInfo':new('PathFindingNodeCostInfoFactory':new(get({'PathFindingInfoFactory', 'MAX'})), 'BasicArrayListS':new(1), 'BasicArrayListS':new(1))),
        put({This, pathFinder}, 'PathFinder':new()).

% throws Exception
getInstancePathFindingInfo(This, GeographicMapInterface, MapArray) when (is_tuple(MapArray) orelse MapArray =:= undefined) ->
        PathFindingInfo = 'PathFindingInfo':new((get({get({This, pathFindingInfo}), '$class'})):getPathFindingNodeCostInfoFactoryInterface(get({This, pathFindingInfo})), 'BasicArrayListS':new(1), 'BasicArrayListS':new(1)),
        (fun(Target_N66582) -> (get({Target_N66582, '$class'})):init(Target_N66582) end)('RaceTrackRoadsGeographicMapCellHistoryFactory':getInstance()),
        (get({This, '$class'})):init(This, GeographicMapInterface, PathFindingInfo, MapArray),
        (get({get({This, pathFinder}), '$class'})):init(get({This, pathFinder}), GeographicMapInterface),
        (get({PathFindingInfo, '$class'})):setPathFinder(PathFindingInfo, get({This, pathFinder})),
        PathFindingInfo.

% throws Exception
init(This, GeographicMapInterface, PathFindingInfo, MapArray) when (is_tuple(MapArray) orelse MapArray =:= undefined) ->
        'BasePathFindingInfoFactory':init(This, GeographicMapInterface, PathFindingInfo, MapArray),
        (get({This, '$class'})):buildPathFindingNodes(This, GeographicMapInterface, PathFindingInfo, MapArray).

% throws Exception
buildPathFindingNodesForCellPosition(This, GeographicMapInterface, PathFindingInfo, MapArray, CellPosition) when (is_tuple(MapArray) orelse MapArray =:= undefined) ->
        ok.

% throws Exception
buildPathFindingNodes(This, GeographicMapInterface, PathFindingInfo, MapArray) when (is_tuple(MapArray) orelse MapArray =:= undefined) ->
        GeographicMapCellPositionFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface),
        AllBinaryTiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        TotalColumns = (get({AllBinaryTiledLayer, '$class'})):getColumns(AllBinaryTiledLayer),
        TotalRows = (get({AllBinaryTiledLayer, '$class'})):getRows(AllBinaryTiledLayer),
        lists:foreach(fun(Column) ->
            lists:foreach(fun(Row) ->
                (get({This, '$class'})):buildPathFindingNodesForCellPosition(This, GeographicMapInterface, PathFindingInfo, MapArray, (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, Column, Row))
            end, lists:seq(0, TotalRows - 1))
        end, lists:seq(0, TotalColumns - 1)).

