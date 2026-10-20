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
% package org.allbinary.logic.communication.smtp.configuration.server
% import java.util.HashMap
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('EmailServerConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements EmailServerConfigurationInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, accountName}, undefined),
    put({This, password}, undefined),
    put({This, smtpServer}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, get({CommonStrings, 'CONSTRUCTOR'}));
            false -> ok
        end,
        (get({This, '$class'})):setSmtpServer(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This.

'$init'(This, HashMap) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, "EmailServerConfiguration(HashMap)");
            false -> ok
        end,
        (get({This, '$class'})):setAccountName(This, (get({HashMap, '$class'})):get(HashMap, get({'EmailServerConfigurationData', 'ACCOUNT'}))),
        (get({This, '$class'})):setPassword(This, (get({HashMap, '$class'})):get(HashMap, get({'EmailServerConfigurationData', 'PASSWORD'}))),
        (get({This, '$class'})):setSmtpServer(This, (get({HashMap, '$class'})):get(HashMap, get({'EmailServerConfigurationData', 'SERVER'}))),
        (get({This, '$class'})):log(This).

new(Account, Password, Server) when (is_list(Account) orelse Account =:= undefined), (is_list(Password) orelse Password =:= undefined), (is_list(Server) orelse Server =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Account, Password, Server),
    This.

'$init'(This, Account, Password, Server) when (is_list(Account) orelse Account =:= undefined), (is_list(Password) orelse Password =:= undefined), (is_list(Server) orelse Server =:= undefined) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({CommonStrings, 'START'}), This, "EmailServerConfiguration(HashMap)");
            false -> ok
        end,
        (get({This, '$class'})):setAccountName(This, Account),
        (get({This, '$class'})):setPassword(This, Password),
        (get({This, '$class'})):setSmtpServer(This, Server),
        (get({This, '$class'})):log(This).

setSmtpServer(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, smtpServer}, Value).

getSmtpServer(This) ->
        get({This, smtpServer}).

getAccountName(This) ->
        get({This, accountName}).

setAccountName(This, AccountName) when (is_list(AccountName) orelse AccountName =:= undefined) ->
        put({This, accountName}, AccountName).

getPassword(This) ->
        get({This, password}).

setPassword(This, Password) when (is_list(Password) orelse Password =:= undefined) ->
        put({This, password}, Password).

log(This) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({This, '$class'})):toString(This), This, "EmailServerConfiguration");
            false -> ok
        end.

toString(This) ->
        lists:concat([lists:concat([lists:concat([lists:concat([lists:concat([lists:concat(["Email Server Configuration:\n", "Smtp Server: \n"]), (get({This, '$class'})):getSmtpServer(This)]), "\nAccount Name: "]), (get({This, '$class'})):getAccountName(This)]), "\nPassword: "]), (get({This, '$class'})):getPassword(This)]).

