%
% AllBinary Open License Version 1
% Copyright (c) 2006 AllBinary
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

-module('PathFindingNodeCostInfoFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PathFindingNodeCostInfoFactoryBase', Function, Arguments).

init_fields(This) ->
    put({This, pathFindingNodeCostInfoAdjacencyList}, undefined),
    ok.


new(Max) when is_integer(Max) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Max),
    This.

init(This, Max) when is_integer(Max) ->
    'PathFindingNodeCostInfoFactoryBase':init(This),
    init_fields(This),
        put({This, pathFindingNodeCostInfoAdjacencyList}, array:new(Max, {default, array:new(Max, {default, undefined})})).

% throws Exception
create(This, GeographicMapInterface, GoingToGeographicMapCellPosition, GeographicMapCellPosition, CostFromStart, CostToEnd) when is_integer(CostFromStart), is_integer(CostToEnd) ->
        (get({This, '$class'})):getInstance(This, GoingToGeographicMapCellPosition, GeographicMapCellPosition, CostFromStart, CostToEnd).

% throws Exception
getInstance(This, GoingToGeographicMapCellPosition, GeographicMapCellPosition, CostFromStart, CostToEnd) when is_integer(CostFromStart), is_integer(CostToEnd) ->
        put({local, pathFindingNodeCostInfo}, (get({This, '$class'})):getInstance(This, GoingToGeographicMapCellPosition, GeographicMapCellPosition)),
        case (get({local, pathFindingNodeCostInfo}) =:= undefined) of
            true ->
            put({local, pathFindingNodeCostInfo}, 'PathFindingNodeCostInfo':new(CostFromStart, CostToEnd)),
            (get({get({local, pathFindingNodeCostInfo}), '$class'})):setCalculatedTotalCost(get({local, pathFindingNodeCostInfo})),
            put({This, pathFindingNodeCostInfoAdjacencyList}, array:set((get({GeographicMapCellPosition, '$class'})):getId(GeographicMapCellPosition), array:set((get({GoingToGeographicMapCellPosition, '$class'})):getId(GoingToGeographicMapCellPosition), get({local, pathFindingNodeCostInfo}), array:get((get({GeographicMapCellPosition, '$class'})):getId(GeographicMapCellPosition), get({This, pathFindingNodeCostInfoAdjacencyList}))), get({This, pathFindingNodeCostInfoAdjacencyList})));
            false ->
            (get({get({local, pathFindingNodeCostInfo}), '$class'})):setCostFromStart(get({local, pathFindingNodeCostInfo}), CostFromStart),
            (get({get({local, pathFindingNodeCostInfo}), '$class'})):setCostToEnd(get({local, pathFindingNodeCostInfo}), CostToEnd),
            (get({get({local, pathFindingNodeCostInfo}), '$class'})):setCalculatedTotalCost(get({local, pathFindingNodeCostInfo}))
        end,
        get({local, pathFindingNodeCostInfo}).

getInstance(This, GoingToFromGeographicMapCellPosition, GeographicMapCellPosition) ->
        array:get((get({GoingToFromGeographicMapCellPosition, '$class'})):getId(GoingToFromGeographicMapCellPosition), array:get((get({GeographicMapCellPosition, '$class'})):getId(GeographicMapCellPosition), get({This, pathFindingNodeCostInfoAdjacencyList}))).

getTotalCost(This, GeographicMapInterface, ComingFromGeographicMapCellPosition, GeographicMapCellPosition) ->
        get({(get({This, '$class'})):getInstance(This, ComingFromGeographicMapCellPosition, GeographicMapCellPosition), totalCostP}).

