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
% package org.allbinary.logic.java.anyType.clazz
% import org.allbinary.logic.java.anyType.ConstructorUtil
% import org.allbinary.logic.java.anyType.InterfaceUtil
% import org.allbinary.logic.java.anyType.MethodUtil
% import org.allbinary.logic.string.StringMaker

-module('ClassUtil').
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

viewAll(AnyType, LineBreak) when (is_list(LineBreak) orelse LineBreak =:= undefined) ->
        try
        case (AnyType =/= undefined) of
            true ->
            throw({'$return', 'ClassUtil':viewAll(get({AnyType, '$class'}), LineBreak)});
            false ->
            "Object Null"
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end
% unreachable Java overload viewAll(Class myClass, String lineBreak) has the same guards as an earlier clause
.


