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
% import org.allbinary.animation.AnimationBehaviorFactory
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.media.ScaleProperties

-module('ImageArrayAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, dx}, 0),
    put({This, dy}, 0),
    put({This, imageArray}, undefined),
    put({This, animationBehaviorFactory}, undefined),
    ok.


new(ImageArray, Dx, Dy, AnimationBehaviorFactory) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ImageArray, Dx, Dy, AnimationBehaviorFactory),
    This.

init(This, ImageArray, Dx, Dy, AnimationBehaviorFactory) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(Dx), is_integer(Dy) ->
    init_fields(This),
        put({This, imageArray}, ImageArray),
        put({This, animationBehaviorFactory}, AnimationBehaviorFactory),
        put({This, dx}, Dx),
        put({This, dy}, Dy).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        try
        case ((get({This, dx}) =/= 0) orelse (get({This, dy}) =/= 0)) of
            true ->
            throw({'$return', 'AdjustedImageArrayAnimation':new(get({This, imageArray}), get({This, dx}), get({This, dy}), (get({get({This, animationBehaviorFactory}), '$class'})):getOrCreateInstance(get({This, animationBehaviorFactory})))});
            false ->
            throw({'$return', 'ImageArrayAnimation':new(get({This, imageArray}), 'AnimationBehavior':getInstance())})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setInitialScale(This, ScaleProperties) ->
        ok.

