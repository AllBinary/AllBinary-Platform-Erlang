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
% package org.allbinary.media.graphics.geography.map.racetrack
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.layer.Layer
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface
% import org.allbinary.media.graphics.geography.map.GeographicMapCellType

-module('NullRaceTrackGeographicMap').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements RaceTrackGeographicMapInterface

static_init() ->
    put({?MODULE, 'NULL_RACE_TRACK_GEOGRAPHIC_MAP'}, 'NullRaceTrackGeographicMap':new()),
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


getId(This) ->
        erlang:error({'RuntimeException'}).

getName(This) ->
        erlang:error({'RuntimeException'}).

reset(This) ->
        erlang:error({'RuntimeException'}).

getAllBinaryTiledLayer(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getCellPositionsAt(This, Layer, CurrentCellPositionArray, CellPositionArray) when (is_tuple(CurrentCellPositionArray) orelse CurrentCellPositionArray =:= undefined), (is_tuple(CellPositionArray) orelse CellPositionArray =:= undefined) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getCellPositionAtXY(This, X, Y) when is_integer(X), is_integer(Y) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getCellPositionAtXYNoThrow(This, X, Y) when is_integer(X), is_integer(Y) ->
        erlang:error({'RuntimeException'}).

getCellTypeFromMapCellTypeInt(This, CellTypeId) when is_integer(CellTypeId) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getCellTypeAtXY(This, X, Y) when is_integer(X), is_integer(Y) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getCellTypeAt(This, GeographicMapCellPosition) ->
        erlang:error({'RuntimeException'}).

getGeographicMapCellPositionFactory(This) ->
        erlang:error({'RuntimeException'}).

getGeographicMapCellPositionFactoryInterface(This) ->
        erlang:error({'RuntimeException'}).

getForegroundBasicColor(This) ->
        erlang:error({'RuntimeException'}).

getBackgroundBasicColor(This) ->
        erlang:error({'RuntimeException'}).

getRaceTrackInfo(This) ->
        erlang:error({'RuntimeException'}).

setRaceTrackInfo(This, ARaceTrackInfo) ->
        erlang:error({'RuntimeException'}).

getRaceTrackData(This) ->
        erlang:error({'RuntimeException'}).

setRaceTrackData(This, RaceTrackData) ->
        erlang:error({'RuntimeException'}).

