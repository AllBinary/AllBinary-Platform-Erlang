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
% package org.allbinary.business.init
% import java.sql.Connection
% import java.sql.DriverManager
% import java.sql.ResultSet
% import java.sql.ResultSetMetaData
% import java.sql.SQLException
% import java.sql.Statement
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.init.db.DatabaseConnectionInfoInterface
% import org.allbinary.business.init.db.DbConnectionInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.communication.sql.SqlStrings
% import org.allbinary.logic.communication.sql.SqlTypeStrings
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('InitSql').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, sqlTypeStrings}, 'SqlTypeStrings':getInstance()),
    put({This, sqlStrings}, 'SqlStrings':getInstance()),
    put({This, stdUtil}, 'StdUtil':getInstance()),
    put({This, 'INSERT'}, "insert"),
    put({This, 'UPDATE'}, "update"),
    put({This, databaseConnectionInfoInterface}, undefined),
    put({This, userid}, undefined),
    put({This, password}, undefined),
    put({This, tableName}, undefined),
    put({This, conn}, undefined),
    put({This, useridAndPassword}, false),
    put({This, 'SUCCESS_SQL_STATEMENT'}, "Success\nSQL Statement: "),
    put({This, 'FAILED_SQL_STATEMENT'}, "Failed\nSQL Statement: "),
    put({This, 'INIT_SQL'}, "InitSql"),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'EQUAL_QUOTE'}, "=\""),
    put({This, 'METHOD_GET_ROW'}, "getRow()"),
    put({This, 'METHOD_UPDATE_WHERE'}, "updateWhere()"),
    put({This, 'ROW_VALUE_LABEL'}, "Row Value: "),
    put({This, 'NO_RESULTS_IN_RESULT_SET'}, "No Results in ResultSet"),
    put({This, 'INSERT_END'}, "')"),
    ok.


new(DatabaseConnectionInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, DatabaseConnectionInfoInterface),
    This.

init(This, DatabaseConnectionInfoInterface) ->
    init_fields(This),
        (get({This, '$class'})):setDatabaseConnectionInfoInterface(This, DatabaseConnectionInfoInterface).

setTable(This, TableName) when (is_list(TableName) orelse TableName =:= undefined) ->
        put({This, tableName}, TableName).

setDatabaseConnectionInfoInterface(This, DatabaseConnectionInfoInterface) ->
        put({This, databaseConnectionInfoInterface}, DatabaseConnectionInfoInterface).

createTable(This, TableData) when (is_list(TableData) orelse TableData =:= undefined) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Creating Table: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, TableData),
            'PreLogUtil':put((get({StringBuffer, '$class'})):toString(StringBuffer), get({This, 'INIT_SQL'}), "createTable()"),
            (get({This, '$class'})):executeSQLStatement(This, TableData),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'SQLLOGGINGERROR'})) of
                true ->
                'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), get({This, 'INIT_SQL'}), "createTable()", E);
                false -> ok
            end,
            false
        end.

dropTable(This) ->
        SqlStatement = lists:concat([get({get({This, sqlStrings}), 'DROP_TABLE'}), get({This, tableName})]),
        try
            (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'SQLLOGGINGERROR'})) of
                true ->
                'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), get({This, 'INIT_SQL'}), "dropTables()", E);
                false -> ok
            end,
            false
        end.

