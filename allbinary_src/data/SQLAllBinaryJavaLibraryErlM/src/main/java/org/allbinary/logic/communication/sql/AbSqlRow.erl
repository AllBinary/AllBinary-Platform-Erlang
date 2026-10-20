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
% import java.sql.ResultSet
% import java.sql.ResultSetMetaData
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.init.db.DbConnectionInfo
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.string.regex.replace.Replace

-module('AbSqlRow').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlColumn', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'EQUAL_QUOTE'}, "=\""),
    put({This, 'ESCAPE_QUOTES'}, "\\\""),
    put({This, 'GET_ROW'}, "Row Value: "),
    put({This, 'METHOD_GET_ROW'}, "getRow()"),
    put({This, 'METHOD_GET_ROWS'}, "getRows()"),
    put({This, 'METHOD_GET_ALL_ROWS'}, "getAllRows()"),
    put({This, 'METHOD_UPDATE_WHERE'}, "updateWhere()"),
    put({This, 'METHOD_GET_ROWS_WHERE_BETWEEN'}, "getRowsWhereBetween()"),
    put({This, 'METHOD_DELETE_WHERE'}, "deleteWhere()"),
    put({This, 'ROW_VALUE_LABEL'}, "Row Value: "),
    put({This, 'ROW_VALUES_LABEL'}, "Row Values: "),
    put({This, 'NO_RESULTS_IN_RESULT_SET'}, "No Results in ResultSet"),
    put({This, 'COLUMN_NAME_LABEL'}, "columnName: "),
    put({This, 'INSERT_END'}, "')"),
    ok.


new(DatabaseConnectionInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DatabaseConnectionInfoInterface),
    This.

'$init'(This, DatabaseConnectionInfoInterface) ->
        'AbSqlColumn':'$init'(This, DatabaseConnectionInfoInterface),
        init_fields(This).

getValue(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        try
        case (fun(Target_N66587) -> (get({Target_N66587, '$class'})):isEmpty(Target_N66587, Value) end)('StringValidationUtil':getInstance()) of
            true ->
            throw({'$return', get({get({This, stringUtil}), 'EMPTY_STRING'})});
            false ->
            throw({'$return', Value})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

updateWhere(This, Key, Value, UpdatedKeyValuePairs) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'UPDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SET'})),
        try
            KeyArray = (fun(Target_N66927) -> (get({Target_N66927, '$class'})):toArray(Target_N66927) end)((get({UpdatedKeyValuePairs, '$class'})):keySet(UpdatedKeyValuePairs)),
            Size = array:size(KeyArray),
            lists:foreach(fun(I) ->
                ColumnName = (fun(Target_N67044) -> (get({Target_N67044, '$class'})):toString(Target_N67044) end)(array:get(I, KeyArray)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, ColumnName),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'EQUAL_QUOTE'})),
                put({local, columnValue}, (get({UpdatedKeyValuePairs, '$class'})):get(UpdatedKeyValuePairs, ColumnName)),
                case (get({local, columnValue}) =:= undefined) of
                    true ->
                    put({local, columnValue}, get({get({This, stringUtil}), 'EMPTY_STRING'}));
                    false ->
                    put({local, columnValue}, (fun(Target_N67300) -> (get({Target_N67300, '$class'})):all(Target_N67300, get({local, columnValue})) end)('Replace':new(get({get({This, sqlStrings}), 'CLOSE_QUOTE'}), get({This, 'ESCAPE_QUOTES'}))))
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
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'SUCCESS_SQL_STATEMENT'}), SqlStatement]), This, get({This, 'METHOD_UPDATE_WHERE'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({This, 'FAILED_SQL_STATEMENT'}) + StringBuffer), This, get({This, 'METHOD_UPDATE_WHERE'}), E);
                false -> ok
            end
        end.

