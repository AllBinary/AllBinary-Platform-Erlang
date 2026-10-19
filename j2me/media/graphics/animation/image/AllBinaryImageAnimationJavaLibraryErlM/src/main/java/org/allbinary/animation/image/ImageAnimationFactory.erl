% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% import org.allbinary.graphics.opengles.OpenGLUtil
% import org.allbinary.logic.math.PrimitiveIntUtil

-module('ImageAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    ok.


% throws Exception
createFactory(Image) ->
        'ImageAnimationFactory':new(Image, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image), 0, 0, 'AnimationBehaviorFactory':getInstance()).

new(Image, Width, Height, Dx, Dy, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, Width, Height, Dx, Dy, AnimationBehaviorFactory),
    This.

init(This, Image, Width, Height, Dx, Dy, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy) ->
        'BaseImageAnimationFactory':init(This, Image, 'PrimitiveIntUtil':getArrayInstance(), Width, Height, Dx, Dy, AnimationBehaviorFactory).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        try
        put({local, scaledImage}, (get({get({This, animationFactoryImageScaleUtil}), '$class'})):createImage(get({This, animationFactoryImageScaleUtil}), (get({This, '$class'})):getImage(This), get({get({This, animationFactoryInitializationVisitor}), width}), get({get({This, animationFactoryInitializationVisitor}), height}), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight}))),
        OpenGLUtil = 'OpenGLUtil':getInstance(),
        put({local, scaledImage}, (get({OpenGLUtil, '$class'})):addImage(OpenGLUtil, get({local, scaledImage}))),
        case ((get({get({This, animationFactoryInitializationVisitor}), dx}) =/= 0) orelse (get({get({This, animationFactoryInitializationVisitor}), dy}) =/= 0)) of
            true ->
            (get({get({This, animationFactoryImageScaleUtil}), '$class'})):processAdjust(get({This, animationFactoryImageScaleUtil}), This),
            throw({'$return', 'AdjustedImageAnimation':new(get({local, scaledImage}), get({get({This, animationFactoryInitializationVisitor}), dx}), get({get({This, animationFactoryInitializationVisitor}), dy}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))});
            false ->
            throw({'$return', 'ImageAnimation':new(get({local, scaledImage}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

