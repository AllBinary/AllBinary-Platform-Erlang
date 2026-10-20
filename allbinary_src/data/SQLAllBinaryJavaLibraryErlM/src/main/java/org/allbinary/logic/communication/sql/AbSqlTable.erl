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
% package org.allbinary.logic.communication.sql
% import org.allbinary.business.init.db.DbConnectionInfo
% import org.allbinary.logic.communication.log.LogUtil

-module('AbSqlTable').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBasic', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, undefined),
    put({This, 'METHOD_CREATED_TABLE'}, "createTable()"),
    put({This, 'METHOD_DROP_TABLE'}, "dropTable()"),
    put({This, 'TABLE_CREATION_SUCCESS'}, "Table Creation Successful: "),
    put({This, 'DROPPED_SUCCESS'}, " Dropped Successfully"),
    ok.


new(DatabaseConnectionInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DatabaseConnectionInfoInterface),
    This.

'$init'(This, DatabaseConnectionInfoInterface) ->
        'AbSqlBasic':'$init'(This, DatabaseConnectionInfoInterface),
        init_fields(This).

setTableName(This, TableName) when (is_list(TableName) orelse TableName =:= undefined) ->
        put({This, tableName}, TableName).

getTableName(This) ->
        get({This, tableName}).

createTable(This, Data) when (is_list(Data) orelse Data =:= undefined) ->
        try
            (get({This, '$class'})):executeSQLStatement(This, Data),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([get({This, 'TABLE_CREATION_SUCCESS'}), get({This, tableName})]), " with statement: "]), Data]), This, get({This, 'METHOD_CREATED_TABLE'}));
                false -> ok
            end,
            lists:concat([get({This, tableName}), get({get({This, sqlStrings}), 'CREATE_RETURN'})])
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Table Creation Failed: ", get({This, tableName})]), " with statement: "]), Data]), This, get({This, 'METHOD_CREATED_TABLE'}), E);
                false -> ok
            end,
            lists:concat([lists:concat(["Failed to Create ", get({This, tableName})]), " table."])
        end.

dropTable(This) ->
        SqlStatement = lists:concat([get({get({This, sqlStrings}), 'DROP_TABLE'}), get({This, tableName})]),
        try
            (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'SUCCESS_SQL_STATEMENT'}), SqlStatement]), This, get({This, 'METHOD_DROP_TABLE'}));
                false -> ok
            end,
            lists:concat([get({This, tableName}), get({This, 'DROPPED_SUCCESS'})])
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), SqlStatement]), This, get({This, 'METHOD_DROP_TABLE'}), E);
                false -> ok
            end,
            lists:concat([lists:concat(["Failed to Drop ", get({This, tableName})]), " table."])
        end.

