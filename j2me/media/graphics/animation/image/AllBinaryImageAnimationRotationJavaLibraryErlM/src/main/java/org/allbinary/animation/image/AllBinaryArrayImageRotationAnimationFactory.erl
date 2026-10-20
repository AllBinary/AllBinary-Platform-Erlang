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
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullImage
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.game.configuration.GameConfigurationCentral
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.media.image.ImageToRotationImageArrayUtil

-module('AllBinaryArrayImageRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    put({This, imageArray}, get({'NullImage', 'NULL_IMAGE_ARRAY'})),
    put({This, angleIncrement}, 0),
    ok.


% throws Exception
createFactory(Image, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        ArrayImageRotationAnimationFactory = 'AllBinaryArrayImageRotationAnimationFactory':new(Image, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image), (get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}) / (fun(Target_N66018) -> (get({Target_N66018, '$class'})):getGameControlFidelity(Target_N66018) end)('GameConfigurationCentral':getInstance())), 'AnimationBehaviorFactory':getInstance()),
        (get({ArrayImageRotationAnimationFactory, '$class'})):initDXY(ArrayImageRotationAnimationFactory, Dx, Dy),
        ArrayImageRotationAnimationFactory.

% throws Exception
createFactoryA(Image, Dx, Dy, AngleIncrement) when is_integer(Dx), is_integer(Dy), is_integer(AngleIncrement) ->
        ArrayImageRotationAnimationFactory = 'AllBinaryArrayImageRotationAnimationFactory':new(Image, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image), AngleIncrement, 'AnimationBehaviorFactory':getInstance()),
        (get({ArrayImageRotationAnimationFactory, '$class'})):initDXY(ArrayImageRotationAnimationFactory, Dx, Dy),
        ArrayImageRotationAnimationFactory.

new(Image, Width, Height, AngleIncrement, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory),
    This.

'$init'(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement) ->
        'BaseImageAnimationFactory':'$init'(This, Image, 'PrimitiveIntUtil':getArrayInstance(), Width, Height, 0, 0, AnimationBehaviorFactory),
        init_fields(This),
        put({This, angleIncrement}, AngleIncrement),
        (get({This, '$class'})):init(This).

% throws Exception
init(This) ->
        (get({This, '$class'})):setImageArray(This, (fun(Target_N66806) -> (get({Target_N66806, '$class'})):generate(Target_N66806, (get({This, '$class'})):getImage(This), (get({This, '$class'})):getAngleIncrement(This), trunc(get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}))) end)('ImageToRotationImageArrayUtil':getInstance())).

initDXY(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        put({get({This, animationFactoryInitializationVisitor}), dx}, Dx),
        put({get({This, animationFactoryInitializationVisitor}), dy}, Dy),
        put({get({This, animationFactoryInitializationVisitor}), originalDx}, Dx),
        put({get({This, animationFactoryInitializationVisitor}), originalDy}, Dy).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        try
        ScaledImageArray = array:new(array:size(get({This, imageArray})), {default, undefined}),
        Size = array:size(ScaledImageArray),
        Image = (get({This, '$class'})):getImage(This),
        lists:foreach(fun(Index) ->
            array:set(Index, (get({get({This, animationFactoryImageScaleUtil}), '$class'})):createImage(get({This, animationFactoryImageScaleUtil}), Image, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight})), ScaledImageArray)
        end, lists:seq(0, Size - 1)),
        case ((get({get({This, animationFactoryInitializationVisitor}), dx}) =/= 0) orelse (get({get({This, animationFactoryInitializationVisitor}), dy}) =/= 0)) of
            true ->
            (get({get({This, animationFactoryImageScaleUtil}), '$class'})):processAdjust(get({This, animationFactoryImageScaleUtil}), This),
            throw({'$return', 'AdjustedImageArrayRotationAnimation':new(ScaledImageArray, 'AngleInfo':getInstance((get({This, '$class'})):getAngleIncrement(This)), trunc(get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'})), get({get({This, animationFactoryInitializationVisitor}), dx}), get({get({This, animationFactoryInitializationVisitor}), dy}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))});
            false ->
            throw({'$return', 'ImageArrayRotationAnimation':new(ScaledImageArray, 'AngleInfo':getInstance((get({This, '$class'})):getAngleIncrement(This)), trunc(get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'})), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setImageArray(This, ImageArray) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
        put({This, imageArray}, ImageArray).

getAngleIncrement(This) ->
        get({This, angleIncrement}).

