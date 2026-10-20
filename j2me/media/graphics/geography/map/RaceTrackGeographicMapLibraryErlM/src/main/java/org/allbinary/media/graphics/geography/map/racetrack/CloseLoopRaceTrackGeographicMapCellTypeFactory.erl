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

-module('CloseLoopRaceTrackGeographicMapCellTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RaceTrackGeographicMapCellTypeFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'CloseLoopRaceTrackGeographicMapCellTypeFactory':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'CloseLoopRaceTrackGeographicMapCellTypeFactory', instanceC}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'RaceTrackGeographicMapCellTypeFactory':'$init'(This),
    init_fields(This),
        put({This, 'EMPTY_CELL_TYPE'}, get({'EmptyRaceRaceTrackGeographicMapCellTypeFactory':getInstance(), 'EMPTY_CELL_TYPE'})),
        put({This, 'EASY_CELL_TYPE'}, get({This, 'EMPTY_CELL_TYPE'})),
        put({This, 'FINISH_LINE_ROAD_CELL_TYPE'}, get({This, 'START_LINE_ROAD_CELL_TYPE'})).

