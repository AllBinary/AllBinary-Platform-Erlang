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
% package org.allbinary.business.installer
% import java.lang.reflect.Method
% import org.allbinary.business.init.db.DbConnectionInfo
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('InitDb').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, anyType}, undefined),
    put({This, 'METHOD_CALL_GET_HOST_NAME'}, "getHostName"),
    put({This, 'METHOD_CALL_ADD_USERS'}, "addUsers"),
    put({This, 'METHOD_CALL_ADD_DATABASES'}, "addDatabases"),
    put({This, 'METHOD_CALL_ADD_TABLES'}, "addTables"),
    put({This, 'METHOD_CALL_TEMP_MAIN_PATH'}, "useTemporaryMainPath"),
    put({This, 'METHOD_CALL_MAIN_PATH'}, "useNormalMainPath"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

new(DbConnectionInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, DbConnectionInfo),
    This.

init(This, DbConnectionInfo) ->
    init_fields(This),
        ok.

setHelper(This, AnyType) ->
        put({This, anyType}, AnyType).

getHelper(This) ->
        get({This, anyType}).

getHostName(This) ->
        try
            DynamicClass = get({get({This, anyType}), '$class'}),
            Method = (get({DynamicClass, '$class'})):getMethod(DynamicClass, get({This, 'METHOD_CALL_GET_HOST_NAME'}), undefined),
            Result = (get({Method, '$class'})):invoke(Method, get({This, anyType}), undefined),
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            undefined
        end.

addUsers(This) ->
        try
            DynamicClass = get({get({This, anyType}), '$class'}),
            Method = (get({DynamicClass, '$class'})):getMethod(DynamicClass, get({This, 'METHOD_CALL_ADD_USERS'}), undefined),
            Result = (get({Method, '$class'})):invoke(Method, get({This, anyType}), undefined),
            (get({Result, '$class'})):booleanValue(Result)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            false
        end.

addDatabases(This) ->
        try
            DynamicClass = get({get({This, anyType}), '$class'}),
            Method = (get({DynamicClass, '$class'})):getMethod(DynamicClass, get({This, 'METHOD_CALL_ADD_DATABASES'}), undefined),
            Result = (get({Method, '$class'})):invoke(Method, get({This, anyType}), undefined),
            (get({Result, '$class'})):booleanValue(Result)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            false
        end.

addTables(This) ->
        try
            DynamicClass = get({get({This, anyType}), '$class'}),
            Method = (get({DynamicClass, '$class'})):getMethod(DynamicClass, get({This, 'METHOD_CALL_ADD_TABLES'}), undefined),
            Result = (get({Method, '$class'})):invoke(Method, get({This, anyType}), undefined),
            (get({Result, '$class'})):booleanValue(Result)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            false
        end.

useTemporaryMainPath(This) ->
        try
            DynamicClass = get({get({This, anyType}), '$class'}),
            Method = (get({DynamicClass, '$class'})):getMethod(DynamicClass, get({This, 'METHOD_CALL_TEMP_MAIN_PATH'}), undefined),
            Result = (get({Method, '$class'})):invoke(Method, get({This, anyType}), undefined),
            (get({Result, '$class'})):booleanValue(Result)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            false
        end.

useNormalMainPath(This) ->
        try
            DynamicClass = get({get({This, anyType}), '$class'}),
            Method = (get({DynamicClass, '$class'})):getMethod(DynamicClass, get({This, 'METHOD_CALL_MAIN_PATH'}), undefined),
            Result = (get({Method, '$class'})):invoke(Method, get({This, anyType}), undefined),
            (get({Result, '$class'})):booleanValue(Result)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            false
        end.

