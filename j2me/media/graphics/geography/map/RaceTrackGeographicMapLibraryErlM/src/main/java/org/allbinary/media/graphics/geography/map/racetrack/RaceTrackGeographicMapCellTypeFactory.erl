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
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory

-module('RaceTrackGeographicMapCellTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GeographicMapCellTypeFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'RaceTrackGeographicMapCellTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'EMPTY_CELL_TYPE'}, 'GeographicMapCellType':new(0, (-1))),
    put({This, 'EASY_CELL_TYPE'}, get({This, 'EMPTY_CELL_TYPE'})),
    put({This, 'BOTTOM_LEFT_TURN_ROAD_CELL_TYPE'}, undefined),
    put({This, 'BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE'}, undefined),
    put({This, 'TOP_LEFT_TURN_ROAD_CELL_TYPE'}, undefined),
    put({This, 'TOP_RIGHT_TURN_ROAD_CELL_TYPE'}, undefined),
    put({This, 'HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE'}, undefined),
    put({This, 'VERTICAL_STRAIGHT_ROAD_CELL_TYPE'}, undefined),
    put({This, 'START_LINE_ROAD_CELL_TYPE'}, undefined),
    put({This, 'DEFAULT_FINISH_LINE_ROAD_CELL_TYPE'}, undefined),
    put({This, 'FINISH_LINE_ROAD_CELL_TYPE'}, get({'GeographicMapCellType', 'NULL_GEOGRAPHIC_MAP_CELL_TYPE'})),
    ok.


getInstance() ->
        get({'RaceTrackGeographicMapCellTypeFactory', instanceC}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'GeographicMapCellTypeFactory':'$init'(This),
    init_fields(This),
        RaceTrackGeographicMapCellTypes = 'RaceTrackGeographicMapCellTypes':getInstance(),
        put({This, 'BOTTOM_LEFT_TURN_ROAD_CELL_TYPE'}, get({RaceTrackGeographicMapCellTypes, 'BOTTOM_LEFT_TURN_ROAD_CELL_TYPE'})),
        put({This, 'BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE'}, get({RaceTrackGeographicMapCellTypes, 'BOTTOM_RIGHT_TURN_ROAD_CELL_TYPE'})),
        put({This, 'TOP_LEFT_TURN_ROAD_CELL_TYPE'}, get({RaceTrackGeographicMapCellTypes, 'TOP_LEFT_TURN_ROAD_CELL_TYPE'})),
        put({This, 'TOP_RIGHT_TURN_ROAD_CELL_TYPE'}, get({RaceTrackGeographicMapCellTypes, 'TOP_RIGHT_TURN_ROAD_CELL_TYPE'})),
        put({This, 'HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE'}, get({RaceTrackGeographicMapCellTypes, 'HORIZONTAL_STRAIGHT_ROAD_CELL_TYPE'})),
        put({This, 'VERTICAL_STRAIGHT_ROAD_CELL_TYPE'}, get({RaceTrackGeographicMapCellTypes, 'VERTICAL_STRAIGHT_ROAD_CELL_TYPE'})),
        put({This, 'START_LINE_ROAD_CELL_TYPE'}, get({RaceTrackGeographicMapCellTypes, 'START_LINE_ROAD_CELL_TYPE'})),
        put({This, 'DEFAULT_FINISH_LINE_ROAD_CELL_TYPE'}, get({RaceTrackGeographicMapCellTypes, 'DEFAULT_FINISH_LINE_ROAD_CELL_TYPE'})).

getStartType(This) ->
        (get({get({This, 'START_LINE_ROAD_CELL_TYPE'}), '$class'})):getType(get({This, 'START_LINE_ROAD_CELL_TYPE'})).

getEndType(This) ->
        (get({get({This, 'FINISH_LINE_ROAD_CELL_TYPE'}), '$class'})):getType(get({This, 'FINISH_LINE_ROAD_CELL_TYPE'})).

getEmptyType(This) ->
        (get({get({This, 'EMPTY_CELL_TYPE'}), '$class'})):getType(get({This, 'EMPTY_CELL_TYPE'})).

isPath(This, CellType) ->
        try
        case ((CellType =/= get({This, 'EMPTY_CELL_TYPE'})) andalso (CellType =/= get({This, 'EASY_CELL_TYPE'}))) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

