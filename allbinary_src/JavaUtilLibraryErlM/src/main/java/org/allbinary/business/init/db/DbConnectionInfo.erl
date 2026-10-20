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
% package org.allbinary.business.init.db
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('DbConnectionInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DatabaseConnectionInfoInterface

init_fields(This) ->
    put({This, jdbcDriver}, undefined),
    put({This, name}, undefined),
    put({This, userName}, undefined),
    put({This, password}, undefined),
    put({This, schema}, undefined),
    put({This, server}, undefined),
    put({This, port}, undefined),
    put({This, url}, undefined),
    put({This, host}, undefined),
    put({This, 'SCHEMA_SEP'}, "://"),
    put({This, 'USER_NAME_KEY'}, "?user="),
    put({This, 'PASSWORD_KEY'}, "&password="),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

updateUrl(This) ->
        (get({This, '$class'})):updateHost(This),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getHost(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getUserNameKey(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getUserName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getPasswordKey(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getPassword(This)),
        put({This, url}, (get({StringBuffer, '$class'})):toString(StringBuffer)).

getUrl(This) ->
        get({This, url}).

getJdbcDriver(This) ->
        get({This, jdbcDriver}).

getName(This) ->
        get({This, name}).

getUserName(This) ->
        get({This, userName}).

getPassword(This) ->
        get({This, password}).

updateHost(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getSchema(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SCHEMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getServer(This)),
        case (((get({This, '$class'})):getPort(This) =/= undefined) andalso ((fun(Target_N66818) -> (get({Target_N66818, '$class'})):length(Target_N66818) end)((get({This, '$class'})):getPort(This)) > 1)) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonSeps':getInstance(), 'COLON'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getPort(This));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        put({This, host}, (get({StringBuffer, '$class'})):toString(StringBuffer)).

getHost(This) ->
        get({This, host}).

getSchema(This) ->
        get({This, schema}).

getServer(This) ->
        get({This, server}).

getPort(This) ->
        get({This, port}).

setJdbcDriver(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, jdbcDriver}, Value).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, name}, Value),
        (get({This, '$class'})):updateUrl(This).

setUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, userName}, Value),
        (get({This, '$class'})):updateUrl(This).

setPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, password}, Value),
        (get({This, '$class'})):updateUrl(This).

setSchema(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, schema}, Value),
        (get({This, '$class'})):updateUrl(This).

setServer(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, server}, Value),
        (get({This, '$class'})):updateUrl(This).

setPort(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, port}, Value),
        (get({This, '$class'})):updateUrl(This).

getUserNameKey(This) ->
        get({This, 'USER_NAME_KEY'}).

getPasswordKey(This) ->
        get({This, 'PASSWORD_KEY'}).

