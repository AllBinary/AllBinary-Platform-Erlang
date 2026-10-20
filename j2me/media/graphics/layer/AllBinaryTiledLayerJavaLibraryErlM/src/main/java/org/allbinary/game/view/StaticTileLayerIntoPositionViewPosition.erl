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
% package org.allbinary.game.view
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.Layer
% import org.allbinary.layer.NullLayer
% import org.allbinary.view.ViewPosition

-module('StaticTileLayerIntoPositionViewPosition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ViewPosition', Function, Arguments).

static_init() ->
    put({?MODULE, tiledLayer}, 'NullLayer':getInstance()),
    put({?MODULE, layer}, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'ViewPosition':'$init'(This, 0, 0, 0).

getX(This) ->
        ('ViewPosition':getX(This) - (get({get({'StaticTileLayerIntoPositionViewPosition', tiledLayer}), '$class'})):getXP(get({'StaticTileLayerIntoPositionViewPosition', tiledLayer}))).

getY(This) ->
        ('ViewPosition':getY(This) - (get({get({'StaticTileLayerIntoPositionViewPosition', tiledLayer}), '$class'})):getYP(get({'StaticTileLayerIntoPositionViewPosition', tiledLayer}))).

getZ(This) ->
        ('ViewPosition':getZ(This) - (get({get({'StaticTileLayerIntoPositionViewPosition', tiledLayer}), '$class'})):getZP(get({'StaticTileLayerIntoPositionViewPosition', tiledLayer}))).

setTiledLayer(TiledLayer) ->
        put({'StaticTileLayerIntoPositionViewPosition', tiledLayer}, TiledLayer).

