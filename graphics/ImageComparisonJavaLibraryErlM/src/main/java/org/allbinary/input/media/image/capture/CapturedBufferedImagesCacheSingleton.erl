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
% package org.allbinary.input.media.image.capture
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.cache.AutomaticCacheInterface
% import org.allbinary.logic.util.cache.CacheInterface
% import org.allbinary.logic.util.cache.CacheInterfaceFactory
% import org.allbinary.logic.util.cache.CachePolicyFactory
% import org.allbinary.logic.util.cache.CacheTypeFactory
% import org.allbinary.string.CommonStrings

-module('CapturedBufferedImagesCacheSingleton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, cacheInterface}, undefined),
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        STATIC_BLOCK = "Static Block",
        Instance = "CapturedBufferedImagesCacheSingleton",
        try
            (get({LogUtil, '$class'})):putF(LogUtil, get({CommonStrings, 'START'}), Instance, STATIC_BLOCK),
            put({'CapturedBufferedImagesCacheSingleton', cacheInterface}, 'CacheInterfaceFactory':getInstance((get({'CacheTypeFactory':getInstance(), 'SET'})), (get({'CachePolicyFactory':getInstance(), 'ONE_MINUTE_FIVE_MAX'})))),
            (get({LogUtil, '$class'})):putF(LogUtil, get({CommonStrings, 'END'}), Instance, STATIC_BLOCK)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({LogUtil, '$class'})):put(LogUtil, get({CommonStrings, 'EXCEPTION'}), Instance, STATIC_BLOCK, E)
        end,
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getInstance() ->
        get({'CapturedBufferedImagesCacheSingleton', cacheInterface}).


