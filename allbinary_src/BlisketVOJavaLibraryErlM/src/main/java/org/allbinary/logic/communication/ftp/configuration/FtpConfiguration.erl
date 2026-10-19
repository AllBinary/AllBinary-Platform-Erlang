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
% package org.allbinary.logic.communication.ftp.configuration
% import java.util.HashMap

-module('FtpConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements FtpConfigurationInterface

init_fields(This) ->
    put({This, ftpServer}, undefined),
    put({This, ftpPath}, undefined),
    put({This, ftpUserName}, undefined),
    put({This, ftpPassword}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap),
    This.

init(This, HashMap) ->
    init_fields(This),
        put({This, ftpServer}, (get({HashMap, '$class'})):get(HashMap, get({'FtpConfigurationData', 'SERVER'}))),
        put({This, ftpPath}, (get({HashMap, '$class'})):get(HashMap, get({'FtpConfigurationData', 'PATH'}))),
        put({This, ftpUserName}, (get({HashMap, '$class'})):get(HashMap, get({'FtpConfigurationData', 'USERNAME'}))),
        put({This, ftpPassword}, (get({HashMap, '$class'})):get(HashMap, get({'FtpConfigurationData', 'PASSWORD'}))).

getServer(This) ->
        get({This, ftpServer}).

getPath(This) ->
        get({This, ftpPath}).

getUserName(This) ->
        get({This, ftpUserName}).

getPassword(This) ->
        get({This, ftpPassword}).

setServer(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, ftpServer}, Value).

setPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, ftpPath}, Value).

setUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, ftpUserName}, Value).

setPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, ftpPassword}, Value).

