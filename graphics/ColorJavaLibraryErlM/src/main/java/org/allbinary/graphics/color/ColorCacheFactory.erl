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
% package org.allbinary.graphics.color
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.cache.AutomaticCacheInterface
% import org.allbinary.logic.util.cache.AutomaticCacheInterfaceFactory
% import org.allbinary.logic.util.cache.CachePolicyFactory
% import org.allbinary.logic.util.cache.CacheTypeFactory
% import org.allbinary.string.CommonStrings

-module('ColorCacheFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, cacheInterface}, undefined),
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        STATIC_BLOCK = "Static Block",
        try
            (get({LogUtil, '$class'})):putF(LogUtil, get({CommonStrings, 'START'}), 'ColorCacheFactory', STATIC_BLOCK),
            put({'ColorCacheFactory', cacheInterface}, 'AutomaticCacheInterfaceFactory':getInstance('ColorCacheableFactory':new(), get({'CacheTypeFactory':getInstance(), 'CACHE'}), get({'CachePolicyFactory':getInstance(), 'THIRTY_MINUTES_TEN_THOUSAND_MAX'}))),
            (get({LogUtil, '$class'})):putF(LogUtil, get({CommonStrings, 'END'}), 'ColorCacheFactory', STATIC_BLOCK)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({LogUtil, '$class'})):put(LogUtil, get({CommonStrings, 'EXCEPTION'}), 'ColorCacheFactory', STATIC_BLOCK, E)
        end,
    ok.

init_fields(This) ->
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
        get({'ColorCacheFactory', cacheInterface}).

