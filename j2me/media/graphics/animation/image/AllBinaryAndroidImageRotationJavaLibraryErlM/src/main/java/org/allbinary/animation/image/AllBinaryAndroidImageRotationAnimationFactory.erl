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
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.game.configuration.GameConfigurationCentral
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.media.image.ImageCopyUtil
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo

-module('AllBinaryAndroidImageRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    put({This, angleIncrement}, 0),
    put({This, resizeCanvasForRotation}, false),
    ok.


% throws Exception
createFactory(Image, Width, Height, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height) ->
        'AllBinaryAndroidImageRotationAnimationFactory':new(Image, Width, Height, trunc(((get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}) / (fun(Target_N65956) -> (get({Target_N65956, '$class'})):getGameControlFidelity(Target_N65956) end)('GameConfigurationCentral':getInstance())))), AnimationBehaviorFactory, false).

% throws Exception
createFactoryA(Image, Width, Height, AngleIncrement, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement) ->
        'AllBinaryAndroidImageRotationAnimationFactory':new(Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, false).

% throws Exception
createFactoryU(Image, AnimationBehaviorFactory) ->
        AndroidImageRotationAnimationFactory = 'AllBinaryAndroidImageRotationAnimationFactory':new(Image, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image), trunc(((get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}) / (fun(Target_N66462) -> (get({Target_N66462, '$class'})):getGameControlFidelity(Target_N66462) end)('GameConfigurationCentral':getInstance())))), AnimationBehaviorFactory, false),
        (get({AndroidImageRotationAnimationFactory, '$class'})):init(AndroidImageRotationAnimationFactory, (-(((get({Image, '$class'})):getWidth(Image) bsr 2))), (-(((get({Image, '$class'})):getHeight(Image) bsr 2)))),
        AndroidImageRotationAnimationFactory.

% throws Exception
createFactoryDXYU(Image, Dx, Dy, AnimationBehaviorFactory) when is_integer(Dx), is_integer(Dy) ->
        AndroidImageRotationAnimationFactory = 'AllBinaryAndroidImageRotationAnimationFactory':new(Image, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image), trunc(((get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}) / (fun(Target_N66831) -> (get({Target_N66831, '$class'})):getGameControlFidelity(Target_N66831) end)('GameConfigurationCentral':getInstance())))), AnimationBehaviorFactory, false),
        (get({AndroidImageRotationAnimationFactory, '$class'})):init(AndroidImageRotationAnimationFactory, Dx, Dy),
        AndroidImageRotationAnimationFactory.

% throws Exception
createFactoryADXY(Image, Width, Height, Dx, Dy, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation) when is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy), is_integer(AngleIncrement), is_boolean(ResizeCanvasForRotation) ->
        AndroidImageRotationAnimationFactory = 'AllBinaryAndroidImageRotationAnimationFactory':new(Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation),
        (get({AndroidImageRotationAnimationFactory, '$class'})):init(AndroidImageRotationAnimationFactory, Dx, Dy),
        AndroidImageRotationAnimationFactory.

init(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        put({get({This, animationFactoryInitializationVisitor}), dx}, Dx),
        put({get({This, animationFactoryInitializationVisitor}), dy}, Dy),
        put({get({This, animationFactoryInitializationVisitor}), originalDx}, Dx),
        put({get({This, animationFactoryInitializationVisitor}), originalDy}, Dy).

new(Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement), is_boolean(ResizeCanvasForRotation) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation),
    This.

init(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement), is_boolean(ResizeCanvasForRotation) ->
        'BaseImageAnimationFactory':init(This, Image, 'PrimitiveIntUtil':getArrayInstance(), Width, Height, 0, 0, AnimationBehaviorFactory),
        init_fields(This),
        put({This, angleIncrement}, AngleIncrement),
        put({This, resizeCanvasForRotation}, ResizeCanvasForRotation).

% throws Exception
getCanvasImage(This) ->
        try
        Features = 'Features':getInstance(),
        case (get({This, resizeCanvasForRotation}) andalso (not (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})))) of
            true ->
            throw({'$return', (fun(Target_N68154) -> (get({Target_N68154, '$class'})):createImageScale(Target_N68154, (get({This, '$class'})):getImage(This), 1.44, false) end)('ImageCopyUtil':getInstance())});
            false ->
            throw({'$return', (get({This, '$class'})):getImage(This)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        try
        CanvasImage = (get({This, '$class'})):getCanvasImage(This),
        ScaledImage = (get({get({This, animationFactoryImageScaleUtil}), '$class'})):createImage(get({This, animationFactoryImageScaleUtil}), CanvasImage, get({get({This, animationFactoryInitializationVisitor}), width}), get({get({This, animationFactoryInitializationVisitor}), height}), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight})),
        CopyOfScaledImage = (fun(Target_N68448) -> (get({Target_N68448, '$class'})):createImage(Target_N68448, ScaledImage) end)('ImageCopyUtil':getInstance()),
        case ((get({get({This, animationFactoryInitializationVisitor}), dx}) =/= 0) orelse (get({get({This, animationFactoryInitializationVisitor}), dy}) =/= 0)) of
            true ->
            (get({get({This, animationFactoryImageScaleUtil}), '$class'})):processAdjust(get({This, animationFactoryImageScaleUtil}), This),
            throw({'$return', 'AllBinaryAdjustedAndroidImageRotationAnimation':new(ScaledImage, CopyOfScaledImage, 'AngleInfo':getInstance(get({This, angleIncrement})), get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}), get({get({This, animationFactoryInitializationVisitor}), dx}), get({get({This, animationFactoryInitializationVisitor}), dy}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))});
            false ->
            throw({'$return', 'AllBinaryFlickerAndroidImageRotationAnimation':new(ScaledImage, CopyOfScaledImage, 'AngleInfo':getInstance(get({This, angleIncrement})), get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

