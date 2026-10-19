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
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.animation.SingletonAnimationInterfaceFactory
% import org.allbinary.image.IndexedAnimationToImageArrayUtil

-module('ImageArraySingletonAnimationInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SingletonAnimationInterfaceFactory', Function, Arguments).

init_fields(This) ->
    ok.


new(ImageArray) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ImageArray),
    This.

init(This, ImageArray) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
        'SingletonAnimationInterfaceFactory':init(This, 'ImageArrayAnimation':new(ImageArray, 'AnimationBehavior':getInstance())).

