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
% package org.allbinary.data.tables.user.quoterequest
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.business.quoterequest.QuoteRequestData
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.quoterequest.QuoteRequest
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('QuoteRequestEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements QuoteRequestEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "quoterequest"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'AbSqlBean':'$init'(This, 'UserDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, tableName})).

insert(This, Values) ->
        try
            'AbSqlBean':insert(This, Values),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'QuoteRequestEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'QuoteRequestEntity', 'INSERT'}), E);
                false -> ok
            end
        end.

% throws Exception
get(This, UserName, Id) when (is_list(UserName) orelse UserName =:= undefined), is_integer(Id) ->
        try
        Row = (fun(Target_N66729) -> (get({Target_N66729, '$class'})):createHashMap(Target_N66729) end)('StdUtil':getInstance()),
        (get({Row, '$class'})):put(Row, get({'UserData', 'USERNAME'}), UserName),
        (get({Row, '$class'})):put(Row, get({'QuoteRequestData':getInstance(), 'ID'}), allbinary_java:to_string(Id)),
        QuoteRequestHashMap = 'AbSqlBean':getRow(This, Row),
        case (QuoteRequestHashMap =/= undefined) of
            true ->
            throw({'$return', 'QuoteRequest':new(QuoteRequestHashMap)});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getIds(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        'AbSqlBean':getColumnWhere(This, get({'QuoteRequestData':getInstance(), 'ID'}), get({'UserData', 'USERNAME'}), UserName).

deleteWhere(This, Key, Value) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        try
            'AbSqlBean':deleteWhere(This, Key, Value),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "deleteWhere");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "deleteWhere", E);
                false -> ok
            end
        end.

createTableStatement(This) ->
        QuoteRequestData = 'QuoteRequestData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N67927) -> (get({Target_N67927, '$class'})):append(Target_N67927, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N67934) -> (get({Target_N67934, '$class'})):append(Target_N67934, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})))),
        (fun(Target_N68018) -> (get({Target_N68018, '$class'})):append(Target_N68018, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({QuoteRequestData, 'ID'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'UserData', 'USERNAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({QuoteRequestData, 'PROJECT_INFO'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({QuoteRequestData, 'CUSTOMER_COMMENTS'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({QuoteRequestData, 'BUDGET'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({QuoteRequestData, 'TIMEFRAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({QuoteRequestData, 'COMMENTS'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'EntryData':getInstance(), 'TIMECREATED'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'EntryData':getInstance(), 'LASTMODIFIED'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'PRIMARY_KEY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({QuoteRequestData, 'ID'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'END'})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

dropTable(This) ->
        Result = allbinary_java:to_string('AbSqlBean':dropTable(This)),
        Result.

update(This, UserName, UpdatedValues) when (is_list(UserName) orelse UserName =:= undefined) ->
        'AbSqlBean':updateWhere(This, get({'UserData', 'USERNAME'}), UserName, UpdatedValues).

