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
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.cache.CacheableInterface

-module('ImageArrayRotationAnimationCacheable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CacheableInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AdjustedImageArrayRotationAnimation', Function, Arguments).

init_fields(This) ->
    ok.


new(AnyType, AnimationBehavior) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnyType, AnimationBehavior),
    This.

'$init'(This, AnyType, AnimationBehavior) ->
        'AdjustedImageArrayRotationAnimation':'$init'(This, (get({(AnyType), '$class'})):getImageArray((AnyType)), (get({(AnyType), '$class'})):getAngleInfoP((AnyType)), (get({(AnyType), '$class'})):getTotalAngle((AnyType)), (get({(AnyType), '$class'})):getDx((AnyType)), (get({(AnyType), '$class'})):getDy((AnyType)), AnimationBehavior).

getKey(This) ->
        get({'NullUtil':getInstance(), 'NULL_OBJECT'}).

toString(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

