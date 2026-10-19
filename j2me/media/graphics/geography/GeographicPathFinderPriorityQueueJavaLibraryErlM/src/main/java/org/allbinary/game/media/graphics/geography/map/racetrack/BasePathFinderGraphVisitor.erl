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
% import org.allbinary.logic.string.StringUtil
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
    init(This, GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight),
    This.

init(This, GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight) when is_integer(EdgeMinimum), is_integer(MinPathWeight), is_integer(MaxPathWeight) ->
    'PathFinderGraphVisitorBase':init(This),
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
        put({local, startPathFindingNode}, undefined),
        lists:foreach(fun(Index) ->
            put({local, startPathFindingNode}, (get({StartPathFindingNodeList, '$class'})):get(StartPathFindingNodeList, Index)),
            (get({PathList, '$class'})):remove(PathList, get({get({local, startPathFindingNode}), geographicMapCellPosition})),
            (get({PathList, '$class'})):addAt(PathList, 0, get({get({local, startPathFindingNode}), geographicMapCellPosition}))
        end, lists:seq(((get({StartPathFindingNodeList, '$class'})):size(StartPathFindingNodeList) - 1), 0, -1)).

isValid(This, GraphPath) ->
        false.

getInvalidReason(This, GraphPath) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

