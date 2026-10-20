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
% import jsinterop.annotations.JsType
% import org.allbinary.string.CommonStrings
% import jsinterop.annotations.JsMethod
% import jsinterop.annotations.JsConstructor
% import jsinterop.annotations.JsProperty

-module('IndexedBasicArrayListCache').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CacheInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BaseBasicArrayListCache', Function, Arguments).

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, size}, 0),
    put({This, index}, 0),
    ok.


% throws Exception
createCache(Size) when is_integer(Size) ->
        IndexedBasicArrayListCache = 'IndexedBasicArrayListCache':new(),
        (get({IndexedBasicArrayListCache, '$class'})):init(IndexedBasicArrayListCache, Size),
        IndexedBasicArrayListCache.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BaseBasicArrayListCache':'$init'(This),
    init_fields(This),
        ok.

% throws Exception
init(This, Size) when is_integer(Size) ->
        case (get({This, size}) < Size) of
            true ->
            (get({get({This, list}), '$class'})):ensureCapacity(get({This, list}), Size),
            lists:foreach(fun(Index) ->
                (get({This, '$class'})):addDefault(This)
            end, lists:seq((Size - 1), get({This, size}), -1)),
            put({This, size}, Size);
            false -> ok
        end.

getAt(This, Index) when is_integer(Index) ->
        array:get(Index, get({get({This, list}), objectArray})).

% throws Exception
addDefault(This) ->
        ok.

% throws Exception
addObject(This, AnyType) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), AnyType).

% throws Exception
add(This, CacheableInterface) ->
        (get({get({This, list}), '$class'})):add(get({This, list}), CacheableInterface).

% throws Exception
addArray(This, CacheableInterfaces) when (is_tuple(CacheableInterfaces) orelse CacheableInterfaces =:= undefined) ->
        erlang:error({'Exception', "No Imple"}).

clear(This) ->
        put({This, index}, 0).

