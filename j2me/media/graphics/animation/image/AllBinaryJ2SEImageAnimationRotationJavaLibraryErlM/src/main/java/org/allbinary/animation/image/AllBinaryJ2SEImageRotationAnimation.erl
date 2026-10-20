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
% import javax.microedition.lcdui.NullImage
% import org.allbinary.DisposalUtil
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.math.AngleInfo
% import org.allbinary.media.image.ImageCopyUtil
% import org.allbinary.media.image.ImageModifierUtil
% import org.allbinary.media.image.ImageRotationUtil

-module('AllBinaryJ2SEImageRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageBaseRotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, imageRotationUtil}, 'ImageRotationUtil':getInstance()),
    put({This, imageModifierUtil}, 'ImageModifierUtil':getInstanceOrCreate()),
    put({This, realOriginalImage}, undefined),
    put({This, originalImageArray}, array:new(1, {default, undefined})),
    put({This, twoImages}, array:new(2, {default, undefined})),
    put({This, imageToShow}, undefined),
    put({This, bufferedImageIndex}, 0),
    put({This, lastScaleX}, 1.0),
    put({This, lastScaleY}, 1.0),
    put({This, scaleX}, 1.0),
    put({This, scaleY}, 1.0),
    put({This, maxScaleX}, 0.0),
    put({This, maxScaleY}, 0.0),
    put({This, alphaProcessor}, 'ModifierBaseProcessor':getInstance()),
    put({This, setColorProcessor}, 'ModifierBaseProcessor':getInstance()),
    put({This, changeColorProcessor}, 'ModifierBaseProcessor':getInstance()),
    put({This, scaleProcessor}, 'ScaleProcessor':getInstance()),
    ok.


new(OriginalImage, Image, AngleInfo, TotalAngle, AnimationBehavior) when is_integer(TotalAngle) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, OriginalImage, Image, AngleInfo, TotalAngle, AnimationBehavior),
    This.

'$init'(This, OriginalImage, Image, AngleInfo, TotalAngle, AnimationBehavior) when is_integer(TotalAngle) ->
        'ImageBaseRotationAnimation':'$init'(This, Image, AngleInfo, TotalAngle, AnimationBehavior),
        init_fields(This),
        put({This, realOriginalImage}, OriginalImage),
        put({This, originalImageArray}, array:set(0, OriginalImage, get({This, originalImageArray}))),
        put({This, imageToShow}, Image),
        put({This, twoImages}, array:set(0, Image, get({This, twoImages}))),
        put({This, twoImages}, array:set(1, (fun(Target_N66743) -> (get({Target_N66743, '$class'})):createImageForRotation(Target_N66743, Image) end)('ImageCopyUtil':getInstance()), get({This, twoImages}))).

setBasicColorP(This, BasicColor) ->
        put({local, changed}, false),
        case (((get({This, '$class'})):getBasicColorP(This) =:= undefined) orelse ((fun(Target_N66993) -> (get({Target_N66993, '$class'})):intValue(Target_N66993) end)((get({This, '$class'})):getBasicColorP(This)) =/= (get({BasicColor, '$class'})):intValue(BasicColor))) of
            true ->
            put({local, changed}, true);
            false -> ok
        end,
        'ImageBaseRotationAnimation':setBasicColorP(This, BasicColor),
        case get({local, changed}) of
            true ->
            put({This, setColorProcessor}, 'SetColorProcessor':getInstance()),
            (get({This, '$class'})):updateImage(This);
            false -> ok
        end.

changeBasicColor(This, BasicColor) ->
        put({local, changed}, false),
        case (((get({This, '$class'})):getChangeBasicColor(This) =:= undefined) orelse ((fun(Target_N67275) -> (get({Target_N67275, '$class'})):intValue(Target_N67275) end)((get({This, '$class'})):getChangeBasicColor(This)) =/= (get({BasicColor, '$class'})):intValue(BasicColor))) of
            true ->
            put({local, changed}, true);
            false -> ok
        end,
        'ImageBaseRotationAnimation':changeBasicColor(This, BasicColor),
        case get({local, changed}) of
            true ->
            put({This, changeColorProcessor}, 'ChangeColorProcessor':getInstance()),
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

