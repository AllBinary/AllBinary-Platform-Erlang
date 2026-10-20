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
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.media.image.ImageCopyUtil
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo

-module('AllBinaryHTMLImageRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    put({This, angleIncrement}, 0),
    ok.


% throws Exception
createFactoryADXY(Image, Width, Height, Dx, Dy, AngleIncrement, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy), is_integer(AngleIncrement) ->
        HtmlImageRotationAnimationFactory = 'AllBinaryHTMLImageRotationAnimationFactory':new(Image, Width, Height, AngleIncrement, AnimationBehaviorFactory),
        (get({HtmlImageRotationAnimationFactory, '$class'})):init(HtmlImageRotationAnimationFactory, Dx, Dy),
        HtmlImageRotationAnimationFactory.

new(Image, Width, Height, AngleIncrement, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory),
    This.

'$init'(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement) ->
        'BaseImageAnimationFactory':'$init'(This, Image, 'PrimitiveIntUtil':getArrayInstance(), Width, Height, 0, 0, AnimationBehaviorFactory),
        init_fields(This),
        put({This, angleIncrement}, AngleIncrement).

init(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        put({get({This, animationFactoryInitializationVisitor}), dx}, Dx),
        put({get({This, animationFactoryInitializationVisitor}), dy}, Dy),
        put({get({This, animationFactoryInitializationVisitor}), originalDx}, Dx),
        put({get({This, animationFactoryInitializationVisitor}), originalDy}, Dy).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        try
        ScaledImage = (get({get({This, animationFactoryImageScaleUtil}), '$class'})):createImage(get({This, animationFactoryImageScaleUtil}), (get({This, '$class'})):getImage(This), get({get({This, animationFactoryInitializationVisitor}), width}), get({get({This, animationFactoryInitializationVisitor}), height}), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight})),
        CopyOfScaledImage = (fun(Target_N66800) -> (get({Target_N66800, '$class'})):createImage(Target_N66800, ScaledImage) end)('ImageCopyUtil':getInstance()),
        case ((get({get({This, animationFactoryInitializationVisitor}), dx}) =/= 0) orelse (get({get({This, animationFactoryInitializationVisitor}), dy}) =/= 0)) of
            true ->
            (get({get({This, animationFactoryImageScaleUtil}), '$class'})):processAdjust(get({This, animationFactoryImageScaleUtil}), This),
            throw({'$return', 'AllBinaryAdjustedHTMLImageRotationAnimation':new(ScaledImage, CopyOfScaledImage, 'AngleInfo':getInstance((get({This, '$class'})):getAngleIncrement(This)), get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}), get({get({This, animationFactoryInitializationVisitor}), dx}), get({get({This, animationFactoryInitializationVisitor}), dy}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))});
            false ->
            throw({'$return', 'AllBinaryHTMLImageRotationAnimation':new(ScaledImage, CopyOfScaledImage, 'AngleInfo':getInstance(get({This, angleIncrement})), get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getAngleIncrement(This) ->
        get({This, angleIncrement}).

