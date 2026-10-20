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
% import org.microemu.device.playn.PlaynImmutableImage
% import org.microemu.device.playn.PlaynMutableImage
% import playn.core.CanvasImage
% import playn.core.CanvasSurface

-module('ImageRotationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageRotationUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ImageRotationUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

rotateImage(This, OriginalImage, Image, TotalAngle) when is_integer(TotalAngle) ->
        try
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            HtmlImage = Image,
            CanvasImage = (get({HtmlImage, '$class'})):getImage(HtmlImage),
            CanvasSurface = (get({HtmlImage, '$class'})):getCanvasSurface(HtmlImage, CanvasImage),
            (get({CanvasSurface, '$class'})):translate(CanvasSurface, ((get({OriginalImage, '$class'})):getWidth(OriginalImage) / 2), ((get({OriginalImage, '$class'})):getHeight(OriginalImage) / 2)),
            Image2 = (get({This, '$class'})):rotateImageCanvasSurface(This, OriginalImage, Image, CanvasSurface, TotalAngle),
            (get({This, '$class'})):drawImage(This, OriginalImage, Image, CanvasSurface),
            throw({'$return', Image2});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

rotateImageCanvasSurfaceClear(This, OriginalImage, Image, CanvasSurface, TotalAngle) when is_integer(TotalAngle) ->
        try
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            (get({CanvasSurface, '$class'})):translate(CanvasSurface, ((-(get({OriginalImage, '$class'})):getWidth(OriginalImage)) / 2), ((-(get({OriginalImage, '$class'})):getHeight(OriginalImage)) / 2)),
            (get({CanvasSurface, '$class'})):clear(CanvasSurface),
            (get({CanvasSurface, '$class'})):translate(CanvasSurface, ((get({OriginalImage, '$class'})):getWidth(OriginalImage) / 2), ((get({OriginalImage, '$class'})):getHeight(OriginalImage) / 2)),
            throw({'$return', (get({This, '$class'})):rotateImageCanvasSurface(This, OriginalImage, Image, CanvasSurface, TotalAngle)});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

rotateImageCanvasSurface(This, OriginalImage, Image, CanvasSurface, TotalAngle) when is_integer(TotalAngle) ->
        try
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            (get({CanvasSurface, '$class'})):rotate(CanvasSurface, float(((TotalAngle) * math:pi() / 180))),
            throw({'$return', Image});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

drawImage(This, OriginalImage, Image, CanvasSurface) ->
        put({local, originalPlayNImage}, undefined),
        case (get({OriginalImage, '$class'})):isMutable(OriginalImage) of
            true ->
            put({local, originalHTMLImage}, OriginalImage),
            put({local, originalPlayNImage}, (get({get({local, originalHTMLImage}), '$class'})):getImage(get({local, originalHTMLImage})));
            false ->
            put({local, originalHTMLImage}, OriginalImage),
            put({local, originalPlayNImage}, (get({get({local, originalHTMLImage}), '$class'})):getImage(get({local, originalHTMLImage})))
        end,
        (get({CanvasSurface, '$class'})):drawImage(CanvasSurface, get({local, originalPlayNImage}), ((-(get({OriginalImage, '$class'})):getWidth(OriginalImage)) / 2), ((-(get({OriginalImage, '$class'})):getHeight(OriginalImage)) / 2)).

% throws Exception
createRotatedImage(This, OriginalImage, RotationInDegrees) when is_integer(RotationInDegrees) ->
        Image = (fun(Target_N67523) -> (get({Target_N67523, '$class'})):createImageWH(Target_N67523, (get({OriginalImage, '$class'})):getWidth(OriginalImage), (get({OriginalImage, '$class'})):getHeight(OriginalImage)) end)('ImageCreationUtil':getInstance()),
        RotatedImage = (get({This, '$class'})):rotateImage(This, OriginalImage, Image, RotationInDegrees),
        case (RotatedImage =:= undefined) of
            true ->
            erlang:error({'Exception', "Not Mutable"});
            false -> ok
        end,
        RotatedImage.

