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
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.media.ScaleProperties

-module('CompoundAnimationInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, basicAnimationInterfaceFactoryInterfaceArrayP}, undefined),
    put({This, animationBehaviorFactory}, undefined),
    ok.


new(BasicAnimationInterfaceFactoryInterfaceArray, AnimationBehaviorFactory) when (is_tuple(BasicAnimationInterfaceFactoryInterfaceArray) orelse BasicAnimationInterfaceFactoryInterfaceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, BasicAnimationInterfaceFactoryInterfaceArray, AnimationBehaviorFactory),
    This.

init(This, BasicAnimationInterfaceFactoryInterfaceArray, AnimationBehaviorFactory) when (is_tuple(BasicAnimationInterfaceFactoryInterfaceArray) orelse BasicAnimationInterfaceFactoryInterfaceArray =:= undefined) ->
    init_fields(This),
        put({This, basicAnimationInterfaceFactoryInterfaceArrayP}, BasicAnimationInterfaceFactoryInterfaceArray),
        put({This, animationBehaviorFactory}, AnimationBehaviorFactory).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        Size = array:size(get({This, basicAnimationInterfaceFactoryInterfaceArrayP})),
        AnimationInterfaceArray = (get({This, '$class'})):createArray(This, Size),
        lists:foreach(fun(Index) ->
            array:set(Index, (fun(Target_N66114) -> (get({Target_N66114, '$class'})):getInstance(Target_N66114, InstanceId) end)(array:get(Index, get({This, basicAnimationInterfaceFactoryInterfaceArrayP}))), AnimationInterfaceArray)
        end, lists:seq(0, Size - 1)),
        (get({This, '$class'})):createAnimation(This, AnimationInterfaceArray).

createArray(This, Size) when is_integer(Size) ->
        get({'NullAnimationFactory':getFactoryInstance(), 'EMPTY_ARRAY'}).

createAnimation(This, AnimationInterfaceArray) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
        (fun(Target_N66414) -> (get({Target_N66414, '$class'})):getInstance(Target_N66414, 0) end)('NullAnimationFactory':getFactoryInstance()).

getBasicAnimationInterfaceFactoryInterfaceArray(This) ->
        get({This, basicAnimationInterfaceFactoryInterfaceArrayP}).

setInitialScale(This, ScaleProperties) ->
        Size = array:size(get({This, basicAnimationInterfaceFactoryInterfaceArrayP})),
        lists:foreach(fun(Index) ->
            (fun(Target_N66618) -> (get({Target_N66618, '$class'})):setInitialScale(Target_N66618, ScaleProperties) end)(array:get(Index, get({This, basicAnimationInterfaceFactoryInterfaceArrayP})))
        end, lists:seq(0, Size - 1)).

