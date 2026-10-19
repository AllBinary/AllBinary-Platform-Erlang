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
% package org.allbinary.logic.util.cache
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('AbstractArrayListPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PoolInterface

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, buffers}, 'BasicArrayListD':new()),
    put({This, cacheableInterfaceFactoryInterface}, undefined),
    ok.


new(CacheableInterfaceFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CacheableInterfaceFactoryInterface),
    This.

init(This, CacheableInterfaceFactoryInterface) ->
    init_fields(This),
        put({This, cacheableInterfaceFactoryInterface}, CacheableInterfaceFactoryInterface).

% throws Exception
clear(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
remove(This, Key) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
add(This, CacheableInterface) ->
        (get({get({This, buffers}), '$class'})):add(get({This, buffers}), CacheableInterface).

% throws Exception
addArray(This, CacheableInterfaces) when (is_tuple(CacheableInterfaces) orelse CacheableInterfaces =:= undefined) ->
        lists:foreach(fun(Index) ->
            (get({get({This, buffers}), '$class'})):add(get({This, buffers}), array:get(Index, CacheableInterfaces))
        end, lists:seq(0, array:size(CacheableInterfaces) - 1)).

