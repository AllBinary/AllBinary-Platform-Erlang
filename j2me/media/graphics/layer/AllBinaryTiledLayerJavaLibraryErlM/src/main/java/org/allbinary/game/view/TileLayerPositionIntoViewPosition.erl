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
% import org.allbinary.layer.Layer
% import org.allbinary.layer.NullLayer
% import org.allbinary.view.ViewPosition

-module('TileLayerPositionIntoViewPosition').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ViewPosition', Function, Arguments).

init_fields(This) ->
    put({This, tiledLayer}, 'NullLayer':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'ViewPosition':'$init'(This, 0, 0, 0),
        init_fields(This).

getX(This) ->
        ('ViewPosition':getX(This) - (get({get({This, tiledLayer}), '$class'})):getXP(get({This, tiledLayer}))).

getY(This) ->
        ('ViewPosition':getY(This) - (get({get({This, tiledLayer}), '$class'})):getYP(get({This, tiledLayer}))).

getZ(This) ->
        ('ViewPosition':getZ(This) - (get({get({This, tiledLayer}), '$class'})):getZP(get({This, tiledLayer}))).

setTiledLayer(This, TiledLayer) ->
        put({This, tiledLayer}, TiledLayer).

