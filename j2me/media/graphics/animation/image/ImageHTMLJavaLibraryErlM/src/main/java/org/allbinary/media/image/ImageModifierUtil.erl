% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.media.image
% import javax.microedition.lcdui.Image
% import org.allbinary.graphics.color.BasicColor
% import org.microemu.device.playn.PlaynMutableImage
% import playn.core.CanvasImage
% import playn.core.CanvasSurface

-module('ImageModifierUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageModifierUtil':new()),
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


getInstanceOrCreate() ->
        get({'ImageModifierUtil', instance}).

setColor(This, UnusedOriginalImage, Image, ImageIndex, BasicColor) when is_integer(ImageIndex) ->
        ok.

changeColor(This, UnusedOriginalImage, Image, ImageIndex, BasicColor) when is_integer(ImageIndex) ->
        ok.

setAlpha(This, OriginalImage, Image, ImageIndex, AlphaInt) when is_integer(ImageIndex), is_integer(AlphaInt) ->
        ok.

getImageArray(This, OriginalImageArray) when (is_tuple(OriginalImageArray) orelse OriginalImageArray =:= undefined) ->
        OriginalImageArray.

handleImage(This, ImageArray, Index, Image) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(Index) ->
        ok.

reset(This) ->
        ok.

