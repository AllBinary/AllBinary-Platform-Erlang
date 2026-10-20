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
% package org.allbinary.data.tables.user.commerce.money.payment
% import java.util.Calendar
% import java.util.HashMap
% import java.util.Random
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.commerce.money.payment.Payment
% import org.allbinary.business.user.commerce.money.payment.PaymentData
% import org.allbinary.business.user.commerce.money.payment.PaymentInterface
% import org.allbinary.data.generator.PaymentIdGenerator
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.control.crypt.SuperCrypt
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil

-module('PaymentEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PaymentEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "payment"),
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

getLastId(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        'AbSqlBean':getLargestIntegerInColumnWhere(This, get({'PaymentData', 'ID'}), get({'UserData', 'USERNAME'}), UserName).

setDefault(This, UserName, Index) when (is_list(UserName) orelse UserName =:= undefined) ->
        try
            UpdateKeyAndValue = (fun(Target_N66479) -> (get({Target_N66479, '$class'})):createHashMap(Target_N66479) end)('StdUtil':getInstance()),
            WhereKeyAndValue = (fun(Target_N66530) -> (get({Target_N66530, '$class'})):createHashMap(Target_N66530) end)('StdUtil':getInstance()),
            (get({WhereKeyAndValue, '$class'})):put(WhereKeyAndValue, get({'UserData', 'USERNAME'}), UserName),
            PaymentInterface = (get({This, '$class'})):getDefault(This, UserName),
            case (PaymentInterface =/= undefined) of
                true ->
                (get({UpdateKeyAndValue, '$class'})):put(UpdateKeyAndValue, get({'EntryData':getInstance(), 'DEFAULT'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
                (get({WhereKeyAndValue, '$class'})):put(WhereKeyAndValue, get({'PaymentData', 'ID'}), (get({PaymentInterface, '$class'})):getId(PaymentInterface)),
                'AbSqlBean':updateWhere(This, WhereKeyAndValue, UpdateKeyAndValue);
                false -> ok
            end,
            (get({UpdateKeyAndValue, '$class'})):put(UpdateKeyAndValue, get({'EntryData':getInstance(), 'DEFAULT'}), get({'EntryData':getInstance(), 'DEFAULT'})),
            (get({WhereKeyAndValue, '$class'})):put(WhereKeyAndValue, get({'PaymentData', 'ID'}), (get({Index, '$class'})):toString(Index)),
            'AbSqlBean':updateWhere(This, WhereKeyAndValue, UpdateKeyAndValue),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "setDefault");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "setDefault", E);
                false -> ok
            end
        end.

get(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        try
            PaymentVector = 'BasicArrayListD':new(),
            KeyAndValue = (fun(Target_N67631) -> (get({Target_N67631, '$class'})):createHashMap(Target_N67631) end)('StdUtil':getInstance()),
            (get({KeyAndValue, '$class'})):put(KeyAndValue, get({'UserData', 'USERNAME'}), UserName),
            PaymentList = 'AbSqlBean':getRows(This, KeyAndValue),
            Size = (get({PaymentList, '$class'})):size(PaymentList),
            lists:foreach(fun(Index) ->
                PaymentHashMap = (get({PaymentList, '$class'})):get(PaymentList, Index),
                Payment = 'Payment':new(PaymentHashMap),
                case (Payment =/= undefined) of
                    true ->
                    (get({PaymentVector, '$class'})):add(PaymentVector, Payment);
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            PaymentVector
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), 'GET'}), E);
                false -> ok
            end,
            undefined
        end.

getDefault(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        try
        try
            put({local, paymentHashMap}, (fun(Target_N68432) -> (get({Target_N68432, '$class'})):createHashMap(Target_N68432) end)('StdUtil':getInstance())),
            UpdateKeyAndValue = (fun(Target_N68483) -> (get({Target_N68483, '$class'})):createHashMap(Target_N68483) end)('StdUtil':getInstance()),
            (get({UpdateKeyAndValue, '$class'})):put(UpdateKeyAndValue, get({'EntryData':getInstance(), 'DEFAULT'}), get({'EntryData':getInstance(), 'DEFAULT'})),
            (get({UpdateKeyAndValue, '$class'})):put(UpdateKeyAndValue, get({'UserData', 'USERNAME'}), UserName),
            put({local, paymentHashMap}, 'AbSqlBean':getRow(This, UpdateKeyAndValue)),
            case (get({local, paymentHashMap}) =/= undefined) of
                true ->
                Payment = 'Payment':new(get({local, paymentHashMap})),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "getDefault");
                    false -> ok
                end,
                throw({'$return', Payment});
                false ->
                throw({'$return', undefined})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "getDefault", E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

remove(This, UserName, Index) when (is_list(UserName) orelse UserName =:= undefined) ->
        try
            WhereHashMap = (fun(Target_N69365) -> (get({Target_N69365, '$class'})):createHashMap(Target_N69365) end)('StdUtil':getInstance()),
            (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'UserData', 'USERNAME'}), UserName),
            (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'PaymentData', 'ID'}), (get({Index, '$class'})):toString(Index)),
            'AbSqlBean':deleteWhere(This, WhereHashMap),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "remove");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "remove", E);
                false -> ok
            end
        end.

