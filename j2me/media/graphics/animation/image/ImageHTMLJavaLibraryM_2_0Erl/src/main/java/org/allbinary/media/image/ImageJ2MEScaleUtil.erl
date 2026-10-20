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
% import playn.core.Canvas
% import playn.core.CoreImage
% import playn.core.ImageImpl
% import playn.core.PlayN
% import playn.html.HtmlGraphics
% import playn.html.HtmlImage

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
        ScaledImage = 'Image':createImageWH(Width, Height),
        HtmlImage = ScaledImage,
        ScaledPlayNImage = (get({HtmlImage, '$class'})):getImage(HtmlImage),
        Canvas = (fun(Target_N66810) -> (get({Target_N66810, '$class'})):get(Target_N66810, ScaledPlayNImage) end)(((fun(Target_N66823) -> (get({Target_N66823, '$class'})):graphics(Target_N66823) end)('PlayN':getInstance()))),
        (get({(get({local, originalPlayNImage})), '$class'})):draw((get({local, originalPlayNImage})), (get({Canvas, '$class'})):gc(Canvas), 0, 0, (get({ScaledImage, '$class'})):getWidth(ScaledImage), (get({ScaledImage, '$class'})):getHeight(ScaledImage), 0, 0, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image)),
        ScaledImage.