getRow(This, KeysAndValues) ->
        try
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT_ALL_FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, tableName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
        try
            put({local, result}, undefined),
            Set = (get({KeysAndValues, '$class'})):keySet(KeysAndValues),
            KeyArray = (get({Set, '$class'})):toArray(Set),
            Size = array:size(KeyArray),
            lists:foreach(fun(I) ->
                Key = array:get(I, KeyArray),
                Value = allbinary_java:to_string((get({KeysAndValues, '$class'})):get(KeysAndValues, Key)),
                (get({StringBuffer, '$class'})):append(StringBuffer, Key),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getValue(This, Value)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
                case (I < (Size - 1)) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'AND'}));
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                'PreLogUtil':put(lists:concat([get({get({This, sqlStrings}), 'SQL_STATEMENT_LABEL'}), SqlStatement]), get({This, 'INIT_SQL'}), get({This, 'METHOD_GET_ROW'}));
                false -> ok
            end,
            Rset = (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            ResultSetMetaData = (get({Rset, '$class'})):getMetaData(Rset),
            (fun Loop() -> case (get({Rset, '$class'})):next(Rset) of true ->
                put({local, result}, (get({get({This, stdUtil}), '$class'})):createHashMap(get({This, stdUtil}))),
                ColumnCount = (get({ResultSetMetaData, '$class'})):getColumnCount(ResultSetMetaData),
                lists:foreach(fun(Index) ->
                    ColumnName = (get({ResultSetMetaData, '$class'})):getColumnName(ResultSetMetaData, Index),
                    Field = (get({Rset, '$class'})):getString(Rset, ColumnName),
                    (get({get({local, result}), '$class'})):put(get({local, result}), ColumnName, Field)
                end, lists:seq(1, ColumnCount)),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    'PreLogUtil':put(lists:concat([get({This, 'ROW_VALUE_LABEL'}), (get({get({local, result}), '$class'})):toString(get({local, result}))]), get({This, 'INIT_SQL'}), get({This, 'METHOD_GET_ROW'}));
                    false -> ok
                end,
                throw({'$return', get({local, result})}),
                Loop();
            false -> ok end end)(),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                'PreLogUtil':put(get({This, 'NO_RESULTS_IN_RESULT_SET'}), get({This, 'INIT_SQL'}), get({This, 'METHOD_GET_ROW'}));
                false -> ok
            end,
            undefined
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                'PreLogUtil':putOE(lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), StringBuffer]), get({This, 'INIT_SQL'}), get({This, 'METHOD_GET_ROW'}), E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

updateWhere(This, Key, Value, UpdatedKeyValuePairs) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'UPDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, tableName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SET'})),
        try
            ColumnArray = (fun(Target_N70562) -> (get({Target_N70562, '$class'})):toArray(Target_N70562) end)((get({UpdatedKeyValuePairs, '$class'})):keySet(UpdatedKeyValuePairs)),
            Size = array:size(ColumnArray),
            lists:foreach(fun(I) ->
                ColumnName = (fun(Target_N70665) -> (get({Target_N70665, '$class'})):toString(Target_N70665) end)(array:get(I, ColumnArray)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, ColumnName),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'EQUAL_QUOTE'})),
                put({local, columnValue}, (get({UpdatedKeyValuePairs, '$class'})):get(UpdatedKeyValuePairs, ColumnName)),
                case (get({local, columnValue}) =:= undefined) of
                    true ->
                    put({local, columnValue}, get({get({This, stringUtil}), 'EMPTY_STRING'}));
                    false ->
                    ok
                end,
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getValue(This, get({local, columnValue}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
                case (I < (Size - 1)) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'COMMA'}));
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, Key),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getValue(This, Value)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
            SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
            (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                'PreLogUtil':put(lists:concat([get({This, 'SUCCESS_SQL_STATEMENT'}), SqlStatement]), get({This, 'INIT_SQL'}), get({This, 'METHOD_UPDATE_WHERE'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                'PreLogUtil':putOE(lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), StringBuffer]), get({This, 'INIT_SQL'}), get({This, 'METHOD_UPDATE_WHERE'}), E);
                false -> ok
            end
        end.

insert(This, Values) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'INSERT_INTO'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, tableName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'VALUES'})),
        try
            Size = (get({Values, '$class'})):size(Values),
            lists:foreach(fun(I) ->
                put({local, value}, (get({This, '$class'})):getValue(This, (get({Values, '$class'})):get(Values, I))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, value})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SINGLE_QUOTE_COMMA_SEP'}))
            end, lists:seq(0, (Size - 1) - 1)),
            put({local, value}, (get({This, '$class'})):getValue(This, (get({Values, '$class'})):get(Values, ((get({Values, '$class'})):size(Values) - 1)))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({local, value})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'INSERT_END'})),
            SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
            (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                'PreLogUtil':put(lists:concat([get({This, 'SUCCESS_SQL_STATEMENT'}), SqlStatement]), get({This, 'INIT_SQL'}), get({This, 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                'PreLogUtil':putOE(lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), (get({StringBuffer, '$class'})):toString(StringBuffer)]), get({This, 'INIT_SQL'}), get({This, 'INSERT'}), E);
                false -> ok
            end
        end.

getValue(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        try
        case (fun(Target_N73345) -> (get({Target_N73345, '$class'})):isEmpty(Target_N73345, Value) end)('StringValidationUtil':getInstance()) of
            true ->
            throw({'$return', get({get({This, stringUtil}), 'EMPTY_STRING'})});
            false ->
            throw({'$return', Value})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception, SQLException
executeSQLStatement(This, Statement) when (is_list(Statement) orelse Statement =:= undefined) ->
        try
            case (get({This, conn}) =:= undefined) of
                true ->
                (get({This, '$class'})):initialize(This);
                false -> ok
            end,
            Stmt = (get({get({This, conn}), '$class'})):createStatement(get({This, conn})),
            (get({Stmt, '$class'})):execute(Stmt, Statement),
            Rset = (get({Stmt, '$class'})):getResultSet(Stmt),
            (get({Stmt, '$class'})):close(Stmt),
            Rset
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'SQLLOGGINGERROR'})) of
                true ->
                'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), get({This, 'INIT_SQL'}), "executeSQLStatement()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws SQLException
