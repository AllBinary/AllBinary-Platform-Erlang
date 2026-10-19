% 
% AllBinary Open License Version 1 
% Copyright (c) 2003 AllBinary 
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
% package org.allbinary.game.layer.item
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.graphics.form.item.ABCustomImageItem
% import org.allbinary.animation.Animation
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.layer.LayerInterfaceFactoryInterface

-module('LayerInterfaceFactoryImageItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ABCustomImageItem', Function, Arguments).

init_fields(This) ->
    put({This, animationArray}, undefined),
    put({This, layerInterfaceFactoryInterface}, undefined),
    ok.


new(Label, Img, Layout, AltText, BasicColor, AnimationArray, LayerInterfaceFactoryInterface) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined), (is_tuple(AnimationArray) orelse AnimationArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label, Img, Layout, AltText, BasicColor, AnimationArray, LayerInterfaceFactoryInterface),
    This.

init(This, Label, Img, Layout, AltText, BasicColor, AnimationArray, LayerInterfaceFactoryInterface) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined), (is_tuple(AnimationArray) orelse AnimationArray =:= undefined) ->
        'ABCustomImageItem':init(This, Label, Img, Layout, AltText, BasicColor, 0),
        init_fields(This),
        put({This, animationArray}, AnimationArray),
        put({This, layerInterfaceFactoryInterface}, LayerInterfaceFactoryInterface).

getLayerInterfaceFactoryInterface(This) ->
        get({This, layerInterfaceFactoryInterface}).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        'ABCustomImageItem':paintXY(This, Graphics, X, Y),
        put({local, index}, array:size(get({This, animationArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N66211) -> (get({Target_N66211, '$class'})):paintXY(Target_N66211, Graphics, X, Y) end)(array:get(get({local, index}), get({This, animationArray}))),
            Loop();
        false -> ok end end)().

