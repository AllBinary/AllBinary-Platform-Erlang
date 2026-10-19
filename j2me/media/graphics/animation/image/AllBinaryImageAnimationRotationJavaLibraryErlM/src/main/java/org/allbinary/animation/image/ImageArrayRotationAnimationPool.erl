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
% import org.allbinary.logic.util.cache.BasicArrayListResetablePool
% import org.allbinary.logic.util.cache.CacheableInterface
% import org.allbinary.logic.util.cache.CacheableInterfaceFactoryInterface
% import org.allbinary.logic.util.cache.PoolInterface

-module('ImageArrayRotationAnimationPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicArrayListResetablePool', Function, Arguments).

static_init() ->
    put({?MODULE, 'IMAGE_ROTATION_ANIMATION_POOL'}, 'ImageArrayRotationAnimationPool':new('ImageArrayRotationAnimationCacheableInterfaceFactory':new())),
    ok.

init_fields(This) ->
    ok.


new(CacheableInterfaceFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CacheableInterfaceFactoryInterface),
    This.

init(This, CacheableInterfaceFactoryInterface) ->
        'BasicArrayListResetablePool':init(This, CacheableInterfaceFactoryInterface).

getInstance() ->
        get({'ImageArrayRotationAnimationPool', 'IMAGE_ROTATION_ANIMATION_POOL'}).

% throws Exception
remove(This, Key) ->
        CacheableInterface = 'BasicArrayListResetablePool':remove(This, Key),
        AllBinaryImageRotationAnimationInfo = Key,
        ImageArrayRotationAnimationCacheable = (CacheableInterface),
        (get({ImageArrayRotationAnimationCacheable, '$class'})):setImageArray(ImageArrayRotationAnimationCacheable, (get({AllBinaryImageRotationAnimationInfo, '$class'})):getImageArray(AllBinaryImageRotationAnimationInfo)),
        CacheableInterface.

