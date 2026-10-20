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
% package org.allbinary.media.graphics.geography.map.racetrack
% import org.allbinary.string.CommonStrings
% import org.allbinary.media.graphics.geography.pathfinding.PathFindingNodeCostInfoData

-module('EmptyRaceRaceTrackGeographicMapCellTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RaceTrackGeographicMapCellTypeFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'EmptyRaceRaceTrackGeographicMapCellTypeFactory':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'EmptyRaceRaceTrackGeographicMapCellTypeFactory', instanceC}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'RaceTrackGeographicMapCellTypeFactory':'$init'(This),
    init_fields(This),
        CommonStrings = 'CommonStrings':getInstance(),
        put({This, 'EMPTY_CELL_TYPE'}, 'RaceTrackGeographicMapCellType':new(get({CommonStrings, 'EMPTY'}), 0, get({'PathFindingNodeCostInfoData':getInstance(), 'MAX_NODE_COST'}), 1)),
        put({This, 'EASY_CELL_TYPE'}, 'RaceTrackGeographicMapCellType':new("Easy", 19, 1, 0)),
        put({This, 'FINISH_LINE_ROAD_CELL_TYPE'}, get({This, 'DEFAULT_FINISH_LINE_ROAD_CELL_TYPE'})).

