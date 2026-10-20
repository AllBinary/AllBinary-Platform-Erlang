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

-module('BasicArrayListResetablePool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbstractArrayListPool', Function, Arguments).

init_fields(This) ->
    ok.


new(CacheableInterfaceFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CacheableInterfaceFactoryInterface),
    This.

'$init'(This, CacheableInterfaceFactoryInterface) ->
        'AbstractArrayListPool':'$init'(This, CacheableInterfaceFactoryInterface).

clear(This) ->
        ok.

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

