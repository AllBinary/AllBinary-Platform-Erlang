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
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory

-module('GeographicMapCellPathHistoryInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, previousGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, previousOnPathGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, nextUnvisitedOnPathGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, nextOnPathGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    put({This, nextChosenOnPathGeographicMapCellPosition}, get({'SimpleGeographicMapCellPositionFactory', 'NULL_GEOGRAPHIC_MAP_CELL_POSITION'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getPreviousGeographicMapCellPosition(This) ->
        get({This, previousGeographicMapCellPosition}).

setPreviousGeographicMapCellPosition(This, PreviousGeographicMapCellPosition) ->
        put({This, previousGeographicMapCellPosition}, PreviousGeographicMapCellPosition).

getPreviousOnPathGeographicMapCellPosition(This) ->
        get({This, previousOnPathGeographicMapCellPosition}).

setPreviousOnPathGeographicMapCellPosition(This, PreviousOnPathGeographicMapCellPosition) ->
        put({This, previousOnPathGeographicMapCellPosition}, PreviousOnPathGeographicMapCellPosition).

getNextUnvisitedOnPathGeographicMapCellPosition(This) ->
        get({This, nextUnvisitedOnPathGeographicMapCellPosition}).

setNextUnvisitedOnPathGeographicMapCellPosition(This, NextUnvisitedOnPathGeographicMapCellPosition) ->
        put({This, nextUnvisitedOnPathGeographicMapCellPosition}, NextUnvisitedOnPathGeographicMapCellPosition).

getNextOnPathGeographicMapCellPosition(This) ->
        get({This, nextOnPathGeographicMapCellPosition}).

setNextOnPathGeographicMapCellPosition(This, NextOnPathGeographicMapCellPosition) ->
        put({This, nextOnPathGeographicMapCellPosition}, NextOnPathGeographicMapCellPosition).

getNextChosenOnPathGeographicMapCellPosition(This) ->
        get({This, nextChosenOnPathGeographicMapCellPosition}).

setNextChosenOnPathGeographicMapCellPosition(This, NextChosenOnPathGeographicMapCellPosition) ->
        put({This, nextChosenOnPathGeographicMapCellPosition}, NextChosenOnPathGeographicMapCellPosition).

