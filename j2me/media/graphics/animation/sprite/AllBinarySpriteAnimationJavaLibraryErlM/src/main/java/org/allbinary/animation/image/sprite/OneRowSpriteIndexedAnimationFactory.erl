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
% import org.allbinary.animation.image.BaseImageAnimationFactory
% import org.allbinary.graphics.color.BasicColorUtil
% import org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil
% import org.allbinary.logic.math.PrimitiveIntUtil

-module('OneRowSpriteIndexedAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    put({This, animationFactorySpriteScaleUtil}, 'AnimationFactorySpriteScaleUtil':getInstance()),
    ok.


% throws Exception
createFactoryDX(Image, Dx, AnimationBehaviorFactory) when is_integer(Dx) ->
        OneRowSpriteIndexedAnimationFactory = 'OneRowSpriteIndexedAnimationFactory':new(Image, 'PrimitiveIntUtil':getArrayInstance(), (get({Image, '$class'})):getHeight(Image), (get({Image, '$class'})):getHeight(Image), 0, 0, AnimationBehaviorFactory),
        (get({OneRowSpriteIndexedAnimationFactory, '$class'})):initW(OneRowSpriteIndexedAnimationFactory, Dx),
        OneRowSpriteIndexedAnimationFactory.

% throws Exception
createFactoryDXY(Image, Dx, Dy, AnimationBehaviorFactory) when is_integer(Dx), is_integer(Dy) ->
        OneRowSpriteIndexedAnimationFactory = 'OneRowSpriteIndexedAnimationFactory':new(Image, 'PrimitiveIntUtil':getArrayInstance(), (get({Image, '$class'})):getHeight(Image), (get({Image, '$class'})):getHeight(Image), 0, 0, AnimationBehaviorFactory),
        (get({OneRowSpriteIndexedAnimationFactory, '$class'})):init(OneRowSpriteIndexedAnimationFactory, Dx, Dy),
        OneRowSpriteIndexedAnimationFactory.

% throws Exception
createFactoryWH(Image, Width, Height, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height) ->
        'OneRowSpriteIndexedAnimationFactory':new(Image, 'PrimitiveIntUtil':getArrayInstance(), Width, Height, 0, 0, AnimationBehaviorFactory).

% throws Exception
createFactory(Image, AnimationBehaviorFactory) ->
        'OneRowSpriteIndexedAnimationFactory':new(Image, 'PrimitiveIntUtil':getArrayInstance(), (get({Image, '$class'})):getHeight(Image), (get({Image, '$class'})):getHeight(Image), 0, 0, AnimationBehaviorFactory).

new(Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined), is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory),
    This.

'$init'(This, Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined), is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy) ->
        'BaseImageAnimationFactory':'$init'(This, Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory),
        init_fields(This).

init(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        put({get({This, animationFactoryInitializationVisitor}), dx}, Dx),
        put({get({This, animationFactoryInitializationVisitor}), dy}, Dy).

initW(This, Dx) when is_integer(Dx) ->
        (get({This, '$class'})):init(This, Dx, 0),
        put({get({This, animationFactoryInitializationVisitor}), dx}, (get({get({This, animationFactoryInitializationVisitor}), dx}) + (-((get({get({This, animationFactoryInitializationVisitor}), width}) bsr 2))))).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        try
        Sprite = (get({get({This, animationFactorySpriteScaleUtil}), '$class'})):createImage(get({This, animationFactorySpriteScaleUtil}), (get({This, '$class'})):getImage(This), get({get({This, animationFactoryInitializationVisitor}), width}), get({get({This, animationFactoryInitializationVisitor}), height}), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight})),
        case ((get({get({This, animationFactoryInitializationVisitor}), dx}) =/= 0) orelse (get({get({This, animationFactoryInitializationVisitor}), dy}) =/= 0)) of
            true ->
            throw({'$return', 'AdjustedSpriteIndexedAnimation':new(Sprite, (get({This, '$class'})):getImage(This), get({'BasicColorUtil':getInstance(), 'ZERO_ARRAY'}), get({get({This, animationFactoryInitializationVisitor}), dx}), get({get({This, animationFactoryInitializationVisitor}), dy}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))});
            false ->
            throw({'$return', 'SpriteIndexedAnimation':new(Sprite, (get({This, '$class'})):getImage(This), get({'BasicColorUtil':getInstance(), 'ZERO_ARRAY'}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