% throws Exception
updateWhere(This, WhereKeyValuePairs, UpdatedKeyValuePairs) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'UPDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SET'})),
        try
            KeyArray = (fun(Target_N68735) -> (get({Target_N68735, '$class'})):toArray(Target_N68735) end)((get({UpdatedKeyValuePairs, '$class'})):keySet(UpdatedKeyValuePairs)),
            Size = array:size(KeyArray),
            lists:foreach(fun(I) ->
                ColumnName = (fun(Target_N68852) -> (get({Target_N68852, '$class'})):toString(Target_N68852) end)(array:get(I, KeyArray)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, ColumnName),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'EQUAL_QUOTE'})),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'COLUMN_NAME_LABEL'}), ColumnName]), This, get({This, 'METHOD_UPDATE_WHERE'}));
                    false -> ok
                end,
                put({local, columnValue}, (get({UpdatedKeyValuePairs, '$class'})):get(UpdatedKeyValuePairs, ColumnName)),
                case (get({local, columnValue}) =:= undefined) of
                    true ->
                    put({local, columnValue}, get({get({This, stringUtil}), 'EMPTY_STRING'}));
                    false ->
                    put({local, columnValue}, (fun(Target_N69346) -> (get({Target_N69346, '$class'})):all(Target_N69346, get({local, columnValue})) end)('Replace':new(get({get({This, sqlStrings}), 'CLOSE_QUOTE'}), get({This, 'ESCAPE_QUOTES'}))))
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
            Set = (get({WhereKeyValuePairs, '$class'})):keySet(WhereKeyValuePairs),
            KeyArray2 = (get({Set, '$class'})):toArray(Set),
            Size2 = array:size(KeyArray2),
            lists:foreach(fun(I) ->
                Key = array:get(I, KeyArray2),
                Value = (get({WhereKeyValuePairs, '$class'})):get(WhereKeyValuePairs, Key),
                begin
                    (get({StringBuffer, '$class'})):append(StringBuffer, Key),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getValue(This, Value)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
                    case (I < (Size2 - 1)) of
                        true ->
                        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'AND'}));
                        false -> ok
                    end
                end
            end, lists:seq(0, Size2 - 1)),
            SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
            (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'SUCCESS_SQL_STATEMENT'}), SqlStatement]), This, get({This, 'METHOD_UPDATE_WHERE'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({This, 'FAILED_SQL_STATEMENT'}) + StringBuffer), This, get({This, 'METHOD_UPDATE_WHERE'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

deleteWhere(This, Key, Value) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'DELETE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Key),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Value),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
        try
            SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
            (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'SUCCESS_SQL_STATEMENT'}), SqlStatement]), This, get({This, 'METHOD_DELETE_WHERE'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), (get({StringBuffer, '$class'})):toString(StringBuffer)]), This, get({This, 'METHOD_DELETE_WHERE'}), E);
                false -> ok
            end
        end.

deleteWhere(This, KeysAndValues) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'DELETE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
        try
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
            (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'SUCCESS_SQL_STATEMENT'}), SqlStatement]), This, get({This, 'METHOD_DELETE_WHERE'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), (get({StringBuffer, '$class'})):toString(StringBuffer)]), This, get({This, 'METHOD_DELETE_WHERE'}), E);
                false -> ok
            end
        end.

insert(This, Values) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'INSERT_INTO'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'VALUES'})),
        try
            lists:foreach(fun(I) ->
                put({local, value}, (get({This, '$class'})):getValue(This, (get({Values, '$class'})):get(Values, I))),
                put({local, value}, (fun(Target_N73845) -> (get({Target_N73845, '$class'})):all(Target_N73845, get({local, value})) end)('Replace':new(get({get({This, sqlStrings}), 'ESCAPE'}), get({get({This, sqlStrings}), 'DOUBLE_ESCAPE'})))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, value})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SINGLE_QUOTE_COMMA_SEP'}))
            end, lists:seq(0, ((get({Values, '$class'})):size(Values) - 1) - 1)),
            put({local, value}, (get({This, '$class'})):getValue(This, (get({Values, '$class'})):get(Values, ((get({Values, '$class'})):size(Values) - 1)))),
            put({local, value}, (fun(Target_N74187) -> (get({Target_N74187, '$class'})):all(Target_N74187, get({local, value})) end)('Replace':new(get({get({This, sqlStrings}), 'ESCAPE'}), get({get({This, sqlStrings}), 'DOUBLE_ESCAPE'})))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({local, value})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'INSERT_END'})),
            SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
            (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'SUCCESS_SQL_STATEMENT'}), SqlStatement]), This, get({This, 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), (get({StringBuffer, '$class'})):toString(StringBuffer)]), This, get({'AbSqlRow', 'INSERT'}), E);
                false -> ok
            end
        end.

