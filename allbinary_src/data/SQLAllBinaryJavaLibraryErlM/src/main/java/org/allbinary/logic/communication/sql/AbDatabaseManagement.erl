% 
% To change this license header, choose License Headers in Project Properties. 
% To change this template file, choose Tools | Templates 
% and open the template in the editor.  
% Generated Code Do Not Modify
% package org.allbinary.logic.communication.sql
% import java.net.InetAddress
% import org.allbinary.business.init.db.DatabaseConnectionInfoInterface
% import org.allbinary.business.init.db.DbConnectionInfo
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('AbDatabaseManagement').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, sqlCommandLog}, 'StringMaker':new()),
    put({This, 'GRANT_ALL'}, "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON "),
    put({This, 'DOT_STAR'}, ".*"),
    put({This, 'TO'}, " TO "),
    put({This, 'AT_LOCALHOST'}, "@localhost"),
    put({This, 'IDENTIFIED_BY'}, " IDENTIFIED BY '"),
    put({This, 'WITH_GRANT_OPTION'}, "' WITH GRANT OPTION"),
    put({This, 'FAILED'}, "Failed"),
    put({This, 'GET_HOST_NAME'}, "getHostName()"),
    put({This, 'METHOD_ADD_USER'}, "addUser()"),
    put({This, 'METHOD_ADD_USERS'}, "addUsers()"),
    put({This, 'METHOD_ADD_DB'}, "addDb()"),
    put({This, 'METHOD_ADD_DATABASES'}, "addDatabases()"),
    put({This, 'METHOD_ADD_TABLES'}, "addTables()"),
    put({This, 'UNABLE_TO_CREATE_USER'}, "Unable to Create User: "),
    put({This, 'UNABLE_TO_CREATE_DATABASE'}, "Unable to Create Database: "),
    put({This, 'UNABLE_TO_CREATE_TABLES'}, "Unable to Create Tables"),
    put({This, 'ADD_TABLES_RESULTS_LABEL'}, "Add Table Results: "),
    ok.


new(DatabaseConnectionInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DatabaseConnectionInfoInterface),
    This;
new(ConnectionInfo) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ConnectionInfo),
    This.

'$init'(This, DatabaseConnectionInfoInterface) ->
        'AbSqlBean':'$init'(This, DatabaseConnectionInfoInterface),
        init_fields(This);
'$init'(This, ConnectionInfo) ->
        'AbSqlBean':'$init'(This, ConnectionInfo),
        init_fields(This).


getHostName(This) ->
        try
            Addr = 'InetAddress':getLocalHost(),
            (get({Addr, '$class'})):getHostName(Addr)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({This, 'FAILED'}), This, get({This, 'GET_HOST_NAME'}), E),
            undefined
        end.

% throws Exception
addDbUser(This, HostName, Db, UserName, Password) when (is_list(HostName) orelse HostName =:= undefined), (is_list(Db) orelse Db =:= undefined), (is_list(UserName) orelse UserName =:= undefined), (is_list(Password) orelse Password =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'GRANT_ALL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Db),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'DOT_STAR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'TO'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, UserName),
        (get({StringBuffer, '$class'})):append(StringBuffer, HostName),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'IDENTIFIED_BY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Password),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'WITH_GRANT_OPTION'})),
        SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
        (get({get({This, sqlCommandLog}), '$class'})):append(get({This, sqlCommandLog}), SqlStatement),
        (get({get({This, sqlCommandLog}), '$class'})):append(get({This, sqlCommandLog}), get({get({This, commonSeps}), 'NEW_LINE'})),
        'AbSqlBean':executeSQLStatement(This, SqlStatement),
        true.

addDbUser(This, Db, UserName, Password) when (is_list(Db) orelse Db =:= undefined), (is_list(UserName) orelse UserName =:= undefined), (is_list(Password) orelse Password =:= undefined) ->
        try
            (get({This, '$class'})):addDbUser(This, get({This, 'AT_LOCALHOST'}), Db, UserName, Password),
            HostName = (get({This, '$class'})):getHostName(This),
            case (HostName =/= undefined) of
                true ->
                (get({This, '$class'})):addDbUser(This, HostName, Db, UserName, Password);
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_USER'}), UserName]), This, get({This, 'METHOD_ADD_USER'}), E),
            false
        end.

addDb(This, Db) when (is_list(Db) orelse Db =:= undefined) ->
        try
            SqlStatement = lists:concat([get({get({This, sqlStrings}), 'CREATE_DATABASE'}), Db]),
            (get({get({This, sqlCommandLog}), '$class'})):append(get({This, sqlCommandLog}), SqlStatement),
            (get({get({This, sqlCommandLog}), '$class'})):append(get({This, sqlCommandLog}), get({get({This, commonSeps}), 'NEW_LINE'})),
            'AbSqlBean':executeSQLStatement(This, SqlStatement),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_DATABASE'}), Db]), This, get({This, 'METHOD_ADD_DB'}), E),
            false
        end.