setScale(This, ScaleX, ScaleY) when is_number(ScaleX), is_number(ScaleY) ->
        put({This, scaleX}, ScaleX),
        put({This, scaleY}, ScaleY),
        case ((get({This, scaleX}) =/= get({This, lastScaleX})) orelse (get({This, scaleY}) =/= get({This, lastScaleY}))) of
            true ->
            (get({get({This, scaleProcessor}), '$class'})):update(get({This, scaleProcessor}), get({This, realOriginalImage}), get({This, originalImageArray}), get({This, twoImages}), get({This, bufferedImageIndex}), get({This, scaleX}), get({This, scaleY}), get({This, maxScaleX}), get({This, maxScaleY})),
            (get({This, '$class'})):updateImage(This);
            false -> ok
        end,
        put({This, lastScaleX}, get({This, scaleX})),
        put({This, lastScaleY}, get({This, scaleY})).

setMaxScale(This, MaxScaleX, MaxScaleY) when is_number(MaxScaleX), is_number(MaxScaleY) ->
        put({This, maxScaleX}, MaxScaleX),
        put({This, maxScaleY}, MaxScaleY),
        (get({get({This, scaleProcessor}), '$class'})):update(get({This, scaleProcessor}), get({This, realOriginalImage}), get({This, originalImageArray}), get({This, twoImages}), get({This, bufferedImageIndex}), get({This, scaleX}), get({This, scaleY}), get({This, maxScaleX}), get({This, maxScaleY})),
        (get({This, '$class'})):updateImage(This).

nextRotation(This) ->
        'ImageBaseRotationAnimation':nextRotation(This),
        (get({This, '$class'})):updateImage(This).

previousRotation(This) ->
        'ImageBaseRotationAnimation':previousRotation(This),
        (get({This, '$class'})):updateImage(This).

updateImage(This) ->
        (get({get({This, imageRotationUtil}), '$class'})):rotateImage(get({This, imageRotationUtil}), array:get(0, get({This, originalImageArray})), array:get(get({This, bufferedImageIndex}), get({This, twoImages})), ((get({get({This, angleInfo}), '$class'})):getAngle(get({This, angleInfo})) + 90)),
        (get({get({This, alphaProcessor}), '$class'})):updateAlpha(get({This, alphaProcessor}), get({This, imageModifierUtil}), get({'NullImage', 'NULL_IMAGE'}), array:get(get({This, bufferedImageIndex}), get({This, twoImages})), 0, get({This, alphaP})),
        (get({get({This, setColorProcessor}), '$class'})):updateColor(get({This, setColorProcessor}), get({This, imageModifierUtil}), get({'NullImage', 'NULL_IMAGE'}), array:get(get({This, bufferedImageIndex}), get({This, twoImages})), 0, get({This, basicColor})),
        (get({get({This, changeColorProcessor}), '$class'})):updateColor(get({This, changeColorProcessor}), get({This, imageModifierUtil}), get({'NullImage', 'NULL_IMAGE'}), array:get(get({This, bufferedImageIndex}), get({This, twoImages})), 0, get({This, changeBasicColorP})),
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

% throws Exception
close(This) ->
        'ImageBaseRotationAnimation':close(This),
        DisposalUtil = 'DisposalUtil':getInstance(),
        Size2 = array:size(get({This, twoImages})),
        lists:foreach(fun(Index) ->
            (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, array:get(Index, get({This, twoImages})))
        end, lists:seq(0, Size2 - 1)),
        Size = array:size(get({This, originalImageArray})),
        lists:foreach(fun(Index) ->
            (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, array:get(Index, get({This, originalImageArray})))
        end, lists:seq(0, Size - 1)),
        (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, get({This, realOriginalImage})),
        (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, get({This, imageToShow})).

% throws Throwable
finalize(This) ->
        'ImageBaseRotationAnimation':finalize(This),
        DisposalUtil = 'DisposalUtil':getInstance(),
        Size2 = array:size(get({This, twoImages})),
        lists:foreach(fun(Index) ->
            (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, array:get(Index, get({This, twoImages})))
        end, lists:seq(0, Size2 - 1)),
        Size = array:size(get({This, originalImageArray})),
        lists:foreach(fun(Index) ->
            (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, array:get(Index, get({This, originalImageArray})))
        end, lists:seq(0, Size - 1)),
        (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, get({This, realOriginalImage})),
        (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, get({This, imageToShow})).

