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
% package org.allbinary.media.graphics.geography.pathfinding
% import java.util.HashSet
% import java.util.PriorityQueue
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.MathUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.util.BasicArrayListUtil

-module('PathFinder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GeographicPathFinderBase', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicArrayListUtil}, 'BasicArrayListUtil':getInstance()),
    put({This, mathUtil}, 'MathUtil':getInstance()),
    put({This, openPriorityQueue}, 'PriorityQueue':new()),
    put({This, closedSet}, 'HashSet':new()),
    put({This, geographicMapInterface}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({This, costArray}, get({'PathFindingNodeCost', 'NULL_PATH_FINDING_NODE_COST_ARRAY_ARRAY'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'GeographicPathFinderBase':'$init'(This),
    init_fields(This).


% throws Exception
init(This, GeographicMapInterface) ->
        put({This, geographicMapInterface}, GeographicMapInterface),
        TiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        put({This, costArray}, array:new((get({TiledLayer, '$class'})):getColumns(TiledLayer), {default, array:new((get({TiledLayer, '$class'})):getRows(TiledLayer), {default, undefined})})),
        BasicGeographicMapCellPositionFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface),
        put({local, node}, undefined),
        SizeX = array:size(get({This, costArray})),
        SizeY = array:size(array:get(0, get({This, costArray}))),
        lists:foreach(fun(Column) ->
            lists:foreach(fun(Row) ->
                GeographicMapCellType = (get({GeographicMapInterface, '$class'})):getCellTypeAt(GeographicMapInterface, (get({BasicGeographicMapCellPositionFactory, '$class'})):getAt(BasicGeographicMapCellPositionFactory, Column, Row)),
                RaceTrackGeographicMapCellType = GeographicMapCellType,
                put({local, node}, 'PathFindingNodeCost':new(get({'NullUtil':getInstance(), 'NULL_OBJECT'}), (get({BasicGeographicMapCellPositionFactory, '$class'})):getAt(BasicGeographicMapCellPositionFactory, Column, Row), 'PathFindingNodeCostInfo':new(trunc((get({RaceTrackGeographicMapCellType, '$class'})):getTravelCost(RaceTrackGeographicMapCellType)), (-1)))),
                put({This, costArray}, array:set(Column, array:set(Row, get({local, node}), array:get(Column, get({This, costArray}))), get({This, costArray})))
            end, lists:seq(0, SizeY - 1))
        end, lists:seq(0, SizeX - 1)).

searchTotalPath(This, StartPathFindingNodeList, EndPathFindingNodeList, TotalPaths) when is_integer(TotalPaths) ->
        try
            (get({This, '$class'})):search(This, (get({StartPathFindingNodeList, '$class'})):get(StartPathFindingNodeList, 0), (get({EndPathFindingNodeList, '$class'})):get(EndPathFindingNodeList, 0))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "search", E),
            (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))
        end.

% throws Exception
searchTotalPathN(This, StartPathFindingNodeList, EndPathFindingNodeList, TotalPaths, MultipassState) when is_integer(TotalPaths) ->
        try
        case (get({MultipassState, step}) =:= 0) of
            true ->
            put({MultipassState, step}, get({MultipassState, step}) + 1);
            false ->
            case (get({MultipassState, step}) =:= 1) of
            true ->
            (get({This, '$class'})):searchStart(This, (get({StartPathFindingNodeList, '$class'})):get(StartPathFindingNodeList, 0), (get({EndPathFindingNodeList, '$class'})):get(EndPathFindingNodeList, 0), MultipassState);
            false ->
            case (get({MultipassState, step}) =:= 2) of
            true ->
            throw({'$return', (get({This, '$class'})):searchN(This, (get({StartPathFindingNodeList, '$class'})):get(StartPathFindingNodeList, 0), (get({EndPathFindingNodeList, '$class'})):get(EndPathFindingNodeList, 0), MultipassState)});
            false -> ok
        end
        end
        end,
        (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
search(This, StartPathFindingNode, EndPathFindingNode) ->
        List = (get({This, '$class'})):findPath(This, get({StartPathFindingNode, geographicMapCellPosition}), get({EndPathFindingNode, geographicMapCellPosition})),
        PathList = 'BasicArrayListD':new(),
        (get({PathList, '$class'})):add(PathList, List),
        PathList.

% throws Exception
searchStart(This, StartPathFindingNode, EndPathFindingNode, MultipassState) ->
        (get({This, '$class'})):findPathStart(This, get({StartPathFindingNode, geographicMapCellPosition}), get({EndPathFindingNode, geographicMapCellPosition}), MultipassState).

% throws Exception
searchN(This, StartPathFindingNode, EndPathFindingNode, MultipassState) ->
        try
        List = (get({This, '$class'})):findPathEnd(This, get({StartPathFindingNode, geographicMapCellPosition}), get({EndPathFindingNode, geographicMapCellPosition}), MultipassState),
        case (List =:= undefined) of
            true ->
            throw({'$return', (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))});
            false -> ok
        end,
        PathList = 'BasicArrayListD':new(),
        (get({PathList, '$class'})):add(PathList, List),
        put({MultipassState, iteration}, 0),
        put({MultipassState, step}, 0),
        PathList
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
findPath(This, Start, Target) ->
        try
        (get({get({This, openPriorityQueue}), '$class'})):clear(get({This, openPriorityQueue})),
        (get({get({This, closedSet}), '$class'})):clear(get({This, closedSet})),
        put({local, discoveryCalculation}, 0),
        put({local, node}, undefined),
        TargetColumn = (get({Target, '$class'})):getColumn(Target),
        TargetRow = (get({Target, '$class'})):getRow(Target),
        SizeX = array:size(get({This, costArray})),
        SizeY = array:size(array:get(0, get({This, costArray}))),
        lists:foreach(fun(Column) ->
            lists:foreach(fun(Row) ->
                put({local, discoveryCalculation}, (trunc((get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (Column - TargetColumn))) + (get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (Row - TargetRow)))),
                put({local, node}, array:get(Row, array:get(Column, get({This, costArray})))),
                put({get({get({local, node}), pathFindingNodeCostInfoP}), totalCostP}, 0),
                put({get({get({local, node}), pathFindingNodeCostInfoP}), costToEndP}, get({local, discoveryCalculation}))
            end, lists:seq(0, SizeY - 1))
        end, lists:seq(0, SizeX - 1)),
        StartNode = array:get((get({Start, '$class'})):getRow(Start), array:get((get({Start, '$class'})):getColumn(Start), get({This, costArray}))),
        (get({get({This, openPriorityQueue}), '$class'})):add(get({This, openPriorityQueue}), StartNode),
        GeographicMapInterface = get({This, geographicMapInterface}),
        BasicGeographicMapCellPositionFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface),
        AllBinaryTiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        TargetNode = array:get((get({Target, '$class'})):getRow(Target), array:get((get({Target, '$class'})):getColumn(Target), get({This, costArray}))),
        put({local, current}, undefined),
        (fun Loop() ->
            put({local, current}, (get({get({This, openPriorityQueue}), '$class'})):poll(get({This, openPriorityQueue}))),
            (get({get({This, closedSet}), '$class'})):add(get({This, closedSet}), get({local, current})),
            case (get({get({local, current}), '$class'})):equals(get({local, current}), TargetNode) of
                true ->
                throw({'$return', (get({This, '$class'})):extractPath(This, Start, get({local, current}))});
                false -> ok
            end,
            put({local, neighbor}, undefined),
            put({local, neighborInfo}, undefined),
            put({local, calculatedCost}, 0),
            lists:foreach(fun(Column) ->
                lists:foreach(fun(Row) ->
                    try
                    case (((((Column > 0) andalso (Row > 0)) andalso (Column < (get({AllBinaryTiledLayer, '$class'})):getColumns(AllBinaryTiledLayer))) andalso (Row < (get({AllBinaryTiledLayer, '$class'})):getRows(AllBinaryTiledLayer))) andalso (get({GeographicMapInterface, '$class'})):isOnMap(GeographicMapInterface, (get({BasicGeographicMapCellPositionFactory, '$class'})):getAt(BasicGeographicMapCellPositionFactory, Column, Row))) of
                        true ->
                        put({local, neighbor}, array:get(Row, array:get(Column, get({This, costArray})))),
                        case (get({get({This, closedSet}), '$class'})):contains(get({This, closedSet}), get({local, neighbor})) of
                            true ->
                            throw('$continue');
                            false -> ok
                        end,
                        put({local, neighborInfo}, get({get({local, neighbor}), pathFindingNodeCostInfoP})),
                        put({local, calculatedCost}, ((get({get({local, neighborInfo}), costToEndP}) + get({get({local, neighborInfo}), costFromStartP})) + get({get({get({local, current}), pathFindingNodeCostInfoP}), totalCostP}))),
                        case ((get({local, calculatedCost}) < get({get({local, neighborInfo}), totalCostP})) orelse (not (get({get({This, openPriorityQueue}), '$class'})):contains(get({This, openPriorityQueue}), get({local, neighbor})))) of
                            true ->
                            put({get({local, neighborInfo}), totalCostP}, get({local, calculatedCost})),
                            put({get({local, neighbor}), parent}, get({local, current})),
                            case (not (get({get({This, openPriorityQueue}), '$class'})):contains(get({This, openPriorityQueue}), get({local, neighbor}))) of
                                true ->
                                case (get({GeographicMapInterface, '$class'})):isOfFourDirections(GeographicMapInterface, get({get({local, current}), geographicMapCellPosition}), get({get({local, neighbor}), geographicMapCellPosition})) of
                                    true ->
                                    (get({get({This, openPriorityQueue}), '$class'})):add(get({This, openPriorityQueue}), get({local, neighbor}));
                                    false -> ok
                                end;
                                false -> ok
                            end;
                            false -> ok
                        end;
                        false -> ok
                    end
                    catch throw:'$continue' -> ok end
                end, lists:seq(((get({get({get({local, current}), geographicMapCellPosition}), '$class'})):getRow(get({get({local, current}), geographicMapCellPosition})) - 1), ((get({get({get({local, current}), geographicMapCellPosition}), '$class'})):getRow(get({get({local, current}), geographicMapCellPosition})) + 2) - 1))
            end, lists:seq(((get({get({get({local, current}), geographicMapCellPosition}), '$class'})):getColumn(get({get({local, current}), geographicMapCellPosition})) - 1), ((get({get({get({local, current}), geographicMapCellPosition}), '$class'})):getColumn(get({get({local, current}), geographicMapCellPosition})) + 2) - 1)),
            case (not (get({get({This, openPriorityQueue}), '$class'})):isEmpty(get({This, openPriorityQueue}))) of true -> Loop(); false -> ok end
        end)(),
        erlang:error({'RuntimeException'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
findPathStart(This, Start, Target, MultipassState) ->
        (get({get({This, openPriorityQueue}), '$class'})):clear(get({This, openPriorityQueue})),
        (get({get({This, closedSet}), '$class'})):clear(get({This, closedSet})),
        put({local, discoveryCalculation}, 0),
        put({local, node}, undefined),
        TargetColumn = (get({Target, '$class'})):getColumn(Target),
        TargetRow = (get({Target, '$class'})):getRow(Target),
        SizeX = array:size(get({This, costArray})),
        SizeY = array:size(array:get(0, get({This, costArray}))),
        lists:foreach(fun(Column) ->
            lists:foreach(fun(Row) ->
                put({local, discoveryCalculation}, (trunc((get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (Column - TargetColumn))) + (get({get({This, mathUtil}), '$class'})):abs(get({This, mathUtil}), (Row - TargetRow)))),
                put({local, node}, array:get(Row, array:get(Column, get({This, costArray})))),
                put({get({get({local, node}), pathFindingNodeCostInfoP}), totalCostP}, 0),
                put({get({get({local, node}), pathFindingNodeCostInfoP}), costToEndP}, get({local, discoveryCalculation}))
            end, lists:seq(0, SizeY - 1))
        end, lists:seq(0, SizeX - 1)),
        StartNode = array:get((get({Start, '$class'})):getRow(Start), array:get((get({Start, '$class'})):getColumn(Start), get({This, costArray}))),
        (get({get({This, openPriorityQueue}), '$class'})):add(get({This, openPriorityQueue}), StartNode),
        put({MultipassState, step}, get({MultipassState, step}) + 1).

% throws Exception
findPathEnd(This, Start, Target, MultipassState) ->
        try
        GeographicMapInterface = get({This, geographicMapInterface}),
        BasicGeographicMapCellPositionFactory = (get({GeographicMapInterface, '$class'})):getGeographicMapCellPositionFactory(GeographicMapInterface),
        AllBinaryTiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        TargetNode = array:get((get({Target, '$class'})):getRow(Target), array:get((get({Target, '$class'})):getColumn(Target), get({This, costArray}))),
        put({local, current}, undefined),
        put({local, total}, 0),
        (fun Loop() ->
            put({local, current}, (get({get({This, openPriorityQueue}), '$class'})):poll(get({This, openPriorityQueue}))),
            (get({get({This, closedSet}), '$class'})):add(get({This, closedSet}), get({local, current})),
            case (get({get({local, current}), '$class'})):equals(get({local, current}), TargetNode) of
                true ->
                throw({'$return', (get({This, '$class'})):extractPath(This, Start, get({local, current}))});
                false -> ok
            end,
            put({local, neighbor}, undefined),
            put({local, neighborInfo}, undefined),
            put({local, calculatedCost}, 0),
            lists:foreach(fun(Column) ->
                lists:foreach(fun(Row) ->
                    try
                    case (((((Column > 0) andalso (Row > 0)) andalso (Column < (get({AllBinaryTiledLayer, '$class'})):getColumns(AllBinaryTiledLayer))) andalso (Row < (get({AllBinaryTiledLayer, '$class'})):getRows(AllBinaryTiledLayer))) andalso (get({GeographicMapInterface, '$class'})):isOnMap(GeographicMapInterface, (get({BasicGeographicMapCellPositionFactory, '$class'})):getAt(BasicGeographicMapCellPositionFactory, Column, Row))) of
                        true ->
                        put({local, neighbor}, array:get(Row, array:get(Column, get({This, costArray})))),
                        case (get({get({This, closedSet}), '$class'})):contains(get({This, closedSet}), get({local, neighbor})) of
                            true ->
                            throw('$continue');
                            false -> ok
                        end,
                        put({local, neighborInfo}, get({get({local, neighbor}), pathFindingNodeCostInfoP})),
                        put({local, calculatedCost}, ((get({get({local, neighborInfo}), costToEndP}) + get({get({local, neighborInfo}), costFromStartP})) + get({get({get({local, current}), pathFindingNodeCostInfoP}), totalCostP}))),
                        case ((get({local, calculatedCost}) < get({get({local, neighborInfo}), totalCostP})) orelse (not (get({get({This, openPriorityQueue}), '$class'})):contains(get({This, openPriorityQueue}), get({local, neighbor})))) of
                            true ->
                            put({get({local, neighborInfo}), totalCostP}, get({local, calculatedCost})),
                            put({get({local, neighbor}), parent}, get({local, current})),
                            case (not (get({get({This, openPriorityQueue}), '$class'})):contains(get({This, openPriorityQueue}), get({local, neighbor}))) of
                                true ->
                                case (get({GeographicMapInterface, '$class'})):isOfFourDirections(GeographicMapInterface, get({get({local, current}), geographicMapCellPosition}), get({get({local, neighbor}), geographicMapCellPosition})) of
                                    true ->
                                    (get({get({This, openPriorityQueue}), '$class'})):add(get({This, openPriorityQueue}), get({local, neighbor}));
                                    false -> ok
                                end;
                                false -> ok
                            end;
                            false -> ok
                        end;
                        false -> ok
                    end
                    catch throw:'$continue' -> ok end
                end, lists:seq(((get({get({get({local, current}), geographicMapCellPosition}), '$class'})):getRow(get({get({local, current}), geographicMapCellPosition})) - 1), ((get({get({get({local, current}), geographicMapCellPosition}), '$class'})):getRow(get({get({local, current}), geographicMapCellPosition})) + 2) - 1))
            end, lists:seq(((get({get({get({local, current}), geographicMapCellPosition}), '$class'})):getColumn(get({get({local, current}), geographicMapCellPosition})) - 1), ((get({get({get({local, current}), geographicMapCellPosition}), '$class'})):getColumn(get({get({local, current}), geographicMapCellPosition})) + 2) - 1)),
            put({local, total}, get({local, total}) + 1),
            case (get({local, total}) > 10) of
                true ->
                throw({'$return', (get({get({This, basicArrayListUtil}), '$class'})):getImmutableInstance(get({This, basicArrayListUtil}))});
                false -> ok
            end,
            case (not (get({get({This, openPriorityQueue}), '$class'})):isEmpty(get({This, openPriorityQueue}))) of true -> Loop(); false -> ok end
        end)(),
        erlang:error({'RuntimeException'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

extractPath(This, Start, Current) ->
        put({local, current}, Current),
        Path = 'BasicArrayListD':new(),
        (fun Loop() -> case (get({get({local, current}), parent}) =/= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of true ->
            (get({Path, '$class'})):add(Path, get({get({local, current}), geographicMapCellPosition})),
            put({local, current}, get({get({local, current}), parent})),
            Loop();
        false -> ok end end)(),
        (get({Path, '$class'})):add(Path, Start),
        (get({get({This, basicArrayListUtil}), '$class'})):reverse(get({This, basicArrayListUtil}), Path),
        Path.