getRow(This, KeysAndValues) ->
        try
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT_ALL_FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
        try
            put({local, result}, undefined),
            Set = (get({KeysAndValues, '$class'})):keySet(KeysAndValues),
            KeyArray = (get({Set, '$class'})):toArray(Set),
            Size = array:size(KeyArray),
            lists:foreach(fun(Index) ->
                Key = array:get(Index, KeyArray),
                Value = allbinary_java:to_string((get({KeysAndValues, '$class'})):get(KeysAndValues, Key)),
                (get({StringBuffer, '$class'})):append(StringBuffer, Key),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getValue(This, Value)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
                case (Index < (Size - 1)) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'AND'}));
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({get({This, sqlStrings}), 'SQL_STATEMENT_LABEL'}), SqlStatement]), This, get({This, 'METHOD_GET_ROW'}));
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
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'ROW_VALUE_LABEL'}), (get({get({local, result}), '$class'})):toString(get({local, result}))]), This, get({This, 'METHOD_GET_ROW'}));
                    false -> ok
                end,
                throw({'$return', get({local, result})}),
                Loop();
            false -> ok end end)(),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'NO_RESULTS_IN_RESULT_SET'}), This, get({This, 'METHOD_GET_ROW'}));
                false -> ok
            end,
            undefined
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({This, 'FAILED_SQL_STATEMENT'}) + StringBuffer), This, get({This, 'METHOD_GET_ROW'}), E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getRows(This, KeysAndValues) ->
        (get({This, '$class'})):getRows(This, KeysAndValues, get({'StringUtil':getInstance(), 'EMPTY_STRING'})).

getRows(This, KeysAndValues, More) when (is_list(More) orelse More =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT_ALL_FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
        try
            Rows = 'BasicArrayListD':new(),
            Set = (get({KeysAndValues, '$class'})):keySet(KeysAndValues),
            KeyArray = (get({Set, '$class'})):toArray(Set),
            Size = array:size(KeyArray),
            lists:foreach(fun(Index) ->
                Key = array:get(Index, KeyArray),
                Value = allbinary_java:to_string((get({KeysAndValues, '$class'})):get(KeysAndValues, Key)),
                (get({StringBuffer, '$class'})):append(StringBuffer, Key),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getValue(This, Value)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
                case (Index < (Size - 1)) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'AND'}));
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({This, sqlStrings}), 'SQL_STATEMENT_LABEL'}) + StringBuffer), This, get({This, 'METHOD_GET_ROWS'}));
                false -> ok
            end,
            (get({StringBuffer, '$class'})):append(StringBuffer, More),
            SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
            Rset = (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            ResultSetMetaData = (get({Rset, '$class'})):getMetaData(Rset),
            (fun Loop() -> case (get({Rset, '$class'})):next(Rset) of true ->
                Result = (get({get({This, stdUtil}), '$class'})):createHashMap(get({This, stdUtil})),
                ColumnCount = (get({ResultSetMetaData, '$class'})):getColumnCount(ResultSetMetaData),
                lists:foreach(fun(Index) ->
                    ColumnName = (get({ResultSetMetaData, '$class'})):getColumnName(ResultSetMetaData, Index),
                    Field = (get({Rset, '$class'})):getString(Rset, ColumnName),
                    (get({Result, '$class'})):put(Result, ColumnName, Field)
                end, lists:seq(1, ColumnCount)),
                ResultAsString = (get({Result, '$class'})):toString(Result),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'GET_ROW'}), ResultAsString]), This, get({This, 'METHOD_GET_ROWS'}));
                    false -> ok
                end,
                (get({Rows, '$class'})):add(Rows, Result),
                Loop();
            false -> ok end end)(),
            Rows
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({This, 'FAILED_SQL_STATEMENT'}) + StringBuffer), This, get({This, 'METHOD_GET_ROWS'}), E);
                false -> ok
            end,
            undefined
        end.

