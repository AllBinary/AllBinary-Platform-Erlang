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
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.media.ScaleProperties

-module('SimultaneousCompoundIndexAnimationInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, basicAnimationInterfaceFactoryInterfaceArray}, undefined),
    put({This, animationBehaviorFactory}, undefined),
    ok.


new(BasicAnimationInterfaceFactoryInterfaceArray, AnimationBehaviorFactory) when (is_tuple(BasicAnimationInterfaceFactoryInterfaceArray) orelse BasicAnimationInterfaceFactoryInterfaceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicAnimationInterfaceFactoryInterfaceArray, AnimationBehaviorFactory),
    This.

'$init'(This, BasicAnimationInterfaceFactoryInterfaceArray, AnimationBehaviorFactory) when (is_tuple(BasicAnimationInterfaceFactoryInterfaceArray) orelse BasicAnimationInterfaceFactoryInterfaceArray =:= undefined) ->
    init_fields(This),
        put({This, basicAnimationInterfaceFactoryInterfaceArray}, BasicAnimationInterfaceFactoryInterfaceArray),
        put({This, animationBehaviorFactory}, AnimationBehaviorFactory).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        Size = array:size(get({This, basicAnimationInterfaceFactoryInterfaceArray})),
        AnimationInterfaceArray = array:new(Size, {default, undefined}),
        lists:foreach(fun(Index) ->
            array:set(Index, (fun(Target_N66122) -> (get({Target_N66122, '$class'})):getInstance(Target_N66122, InstanceId) end)(array:get(Index, get({This, basicAnimationInterfaceFactoryInterfaceArray}))), AnimationInterfaceArray)
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):getOrCreate(This, AnimationInterfaceArray).

getOrCreate(This, AnimationInterfaceArray) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
        'SimultaneousCompoundIndexAnimation':new(AnimationInterfaceArray, (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory}))).

getBasicAnimationInterfaceFactoryInterfaceArray(This) ->
        get({This, basicAnimationInterfaceFactoryInterfaceArray}).

setInitialScale(This, ScaleProperties) ->
        ok.