createConnection(This) ->
        try
            case (get({This, useridAndPassword}) =:= true) of
                true ->
                put({This, conn}, 'DriverManager':getConnection((get({get({This, databaseConnectionInfoInterface}), '$class'})):getUrl(get({This, databaseConnectionInfoInterface})), get({This, userid}), get({This, password})));
                false ->
                put({This, conn}, 'DriverManager':getConnection((get({get({This, databaseConnectionInfoInterface}), '$class'})):getUrl(get({This, databaseConnectionInfoInterface}))))
            end
        catch _:Se when Se =/= '$break', Se =/= '$continue', (not is_tuple(Se) orelse element(1, Se) =/= '$return') ->
            'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), get({This, 'INIT_SQL'}), "createConnection()", Se),
            erlang:error(Se)
        end.

% throws Exception
initialize(This) ->
        try
            try
                JdbcDriver = (get({get({This, databaseConnectionInfoInterface}), '$class'})):getJdbcDriver(get({This, databaseConnectionInfoInterface})),
                'PreLogUtil':put((fun(Target_N74513) -> (get({Target_N74513, '$class'})):toString(Target_N74513) end)((fun(Target_N74520) -> (get({Target_N74520, '$class'})):append(Target_N74520, JdbcDriver) end)((fun(Target_N74527) -> (get({Target_N74527, '$class'})):append(Target_N74527, " Driver: ") end)((fun(Target_N74534) -> (get({Target_N74534, '$class'})):append(Target_N74534, atom_to_list(get({get({This, databaseConnectionInfoInterface}), '$class'}))) end)((fun(Target_N74541) -> (get({Target_N74541, '$class'})):append(Target_N74541, "Loading DbConnnectionInfo: ") end)('StringMaker':new()))))), get({This, 'INIT_SQL'}), "initialize()"),
                (fun(Target_N74641) -> (get({Target_N74641, '$class'})):newInstance(Target_N74641) end)('Class':forName(JdbcDriver))
            catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'SQLLOGGINGERROR'})) of
                    true ->
                    'PreLogUtil':putOE(lists:concat(["LoadDriver Failed: ", (get({get({This, databaseConnectionInfoInterface}), '$class'})):getJdbcDriver(get({This, databaseConnectionInfoInterface}))]), get({This, 'INIT_SQL'}), "initialize()", E);
                    false -> ok
                end,
                erlang:error(E)
            end,
            case ((get({This, userid}) =:= undefined) andalso (get({This, password}) =:= undefined)) of
                true ->
                put({This, useridAndPassword}, true);
                false -> ok
            end,
            (get({This, '$class'})):createConnection(This)
        catch _:Se when Se =/= '$break', Se =/= '$continue', (not is_tuple(Se) orelse element(1, Se) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'SQLLOGGINGERROR'})) of
                true ->
                'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), get({This, 'INIT_SQL'}), "initialize()", Se);
                false -> ok
            end,
            erlang:error(Se)
        end.

getDatabaseConnectionInfoInterface(This) ->
        get({This, databaseConnectionInfoInterface}).

