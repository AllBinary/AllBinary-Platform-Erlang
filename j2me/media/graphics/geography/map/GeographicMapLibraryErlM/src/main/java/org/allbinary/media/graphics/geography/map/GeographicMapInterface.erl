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
% import org.allbinary.layer.Layer

-module('GeographicMapInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getId(This) ->
    erlang:error({abstract_method, getId}).

getName(This) ->
    erlang:error({abstract_method, getName}).

reset(This) ->
    erlang:error({abstract_method, reset}).

getAllBinaryTiledLayer(This) ->
    erlang:error({abstract_method, getAllBinaryTiledLayer}).

% throws Exception
getCellPositionsAt(This, Layer, CurrentCellPositionArray, CellPositionArray) when (is_tuple(CurrentCellPositionArray) orelse CurrentCellPositionArray =:= undefined), (is_tuple(CellPositionArray) orelse CellPositionArray =:= undefined) ->
    erlang:error({abstract_method, getCellPositionsAt}).

% throws Exception
getCellPositionAtXY(This, X, Y) when is_integer(X), is_integer(Y) ->
    erlang:error({abstract_method, getCellPositionAtXY}).

% throws Exception
getCellPositionAtXYNoThrow(This, X, Y) when is_integer(X), is_integer(Y) ->
    erlang:error({abstract_method, getCellPositionAtXYNoThrow}).

getCellTypeFromMapCellTypeInt(This, CellTypeId) when is_integer(CellTypeId) ->
    erlang:error({abstract_method, getCellTypeFromMapCellTypeInt}).

% throws Exception
getCellTypeAtXY(This, X, Y) when is_integer(X), is_integer(Y) ->
    erlang:error({abstract_method, getCellTypeAtXY}).

% throws Exception
getCellTypeAt(This, GeographicMapCellPosition) ->
    erlang:error({abstract_method, getCellTypeAt}).

getGeographicMapCellPositionFactory(This) ->
    erlang:error({abstract_method, getGeographicMapCellPositionFactory}).

getGeographicMapCellPositionFactoryInterface(This) ->
    erlang:error({abstract_method, getGeographicMapCellPositionFactoryInterface}).

getForegroundBasicColor(This) ->
    erlang:error({abstract_method, getForegroundBasicColor}).

getBackgroundBasicColor(This) ->
    erlang:error({abstract_method, getBackgroundBasicColor}).

