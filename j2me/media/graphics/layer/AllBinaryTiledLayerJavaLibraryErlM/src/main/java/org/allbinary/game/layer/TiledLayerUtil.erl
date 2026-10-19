% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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

-module('TiledLayerUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TiledLayerUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'TiledLayerUtil', instance}).

keepOnBorderdMapX(This, TerrainTiledLayer, X, Width, MapBorderBufferWidth) when is_integer(X), is_integer(Width), is_integer(MapBorderBufferWidth) ->
        put({local, newX}, X),
        MaxRight = (((get({TerrainTiledLayer, '$class'})):getWidth(TerrainTiledLayer) - Width) - MapBorderBufferWidth),
        case ((X + Width) > MaxRight) of
            true ->
            put({local, newX}, MaxRight);
            false -> ok
        end,
        case (X < MapBorderBufferWidth) of
            true ->
            put({local, newX}, MapBorderBufferWidth);
            false -> ok
        end,
        get({local, newX}).

keepOnBorderdMapY(This, TerrainTiledLayer, Y, Height, MapBorderBufferHeight) when is_integer(Y), is_integer(Height), is_integer(MapBorderBufferHeight) ->
        put({local, newY}, Y),
        MaxBottom = (((get({TerrainTiledLayer, '$class'})):getHeight(TerrainTiledLayer) - Height) - MapBorderBufferHeight),
        case ((Y + Height) > MaxBottom) of
            true ->
            put({local, newY}, MaxBottom);
            false -> ok
        end,
        case (Y < MapBorderBufferHeight) of
            true ->
            put({local, newY}, MapBorderBufferHeight);
            false -> ok
        end,
        get({local, newY}).

keepOnMapX(This, TerrainTiledLayer, X, Width) when is_integer(X), is_integer(Width) ->
        put({local, newX}, X),
        MaxRight = ((get({TerrainTiledLayer, '$class'})):getWidth(TerrainTiledLayer) - Width),
        case (X >= MaxRight) of
            true ->
            put({local, newX}, MaxRight);
            false -> ok
        end,
        case (X < 0) of
            true ->
            put({local, newX}, 0);
            false -> ok
        end,
        get({local, newX}).

keepOnMapY(This, TerrainTiledLayer, Y, Height) when is_integer(Y), is_integer(Height) ->
        put({local, newY}, Y),
        MaxBottom = ((get({TerrainTiledLayer, '$class'})):getHeight(TerrainTiledLayer) - Height),
        case (Y >= MaxBottom) of
            true ->
            put({local, newY}, MaxBottom);
            false -> ok
        end,
        case (Y < 0) of
            true ->
            put({local, newY}, 0);
            false -> ok
        end,
        get({local, newY}).

