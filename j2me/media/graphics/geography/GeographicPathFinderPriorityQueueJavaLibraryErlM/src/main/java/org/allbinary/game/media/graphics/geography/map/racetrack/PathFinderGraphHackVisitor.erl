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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap

-module('PathFinderGraphHackVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasePathFinderGraphVisitor', Function, Arguments).

init_fields(This) ->
    ok.


new(GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight) when is_integer(EdgeMinimum), is_integer(MinPathWeight), is_integer(MaxPathWeight) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight),
    This.

'$init'(This, GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight) when is_integer(EdgeMinimum), is_integer(MinPathWeight), is_integer(MaxPathWeight) ->
        'BasePathFinderGraphVisitor':'$init'(This, GeographicMapInterface, EdgeMinimum, MinPathWeight, MaxPathWeight).

% throws Exception
visit(This, Graph, StartPathFindingNodeList, EndPathFindingNodeList) ->
        (get({This, '$class'})):fixStart(This, Graph, StartPathFindingNodeList),
        (get({This, '$class'})):fixEnd(This, Graph, EndPathFindingNodeList),
        (get({This, '$class'})):fixOverPassEdges(This, Graph).

% throws Exception
fixStart(This, Graph, StartPathFindingNodeList) ->
        ok.

% throws Exception
fixEnd(This, Graph, EndPathFindingNodeList) ->
        ok.

% throws Exception
fixOverPassEdges(This, Graph) ->
        ok.

% throws Exception
fixPath(This, StartPathFindingNodeList, EndPathFindingNodeList, PathList) ->
        ok.

% throws Exception
removeOverPassEdges(This, PathList) ->
        ok.

isValid(This, GraphPath) ->
        false.