getAllRows(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT_ALL_FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({This, sqlStrings}), 'SQL_STATEMENT_LABEL'}) + StringBuffer), This, get({This, 'METHOD_GET_ALL_ROWS'}));
                false -> ok
            end,
            Rows = 'BasicArrayListD':new(),
            SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
            Rset = (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            ResultSetMetaData = (get({Rset, '$class'})):getMetaData(Rset),
            (fun Loop() -> case (get({Rset, '$class'})):next(Rset) of true ->
                Result = (get({get({This, stdUtil}), '$class'})):createHashMap(get({This, stdUtil})),
                ColumnCount = (get({ResultSetMetaData, '$class'})):getColumnCount(ResultSetMetaData),
                lists:foreach(fun(Index) ->
                    ColumnName = (get({ResultSetMetaData, '$class'})):getColumnName(ResultSetMetaData, Index),
                    Field = (get({Rset, '$class'})):getString(Rset, ColumnName),
                    (get({Result, '$class'})):put(Result, ColumnName, Field)
                end, lists:seq(1, ColumnCount)),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'ROW_VALUES_LABEL'}), (get({Result, '$class'})):toString(Result)]), This, get({This, 'METHOD_GET_ALL_ROWS'}));
                    false -> ok
                end,
                (get({Rows, '$class'})):add(Rows, Result),
                Loop();
            false -> ok end end)(),
            Rows
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({This, 'FAILED_SQL_STATEMENT'}) + StringBuffer), This, get({This, 'METHOD_GET_ALL_ROWS'}), E);
                false -> ok
            end,
            undefined
        end.

getRowsWhereBetween(This, WhereKeyValuePairs, BetweenColumn, Smallest, Largest) when (is_list(BetweenColumn) orelse BetweenColumn =:= undefined), (is_list(Smallest) orelse Smallest =:= undefined), (is_list(Largest) orelse Largest =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT_ALL_FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        try
            Rows = 'BasicArrayListD':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
            Set = (get({WhereKeyValuePairs, '$class'})):keySet(WhereKeyValuePairs),
            put({local, key}, undefined),
            put({local, value}, undefined),
            KeyArray = (get({Set, '$class'})):toArray(Set),
            Size = array:size(KeyArray),
            lists:foreach(fun(Index) ->
                put({local, key}, array:get(Index, KeyArray)),
                put({local, value}, (get({WhereKeyValuePairs, '$class'})):get(WhereKeyValuePairs, get({local, key}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, key})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getValue(This, get({local, value}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'AND'}))
            end, lists:seq(0, Size - 1)),
            (get({StringBuffer, '$class'})):append(StringBuffer, BetweenColumn),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'MORE_THAN_QUOTE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, Smallest),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'AND'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, BetweenColumn),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'LESS_THAN_QUOTE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, Largest),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
            SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({get({This, sqlStrings}), 'SQL_STATEMENT_LABEL'}), SqlStatement]), This, get({This, 'METHOD_GET_ROWS_WHERE_BETWEEN'}));
                false -> ok
            end,
            Rset = (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            ResultSetMetaData = (get({Rset, '$class'})):getMetaData(Rset),
            put({local, result}, undefined),
            put({local, columnNames}, undefined),
            put({local, columnCount}, 0),
            put({local, columnName}, undefined),
            put({local, field}, undefined),
            (fun Loop() -> case (get({Rset, '$class'})):next(Rset) of true ->
                put({local, result}, (get({get({This, stdUtil}), '$class'})):createHashMap(get({This, stdUtil}))),
                put({local, columnNames}, 'BasicArrayListD':new()),
                put({local, columnCount}, (get({ResultSetMetaData, '$class'})):getColumnCount(ResultSetMetaData)),
                lists:foreach(fun(Index) ->
                    put({local, columnName}, (get({ResultSetMetaData, '$class'})):getColumnName(ResultSetMetaData, Index)),
                    put({local, field}, (get({Rset, '$class'})):getString(Rset, get({local, columnName}))),
                    (get({get({local, result}), '$class'})):put(get({local, result}), get({local, columnName}), get({local, field}))
                end, lists:seq(1, get({local, columnCount}))),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'ROW_VALUE_LABEL'}), (get({get({local, result}), '$class'})):toString(get({local, result}))]), This, get({This, 'METHOD_GET_ROWS_WHERE_BETWEEN'}));
                    false -> ok
                end,
                (get({Rows, '$class'})):add(Rows, get({local, result})),
                Loop();
            false -> ok end end)(),
            Rows
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({This, 'FAILED_SQL_STATEMENT'}) + StringBuffer), This, get({This, 'METHOD_GET_ROWS_WHERE_BETWEEN'}), E);
                false -> ok
            end,
            undefined
        end.

