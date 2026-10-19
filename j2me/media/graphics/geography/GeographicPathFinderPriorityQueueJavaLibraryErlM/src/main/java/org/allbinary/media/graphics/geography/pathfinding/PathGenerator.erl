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
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.util.BasicArrayList

-module('PathGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements PathGeneratorInterface

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'PathGenerator':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'PathGenerator', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
init(This, GeographicMapInterface, TotalPaths) when is_integer(TotalPaths) ->
        ok.

% throws Exception
getInstanceNoCache(This, GeographicMapInterface, PathFindingInfo, TotalPaths) when is_integer(TotalPaths) ->
        GeographicMapCellPositionBasicArrayList = (get({This, '$class'})):create(This, GeographicMapInterface, PathFindingInfo, TotalPaths),
        GeographicMapCellPositionBasicArrayList.

% throws Exception
createList(This, GeographicMapInterface, GeographicMapCellHistory, PathFindingInfo, TotalPaths) when is_integer(TotalPaths) ->
        erlang:error({'RuntimeException'}).

% throws Exception
create(This, GeographicMapInterface, PathFindingInfo, TotalPaths) when is_integer(TotalPaths) ->
        StartPathFindingNodeList = (get({PathFindingInfo, '$class'})):getStartPathFindingNodeList(PathFindingInfo),
        EndPathFindingNodeList = (get({PathFindingInfo, '$class'})):getEndPathFindingNodeList(PathFindingInfo),
        GeographicPathFinderInterface = (get({PathFindingInfo, '$class'})):getPathFinder(PathFindingInfo),
        GeographicMapCellPositionBasicArrayList = (get({GeographicPathFinderInterface, '$class'})):searchTotalPath(GeographicPathFinderInterface, StartPathFindingNodeList, EndPathFindingNodeList, TotalPaths),
        GeographicMapCellPositionBasicArrayList.

% throws Exception
createN(This, GeographicMapInterface, PathFindingInfo, TotalPaths, MultipassState) when is_integer(TotalPaths) ->
        StartPathFindingNodeList = (get({PathFindingInfo, '$class'})):getStartPathFindingNodeList(PathFindingInfo),
        EndPathFindingNodeList = (get({PathFindingInfo, '$class'})):getEndPathFindingNodeList(PathFindingInfo),
        GeographicPathFinderInterface = (get({PathFindingInfo, '$class'})):getPathFinder(PathFindingInfo),
        GeographicMapCellPositionBasicArrayList = (get({GeographicPathFinderInterface, '$class'})):searchTotalPathN(GeographicPathFinderInterface, StartPathFindingNodeList, EndPathFindingNodeList, TotalPaths, MultipassState),
        GeographicMapCellPositionBasicArrayList.

% throws Exception
isValid(This, PathList, GeographicMapCellHistory) ->
        erlang:error({'RuntimeException'}).

