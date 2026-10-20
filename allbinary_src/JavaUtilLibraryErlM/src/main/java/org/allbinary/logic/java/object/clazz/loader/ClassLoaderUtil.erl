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
% package org.allbinary.logic.java.anyType.clazz.loader

-module('ClassLoaderUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
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
getName(AnyType) ->
        try
        ClassLoader = (get({get({AnyType, '$class'}), '$class'})):getClassLoader(get({AnyType, '$class'})),
        case (ClassLoader =/= undefined) of
            true ->
            throw({'$return', lists:concat(["ClassLoader: ", atom_to_list(get({ClassLoader, '$class'}))])});
            false -> ok
        end,
        erlang:error({'Exception', "Unable to get ClassLoader"})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

