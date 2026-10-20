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
% package org.allbinary.media.image.comparison.pixel
% import org.allbinary.graphics.GPoint
% import org.allbinary.graphics.PointFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.cache.AutomaticCacheInterface
% import org.allbinary.logic.util.cache.CacheInterfaceFactory
% import org.allbinary.logic.util.cache.CachePolicyFactory
% import org.allbinary.logic.util.cache.CacheTypeFactory
% import org.allbinary.media.image.comparison.color.ColorDelta
% import org.allbinary.media.image.comparison.color.ColorDeltaFactory
% import org.allbinary.string.CommonStrings

-module('PixelDeltaFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, cacheInterface}, undefined),
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        STATIC_BLOCK = "Static Block",
        Instance = "PixelDeltaFactory",
        try
            (get({LogUtil, '$class'})):putF(LogUtil, get({CommonStrings, 'START'}), Instance, STATIC_BLOCK),
            put({'PixelDeltaFactory', cacheInterface}, 'CacheInterfaceFactory':getInstance(get({'CacheTypeFactory':getInstance(), 'CACHE'}), get({'CachePolicyFactory':getInstance(), 'THIRTY_MINUTES_TEN_THOUSAND_MAX'}))),
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
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(X, Y, Rgb1, Rgb2) when is_integer(X), is_integer(Y), is_integer(Rgb1), is_integer(Rgb2) ->
        Point = (fun(Target_N66554) -> (get({Target_N66554, '$class'})):createXY(Target_N66554, X, Y) end)('PointFactory':getInstance()),
        ColorDelta = 'ColorDeltaFactory':getInstance(Rgb1, Rgb2),
        put({local, pixelDelta}, (get({get({'PixelDeltaFactory', cacheInterface}), '$class'})):get(get({'PixelDeltaFactory', cacheInterface}), 'PixelDelta':getKey(Point, ColorDelta))),
        case (get({local, pixelDelta}) =:= undefined) of
            true ->
            put({local, pixelDelta}, 'PixelDelta':new(Point, ColorDelta));
            false -> ok
        end,
        get({local, pixelDelta}).

