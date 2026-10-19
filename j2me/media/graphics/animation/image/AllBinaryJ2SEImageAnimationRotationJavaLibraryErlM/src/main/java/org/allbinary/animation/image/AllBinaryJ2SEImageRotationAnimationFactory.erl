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
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.graphics.opengles.OpenGLUtil
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.media.image.ImageCopyUtil

-module('AllBinaryJ2SEImageRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    put({This, angleIncrementP}, 0),
    put({This, resizeCanvasForRotation}, false),
    ok.


% throws Exception
createDXY(Image, Width, Height, Dx, Dy, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation) when is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy), is_integer(AngleIncrement), is_boolean(ResizeCanvasForRotation) ->
        ImageRotationAnimationFactory = 'AllBinaryJ2SEImageRotationAnimationFactory':new(Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation),
        put({get({ImageRotationAnimationFactory, animationFactoryInitializationVisitor}), dx}, Dx),
        put({get({ImageRotationAnimationFactory, animationFactoryInitializationVisitor}), dy}, Dy),
        put({get({ImageRotationAnimationFactory, animationFactoryInitializationVisitor}), originalDx}, Dx),
        put({get({ImageRotationAnimationFactory, animationFactoryInitializationVisitor}), originalDy}, Dy),
        ImageRotationAnimationFactory.

new(Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement), is_boolean(ResizeCanvasForRotation) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation),
    This.

init(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement), is_boolean(ResizeCanvasForRotation) ->
        'BaseImageAnimationFactory':init(This, Image, 'PrimitiveIntUtil':getArrayInstance(), Width, Height, 0, 0, AnimationBehaviorFactory),
        init_fields(This),
        put({This, angleIncrementP}, AngleIncrement),
        put({This, resizeCanvasForRotation}, ResizeCanvasForRotation).

% throws Exception
getCanvasImage(This) ->
        try
        Features = 'Features':getInstance(),
        case (get({This, resizeCanvasForRotation}) andalso (not (get({Features, '$class'})):isDefault(Features, get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})))) of
            true ->
            throw({'$return', (fun(Target_N66866) -> (get({Target_N66866, '$class'})):createImageScale(Target_N66866, (get({This, '$class'})):getImage(This), 1.44, false) end)('ImageCopyUtil':getInstance())});
            false ->
            throw({'$return', (get({This, '$class'})):getImage(This)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        try
        ImageCopyUtil = 'ImageCopyUtil':getInstance(),
        CanvasImage = (get({This, '$class'})):getCanvasImage(This),
        put({local, scaledImage}, (get({get({This, animationFactoryImageScaleUtil}), '$class'})):createImage(get({This, animationFactoryImageScaleUtil}), CanvasImage, get({get({This, animationFactoryInitializationVisitor}), width}), get({get({This, animationFactoryInitializationVisitor}), height}), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight}))),
        OpenGLUtil = 'OpenGLUtil':getInstance(),
        put({local, scaledImage}, (get({OpenGLUtil, '$class'})):addImage(OpenGLUtil, get({local, scaledImage}))),
        CopyOfScaledImage = (get({ImageCopyUtil, '$class'})):createImageForRotation(ImageCopyUtil, get({local, scaledImage})),
        case ((get({get({This, animationFactoryInitializationVisitor}), dx}) =/= 0) orelse (get({get({This, animationFactoryInitializationVisitor}), dy}) =/= 0)) of
            true ->
            (get({get({This, animationFactoryImageScaleUtil}), '$class'})):processAdjust(get({This, animationFactoryImageScaleUtil}), This),
            throw({'$return', 'AllBinaryAdjustedJ2SEImageRotationAnimation':new(get({local, scaledImage}), CopyOfScaledImage, 'AngleInfo':getInstance(get({This, angleIncrementP})), get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}), get({get({This, animationFactoryInitializationVisitor}), dx}), get({get({This, animationFactoryInitializationVisitor}), dy}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))});
            false ->
            throw({'$return', 'AllBinaryJ2SEImageRotationAnimation':new(get({local, scaledImage}), CopyOfScaledImage, 'AngleInfo':getInstance(get({This, angleIncrementP})), get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getAngleIncrement(This) ->
        get({This, angleIncrementP}).

