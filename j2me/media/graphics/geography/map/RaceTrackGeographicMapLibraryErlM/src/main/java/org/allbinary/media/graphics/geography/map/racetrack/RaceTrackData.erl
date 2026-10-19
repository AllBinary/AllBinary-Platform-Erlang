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
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullImage
% import org.allbinary.graphics.CellPosition
% import org.allbinary.logic.NullUtil

-module('RaceTrackData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, tileSetImage}, get({'NullImage', 'NULL_IMAGE'})),
    put({This, miniTileSetImage}, get({'NullImage', 'NULL_IMAGE'})),
    put({This, cellWidth}, 0),
    put({This, cellHeight}, 0),
    put({This, miniCellWidth}, 0),
    put({This, miniCellHeight}, 0),
    put({This, mapArray}, get({'NullUtil':getInstance(), 'NULL_INT_ARRAY_ARRAY'})),
    put({This, cellTypeIdToGeographicMapCellTypeArray}, get({'NullUtil':getInstance(), 'NULL_INT_ARRAY'})),
    put({This, 'NO_OVER_PASSES_ARRAY'}, array:new(0, {default, undefined})),
    put({This, overPassGeographicMapCellPositionArray}, get({This, 'NO_OVER_PASSES_ARRAY'})),
    put({This, id}, undefined),
    ok.


new(Id, CellWidth, CellHeight, MiniCellWidth, MiniCellHeight, CellTypeIdToGeographicMapCellTypeArray, MapArray) when is_integer(CellWidth), is_integer(CellHeight), is_integer(MiniCellWidth), is_integer(MiniCellHeight), (is_tuple(CellTypeIdToGeographicMapCellTypeArray) orelse CellTypeIdToGeographicMapCellTypeArray =:= undefined), (is_tuple(MapArray) orelse MapArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Id, CellWidth, CellHeight, MiniCellWidth, MiniCellHeight, CellTypeIdToGeographicMapCellTypeArray, MapArray),
    This.

init(This, Id, CellWidth, CellHeight, MiniCellWidth, MiniCellHeight, CellTypeIdToGeographicMapCellTypeArray, MapArray) when is_integer(CellWidth), is_integer(CellHeight), is_integer(MiniCellWidth), is_integer(MiniCellHeight), (is_tuple(CellTypeIdToGeographicMapCellTypeArray) orelse CellTypeIdToGeographicMapCellTypeArray =:= undefined), (is_tuple(MapArray) orelse MapArray =:= undefined) ->
    init_fields(This),
        put({This, id}, Id),
        put({This, cellWidth}, CellWidth),
        put({This, cellHeight}, CellHeight),
        put({This, miniCellWidth}, MiniCellWidth),
        put({This, miniCellHeight}, MiniCellHeight),
        put({This, mapArray}, MapArray),
        put({This, cellTypeIdToGeographicMapCellTypeArray}, CellTypeIdToGeographicMapCellTypeArray).

setMapArray(This, MapArray) when (is_tuple(MapArray) orelse MapArray =:= undefined) ->
        put({This, mapArray}, MapArray).

getMapArray(This) ->
        get({This, mapArray}).

setCellTypeIdToGeographicMapCellTypeArray(This, CellTypeIdToGeographicMapCellTypeArray) when (is_tuple(CellTypeIdToGeographicMapCellTypeArray) orelse CellTypeIdToGeographicMapCellTypeArray =:= undefined) ->
        put({This, cellTypeIdToGeographicMapCellTypeArray}, CellTypeIdToGeographicMapCellTypeArray).

getCellTypeIdToGeographicMapCellTypeArray(This) ->
        get({This, cellTypeIdToGeographicMapCellTypeArray}).

setCellWidth(This, CellWidth) when is_integer(CellWidth) ->
        put({This, cellWidth}, CellWidth).

getCellWidth(This) ->
        get({This, cellWidth}).

setCellHeight(This, CellHeight) when is_integer(CellHeight) ->
        put({This, cellHeight}, CellHeight).

getCellHeight(This) ->
        get({This, cellHeight}).

getOverPassGeographicMapCellPositionArray(This) ->
        get({This, overPassGeographicMapCellPositionArray}).

setOverPassGeographicMapCellPositionArray(This, OverPassGeographicMapCellPositionArray) when (is_tuple(OverPassGeographicMapCellPositionArray) orelse OverPassGeographicMapCellPositionArray =:= undefined) ->
        put({This, overPassGeographicMapCellPositionArray}, OverPassGeographicMapCellPositionArray).

getTileSetImage(This) ->
        get({This, tileSetImage}).

setTileSetImage(This, TileSetImage) ->
        put({This, tileSetImage}, TileSetImage).

getMiniTileSetImage(This) ->
        get({This, miniTileSetImage}).

setMiniTileSetImage(This, MiniTileSetImage) ->
        put({This, miniTileSetImage}, MiniTileSetImage).

getMiniCellWidth(This) ->
        get({This, miniCellWidth}).

setMiniCellWidth(This, MiniCellWidth) when is_integer(MiniCellWidth) ->
        put({This, miniCellWidth}, MiniCellWidth).

getMiniCellHeight(This) ->
        get({This, miniCellHeight}).

setMiniCellHeight(This, MiniCellHeight) when is_integer(MiniCellHeight) ->
        put({This, miniCellHeight}, MiniCellHeight).

setId(This, Id) ->
        put({This, id}, Id).

getId(This) ->
        get({This, id}).

