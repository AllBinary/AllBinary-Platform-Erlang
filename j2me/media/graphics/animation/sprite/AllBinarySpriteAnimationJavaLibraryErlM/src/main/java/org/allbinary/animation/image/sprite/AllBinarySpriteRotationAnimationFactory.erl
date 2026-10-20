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
% import org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.math.PrimitiveIntUtil

-module('AllBinarySpriteRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ProceduralAnimationInterfaceFactoryInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    put({This, animationFactorySpriteScaleUtil}, 'AnimationFactorySpriteScaleUtil':getInstance()),
    ok.


% throws Exception
createWHDY(Image, Dx, Dy, AnimationBehaviorFactory) when is_integer(Dx), is_integer(Dy) ->
        SpriteRotationAnimationFactory = 'AllBinarySpriteRotationAnimationFactory':new(Image, 'PrimitiveIntUtil':getArrayInstance(), (((get({Image, '$class'})):getHeight(Image) bsr 2)), (((get({Image, '$class'})):getHeight(Image) bsr 2)), 0, 0, AnimationBehaviorFactory),
        (get({SpriteRotationAnimationFactory, '$class'})):initWH(SpriteRotationAnimationFactory, Dx, Dy),
        SpriteRotationAnimationFactory.

% throws Exception
createWH(Image, AnimationBehaviorFactory) ->
        'AllBinarySpriteRotationAnimationFactory':createWHDY(Image, 0, 0, AnimationBehaviorFactory).

% throws Exception
createDXY(Image, Dx, Dy, AnimationBehaviorFactory) when is_integer(Dx), is_integer(Dy) ->
        SpriteRotationAnimationFactory = 'AllBinarySpriteRotationAnimationFactory':new(Image, 'PrimitiveIntUtil':getArrayInstance(), (get({Image, '$class'})):getHeight(Image), (get({Image, '$class'})):getHeight(Image), 0, 0, AnimationBehaviorFactory),
        (get({SpriteRotationAnimationFactory, '$class'})):init(SpriteRotationAnimationFactory, Dx, Dy),
        SpriteRotationAnimationFactory.

% throws Exception
createDXYQ(Image, Dx, Dy, AnimationBehaviorFactory) when is_integer(Dx), is_integer(Dy) ->
        SpriteRotationAnimationFactory = 'AllBinarySpriteRotationAnimationFactory':new(Image, 'PrimitiveIntUtil':getArrayInstance(), (((get({Image, '$class'})):getHeight(Image) bsr 2)), (((get({Image, '$class'})):getHeight(Image) bsr 2)), 0, 0, AnimationBehaviorFactory),
        (get({SpriteRotationAnimationFactory, '$class'})):init(SpriteRotationAnimationFactory, Dx, Dy),
        SpriteRotationAnimationFactory.

% throws Exception
createQ(Image, AnimationBehaviorFactory) ->
        'AllBinarySpriteRotationAnimationFactory':new(Image, 'PrimitiveIntUtil':getArrayInstance(), (((get({Image, '$class'})):getHeight(Image) bsr 2)), (((get({Image, '$class'})):getHeight(Image) bsr 2)), 0, 0, AnimationBehaviorFactory).

% throws Exception
createWHF(Image, AnimationBehaviorFactory) ->
        'AllBinarySpriteRotationAnimationFactory':new(Image, 'PrimitiveIntUtil':getArrayInstance(), (get({Image, '$class'})):getHeight(Image), (get({Image, '$class'})):getHeight(Image), 0, 0, AnimationBehaviorFactory).

new(Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined), is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory),
    This.

'$init'(This, Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined), is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy) ->
        'BaseImageAnimationFactory':'$init'(This, Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory),
        init_fields(This),
        case (AnimationBehaviorFactory =:= 'AnimationBehaviorFactory':getInstance()) of
            true ->
            'ForcedLogUtil':log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", This);
            false -> ok
        end.

init(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        put({get({This, animationFactoryInitializationVisitor}), dx}, Dx),
        put({get({This, animationFactoryInitializationVisitor}), dy}, Dy).

initWH(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        (get({This, '$class'})):init(This, Dx, Dy),
        put({get({This, animationFactoryInitializationVisitor}), dx}, (get({get({This, animationFactoryInitializationVisitor}), dx}) + ((-get({get({This, animationFactoryInitializationVisitor}), width})) / 5))),
        put({get({This, animationFactoryInitializationVisitor}), dy}, (get({get({This, animationFactoryInitializationVisitor}), dy}) + ((-get({get({This, animationFactoryInitializationVisitor}), height})) / 5))).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        try
        Sprite = (get({get({This, animationFactorySpriteScaleUtil}), '$class'})):createImage(get({This, animationFactorySpriteScaleUtil}), (get({This, '$class'})):getImage(This), get({get({This, animationFactoryInitializationVisitor}), width}), get({get({This, animationFactoryInitializationVisitor}), height}), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight})),
        case ((get({get({This, animationFactoryInitializationVisitor}), dx}) =/= 0) orelse (get({get({This, animationFactoryInitializationVisitor}), dy}) =/= 0)) of
            true ->
            throw({'$return', 'AllBinaryAdjustedSpriteRotationAnimation':new(Sprite, (get({This, '$class'})):getImage(This), get({get({This, animationFactoryInitializationVisitor}), dx}), get({get({This, animationFactoryInitializationVisitor}), dy}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))});
            false ->
            throw({'$return', 'AllBinarySpriteRotationAnimation':new(Sprite, (get({This, '$class'})):getImage(This), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getInstanceAnimation(This, AnimationInterface) ->
        (get({This, '$class'})):getInstance(This, 0).

