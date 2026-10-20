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

-module('TopToBottomImageAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseImageAnimationFactory', Function, Arguments).

init_fields(This) ->
    ok.


new(Image, SequenceArray, AnimationBehaviorFactory) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, SequenceArray, AnimationBehaviorFactory),
    This.

'$init'(This, Image, SequenceArray, AnimationBehaviorFactory) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined) ->
        'BaseImageAnimationFactory':'$init'(This, Image, SequenceArray, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image), 0, 0, AnimationBehaviorFactory).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        ScaledImage = (get({get({This, animationFactoryImageScaleUtil}), '$class'})):createImage(get({This, animationFactoryImageScaleUtil}), (get({This, '$class'})):getImage(This), get({get({This, animationFactoryInitializationVisitor}), width}), get({get({This, animationFactoryInitializationVisitor}), height}), get({get({This, scaleProperties}), scaleWidth}), get({get({This, scaleProperties}), scaleHeight})),
        'TopToBottomImageAnimation':new(ScaledImage, (get({This, '$class'})):getSequenceArray(This), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))).

