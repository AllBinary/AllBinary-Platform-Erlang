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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.init.db.DbConnectionInfo
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker

-module('AbSqlColumn').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlTable', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'LARGEST_INT_VALUE_IN_COLUMN'}, "\nLargest Int Value in column: "),
    put({This, 'METHOD_GET_LARGETS_INTEGER_IN_COLUMN'}, "getLargestIntegerInColumn"),
    put({This, 'METHOD_GET_COLUMN'}, "getColumn"),
    put({This, 'METHOD_GET_COLUMN_WHERE'}, "getColumnWhere"),
    put({This, 'INVALID_RESULT'}, "-1"),
    ok.


new(DatabaseConnectionInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DatabaseConnectionInfoInterface),
    This.

'$init'(This, DatabaseConnectionInfoInterface) ->
        'AbSqlTable':'$init'(This, DatabaseConnectionInfoInterface),
        init_fields(This).

getLargestIntegerInColumnWhere(This, ColumnName, Key, Value) when (is_list(ColumnName) orelse ColumnName =:= undefined), (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, ColumnName),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Key),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Value),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
        SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
        try
            put({local, largest}, 0),
            Rset = (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            (fun Loop() -> case (get({Rset, '$class'})):next(Rset) of true ->
                IntValue = (get({Rset, '$class'})):getInt(Rset, ColumnName),
                case (IntValue > get({local, largest})) of
                    true ->
                    put({local, largest}, IntValue);
                    false -> ok
                end,
                Loop();
            false -> ok end end)(),
            LargestAsString = (get({get({local, largest}), '$class'})):toString(get({local, largest})),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SQL_STATEMENT_LABEL'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, SqlStatement),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'LARGEST_INT_VALUE_IN_COLUMN'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, LargestAsString),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'METHOD_GET_LARGETS_INTEGER_IN_COLUMN'}));
                false -> ok
            end,
            LargestAsString
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), SqlStatement]), This, get({This, 'METHOD_GET_LARGETS_INTEGER_IN_COLUMN'}), E);
                false -> ok
            end,
            get({This, 'INVALID_RESULT'})
        end.

getColumn(This, ColumnName) when (is_list(ColumnName) orelse ColumnName =:= undefined) ->
        Column = 'BasicArrayListD':new(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, ColumnName),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
        try
            Rset = (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            (fun Loop() -> case (get({Rset, '$class'})):next(Rset) of true ->
                Field = (fun(Target_N67986) -> (get({Target_N67986, '$class'})):toString(Target_N67986) end)((get({Rset, '$class'})):getObject(Rset, ColumnName)),
                (get({Column, '$class'})):add(Column, Field),
                Loop();
            false -> ok end end)(),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SQL_STATEMENT_LABEL'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, SqlStatement),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'COLUMN_VALUE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({Column, '$class'})):toString(Column)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'METHOD_GET_COLUMN'}));
                false -> ok
            end,
            Column
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), SqlStatement]), This, get({This, 'METHOD_GET_COLUMN'}), E);
                false -> ok
            end,
            Column
        end.

getColumnWhere(This, ColumnName, Key, Value) when (is_list(ColumnName) orelse ColumnName =:= undefined), (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, ColumnName),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Key),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Value),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
        SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
        Column = 'BasicArrayListD':new(),
        put({local, rset}, undefined),
        put({local, field}, undefined),
        try
            put({local, rset}, (get({This, '$class'})):executeSQLStatement(This, SqlStatement)),
            (fun Loop() -> case (get({get({local, rset}), '$class'})):next(get({local, rset})) of true ->
                put({local, field}, (fun(Target_N69465) -> (get({Target_N69465, '$class'})):toString(Target_N69465) end)((get({get({local, rset}), '$class'})):getObject(get({local, rset}), ColumnName))),
                (get({Column, '$class'})):add(Column, get({local, field})),
                Loop();
            false -> ok end end)(),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SQL_STATEMENT_LABEL'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, SqlStatement),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'COLUMN_VALUE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({Column, '$class'})):toString(Column)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'METHOD_GET_COLUMN_WHERE'}));
                false -> ok
            end,
            Column
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), SqlStatement]), This, get({This, 'METHOD_GET_COLUMN_WHERE'}), E);
                false -> ok
            end,
            Column
        end.

