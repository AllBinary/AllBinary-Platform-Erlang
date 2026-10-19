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
% package org.allbinary.animation.image
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.math.AngleInfo
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.media.image.ImageCopyUtil
% import org.allbinary.media.image.ImageModifierUtil
% import org.allbinary.media.image.ImageRotationUtil
% import org.microemu.device.playn.PlaynMutableImage
% import playn.core.Canvas
% import playn.core.ImageImpl
% import playn.core.PlayN
% import playn.html.HtmlGraphics
% import playn.html.HtmlImage

-module('AllBinaryHTMLImageRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageBaseRotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, imageRotationUtil}, 'ImageRotationUtil':getInstance()),
    put({This, imageModifierUtil}, 'ImageModifierUtil':getInstanceOrCreate()),
    put({This, originalImage}, undefined),
    put({This, twoImages}, array:new(2, {default, undefined})),
    put({This, canvasSurfaceArray}, array:new(2, {default, undefined})),
    put({This, imageToShow}, undefined),
    put({This, bufferedImageIndex}, 0),
    put({This, alphaProcessor}, 'AlphaBaseProcessor':getInstance()),
    ok.


new(OriginalImage, Image, AngleInfo, TotalAngle, AnimationBehavior) when is_integer(TotalAngle) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, OriginalImage, Image, AngleInfo, TotalAngle, AnimationBehavior),
    This.

init(This, OriginalImage, Image, AngleInfo, TotalAngle, AnimationBehavior) when is_integer(TotalAngle) ->
        'ImageBaseRotationAnimation':init(This, Image, AngleInfo, TotalAngle, AnimationBehavior),
        init_fields(This),
        put({This, originalImage}, OriginalImage),
        put({This, imageToShow}, Image),
        put({This, twoImages}, array:set(0, Image, get({This, twoImages}))),
        put({This, twoImages}, array:set(1, (fun(Target_N66482) -> (get({Target_N66482, '$class'})):createImage(Target_N66482, Image) end)('ImageCopyUtil':getInstance()), get({This, twoImages}))),
        put({This, canvasSurfaceArray}, array:set(0, (get({This, '$class'})):getCanvasSurface(This, array:get(0, get({This, twoImages}))), get({This, canvasSurfaceArray}))),
        put({This, canvasSurfaceArray}, array:set(1, (get({This, '$class'})):getCanvasSurface(This, array:get(1, get({This, twoImages}))), get({This, canvasSurfaceArray}))).

getCanvasSurface(This, Image) ->
        HtmlImage = Image,
        CanvasImage = (get({HtmlImage, '$class'})):getImage(HtmlImage),
        PlayN = 'PlayN':getInstance(),
        Canvas = (fun(Target_N66981) -> (get({Target_N66981, '$class'})):get(Target_N66981, CanvasImage) end)(((get({PlayN, '$class'})):graphics(PlayN))),
        (get({Canvas, '$class'})):translate(Canvas, ((get({get({This, originalImage}), '$class'})):getWidth(get({This, originalImage})) / 2), ((get({get({This, originalImage}), '$class'})):getHeight(get({This, originalImage})) / 2)),
        Canvas.

setBasicColorP(This, BasicColor) ->
        put({local, changed}, false),
        case (((get({This, '$class'})):getBasicColorP(This) =:= undefined) orelse ((fun(Target_N67265) -> (get({Target_N67265, '$class'})):intValue(Target_N67265) end)((get({This, '$class'})):getBasicColorP(This)) =/= (get({BasicColor, '$class'})):intValue(BasicColor))) of
            true ->
            put({local, changed}, true);
            false -> ok
        end,
        'ImageBaseRotationAnimation':setBasicColorP(This, BasicColor),
        case get({local, changed}) of
            true ->
            (get({This, '$class'})):updateImage(This);
            false -> ok
        end.

setAlpha(This, Alpha) when is_integer(Alpha) ->
        put({local, changed}, false),
        case (get({This, alphaP}) =/= Alpha) of
            true ->
            put({local, changed}, true);
            false -> ok
        end,
        'ImageBaseRotationAnimation':setAlpha(This, Alpha),
        case get({local, changed}) of
            true ->
            put({This, alphaProcessor}, 'AlphaProcessor':getInstance()),
            (get({This, '$class'})):updateImage(This);
            false -> ok
        end.

nextRotation(This) ->
        'ImageBaseRotationAnimation':nextRotation(This),
        (get({This, '$class'})):updateImage(This).

previousRotation(This) ->
        'ImageBaseRotationAnimation':previousRotation(This),
        (get({This, '$class'})):updateImage(This).

updateImage(This) ->
        CanvasSurface = array:get(get({This, bufferedImageIndex}), get({This, canvasSurfaceArray})),
        (get({CanvasSurface, '$class'})):save(CanvasSurface),
        (get({get({This, imageRotationUtil}), '$class'})):rotateImageCanvasSurfaceClear(get({This, imageRotationUtil}), get({This, originalImage}), array:get(get({This, bufferedImageIndex}), get({This, twoImages})), CanvasSurface, ((get({get({This, angleInfo}), '$class'})):getAngle(get({This, angleInfo})) + 90)),
        (get({get({This, alphaProcessor}), '$class'})):setAlpha(get({This, alphaProcessor}), get({This, imageModifierUtil}), get({This, originalImage}), array:get(get({This, bufferedImageIndex}), get({This, twoImages})), get({This, alphaP})),
        (get({get({This, imageRotationUtil}), '$class'})):drawImage(get({This, imageRotationUtil}), get({This, originalImage}), get({This, imageToShow}), CanvasSurface),
        (get({CanvasSurface, '$class'})):restore(CanvasSurface),
        (get({This, '$class'})):swap(This).

setFrame(This, Index) when is_integer(Index) ->
        'ImageBaseRotationAnimation':setFrame(This, Index),
        (get({This, '$class'})):updateImage(This).

swap(This) ->
        put({This, imageToShow}, array:get(get({This, bufferedImageIndex}), get({This, twoImages}))),
        case (get({This, bufferedImageIndex}) =:= 0) of
            true ->
            put({This, bufferedImageIndex}, 1);
            false ->
            put({This, bufferedImageIndex}, 0)
        end.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({Graphics, '$class'})):drawImage(Graphics, get({This, imageToShow}), X, Y, get({This, anchor})).

