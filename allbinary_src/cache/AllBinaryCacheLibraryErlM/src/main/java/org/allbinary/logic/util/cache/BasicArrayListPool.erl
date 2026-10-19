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
% import org.allbinary.util.BasicArrayList

-module('BasicArrayListPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbstractArrayListPool', Function, Arguments).

init_fields(This) ->
    ok.


new(CacheableInterfaceFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CacheableInterfaceFactoryInterface),
    This.

init(This, CacheableInterfaceFactoryInterface) ->
        'AbstractArrayListPool':init(This, CacheableInterfaceFactoryInterface).

clear(This) ->
        (get({get({This, buffers}), '$class'})):clear(get({This, buffers})).

% throws Exception
remove(This, Key) ->
        try
        Size = (get({get({This, buffers}), '$class'})):size(get({This, buffers})),
        case (Size > 0) of
            true ->
            throw({'$return', (get({get({This, buffers}), '$class'})):removeAt(get({This, buffers}), (Size - 1))});
            false ->
            throw({'$return', (get({get({This, cacheableInterfaceFactoryInterface}), '$class'})):getInstance(get({This, cacheableInterfaceFactoryInterface}), Key)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
addAll(This, UsedList) ->
        put({local, index}, (get({UsedList, '$class'})):size(UsedList)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            AnyType = array:get(get({local, index}), get({UsedList, objectArray})),
            (get({This, '$class'})):add(This, AnyType),
            Loop();
        false -> ok end end)(),
        (get({UsedList, '$class'})):clear(UsedList).

% throws Exception
releaseUsedBackToPool(This, UsedList) ->
        put({local, index}, (get({UsedList, '$class'})):size(UsedList)),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            List = array:get(get({local, index}), get({UsedList, objectArray})),
            case ((get({List, '$class'})):size(List) =:= 0) of
                true ->
                (get({UsedList, '$class'})):removeAt(UsedList, get({local, index})),
                (get({This, '$class'})):add(This, List);
                false -> ok
            end,
            Loop();
        false -> ok end end)().

