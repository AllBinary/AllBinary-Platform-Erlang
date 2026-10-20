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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil

-module('PathFindingInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements PathFindingInfoInterface

static_init() ->
    put({?MODULE, 'NULL_PATH_FINDING_INFO'}, 'PathFindingInfo':new(get({'PathFindingNodeCostInfoFactoryBase', 'NULL_PATH_FINDING_NODE_COST_INFO_FACTORY_BASE'}), (fun(Target_N65706) -> (get({Target_N65706, '$class'})):getImmutableInstance(Target_N65706) end)('BasicArrayListUtil':getInstance()), (fun(Target_N65730) -> (get({Target_N65730, '$class'})):getImmutableInstance(Target_N65730) end)('BasicArrayListUtil':getInstance()))),
    ok.

init_fields(This) ->
    put({This, pathFinder}, get({'GeographicPathFinderBase', 'NULL_GEOGRAPHIC_PATH_FINDER_BASE'})),
    put({This, startPathFindingNodeList}, undefined),
    put({This, endPathFindingNodeList}, undefined),
    put({This, pathFindingNodeCostInfoFactoryInterface}, undefined),
    ok.


new(PathFindingNodeCostInfoFactoryInterface, StartPathFindingNodeList, EndPathFindingNodeList) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PathFindingNodeCostInfoFactoryInterface, StartPathFindingNodeList, EndPathFindingNodeList),
    This.

'$init'(This, PathFindingNodeCostInfoFactoryInterface, StartPathFindingNodeList, EndPathFindingNodeList) ->
    init_fields(This),
        put({This, pathFindingNodeCostInfoFactoryInterface}, PathFindingNodeCostInfoFactoryInterface),
        put({This, startPathFindingNodeList}, StartPathFindingNodeList),
        put({This, endPathFindingNodeList}, EndPathFindingNodeList).

getStartPathFindingNodeList(This) ->
        get({This, startPathFindingNodeList}).

getEndPathFindingNodeList(This) ->
        get({This, endPathFindingNodeList}).

getPathFinder(This) ->
        get({This, pathFinder}).

addStartPathFindingNode(This, StartPathFindingNode) ->
        (get({get({This, startPathFindingNodeList}), '$class'})):add(get({This, startPathFindingNodeList}), StartPathFindingNode).

addEndPathFindingNode(This, EndPathFindingNode) ->
        (get({get({This, endPathFindingNodeList}), '$class'})):add(get({This, endPathFindingNodeList}), EndPathFindingNode).

setPathFinder(This, PathFinder) ->
        put({This, pathFinder}, PathFinder).

getPathFindingNodeCostInfoFactoryInterface(This) ->
        get({This, pathFindingNodeCostInfoFactoryInterface}).