getRowsWhereBetween(This, BetweenColumn, Smallest, Largest) when (is_list(BetweenColumn) orelse BetweenColumn =:= undefined), (is_list(Smallest) orelse Smallest =:= undefined), (is_list(Largest) orelse Largest =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT_ALL_FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        try
            Rows = 'BasicArrayListD':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, BetweenColumn),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'MORE_THAN_QUOTE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, Smallest),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'AND'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, BetweenColumn),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'LESS_THAN_QUOTE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, Largest),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
            SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({get({This, sqlStrings}), 'SQL_STATEMENT_LABEL'}), SqlStatement]), This, get({This, 'METHOD_GET_ROWS_WHERE_BETWEEN'}));
                false -> ok
            end,
            Rset = (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            ResultSetMetaData = (get({Rset, '$class'})):getMetaData(Rset),
            put({local, columnName}, undefined),
            put({local, field}, undefined),
            put({local, result}, undefined),
            put({local, columnNames}, undefined),
            put({local, columnCount}, 0),
            (fun Loop() -> case (get({Rset, '$class'})):next(Rset) of true ->
                put({local, result}, (get({get({This, stdUtil}), '$class'})):createHashMap(get({This, stdUtil}))),
                put({local, columnNames}, 'BasicArrayListD':new()),
                put({local, columnCount}, (get({ResultSetMetaData, '$class'})):getColumnCount(ResultSetMetaData)),
                lists:foreach(fun(Index) ->
                    put({local, columnName}, (get({ResultSetMetaData, '$class'})):getColumnName(ResultSetMetaData, Index)),
                    put({local, field}, (get({Rset, '$class'})):getString(Rset, get({local, columnName}))),
                    (get({get({local, result}), '$class'})):put(get({local, result}), get({local, columnName}), get({local, field}))
                end, lists:seq(1, get({local, columnCount}))),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'ROW_VALUE_LABEL'}), (get({get({local, result}), '$class'})):toString(get({local, result}))]), This, get({This, 'METHOD_GET_ROWS_WHERE_BETWEEN'}));
                    false -> ok
                end,
                (get({Rows, '$class'})):add(Rows, get({local, result})),
                Loop();
            false -> ok end end)(),
            Rows
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({This, 'FAILED_SQL_STATEMENT'}) + StringBuffer), This, get({This, 'METHOD_GET_ROWS_WHERE_BETWEEN'}), E);
                false -> ok
            end,
            undefined
        end.