add(This, UserName, PaymentInterface) when (is_list(UserName) orelse UserName =:= undefined) ->
        try
            Vector = 'BasicArrayListD':new(),
            (get({Vector, '$class'})):add(Vector, (fun(Target_N70168) -> (get({Target_N70168, '$class'})):getNext(Target_N70168) end)('PaymentIdGenerator':new())),
            (get({Vector, '$class'})):add(Vector, UserName),
            (get({Vector, '$class'})):add(Vector, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            (get({Vector, '$class'})):add(Vector, (get({PaymentInterface, '$class'})):getName(PaymentInterface)),
            (get({Vector, '$class'})):add(Vector, (get({PaymentInterface, '$class'})):getType(PaymentInterface)),
            (get({Vector, '$class'})):add(Vector, (get({PaymentInterface, '$class'})):getExpiration(PaymentInterface)),
            Random = (fun(Target_N70401) -> (get({Target_N70401, '$class'})):nextInt(Target_N70401, get({'SuperCrypt', 'KEYMAX'})) end)('Random':new()),
            (get({Vector, '$class'})):add(Vector, (fun(Target_N70472) -> (get({Target_N70472, '$class'})):encrypt(Target_N70472, (get({PaymentInterface, '$class'})):getNumber(PaymentInterface)) end)('SuperCrypt':new(Random))),
            (get({Vector, '$class'})):add(Vector, (get({Random, '$class'})):toString(Random)),
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N70646) -> (get({Target_N70646, '$class'})):toString(Target_N70646) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            (get({Vector, '$class'})):add(Vector, Time),
            'AbSqlBean':insert(This, Vector),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "add");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "add", E);
                false -> ok
            end
        end.

createTableStatement(This) ->
        EntryData = 'EntryData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N71401) -> (get({Target_N71401, '$class'})):append(Target_N71401, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N71408) -> (get({Target_N71408, '$class'})):append(Target_N71408, get({'PaymentData', 'ID'})) end)((fun(Target_N71415) -> (get({Target_N71415, '$class'})):append(Target_N71415, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N71422) -> (get({Target_N71422, '$class'})):append(Target_N71422, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N71429) -> (get({Target_N71429, '$class'})):append(Target_N71429, get({EntryData, 'TIMECREATED'})) end)((fun(Target_N71436) -> (get({Target_N71436, '$class'})):append(Target_N71436, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N71443) -> (get({Target_N71443, '$class'})):append(Target_N71443, get({EntryData, 'ENCRYPTION'})) end)((fun(Target_N71450) -> (get({Target_N71450, '$class'})):append(Target_N71450, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N71457) -> (get({Target_N71457, '$class'})):append(Target_N71457, get({'PaymentData', 'NUMBER'})) end)((fun(Target_N71464) -> (get({Target_N71464, '$class'})):append(Target_N71464, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N71471) -> (get({Target_N71471, '$class'})):append(Target_N71471, get({'PaymentData', 'EXPIRATION'})) end)((fun(Target_N71478) -> (get({Target_N71478, '$class'})):append(Target_N71478, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N71485) -> (get({Target_N71485, '$class'})):append(Target_N71485, get({'PaymentData', 'TYPE'})) end)((fun(Target_N71492) -> (get({Target_N71492, '$class'})):append(Target_N71492, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N71499) -> (get({Target_N71499, '$class'})):append(Target_N71499, get({'PaymentData', 'NAME'})) end)((fun(Target_N71506) -> (get({Target_N71506, '$class'})):append(Target_N71506, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N71513) -> (get({Target_N71513, '$class'})):append(Target_N71513, get({EntryData, 'DEFAULT'})) end)((fun(Target_N71520) -> (get({Target_N71520, '$class'})):append(Target_N71520, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N71527) -> (get({Target_N71527, '$class'})):append(Target_N71527, get({'UserData', 'USERNAME'})) end)((fun(Target_N71534) -> (get({Target_N71534, '$class'})):append(Target_N71534, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL'})) end)((fun(Target_N71541) -> (get({Target_N71541, '$class'})):append(Target_N71541, get({'PaymentData', 'ID'})) end)((fun(Target_N71548) -> (get({Target_N71548, '$class'})):append(Target_N71548, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N71555) -> (get({Target_N71555, '$class'})):append(Target_N71555, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'}))))))))))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

drop(This) ->
        'AbSqlBean':dropTable(This).

