% 
% AllBinary Open License Version 1 
% Copyright (c) 2002 AllBinary 
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
% package org.allbinary.game.layer.geological.resources
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.game.rand.MyRandomFactory
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface

-module('GeologicalGeographicMapCellPositionFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GeographicMapCellPositionFactoryInterface

init_fields(This) ->
    put({This, resourcePerMapCellType}, undefined),
    ok.


new(ResourcePerMapCellType) when (is_tuple(ResourcePerMapCellType) orelse ResourcePerMapCellType =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ResourcePerMapCellType),
    This.

init(This, ResourcePerMapCellType) when (is_tuple(ResourcePerMapCellType) orelse ResourcePerMapCellType =:= undefined) ->
    init_fields(This),
        put({This, resourcePerMapCellType}, ResourcePerMapCellType).

% throws Exception
getInstance(This, GeographicMapInterface, I_column, I_row, Columns, Rows, Width, Height) when is_integer(I_column), is_integer(I_row), is_integer(Columns), is_integer(Rows), is_integer(Width), is_integer(Height) ->
        TiledLayer = (get({GeographicMapInterface, '$class'})):getAllBinaryTiledLayer(GeographicMapInterface),
        Resources = (array:get((get({TiledLayer, '$class'})):getCell(TiledLayer, I_column, I_row), get({This, resourcePerMapCellType})) + (fun(Target_N66010) -> (get({Target_N66010, '$class'})):getAbsoluteNextInt(Target_N66010, 1000) end)('MyRandomFactory':getInstance())),
        'GeologicalGeographicMapCellPosition':new(I_column, I_row, Columns, Rows, Width, Height, 'GeologicalResource':new(Resources)).

