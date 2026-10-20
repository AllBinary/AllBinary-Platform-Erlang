% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition

-module('PathFindingNodeCostInfoFactoryBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements PathFindingNodeCostInfoFactoryBaseInterface

static_init() ->
    put({?MODULE, 'NULL_PATH_FINDING_NODE_COST_INFO_FACTORY_BASE'}, 'PathFindingNodeCostInfoFactoryBase':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
create(This, GeographicMapInterface, ComingFromGeographicMapCellPosition, GeographicMapCellPosition, CostFromStart, CostToEnd) when is_integer(CostFromStart), is_integer(CostToEnd) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getTotalCost(This, GeographicMapInterface, ComingFromGeographicMapCellPosition, GeographicMapCellPosition) ->
        erlang:error({'RuntimeException'}).

