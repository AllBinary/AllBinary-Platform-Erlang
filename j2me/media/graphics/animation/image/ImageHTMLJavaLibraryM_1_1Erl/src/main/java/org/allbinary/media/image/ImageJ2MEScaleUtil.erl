%
% AllBinary Open License Version 1
% Copyright (c) 2023 AllBinary
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
% import org.allbinary.logic.communication.log.LogUtil
% import org.microemu.device.playn.PlaynImmutableImage
% import org.microemu.device.playn.PlaynMutableImage
% import playn.core.CanvasImage
% import playn.core.CanvasSurface

-module('ImageJ2MEScaleUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageJ2MEScaleUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'ImageJ2MEScaleUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
scaleArray(This, Images, Width, Height) when (is_tuple(Images) orelse Images =:= undefined), is_integer(Width), is_integer(Height) ->
        ScaledImages = array:new(array:size(Images), {default, undefined}),
        put({local, index}, array:size(Images)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            array:set(get({local, index}), (get({This, '$class'})):scale(This, array:get(get({local, index}), Images), Width, Height), ScaledImages),
            Loop();
        false -> ok end end)(),
        ScaledImages.

% throws Exception
scale(This, Image, Width, Height) when is_integer(Width), is_integer(Height) ->
        put({local, originalPlayNImage}, undefined),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            put({local, originalHTMLImage}, Image),
            put({local, originalPlayNImage}, (get({get({local, originalHTMLImage}), '$class'})):getImage(get({local, originalHTMLImage})));
            false ->
            put({local, originalHTMLImage}, Image),
            put({local, originalPlayNImage}, (get({get({local, originalHTMLImage}), '$class'})):getImage(get({local, originalHTMLImage})))
        end,
        ScaledImage = 'Image':createImage(Width, Height),
        HtmlImage = ScaledImage,
        CanvasImage = (get({HtmlImage, '$class'})):getImage(HtmlImage),
        CanvasSurface = (get({HtmlImage, '$class'})):getCanvasSurface(HtmlImage, CanvasImage),
        (get({CanvasSurface, '$class'})):drawImage(CanvasSurface, get({local, originalPlayNImage}), 0, 0, (get({ScaledImage, '$class'})):getWidth(ScaledImage), (get({ScaledImage, '$class'})):getHeight(ScaledImage), 0, 0, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image)),
        ScaledImage.

