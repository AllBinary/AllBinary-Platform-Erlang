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
% package org.allbinary.media.image
% import javax.microedition.lcdui.Image
% import org.allbinary.image.ImageCache
% import org.microemu.device.playn.PlaynImmutableImage
% import org.microemu.device.playn.PlaynMutableImage
% import playn.core.CanvasImage
% import playn.core.CanvasSurface

-module('ImageScaleUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageScaleUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ImageScaleUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
createImage2(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached) when is_number(ScaleNominatorX), is_number(ScaleDenominatorX), is_number(ScaleNominatorY), is_number(ScaleDenominatorY), is_boolean(Cached) ->
        (get({This, '$class'})):createImage3(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached, true).

% throws Exception
createImage3(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached, Mutable) when is_number(ScaleNominatorX), is_number(ScaleDenominatorX), is_number(ScaleNominatorY), is_number(ScaleDenominatorY), is_boolean(Cached), is_boolean(Mutable) ->
        ScaleX = (ScaleNominatorX / ScaleDenominatorX),
        ScaleY = (ScaleNominatorY / ScaleDenominatorY),
        (get({This, '$class'})):createImage(This, ImageCache, OriginalImage, ScaleX, ScaleY, Cached).

% throws Exception
createImage(This, ImageCache, OriginalImage, ScaleX, ScaleY, Cached) when is_number(ScaleX), is_number(ScaleY), is_boolean(Cached) ->
        (get({This, '$class'})):createImageInternal(This, OriginalImage, ScaleX, ScaleY).

% throws Exception
createImageInternal(This, OriginalImage, ScaleX, ScaleY) when is_number(ScaleX), is_number(ScaleY) ->
        try
        Image = (fun(Target_N66729) -> (get({Target_N66729, '$class'})):createImageWH(Target_N66729, trunc((((get({OriginalImage, '$class'})):getWidth(OriginalImage) * ScaleX))), trunc((((get({OriginalImage, '$class'})):getHeight(OriginalImage) * ScaleY)))) end)('ImageCreationUtil':getInstance()),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            put({local, originalPlayNImage}, undefined),
            case (get({OriginalImage, '$class'})):isMutable(OriginalImage) of
                true ->
                put({local, originalHTMLImage}, OriginalImage),
                put({local, originalPlayNImage}, (get({get({local, originalHTMLImage}), '$class'})):getImage(get({local, originalHTMLImage})));
                false ->
                put({local, originalHTMLImage}, OriginalImage),
                put({local, originalPlayNImage}, (get({get({local, originalHTMLImage}), '$class'})):getImage(get({local, originalHTMLImage})))
            end,
            HtmlImage = Image,
            CanvasImage = (get({HtmlImage, '$class'})):getImage(HtmlImage),
            CanvasSurface = (get({HtmlImage, '$class'})):getCanvasSurface(HtmlImage, CanvasImage),
            (get({CanvasSurface, '$class'})):drawImage(CanvasSurface, get({local, originalPlayNImage}), 0, 0, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image), 0, 0, (get({OriginalImage, '$class'})):getWidth(OriginalImage), (get({OriginalImage, '$class'})):getHeight(OriginalImage)),
            throw({'$return', Image});
            false ->
            erlang:error({'Exception', "Not Mutable"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

