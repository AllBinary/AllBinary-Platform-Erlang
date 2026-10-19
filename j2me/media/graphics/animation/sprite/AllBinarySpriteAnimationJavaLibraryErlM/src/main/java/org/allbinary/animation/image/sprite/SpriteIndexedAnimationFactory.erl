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
% import org.allbinary.AndroidUtil
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
% import org.allbinary.animation.image.BaseImageAnimationFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorUtil
% import org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil
% import org.allbinary.logic.math.PrimitiveIntUtil

-module('SpriteIndexedAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ProceduralAnimationInterfaceFactoryInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    put({This, animationFactorySpriteScaleUtil}, 'AnimationFactorySpriteScaleUtil':getInstance()),
    put({This, basicColorArray}, get({'BasicColorUtil':getInstance(), 'ZERO_ARRAY'})),
    ok.


% throws Exception
createCWHDXY(Image, BasicColorArray, Width, Height, Dx, Dy, AnimationBehaviorFactory) when (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined), is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy) ->
        'SpriteIndexedAnimationFactory':new(Image, BasicColorArray, 'PrimitiveIntUtil':getArrayInstance(), Width, Height, Dx, Dy, AnimationBehaviorFactory).

% throws Exception
createCWH(Image, BasicColorArray, Width, Height, AnimationBehaviorFactory) when (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined), is_integer(Width), is_integer(Height) ->
        SpriteIndexedAnimationFactory = 'SpriteIndexedAnimationFactory':new(Image, BasicColorArray, 'PrimitiveIntUtil':getArrayInstance(), Width, Height, 0, 0, AnimationBehaviorFactory),
        (get({SpriteIndexedAnimationFactory, '$class'})):initHWH(SpriteIndexedAnimationFactory),
        SpriteIndexedAnimationFactory.

% throws Exception
createWH(Image, Width, Height, AnimationBehaviorFactory) when is_integer(Width), is_integer(Height) ->
        'SpriteIndexedAnimationFactory':new(Image, get({'BasicColorUtil':getInstance(), 'ZERO_ARRAY'}), 'PrimitiveIntUtil':getArrayInstance(), Width, Height, 0, 0, AnimationBehaviorFactory).

new(Image, BasicColorArray, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory) when (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined), (is_tuple(SequenceArray) orelse SequenceArray =:= undefined), is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, BasicColorArray, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory),
    This.

init(This, Image, BasicColorArray, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory) when (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined), (is_tuple(SequenceArray) orelse SequenceArray =:= undefined), is_integer(Width), is_integer(Height), is_integer(Dx), is_integer(Dy) ->
        'BaseImageAnimationFactory':init(This, Image, SequenceArray, Width, Height, Dx, Dy, AnimationBehaviorFactory),
        init_fields(This),
        put({This, basicColorArray}, BasicColorArray).

initHWH(This) ->
        put({get({This, animationFactoryInitializationVisitor}), dx}, (-((get({get({This, animationFactoryInitializationVisitor}), width}) bsr 2)))),
        put({get({This, animationFactoryInitializationVisitor}), dy}, (-((get({get({This, animationFactoryInitializationVisitor}), height}) bsr 2)))),
        case 'AndroidUtil':isAndroid() of
            true ->
            put({get({This, animationFactoryInitializationVisitor}), dx}, (get({get({This, animationFactoryInitializationVisitor}), dx}) + 3));
            false -> ok
        end.

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        try
        Sprite = (get({get({This, animationFactorySpriteScaleUtil}), '$class'})):createImage(get({This, animationFactorySpriteScaleUtil}), (get({This, '$class'})):getImage(This), get({get({This, animationFactoryInitializationVisitor}), width}), get({get({This, animationFactoryInitializationVisitor}), height}), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight})),
        case ((get({get({This, animationFactoryInitializationVisitor}), dx}) =/= 0) orelse (get({get({This, animationFactoryInitializationVisitor}), dy}) =/= 0)) of
            true ->
            throw({'$return', 'AdjustedSpriteIndexedAnimation':new(Sprite, (get({This, '$class'})):getImage(This), get({This, basicColorArray}), get({get({This, animationFactoryInitializationVisitor}), dx}), get({get({This, animationFactoryInitializationVisitor}), dy}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))});
            false ->
            throw({'$return', 'SpriteIndexedAnimation':new(Sprite, (get({This, '$class'})):getImage(This), get({This, basicColorArray}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getInstanceAnimation(This, AnimationInterface) ->
        (get({This, '$class'})):getInstance(This, 0).

