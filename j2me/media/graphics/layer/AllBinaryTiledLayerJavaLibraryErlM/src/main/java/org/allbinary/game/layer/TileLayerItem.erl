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
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Screen
% import org.allbinary.graphics.form.item.ABCustomItem
% import org.allbinary.graphics.form.item.ABCustomItemInterface
% import org.allbinary.graphics.color.BasicColor

-module('TileLayerItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ABCustomItemInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ABCustomItem', Function, Arguments).

init_fields(This) ->
    put({This, tiledLayer}, undefined),
    ok.


new(Label, TiledLayer, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Label, TiledLayer, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, Label, TiledLayer, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
        'ABCustomItem':'$init'(This, Label, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This),
        put({This, tiledLayer}, TiledLayer).

setOwner(This, Owner) ->
        ok.

getMinimumWidth(This) ->
        (get({get({This, tiledLayer}), '$class'})):getWidth(get({This, tiledLayer})).

getMinimumHeight(This) ->
        (get({get({This, tiledLayer}), '$class'})):getHeight(get({This, tiledLayer})).

getMinContentHeight(This) ->
        (get({get({This, tiledLayer}), '$class'})):getHeight(get({This, tiledLayer})).

getMinContentWidth(This) ->
        (get({get({This, tiledLayer}), '$class'})):getWidth(get({This, tiledLayer})).

getPrefContentHeight(This, Width) when is_integer(Width) ->
        (get({get({This, tiledLayer}), '$class'})):getHeight(get({This, tiledLayer})).

getPrefContentWidth(This, Height) when is_integer(Height) ->
        (get({get({This, tiledLayer}), '$class'})):getWidth(get({This, tiledLayer})).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, tiledLayer}), '$class'})):setPosition(get({This, tiledLayer}), X, Y, (get({get({This, tiledLayer}), '$class'})):getZP(get({This, tiledLayer}))),
        (get({get({This, tiledLayer}), '$class'})):paint(get({This, tiledLayer}), Graphics).

paintUnselected(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        ok.

