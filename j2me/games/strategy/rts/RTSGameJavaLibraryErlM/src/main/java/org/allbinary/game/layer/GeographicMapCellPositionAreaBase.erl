% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.game.layer
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayList

-module('GeographicMapCellPositionAreaBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GeographicMapCellPositionAreaInterface

static_init() ->
    put({?MODULE, 'NULL_GEOGRPAHIC_MAP_POSITION_AREA_BASE'}, 'GeographicMapCellPositionAreaBase':new()),
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


getNextSurroundingGeographicMapCellPosition(This) ->
        erlang:error({'RuntimeException'}).

getOccupyingGeographicMapCellPositionList(This) ->
        erlang:error({'RuntimeException'}).

getSurroundingGeographicMapCellPositionList(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
update(This, GeographicMapInterface) ->
        erlang:error({'RuntimeException'}).

