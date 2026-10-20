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
% package org.allbinary.logic.java.proxy
% import java.lang.reflect.Method
% import java.lang.reflect.Proxy

-module('InterfaceCastProxy').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements InvocationHandler

init_fields(This) ->
    put({This, anyType}, undefined),
    ok.


new(AnyType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnyType),
    This.

'$init'(This, AnyType) ->
    init_fields(This),
        put({This, anyType}, AnyType).

newInstance(AnyType) ->
        'Proxy':newProxyInstance((get({get({AnyType, '$class'}), '$class'})):getClassLoader(get({AnyType, '$class'})), (get({get({AnyType, '$class'}), '$class'})):getInterfaces(get({AnyType, '$class'})), 'InterfaceCastProxy':new(AnyType)).

% throws Throwable
invoke(This, ProxyObject, ProxyMethod, ProxyArgs) when (is_tuple(ProxyArgs) orelse ProxyArgs =:= undefined) ->
        MethodName = (get({ProxyMethod, '$class'})):getName(ProxyMethod),
        RealMethod = (get({get({get({This, anyType}), '$class'}), '$class'})):getMethod(get({get({This, anyType}), '$class'}), MethodName, (get({ProxyMethod, '$class'})):getParameterTypes(ProxyMethod)),
        case (not (get({RealMethod, '$class'})):isAccessible(RealMethod)) of
            true ->
            (get({RealMethod, '$class'})):setAccessible(RealMethod, true);
            false -> ok
        end,
        (get({ProxyMethod, '$class'})):invoke(ProxyMethod, get({This, anyType}), ProxyArgs).

