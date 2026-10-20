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
% package org.allbinary.animation.compound
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.animation.RotationAnimation
% import org.allbinary.logic.communication.log.ForcedLogUtil

-module('SimultaneousCompoundRotationAnimationInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CompoundAnimationInterfaceFactory', Function, Arguments).

init_fields(This) ->
    ok.


new(BasicAnimationInterfaceFactoryInterfaceArray, AnimationBehaviorFactory) when (is_tuple(BasicAnimationInterfaceFactoryInterfaceArray) orelse BasicAnimationInterfaceFactoryInterfaceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicAnimationInterfaceFactoryInterfaceArray, AnimationBehaviorFactory),
    This.

'$init'(This, BasicAnimationInterfaceFactoryInterfaceArray, AnimationBehaviorFactory) when (is_tuple(BasicAnimationInterfaceFactoryInterfaceArray) orelse BasicAnimationInterfaceFactoryInterfaceArray =:= undefined) ->
        'CompoundAnimationInterfaceFactory':'$init'(This, BasicAnimationInterfaceFactoryInterfaceArray, AnimationBehaviorFactory),
        case (AnimationBehaviorFactory =:= 'AnimationBehaviorFactory':getInstance()) of
            true ->
            'ForcedLogUtil':log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", This);
            false -> ok
        end.

createArray(This, Size) when is_integer(Size) ->
        array:new(Size, {default, undefined}).

createAnimation(This, AnimationInterfaceArray) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
        'SimultaneousCompoundRotationAnimation':new(AnimationInterfaceArray, (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))).

