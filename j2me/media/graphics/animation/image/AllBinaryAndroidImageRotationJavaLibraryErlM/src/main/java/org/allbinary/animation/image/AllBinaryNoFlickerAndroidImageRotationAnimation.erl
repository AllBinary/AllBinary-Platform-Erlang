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
% import android.graphics.Matrix
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.Graphics
% import org.allbinary.math.AngleInfo
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.media.image.AndroidImageUtil
% import org.allbinary.media.image.ImageCopyUtil
% import org.allbinary.media.image.ImageModifierUtil

-module('AllBinaryNoFlickerAndroidImageRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageBaseRotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, imageModifierUtil}, 'ImageModifierUtil':getInstanceOrCreate()),
    put({This, androidImageUtil}, 'AndroidImageUtil':getInstance()),
    put({This, matrix}, 'Matrix':new()),
    put({This, halfWidth}, 0),
    put({This, halfHeight}, 0),
    put({This, increment}, 0),
    put({This, originalImage}, undefined),
    put({This, twoImages}, array:new(2, {default, undefined})),
    put({This, imageToShow}, undefined),
    put({This, bufferedImageIndex}, 0),
    ok.


new(OriginalImage, Image, AngleInfo, TotalAngle, AnimationBehavior) when is_integer(TotalAngle) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, OriginalImage, Image, AngleInfo, TotalAngle, AnimationBehavior),
    This.

'$init'(This, OriginalImage, Image, AngleInfo, TotalAngle, AnimationBehavior) when is_integer(TotalAngle) ->
        'ImageBaseRotationAnimation':'$init'(This, Image, AngleInfo, TotalAngle, AnimationBehavior),
        init_fields(This),
        put({This, originalImage}, OriginalImage),
        put({This, halfWidth}, (((get({Image, '$class'})):getWidth(Image) bsr 1))),
        put({This, halfHeight}, (((get({Image, '$class'})):getHeight(Image) bsr 1))),
        put({This, increment}, trunc(((fun(Target_N66432) -> (get({Target_N66432, '$class'})):getAngleIncrement(Target_N66432) end)((get({get({This, angleInfo}), '$class'})):getAngleIncrementInfo(get({This, angleInfo})))))),
        put({This, imageToShow}, Image),
        put({This, twoImages}, array:set(0, Image, get({This, twoImages}))),
        put({This, twoImages}, array:set(1, (fun(Target_N66561) -> (get({Target_N66561, '$class'})):createImage(Target_N66561, Image) end)('ImageCopyUtil':getInstance()), get({This, twoImages}))).

setBasicColorP(This, BasicColor) ->
        put({local, changed}, false),
        case (((get({This, '$class'})):getBasicColorP(This) =:= undefined) orelse ((fun(Target_N66807) -> (get({Target_N66807, '$class'})):intValue(Target_N66807) end)((get({This, '$class'})):getBasicColorP(This)) =/= (get({BasicColor, '$class'})):intValue(BasicColor))) of
            true ->
            (get({get({This, imageModifierUtil}), '$class'})):setColor(get({This, imageModifierUtil}), get({This, originalImage}), get({This, imageToShow}), 0, BasicColor),
            put({local, changed}, true);
            false -> ok
        end,
        'ImageBaseRotationAnimation':setBasicColorP(This, BasicColor),
        case get({local, changed}) of
            true ->
            (get({get({This, matrix}), '$class'})):setRotate(get({This, matrix}), 0.0, float(get({This, halfWidth})), float(get({This, halfHeight}))),
            (get({This, '$class'})):updateImage(This);
            false -> ok
        end.

changeBasicColor(This, BasicColor) ->
        (get({This, '$class'})):setBasicColorP(This, BasicColor).

setAlpha(This, Alpha) when is_integer(Alpha) ->
        put({local, changed}, false),
        case (get({This, alphaP}) =/= Alpha) of
            true ->
            put({local, changed}, true);
            false -> ok
        end,
        'ImageBaseRotationAnimation':setAlpha(This, Alpha),
        (get({get({This, imageModifierUtil}), '$class'})):setAlpha(get({This, imageModifierUtil}), get({This, originalImage}), get({This, imageToShow}), 0, get({This, alphaP})),
        case get({local, changed}) of
            true ->
            (get({get({This, matrix}), '$class'})):setRotate(get({This, matrix}), 0.0, float(get({This, halfWidth})), float(get({This, halfHeight}))),
            (get({This, '$class'})):updateImage(This);
            false -> ok
        end.

nextRotation(This) ->
        'ImageBaseRotationAnimation':nextRotation(This),
        (get({get({This, matrix}), '$class'})):setRotate(get({This, matrix}), float(get({This, increment})), float(get({This, halfWidth})), float(get({This, halfHeight}))),
        (get({This, '$class'})):updateImage(This).

previousRotation(This) ->
        'ImageBaseRotationAnimation':previousRotation(This),
        (get({get({This, matrix}), '$class'})):setRotate(get({This, matrix}), float((-get({This, increment}))), float(get({This, halfWidth})), float(get({This, halfHeight}))),
        (get({This, '$class'})):updateImage(This).

updateImage(This) ->
        (get({get({This, androidImageUtil}), '$class'})):rotate(get({This, androidImageUtil}), array:get(get({This, bufferedImageIndex}), get({This, twoImages})), get({This, originalImage}), get({This, matrix}), get({get({This, imageModifierUtil}), paint})),
        (get({This, '$class'})):swap(This).

setFrame(This, Index) when is_integer(Index) ->
        CurrentFrame = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
        (get({get({This, circularIndexUtil}), '$class'})):setIndex(get({This, circularIndexUtil}), Index),
        NewFrame = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), NewFrame),
        (get({get({This, matrix}), '$class'})):setRotate(get({This, matrix}), (float(((NewFrame - CurrentFrame))) * float(get({This, increment}))), float(get({This, halfWidth})), float(get({This, halfHeight}))),
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

