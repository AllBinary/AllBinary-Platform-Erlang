% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.image.ImageCacheFactory
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.media.ScaleProperties

-module('LazyImageRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, layoutIndex}, 0),
    put({This, animationInterfaceFactoryInterface}, undefined),
    put({This, scaleProperties}, get({'ScaleProperties', instance})),
    ok.


new(LayoutIndex, AssociatedLazyAnimationId, AnimationInterfaceFactoryInterface) when is_integer(LayoutIndex), is_integer(AssociatedLazyAnimationId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, LayoutIndex, AssociatedLazyAnimationId, AnimationInterfaceFactoryInterface),
    This.

init(This, LayoutIndex, AssociatedLazyAnimationId, AnimationInterfaceFactoryInterface) when is_integer(LayoutIndex), is_integer(AssociatedLazyAnimationId) ->
    init_fields(This),
        put({This, layoutIndex}, LayoutIndex),
        put({This, animationInterfaceFactoryInterface}, AnimationInterfaceFactoryInterface),
        put({'ImageCacheFactory':getInstance(), hasAnyLazyAnimationFactories}, true),
        case (get({get({This, animationInterfaceFactoryInterface}), animationBehaviorFactory}) =:= 'AnimationBehaviorFactory':getInstance()) of
            true ->
            'ForcedLogUtil':log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", This);
            false -> ok
        end.

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        try
        case (fun(Target_N66146) -> (get({Target_N66146, '$class'})):isReady(Target_N66146) end)((get({get({This, animationInterfaceFactoryInterface}), '$class'})):getImage(get({This, animationInterfaceFactoryInterface}))) of
            true ->
            (get({get({This, animationInterfaceFactoryInterface}), '$class'})):setInitialScale(get({This, animationInterfaceFactoryInterface}), get({This, scaleProperties})),
            throw({'$return', (get({get({This, animationInterfaceFactoryInterface}), '$class'})):getInstance(get({This, animationInterfaceFactoryInterface}), InstanceId)});
            false ->
            throw({'$return', 'LazyImageRotationAnimation':new(get({This, layoutIndex}), InstanceId, get({This, scaleProperties}), get({This, animationInterfaceFactoryInterface}), (get({get({get({This, animationInterfaceFactoryInterface}), animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({get({This, animationInterfaceFactoryInterface}), animationBehaviorFactory})))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setInitialScale(This, ScaleProperties) ->
        put({This, scaleProperties}, ScaleProperties).

