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
% import javax.microedition.media.Player
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.animation.caption.CaptionIndexedAnimation
% import org.allbinary.animation.image.ImageAnimation
% import org.allbinary.graphics.color.BasicColorUtil
% import org.allbinary.image.AnimationFactoryImageScaleUtil
% import org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.media.ScaleProperties
% import org.allbinary.media.audio.Sound

-module('ImageCaptionIndexedAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, animationFactoryImageScaleUtil}, 'AnimationFactoryImageScaleUtil':getInstance()),
    put({This, animationFactorySpriteScaleUtil}, 'AnimationFactorySpriteScaleUtil':getInstance()),
    put({This, captionImage}, undefined),
    put({This, spriteMovieImage}, undefined),
    put({This, frameWidth}, 0),
    put({This, frameHeight}, 0),
    put({This, captionDx}, 0),
    put({This, captionDy}, 0),
    put({This, dx}, 0),
    put({This, dy}, 0),
    put({This, time}, 0),
    put({This, soundInterface}, undefined),
    put({This, scaleProperties}, get({'ScaleProperties', instance})),
    put({This, animationBehaviorFactory}, undefined),
    ok.


new(CaptionImage, SpriteMovieImage, SoundInterface, FrameWidth, FrameHeight, CaptionDx, CaptionDy, Dx, Dy, Time, AnimationBehaviorFactory) when is_integer(FrameWidth), is_integer(FrameHeight), is_integer(CaptionDx), is_integer(CaptionDy), is_integer(Dx), is_integer(Dy), is_integer(Time) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CaptionImage, SpriteMovieImage, SoundInterface, FrameWidth, FrameHeight, CaptionDx, CaptionDy, Dx, Dy, Time, AnimationBehaviorFactory),
    This.

init(This, CaptionImage, SpriteMovieImage, SoundInterface, FrameWidth, FrameHeight, CaptionDx, CaptionDy, Dx, Dy, Time, AnimationBehaviorFactory) when is_integer(FrameWidth), is_integer(FrameHeight), is_integer(CaptionDx), is_integer(CaptionDy), is_integer(Dx), is_integer(Dy), is_integer(Time) ->
    init_fields(This),
        case (AnimationBehaviorFactory =:= 'AnimationBehaviorFactory':getInstance()) of
            true ->
            'ForcedLogUtil':log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", This);
            false -> ok
        end,
        put({This, captionImage}, CaptionImage),
        put({This, spriteMovieImage}, SpriteMovieImage),
        put({This, frameWidth}, FrameWidth),
        put({This, frameHeight}, FrameHeight),
        put({This, captionDx}, CaptionDx),
        put({This, captionDy}, CaptionDy),
        put({This, dx}, Dx),
        put({This, dy}, Dy),
        put({This, time}, Time),
        put({This, soundInterface}, SoundInterface),
        put({This, animationBehaviorFactory}, AnimationBehaviorFactory).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        ScaledImage = (get({get({This, animationFactoryImageScaleUtil}), '$class'})):createImage(get({This, animationFactoryImageScaleUtil}), get({This, captionImage}), (get({get({This, captionImage}), '$class'})):getWidth(get({This, captionImage})), (get({get({This, captionImage}), '$class'})):getHeight(get({This, captionImage})), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight})),
        AnimationInterface = 'ImageAnimation':new(ScaledImage, (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))),
        Sprite = (get({get({This, animationFactorySpriteScaleUtil}), '$class'})):createImage(get({This, animationFactorySpriteScaleUtil}), get({This, spriteMovieImage}), get({This, frameWidth}), get({This, frameHeight}), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight})),
        MovieIndexedAnimationInterface = 'SpriteIndexedAnimation':new(Sprite, get({This, spriteMovieImage}), get({'BasicColorUtil':getInstance(), 'ZERO_ARRAY'}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))),
        Player = (get({get({This, soundInterface}), '$class'})):getPlayerP(get({This, soundInterface})),
        case (Player =:= undefined) of
            true ->
            erlang:error({'Exception', "Sound Was not Initialized"});
            false -> ok
        end,
        'CaptionIndexedAnimation':new(AnimationInterface, MovieIndexedAnimationInterface, Player, get({This, captionDx}), get({This, captionDy}), get({This, dx}), get({This, dy}), get({This, time}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))).

setInitialScale(This, ScaleProperties) ->
        put({This, scaleProperties}, ScaleProperties).

