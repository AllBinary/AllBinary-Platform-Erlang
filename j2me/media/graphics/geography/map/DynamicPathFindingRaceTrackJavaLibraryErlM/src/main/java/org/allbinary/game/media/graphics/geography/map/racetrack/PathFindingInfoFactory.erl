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
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
% import org.allbinary.media.graphics.geography.map.racetrack.BasePathFindingInfoFactory
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackRoadsGeographicMapCellHistoryFactory
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactoryBase
% import org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapGraph
% import org.allbinary.media.graphics.geography.pathfinding.BasicGeographicMapPathFinder
% import org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorFactoryBase
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoFactory
% import org.allbinary.util.BasicArrayListS

-module('PathFindingInfoFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasePathFindingInfoFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, undefined),
    ok.

init_fields(This) ->
    put({This, 'MAX_DIRECTIONS'}, 4),
    put({This, pathFindingInfo}, undefined),
    put({This, basicGeographicMapGraph}, undefined),
    put({This, basicGeographicMapPathFinder}, undefined),
    put({This, pathFinderGraphVisitorFactoryInterface}, undefined),
    ok.


getInstance() ->
        get({'PathFindingInfoFactory', instance}).

initMax(Max) when is_integer(Max) ->
        put({'PathFindingInfoFactory', instance}, 'PathFindingInfoFactory':new('SimplePathFinderGraphVisitorFactory':new(1, 1, get({'Integer', 'MAX_VALUE'})), Max)).

new(PathFinderGraphVisitorFactoryInterface, Max) when is_integer(Max) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PathFinderGraphVisitorFactoryInterface, Max),
    This.

init(This, PathFinderGraphVisitorFactoryInterface, Max) when is_integer(Max) ->
    'BasePathFindingInfoFactory':init(This),
    init_fields(This),
        CommonStrings = 'CommonStrings':getInstance(),
        'PreLogUtil':put("Using Dynamic Path Finding", This, get({CommonStrings, 'GET_INSTANCE'})),
        put({This, basicGeographicMapPathFinder}, 'BasicGeographicMapPathFinder':new(Max)),
        put({This, pathFindingInfo}, 'PathFindingInfo':new('PathFindingNodeCostInfoFactory':new(Max), 'BasicArrayListS':new(1), 'BasicArrayListS':new(1))),
        put({This, basicGeographicMapGraph}, 'BasicGeographicMapGraph':new((get({get({This, pathFindingInfo}), '$class'})):getPathFindingNodeCostInfoFactoryInterface(get({This, pathFindingInfo})))),
        put({This, pathFinderGraphVisitorFactoryInterface}, PathFinderGraphVisitorFactoryInterface).

% throws Exception
getInstancePathFindingInfo(This, GeographicMapInterface, MapArray) when (is_tuple(MapArray) orelse MapArray =:= undefined) ->
        PathFindingInfo = 'PathFindingInfo':new((get({get({This, pathFindingInfo}), '$class'})):getPathFindingNodeCostInfoFactoryInterface(get({This, pathFindingInfo})), 'BasicArrayListS':new(1), 'BasicArrayListS':new(1)),
        (fun(Target_N67265) -> (get({Target_N67265, '$class'})):init(Target_N67265) end)('RaceTrackRoadsGeographicMapCellHistoryFactory':getInstance()),
        (get({This, '$class'})):init(This, GeographicMapInterface, PathFindingInfo, MapArray),
        (get({get({This, basicGeographicMapPathFinder}), '$class'})):init(get({This, basicGeographicMapPathFinder}), GeographicMapInterface, get({This, basicGeographicMapGraph}), (get({get({This, pathFinderGraphVisitorFactoryInterface}), '$class'})):getInstance(get({This, pathFinderGraphVisitorFactoryInterface}), GeographicMapInterface)),
        (get({PathFindingInfo, '$class'})):setPathFinder(PathFindingInfo, get({This, basicGeographicMapPathFinder})),
        PathFindingInfo.

% throws Exception
init(This, GeographicMapInterface, PathFindingInfo, MapArray) when (is_tuple(MapArray) orelse MapArray =:= undefined) ->
        'BasePathFindingInfoFactory':init(This, GeographicMapInterface, PathFindingInfo, MapArray),
        (get({This, '$class'})):buildPathFindingNodes(This, GeographicMapInterface, PathFindingInfo, MapArray).

% throws Exception
buildPathFindingNodesForCellPosition(This, GeographicMapInterface, PathFindingInfo, MapArray, CellPosition) when (is_tuple(MapArray) orelse MapArray =:= undefined) ->
        GeographicMapCellPositionFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface),
        CellTypeId = array:get((get({CellPosition, '$class'})):getColumn(CellPosition), array:get((get({CellPosition, '$class'})):getRow(CellPosition), MapArray)),
        GeographicMapCellType = (fun(Target_N67917) -> (get({Target_N67917, '$class'})):get(Target_N67917, (get({GeographicMapInterface, '$class'})):getCellTypeFromMapCellTypeInt(GeographicMapInterface, CellTypeId)) end)('GeographicMapCellTypeFactory':getInstance()),
        RaceTrackGeographicMapCellType = GeographicMapCellType,
        AllBinaryTiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        PathFindingNodeCostInfoFactoryInterface = (get({PathFindingInfo, '$class'})):getPathFindingNodeCostInfoFactoryInterface(PathFindingInfo),
        BasicGeographicMapUtil = 'BasicGeographicMapUtil':getInstance(),
        put({local, row}, 0),
        put({local, column}, 0),
        put({local, goingToGeographicMapCellPosition}, undefined),
        put({local, costFromStart}, 0),
        put({local, costToEnd}, 0),
        lists:foreach(fun(Index) ->
            put({local, row}, (get({BasicGeographicMapUtil, '$class'})):getBorderingRow(BasicGeographicMapUtil, Index, CellPosition)),
            put({local, column}, (get({BasicGeographicMapUtil, '$class'})):getBorderingColumn(BasicGeographicMapUtil, Index, CellPosition)),
            case ((((get({local, row}) < (get({AllBinaryTiledLayer, '$class'})):getRows(AllBinaryTiledLayer)) andalso (get({local, column}) < (get({AllBinaryTiledLayer, '$class'})):getColumns(AllBinaryTiledLayer))) andalso (get({local, row}) >= 0)) andalso (get({local, column}) >= 0)) of
                true ->
                put({local, goingToGeographicMapCellPosition}, (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, get({local, column}), get({local, row}))),
                put({local, costFromStart}, (get({RaceTrackGeographicMapCellType, '$class'})):getTravelCost(RaceTrackGeographicMapCellType)),
                put({local, costToEnd}, get({local, costFromStart})),
                (get({PathFindingNodeCostInfoFactoryInterface, '$class'})):create(PathFindingNodeCostInfoFactoryInterface, GeographicMapInterface, get({local, goingToGeographicMapCellPosition}), CellPosition, get({local, costFromStart}), get({local, costToEnd}));
                false -> ok
            end
        end, lists:seq(0, get({This, 'MAX_DIRECTIONS'}) - 1)).

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

