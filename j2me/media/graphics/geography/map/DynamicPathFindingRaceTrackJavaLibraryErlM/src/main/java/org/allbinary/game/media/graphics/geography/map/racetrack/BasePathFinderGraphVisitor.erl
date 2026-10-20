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
% import org.jgrapht.graph.SimpleWeightedGraph
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.pathfinding.PathFinderGraphVisitorBase
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingNode
% import org.allbinary.util.BasicArrayList

-module('BasePathFinderGraphVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PathFinderGraphVisitorBase', Function, Arguments).

init_fields(This) ->
    put({This, geographicMapInterface}, undefined),
    put({This, edgeMinimum}, 0),
    put({This, minPathWeight}, 0),
    put({This, maxPathWeight}, 0),
    ok.


new(GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight) when is_integer(EdgeMinimum), is_integer(MinPathWeight), is_integer(MaxPathWeight) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight),
    This.

'$init'(This, GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight) when is_integer(EdgeMinimum), is_integer(MinPathWeight), is_integer(MaxPathWeight) ->
    'PathFinderGraphVisitorBase':'$init'(This),
    init_fields(This),
        put({This, geographicMapInterface}, GeographicMapInterface),
        put({This, edgeMinimum}, EdgeMinimum),
        put({This, minPathWeight}, MinPathWeight),
        put({This, maxPathWeight}, MaxPathWeight).

% throws Exception
visit(This, Graph, StartPathFindingNodeList, EndPathFindingNodeList) ->
        ok.

% throws Exception
fixPath(This, StartPathFindingNodeList, EndPathFindingNodeList, PathList) ->
        lists:foreach(fun(Index) ->
            StartPathFindingNode = (get({StartPathFindingNodeList, '$class'})):get(StartPathFindingNodeList, Index),
            (get({PathList, '$class'})):remove(PathList, get({StartPathFindingNode, geographicMapCellPosition})),
            (get({PathList, '$class'})):addAt(PathList, 0, get({StartPathFindingNode, geographicMapCellPosition}))
        end, lists:seq(((get({StartPathFindingNodeList, '$class'})):size(StartPathFindingNodeList) - 1), 0, -1)).

isValid(This, GraphPath) ->
        try
        case ((((fun(Target_N66620) -> (get({Target_N66620, '$class'})):size(Target_N66620) end)((get({GraphPath, '$class'})):getEdgeList(GraphPath)) > get({This, edgeMinimum})) andalso ((get({GraphPath, '$class'})):getWeight(GraphPath) < get({This, maxPathWeight}))) andalso ((get({GraphPath, '$class'})):getWeight(GraphPath) > get({This, minPathWeight}))) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getInvalidReason(This, GraphPath) ->
        StringBuffer = 'StringMaker':new(),
        case ((fun(Target_N66852) -> (get({Target_N66852, '$class'})):size(Target_N66852) end)((get({GraphPath, '$class'})):getEdgeList(GraphPath)) < get({This, edgeMinimum})) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat(["Ignoring Small: ", (fun(Target_N66921) -> (get({Target_N66921, '$class'})):size(Target_N66921) end)((get({GraphPath, '$class'})):getEdgeList(GraphPath))]));
            false -> ok
        end,
        case ((get({GraphPath, '$class'})):getWeight(GraphPath) =< get({This, minPathWeight})) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([" Low Weighted Path: ", (get({GraphPath, '$class'})):getWeight(GraphPath)]));
            false -> ok
        end,
        case ((get({GraphPath, '$class'})):getWeight(GraphPath) >= get({This, maxPathWeight})) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, lists:concat([" To High Weighted Path: ", (get({GraphPath, '$class'})):getWeight(GraphPath)]));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

