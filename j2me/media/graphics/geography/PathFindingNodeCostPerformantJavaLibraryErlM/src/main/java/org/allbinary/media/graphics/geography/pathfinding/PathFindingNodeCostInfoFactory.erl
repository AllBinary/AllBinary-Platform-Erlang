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
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType

-module('PathFindingNodeCostInfoFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PathFindingNodeCostInfoFactoryBase', Function, Arguments).

init_fields(This) ->
    ok.


new(Max) when is_integer(Max) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Max),
    This.

'$init'(This, Max) when is_integer(Max) ->
    'PathFindingNodeCostInfoFactoryBase':'$init'(This),
    init_fields(This),
        ok.

% throws Exception
create(This, GeographicMapInterface, GoingToGeographicMapCellPosition, GeographicMapCellPosition, CostFromStart, CostToEnd) when is_integer(CostFromStart), is_integer(CostToEnd) ->
        ok.

% throws Exception
getTotalCost(This, GeographicMapInterface, ComingFromGeographicMapCellPosition, GeographicMapCellPosition) ->
        GeographicMapCellType = (get({GeographicMapInterface, '$class'})):getCellTypeAt(GeographicMapInterface, ComingFromGeographicMapCellPosition),
        GeographicMapCellType2 = (get({GeographicMapInterface, '$class'})):getCellTypeAt(GeographicMapInterface, GeographicMapCellPosition),
        RaceTrackGeographicMapCellType = GeographicMapCellType,
        RaceTrackGeographicMapCellType2 = GeographicMapCellType2,
        (trunc((get({RaceTrackGeographicMapCellType, '$class'})):getTravelCost(RaceTrackGeographicMapCellType)) + (get({RaceTrackGeographicMapCellType2, '$class'})):getTravelCost(RaceTrackGeographicMapCellType2)).

