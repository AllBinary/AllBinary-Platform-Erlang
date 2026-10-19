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
% import org.jgrapht.GraphPath
% import org.jgrapht.graph.DefaultWeightedEdge
% import org.jgrapht.graph.SimpleWeightedGraph
% import org.allbinary.util.BasicArrayList
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.graphics.CellPosition
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingNode

-module('PathFinderGraphHackVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasePathFinderGraphVisitor', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight) when is_integer(EdgeMinimum), is_integer(MinPathWeight), is_integer(MaxPathWeight) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight),
    This.

init(This, GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight) when is_integer(EdgeMinimum), is_integer(MinPathWeight), is_integer(MaxPathWeight) ->
        'BasePathFinderGraphVisitor':init(This, GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight),
        init_fields(This).

% throws Exception
visit(This, Graph, StartPathFindingNodeList, EndPathFindingNodeList) ->
        (get({This, '$class'})):fixStart(This, Graph, StartPathFindingNodeList),
        (get({This, '$class'})):fixEnd(This, Graph, EndPathFindingNodeList),
        (get({This, '$class'})):fixOverPassEdges(This, Graph).

% throws Exception
fixStart(This, Graph, StartPathFindingNodeList) ->
        GeographicMapCellPositionFactory = (get({get({This, geographicMapInterface}), '$class'})):getGeographicMapCellPositionFactory(get({This, geographicMapInterface})),
        TiledLayer = (get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface})),
        lists:foreach(fun(Index) ->
            StartPathFindingNode = (get({StartPathFindingNodeList, '$class'})):get(StartPathFindingNodeList, Index),
            GeographicMapCellPosition = get({StartPathFindingNode, geographicMapCellPosition}),
            Column = (get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition),
            Row = (get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition),
            NextRow = (Row + 1),
            case (get({TiledLayer, '$class'})):isOnTileLayer(TiledLayer, Column, NextRow) of
                true ->
                GeographicMapCellPositionNeighbor = (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, Column, NextRow),
                (get({Graph, '$class'})):removeEdge(Graph, GeographicMapCellPosition, GeographicMapCellPositionNeighbor);
                false -> ok
            end
        end, lists:seq(((get({StartPathFindingNodeList, '$class'})):size(StartPathFindingNodeList) - 1), 0, -1)).

% throws Exception
fixEnd(This, Graph, EndPathFindingNodeList) ->
        GeographicMapCellPositionFactory = (get({get({This, geographicMapInterface}), '$class'})):getGeographicMapCellPositionFactory(get({This, geographicMapInterface})),
        TiledLayer = (get({get({This, geographicMapInterface}), '$class'})):getAllBinaryTiledLayer(get({This, geographicMapInterface})),
        lists:foreach(fun(Index) ->
            EndPathFindingNode = (get({EndPathFindingNodeList, '$class'})):get(EndPathFindingNodeList, Index),
            GeographicMapCellPosition = get({EndPathFindingNode, geographicMapCellPosition}),
            (get({Graph, '$class'})):addVertex(Graph, GeographicMapCellPosition),
            Column = (get({GeographicMapCellPosition, '$class'})):getColumn(GeographicMapCellPosition),
            Row = (get({GeographicMapCellPosition, '$class'})):getRow(GeographicMapCellPosition),
            NextRow = (Row + 1),
            case (get({TiledLayer, '$class'})):isOnTileLayer(TiledLayer, Column, NextRow) of
                true ->
                GeographicMapCellPositionNeighbor = (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, Column, NextRow),
                (get({Graph, '$class'})):addEdge(Graph, GeographicMapCellPosition, GeographicMapCellPositionNeighbor);
                false -> ok
            end
        end, lists:seq(((get({EndPathFindingNodeList, '$class'})):size(EndPathFindingNodeList) - 1), 0, -1)).

