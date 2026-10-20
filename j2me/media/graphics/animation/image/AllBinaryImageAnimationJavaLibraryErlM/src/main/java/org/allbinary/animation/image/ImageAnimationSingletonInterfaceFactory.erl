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
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.SingletonAnimationInterfaceFactory
% import org.allbinary.image.AnimationFrameToImageUtil

-module('ImageAnimationSingletonInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SingletonAnimationInterfaceFactory', Function, Arguments).

init_fields(This) ->
    ok.


new(AnimationInterface, Width, Height) when is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnimationInterface, Width, Height),
    This.

'$init'(This, AnimationInterface, Width, Height) when is_integer(Width), is_integer(Height) ->
        'SingletonAnimationInterfaceFactory':'$init'(This, 'ImageAnimation':new((fun(Target_N65721) -> (get({Target_N65721, '$class'})):getInstanceWH(Target_N65721, Width, Height, AnimationInterface) end)('AnimationFrameToImageUtil':getInstance()), 'AnimationBehavior':getInstance())).

