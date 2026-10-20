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
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.business.init.db.DbConnectionInfo
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker

-module('AbSqlBean').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlRow', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'METHOD_GET_FIELD'}, "getField"),
    put({This, 'METHOD_IS_SUBSET_OF_ENTRY'}, "isSubsetOfEntry"),
    ok.


new(DatabaseConnectionInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, DatabaseConnectionInfoInterface),
    This.

'$init'(This, DatabaseConnectionInfoInterface) ->
        'AbSqlRow':'$init'(This, DatabaseConnectionInfoInterface),
        init_fields(This).

getField(This, Key, Value, RequestedField) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined), (is_list(RequestedField) orelse RequestedField =:= undefined) ->
        try
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, RequestedField),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Key),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Value),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
        SqlStatement = (get({StringBuffer, '$class'})):toString(StringBuffer),
        try
            put({local, field}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
            Rset = (get({This, '$class'})):executeSQLStatement(This, SqlStatement),
            (fun Loop() -> case (get({Rset, '$class'})):next(Rset) of true ->
                put({local, field}, (get({Rset, '$class'})):getString(Rset, RequestedField)),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SQL_STATEMENT_LABEL'})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, SqlStatement),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'FIELD_VALUE'})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({local, field})),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'METHOD_GET_FIELD'}));
                    false -> ok
                end,
                throw({'$return', get({local, field})}),
                Loop();
            false -> ok end end)(),
            undefined
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), SqlStatement]), This, get({This, 'METHOD_GET_FIELD'}), E);
                false -> ok
            end,
            lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), SqlStatement])
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getField(This, KeysAndValues, RequestedField) when (is_list(RequestedField) orelse RequestedField =:= undefined) ->
        try
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, RequestedField),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'FROM'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
        try
            put({local, field}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
            Set = (get({KeysAndValues, '$class'})):keySet(KeysAndValues),
            KeyArray = (get({Set, '$class'})):toArray(Set),
            Size = array:size(KeyArray),
            put({local, key}, undefined),
            put({local, value}, undefined),
            lists:foreach(fun(I) ->
                put({local, key}, array:get(I, KeyArray)),
                put({local, value}, allbinary_java:to_string((get({KeysAndValues, '$class'})):get(KeysAndValues, get({local, key})))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, key})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({local, value})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
                case (I < (Size - 1)) of
                    true ->
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'AND'}));
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            put({local, sqlStatement}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
            Rset = (get({This, '$class'})):executeSQLStatement(This, get({local, sqlStatement})),
            (fun Loop() -> case (get({Rset, '$class'})):next(Rset) of true ->
                put({local, field}, (get({Rset, '$class'})):getString(Rset, RequestedField)),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SQL_STATEMENT_LABEL'})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({local, sqlStatement})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'FIELD_VALUE'})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({local, field})),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'METHOD_GET_FIELD'}));
                    false -> ok
                end,
                throw({'$return', get({local, field})}),
                Loop();
            false -> ok end end)(),
            undefined
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, sqlStatement}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), get({local, sqlStatement})]), This, get({This, 'METHOD_GET_FIELD'}), E);
                false -> ok
            end,
            lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), get({local, sqlStatement})])
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isSubsetOfEntry(This, Key, Value, ColumnsAndValues) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        try
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SELECT'})),
        try
            KeyArray = (fun(Target_N69498) -> (get({Target_N69498, '$class'})):toArray(Target_N69498) end)((get({ColumnsAndValues, '$class'})):keySet(ColumnsAndValues)),
            Size = array:size(KeyArray),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, Key),
            lists:foreach(fun(I) ->
                (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N69732) -> (get({Target_N69732, '$class'})):toString(Target_N69732) end)(array:get(I, KeyArray)))
            end, lists:seq(0, Size - 1)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'FROM'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'WHERE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, Key),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'EQUAL_QUOTE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, Value),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CLOSE_QUOTE'})),
            put({local, sqlStatement}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
            Rset = (get({This, '$class'})):executeSQLStatement(This, get({local, sqlStatement})),
            put({local, columnName}, undefined),
            put({local, field}, undefined),
            (fun Loop() -> case (get({Rset, '$class'})):next(Rset) of true ->
                KeyArray2 = (fun(Target_N70269) -> (get({Target_N70269, '$class'})):toArray(Target_N70269) end)((get({ColumnsAndValues, '$class'})):keySet(ColumnsAndValues)),
                Size2 = array:size(KeyArray2),
                lists:foreach(fun(I) ->
                    put({local, columnName}, (fun(Target_N70376) -> (get({Target_N70376, '$class'})):toString(Target_N70376) end)(array:get(I, KeyArray2))),
                    put({local, field}, (fun(Target_N70421) -> (get({Target_N70421, '$class'})):toString(Target_N70421) end)((get({Rset, '$class'})):getObject(Rset, get({local, columnName})))),
                    case ((get({get({local, field}), '$class'})):compareTo(get({local, field}), (get({ColumnsAndValues, '$class'})):get(ColumnsAndValues, get({local, columnName}))) =/= 0) of
                        true ->
                        throw({'$return', get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'NOTASUBSET'})});
                        false -> ok
                    end
                end, lists:seq(0, Size2 - 1)),
                Loop();
            false -> ok end end)(),
            case ((get({Rset, '$class'})):getRow(Rset) =/= 1) of
                true ->
                throw({'$return', get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'NOTASUBSET'})});
                false ->
                throw({'$return', get({get({get({get({'org', allbinary}), globals}), 'GLOBALS2'}), 'ISASUBSET'})})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({local, sqlStatement}, (get({StringBuffer, '$class'})):toString(StringBuffer)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), get({local, sqlStatement})]), This, get({This, 'METHOD_IS_SUBSET_OF_ENTRY'}), E);
                false -> ok
            end,
            lists:concat([get({This, 'FAILED_SQL_STATEMENT'}), get({local, sqlStatement})])
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

