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

-module('RaceTrackGeographicMapCellTypes').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'RaceTrackGeographicMapCellTypes':new()),
    ok.

init_fields(This) ->
    put({This, 'BOTTOM_LEFT_TURN_ROAD_CELL_TYPE'}, undefined),
    put({This, 'BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE'}, undefined),
    put({This, 'TOP_LEFT_TURN_ROAD_CELL_TYPE'}, undefined),
    put({This, 'TOP_RIGHT_TURN_ROAD_CELL_TYPE'}, undefined),
    put({This, 'HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE'}, undefined),
    put({This, 'VERTICAL_STRAIGHT_ROAD_CELL_TYPE'}, undefined),
    put({This, 'START_LINE_ROAD_CELL_TYPE'}, undefined),
    put({This, 'DEFAULT_FINISH_LINE_ROAD_CELL_TYPE'}, undefined),
    ok.


getInstance() ->
        get({'RaceTrackGeographicMapCellTypes', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, 'BOTTOM_LEFT_TURN_ROAD_CELL_TYPE'}, 'RaceTrackGeographicMapCellType':new("Bottom Left Turn", 1, 1, 0)),
        put({This, 'BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE'}, 'RaceTrackGeographicMapCellType':new("Bottom Right Turn", 2, 1, 0)),
        put({This, 'TOP_LEFT_TURN_ROAD_CELL_TYPE'}, 'RaceTrackGeographicMapCellType':new("Top Left Turn", 3, 1, 0)),
        put({This, 'TOP_RIGHT_TURN_ROAD_CELL_TYPE'}, 'RaceTrackGeographicMapCellType':new("Top Right Turne", 4, 1, 0)),
        put({This, 'HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE'}, 'RaceTrackGeographicMapCellType':new("Horizontal Straight", 5, 1, 0)),
        put({This, 'VERTICAL_STRAIGHT_ROAD_CELL_TYPE'}, 'RaceTrackGeographicMapCellType':new("Vertical Straight", 6, 1, 0)),
        put({This, 'START_LINE_ROAD_CELL_TYPE'}, 'RaceTrackGeographicMapCellType':new("Start Line", 7, 1, 0)),
        put({This, 'DEFAULT_FINISH_LINE_ROAD_CELL_TYPE'}, 'RaceTrackGeographicMapCellType':new("Finish Line", 8, 1, 0)).