% throws Exception
fixOverPassEdges(This, Graph) ->
        GeographicMapCellPositionFactory = (get({get({This, geographicMapInterface}), '$class'})):getGeographicMapCellPositionFactory(get({This, geographicMapInterface})),
        RaceTrackGeographicMap = get({This, geographicMapInterface}),
        CellPositionArray = (fun(Target_N67908) -> (get({Target_N67908, '$class'})):getOverPassGeographicMapCellPositionArray(Target_N67908) end)((get({RaceTrackGeographicMap, '$class'})):getRaceTrackData(RaceTrackGeographicMap)),
        lists:foreach(fun(Index) ->
            OverPassGeographicMapCellPosition = array:get(Index, CellPositionArray),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Fixing Over Pass: ", (get({OverPassGeographicMapCellPosition, '$class'})):getColumn(OverPassGeographicMapCellPosition)]), ", "]), (get({OverPassGeographicMapCellPosition, '$class'})):getRow(OverPassGeographicMapCellPosition)]), This, "fixOverPassEdges"),
            UnderPassGeographicMapCellPosition = (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, (get({OverPassGeographicMapCellPosition, '$class'})):getColumn(OverPassGeographicMapCellPosition), (get({OverPassGeographicMapCellPosition, '$class'})):getRow(OverPassGeographicMapCellPosition)),
            RightUnderPassGeographicMapCellPosition = (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, ((get({OverPassGeographicMapCellPosition, '$class'})):getColumn(OverPassGeographicMapCellPosition) + 1), (get({OverPassGeographicMapCellPosition, '$class'})):getRow(OverPassGeographicMapCellPosition)),
            LeftUnderPassGeographicMapCellPosition = (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, ((get({OverPassGeographicMapCellPosition, '$class'})):getColumn(OverPassGeographicMapCellPosition) - 1), (get({OverPassGeographicMapCellPosition, '$class'})):getRow(OverPassGeographicMapCellPosition)),
            (get({Graph, '$class'})):removeEdge(Graph, UnderPassGeographicMapCellPosition, RightUnderPassGeographicMapCellPosition),
            (get({Graph, '$class'})):removeEdge(Graph, UnderPassGeographicMapCellPosition, LeftUnderPassGeographicMapCellPosition),
            (get({Graph, '$class'})):addVertex(Graph, OverPassGeographicMapCellPosition),
            (get({Graph, '$class'})):addEdge(Graph, OverPassGeographicMapCellPosition, RightUnderPassGeographicMapCellPosition),
            (get({Graph, '$class'})):addEdge(Graph, OverPassGeographicMapCellPosition, LeftUnderPassGeographicMapCellPosition)
        end, lists:seq((array:size(CellPositionArray) - 1), 0, -1)).

% throws Exception
fixPath(This, StartPathFindingNodeList, EndPathFindingNodeList, PathList) ->
        lists:foreach(fun(Index) ->
            EndPathFindingNode = (get({EndPathFindingNodeList, '$class'})):get(EndPathFindingNodeList, Index),
            StartPathFindingNode = (get({StartPathFindingNodeList, '$class'})):get(StartPathFindingNodeList, Index),
            case (fun(Target_N68844) -> (get({Target_N68844, '$class'})):isSameCellPosition(Target_N68844, get({StartPathFindingNode, geographicMapCellPosition}), get({EndPathFindingNode, geographicMapCellPosition})) end)('BasicGeographicMapUtil':getInstance()) of
                true ->
                case (get({PathList, '$class'})):remove(PathList, get({EndPathFindingNode, geographicMapCellPosition})) of
                    true ->
                    (get({PathList, '$class'})):remove(PathList, get({StartPathFindingNode, geographicMapCellPosition})),
                    (get({PathList, '$class'})):addAt(PathList, 0, get({StartPathFindingNode, geographicMapCellPosition}));
                    false -> ok
                end;
                false -> ok
            end
        end, lists:seq(((get({StartPathFindingNodeList, '$class'})):size(StartPathFindingNodeList) - 1), 0, -1)),
        (get({This, '$class'})):removeOverPassEdges(This, PathList).

% throws Exception
removeOverPassEdges(This, PathList) ->
        GeographicMapCellPositionFactory = (get({get({This, geographicMapInterface}), '$class'})):getGeographicMapCellPositionFactory(get({This, geographicMapInterface})),
        RaceTrackGeographicMap = get({This, geographicMapInterface}),
        CellPositionArray = (fun(Target_N69357) -> (get({Target_N69357, '$class'})):getOverPassGeographicMapCellPositionArray(Target_N69357) end)((get({RaceTrackGeographicMap, '$class'})):getRaceTrackData(RaceTrackGeographicMap)),
        lists:foreach(fun(Index) ->
            OverPassGeographicMapCellPosition = array:get(Index, CellPositionArray),
            UnderPassGeographicMapCellPosition = (get({GeographicMapCellPositionFactory, '$class'})):getAt(GeographicMapCellPositionFactory, (get({OverPassGeographicMapCellPosition, '$class'})):getColumn(OverPassGeographicMapCellPosition), (get({OverPassGeographicMapCellPosition, '$class'})):getRow(OverPassGeographicMapCellPosition)),
            IndexOf = (get({PathList, '$class'})):indexOf(PathList, OverPassGeographicMapCellPosition),
            case (IndexOf =/= (-1)) of
                true ->
                (get({PathList, '$class'})):set(PathList, IndexOf, UnderPassGeographicMapCellPosition);
                false -> ok
            end
        end, lists:seq((array:size(CellPositionArray) - 1), 0, -1)).

isValid(This, GraphPath) ->
        try
        case ((((fun(Target_N69815) -> (get({Target_N69815, '$class'})):size(Target_N69815) end)((get({GraphPath, '$class'})):getEdgeList(GraphPath)) > get({This, edgeMinimum})) andalso ((get({GraphPath, '$class'})):getWeight(GraphPath) < get({This, maxPathWeight}))) andalso ((get({GraphPath, '$class'})):getWeight(GraphPath) > get({This, minPathWeight}))) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

