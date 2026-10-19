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
% package org.allbinary.media.graphics.geography.map
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.string.CommonStrings

-module('SimpleGeographicMap').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, id}, undefined),
    put({This, name}, undefined),
    put({This, cellTypeIdToGeographicMapCellType}, undefined),
    put({This, tiledLayer}, undefined),
    put({This, foregroundBasicColor}, get({'BasicColorFactory':getInstance(), 'NULL_COLOR'})),
    put({This, backgroundBasicColor}, get({'BasicColorFactory':getInstance(), 'NULL_COLOR'})),
    put({This, geographicMapCellTypeFactory}, 'GeographicMapCellTypeFactory':getInstance()),
    ok.


new(Id, Name, CellTypeIdToGeographicMapCellType, TiledLayer, ForegroundBasicColor, BackgroundBasicColor) when (is_list(Name) orelse Name =:= undefined), (is_tuple(CellTypeIdToGeographicMapCellType) orelse CellTypeIdToGeographicMapCellType =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Id, Name, CellTypeIdToGeographicMapCellType, TiledLayer, ForegroundBasicColor, BackgroundBasicColor),
    This.

init(This, Id, Name, CellTypeIdToGeographicMapCellType, TiledLayer, ForegroundBasicColor, BackgroundBasicColor) when (is_list(Name) orelse Name =:= undefined), (is_tuple(CellTypeIdToGeographicMapCellType) orelse CellTypeIdToGeographicMapCellType =:= undefined) ->
    init_fields(This),
        put({This, id}, Id),
        put({This, name}, Name),
        put({This, cellTypeIdToGeographicMapCellType}, CellTypeIdToGeographicMapCellType),
        put({This, tiledLayer}, TiledLayer),
        (get({This, '$class'})):setBackgroundBasicColor(This, BackgroundBasicColor),
        (get({This, '$class'})):setForegroundBasicColor(This, ForegroundBasicColor).

getId(This) ->
        get({This, id}).

getName(This) ->
        get({This, name}).

reset(This) ->
        ok.

getAllBinaryTiledLayer(This) ->
        get({This, tiledLayer}).

% throws Exception
getCellTypeAt(This, CellPosition) ->
        I_column = (get({CellPosition, '$class'})):getColumn(CellPosition),
        I_row = (get({CellPosition, '$class'})):getRow(CellPosition),
        put({local, cellTypeId}, (get({get({This, tiledLayer}), '$class'})):getCell(get({This, tiledLayer}), I_column, I_row)),
        case (get({local, cellTypeId}) < 0) of
            true ->
            put({local, cellTypeId}, (get({get({This, tiledLayer}), '$class'})):getAnimatedTile(get({This, tiledLayer}), get({local, cellTypeId})));
            false -> ok
        end,
        (get({get({This, geographicMapCellTypeFactory}), '$class'})):get(get({This, geographicMapCellTypeFactory}), array:get(get({local, cellTypeId}), get({This, cellTypeIdToGeographicMapCellType}))).

getCellTypeFromMapCellTypeInt(This, CellTypeId) when is_integer(CellTypeId) ->
        array:get(CellTypeId, get({This, cellTypeIdToGeographicMapCellType})).

getForegroundBasicColor(This) ->
        get({This, foregroundBasicColor}).

setForegroundBasicColor(This, ForegroundBasicColor) ->
        put({This, foregroundBasicColor}, ForegroundBasicColor).

getBackgroundBasicColor(This) ->
        get({This, backgroundBasicColor}).

setBackgroundBasicColor(This, BackgroundBasicColor) ->
        put({This, backgroundBasicColor}, BackgroundBasicColor).

