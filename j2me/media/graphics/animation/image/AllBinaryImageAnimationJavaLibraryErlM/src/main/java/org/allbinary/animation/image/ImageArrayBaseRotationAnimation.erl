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
% import org.allbinary.animation.RotationAnimation
% import org.allbinary.graphics.Anchor
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.math.AngleInfo
% import org.allbinary.media.image.ImageModifierUtil
% import org.allbinary.util.CircularIndexUtil

-module('ImageArrayBaseRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, imageModifierUtil}, 'ImageModifierUtil':getInstanceOrCreate()),
    put({This, originalImageArray}, undefined),
    put({This, imageArray}, get({'NullImage', 'NULL_IMAGE_ARRAY'})),
    put({This, currentImage}, undefined),
    put({This, totalFrames}, 0),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


new(OriginalImageArray, AngleInfo, AnimationBehavior) when (is_tuple(OriginalImageArray) orelse OriginalImageArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, OriginalImageArray, AngleInfo, AnimationBehavior),
    This.

init(This, OriginalImageArray, AngleInfo, AnimationBehavior) when (is_tuple(OriginalImageArray) orelse OriginalImageArray =:= undefined) ->
        'RotationAnimation':init(This, AngleInfo, 'CircularIndexUtil':createInstance((360 / (fun(Target_N66130) -> (get({Target_N66130, '$class'})):getAngleIncrement(Target_N66130) end)((get({AngleInfo, '$class'})):getAngleIncrementInfo(AngleInfo)))), AnimationBehavior),
        init_fields(This),
        put({This, originalImageArray}, OriginalImageArray),
        (get({This, '$class'})):setImageArray(This, (get({get({This, imageModifierUtil}), '$class'})):getImageArray(get({This, imageModifierUtil}), OriginalImageArray)),
        put({This, currentImage}, array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, imageArray}))).

% throws Exception
getAnimationSize(This) ->
        (get({This, '$class'})):getSize(This).

setAlpha(This, Alpha) when is_integer(Alpha) ->
        case (get({This, alphaP}) =/= Alpha) of
            true ->
            'RotationAnimation':setAlpha(This, Alpha),
            (get({get({This, imageModifierUtil}), '$class'})):reset(get({This, imageModifierUtil})),
            Index = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
            (get({get({This, imageModifierUtil}), '$class'})):setAlpha(get({This, imageModifierUtil}), array:get(Index, get({This, originalImageArray})), array:get(Index, get({This, imageArray})), Index, get({This, alphaP}));
            false -> ok
        end.

nextRotation(This) ->
        'RotationAnimation':nextRotation(This),
        Index = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
        (get({get({This, imageModifierUtil}), '$class'})):setAlpha(get({This, imageModifierUtil}), array:get(Index, get({This, originalImageArray})), array:get(Index, get({This, imageArray})), Index, get({This, alphaP})),
        put({This, currentImage}, array:get(Index, get({This, imageArray}))).

previousRotation(This) ->
        'RotationAnimation':previousRotation(This),
        Index = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
        (get({get({This, imageModifierUtil}), '$class'})):setAlpha(get({This, imageModifierUtil}), array:get(Index, get({This, originalImageArray})), array:get(Index, get({This, imageArray})), Index, get({This, alphaP})),
        put({This, currentImage}, array:get(Index, get({This, imageArray}))).

setFrame(This, Index2) when is_integer(Index2) ->
        'RotationAnimation':setFrame(This, Index2),
        Index = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
        (get({get({This, imageModifierUtil}), '$class'})):setAlpha(get({This, imageModifierUtil}), array:get(Index, get({This, originalImageArray})), array:get(Index, get({This, imageArray})), Index, get({This, alphaP})),
        put({This, currentImage}, array:get(Index, get({This, imageArray}))).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

setImageArray(This, ImageArray) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
        put({This, imageArray}, ImageArray),
        put({This, totalFrames}, array:size(ImageArray)),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(get({This, totalFrames}))).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({Graphics, '$class'})):drawImage(Graphics, get({This, currentImage}), X, Y, get({This, anchor})).

% throws Exception
close(This) ->
        DisposalUtil = 'DisposalUtil':getInstance(),
        Size2 = array:size(get({This, imageArray})),
        lists:foreach(fun(Index) ->
            (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, array:get(Index, get({This, imageArray})))
        end, lists:seq(0, Size2 - 1)),
        Size = array:size(get({This, originalImageArray})),
        lists:foreach(fun(Index) ->
            (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, array:get(Index, get({This, originalImageArray})))
        end, lists:seq(0, Size - 1)),
        (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, get({This, currentImage})).

% throws Throwable
finalize(This) ->
        DisposalUtil = 'DisposalUtil':getInstance(),
        Size2 = array:size(get({This, imageArray})),
        lists:foreach(fun(Index) ->
            (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, array:get(Index, get({This, imageArray})))
        end, lists:seq(0, Size2 - 1)),
        Size = array:size(get({This, originalImageArray})),
        lists:foreach(fun(Index) ->
            (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, array:get(Index, get({This, originalImageArray})))
        end, lists:seq(0, Size - 1)),
        (get({DisposalUtil, '$class'})):disposeImage(DisposalUtil, get({This, currentImage})).

