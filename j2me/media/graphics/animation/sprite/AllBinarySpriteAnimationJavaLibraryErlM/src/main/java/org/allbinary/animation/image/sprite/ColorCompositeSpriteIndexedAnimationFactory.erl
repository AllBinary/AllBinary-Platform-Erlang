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
% package org.allbinary.animation.image.sprite
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.game.Sprite
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
% import org.allbinary.animation.image.BaseImageAnimationFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil
% import org.allbinary.logic.math.PrimitiveIntUtil

-module('ColorCompositeSpriteIndexedAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ProceduralAnimationInterfaceFactoryInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    put({This, animationFactorySpriteScaleUtil}, 'AnimationFactorySpriteScaleUtil':getInstance()),
    put({This, basicColorArray}, undefined),
    ok.


new(Image, BasicColorArray, Width, Height, AnimationBehaviorFactory) when (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined), is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, BasicColorArray, Width, Height, AnimationBehaviorFactory),
    This.

'$init'(This, Image, BasicColorArray, Width, Height, AnimationBehaviorFactory) when (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined), is_integer(Width), is_integer(Height) ->
        'BaseImageAnimationFactory':'$init'(This, Image, 'PrimitiveIntUtil':getArrayInstance(), Width, Height, 0, 0, AnimationBehaviorFactory),
        init_fields(This),
        put({This, basicColorArray}, BasicColorArray).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        Sprite = (get({get({This, animationFactorySpriteScaleUtil}), '$class'})):createImage(get({This, animationFactorySpriteScaleUtil}), (get({This, '$class'})):getImage(This), get({get({This, animationFactoryInitializationVisitor}), width}), get({get({This, animationFactoryInitializationVisitor}), height}), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight})),
        'SpriteIndexedAnimation':new(Sprite, (get({This, '$class'})):getImage(This), get({This, basicColorArray}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))).

% throws Exception
getInstanceAnimation(This, AnimationInterface) ->
        (get({This, '$class'})):getInstance(This, 0).

