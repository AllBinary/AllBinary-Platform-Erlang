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
% package org.allbinary.data.tables.user.commerce.money.payment.transaction
% import java.util.Calendar
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.commerce.inventory.order.OrderData
% import org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionKeysFactory
% import org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResult
% import org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResultInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('TransactionResultEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TransactionResultEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "vresults"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'AbSqlBean':init(This, 'UserDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, tableName})).

remove(This, UserName, OrderNumber) when (is_list(UserName) orelse UserName =:= undefined), (is_list(OrderNumber) orelse OrderNumber =:= undefined) ->
        try
            WhereHashMap = (fun(Target_N66336) -> (get({Target_N66336, '$class'})):createHashMap(Target_N66336) end)('StdUtil':getInstance()),
            (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'OrderData', 'ID'}), OrderNumber),
            (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'UserData', 'USERNAME'}), UserName),
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

add(This, UserName, OrderNumber, TransactionResultInterface) when (is_list(UserName) orelse UserName =:= undefined), (is_list(OrderNumber) orelse OrderNumber =:= undefined) ->
        try
            Values = 'BasicArrayListD':new(),
            (get({Values, '$class'})):add(Values, OrderNumber),
            (get({Values, '$class'})):add(Values, UserName),
            (get({Values, '$class'})):addAllList(Values, (get({TransactionResultInterface, '$class'})):getValues(TransactionResultInterface)),
            Calendar = 'Calendar':getInstance(),
            Time = (fun(Target_N67266) -> (get({Target_N67266, '$class'})):toString(Target_N67266) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar)),
            (get({Values, '$class'})):add(Values, Time),
            (get({Values, '$class'})):add(Values, Time),
            'AbSqlBean':insert(This, Values),
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

getTransactionResultInterface(This, OrderNumber) when (is_list(OrderNumber) orelse OrderNumber =:= undefined) ->
        try
        try
            put({local, resultHashMap}, (fun(Target_N68001) -> (get({Target_N68001, '$class'})):createHashMap(Target_N68001) end)('StdUtil':getInstance())),
            UpdateKeyAndValue = (fun(Target_N68052) -> (get({Target_N68052, '$class'})):createHashMap(Target_N68052) end)('StdUtil':getInstance()),
            (get({UpdateKeyAndValue, '$class'})):put(UpdateKeyAndValue, get({'OrderData', 'ID'}), OrderNumber),
            put({local, resultHashMap}, 'AbSqlBean':getRow(This, UpdateKeyAndValue)),
            case (get({local, resultHashMap}) =/= undefined) of
                true ->
                TransactionResult = 'TransactionResult':new(get({local, resultHashMap})),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "getTransactionResultInterface");
                    false -> ok
                end,
                throw({'$return', TransactionResult});
                false ->
                throw({'$return', undefined})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "getTransactionResultInterface", E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

createTableStatement(This) ->
        PaymentTransactionKeysFactory = 'PaymentTransactionKeysFactory':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N68943) -> (get({Target_N68943, '$class'})):append(Target_N68943, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N68950) -> (get({Target_N68950, '$class'})):append(Target_N68950, get({'UserData', 'USERNAME'})) end)((fun(Target_N68957) -> (get({Target_N68957, '$class'})):append(Target_N68957, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N68964) -> (get({Target_N68964, '$class'})):append(Target_N68964, get({'OrderData', 'ID'})) end)((fun(Target_N68971) -> (get({Target_N68971, '$class'})):append(Target_N68971, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N68978) -> (get({Target_N68978, '$class'})):append(Target_N68978, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})))))))),
        (fun(Target_N69148) -> (get({Target_N69148, '$class'})):append(Target_N69148, get({get({This, sqlTypeStrings}), 'TWELVE_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N69155) -> (get({Target_N69155, '$class'})):append(Target_N69155, (get({get({PaymentTransactionKeysFactory, 'PNREF'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'PNREF'}))) end)((fun(Target_N69162) -> (get({Target_N69162, '$class'})):append(Target_N69162, get({get({This, sqlTypeStrings}), 'MAX_INT_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({PaymentTransactionKeysFactory, 'RESULT'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'RESULT'})))))),
        (fun(Target_N69294) -> (get({Target_N69294, '$class'})):append(Target_N69294, get({get({This, sqlTypeStrings}), 'ONE_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N69301) -> (get({Target_N69301, '$class'})):append(Target_N69301, (get({get({PaymentTransactionKeysFactory, 'AVSADDR'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'AVSADDR'}))) end)((fun(Target_N69308) -> (get({Target_N69308, '$class'})):append(Target_N69308, get({get({This, sqlTypeStrings}), 'SIX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N69315) -> (get({Target_N69315, '$class'})):append(Target_N69315, (get({get({PaymentTransactionKeysFactory, 'AUTHCODE'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'AUTHCODE'}))) end)((fun(Target_N69322) -> (get({Target_N69322, '$class'})):append(Target_N69322, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({PaymentTransactionKeysFactory, 'RESPMSG'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'RESPMSG'})))))))),
        (fun(Target_N69505) -> (get({Target_N69505, '$class'})):append(Target_N69505, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N69512) -> (get({Target_N69512, '$class'})):append(Target_N69512, (get({get({PaymentTransactionKeysFactory, 'STATUS'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'STATUS'}))) end)((fun(Target_N69519) -> (get({Target_N69519, '$class'})):append(Target_N69519, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N69526) -> (get({Target_N69526, '$class'})):append(Target_N69526, (get({get({PaymentTransactionKeysFactory, 'ORIGRESULT'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'ORIGRESULT'}))) end)((fun(Target_N69533) -> (get({Target_N69533, '$class'})):append(Target_N69533, get({get({This, sqlTypeStrings}), 'ONE_CHAR_COLUMN_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({PaymentTransactionKeysFactory, 'AVSZIP'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'AVSZIP'})))))))),
        (fun(Target_N69716) -> (get({Target_N69716, '$class'})):append(Target_N69716, get({get({This, sqlTypeStrings}), 'TWO_INT_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({PaymentTransactionKeysFactory, 'FRAUDCODE'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'FRAUDCODE'})))),
        (fun(Target_N69797) -> (get({Target_N69797, '$class'})):append(Target_N69797, get({get({This, sqlTypeStrings}), 'MAX_INT_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({PaymentTransactionKeysFactory, 'FRAUDMSG'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'FRAUDMSG'})))),
        (fun(Target_N69878) -> (get({Target_N69878, '$class'})):append(Target_N69878, get({get({This, sqlTypeStrings}), 'MAX_INT_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({PaymentTransactionKeysFactory, 'ERRCODE'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'ERRCODE'})))),
        (fun(Target_N69959) -> (get({Target_N69959, '$class'})):append(Target_N69959, get({get({This, sqlTypeStrings}), 'THREE_INT_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({PaymentTransactionKeysFactory, 'SCORE'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'SCORE'})))),
        (fun(Target_N70040) -> (get({Target_N70040, '$class'})):append(Target_N70040, (get({get({PaymentTransactionKeysFactory, 'REASON3'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'REASON3'}))) end)((fun(Target_N70047) -> (get({Target_N70047, '$class'})):append(Target_N70047, get({get({This, sqlTypeStrings}), 'FOUR_INT_NOT_NULL'})) end)((fun(Target_N70054) -> (get({Target_N70054, '$class'})):append(Target_N70054, (get({get({PaymentTransactionKeysFactory, 'REASON2'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'REASON2'}))) end)((fun(Target_N70061) -> (get({Target_N70061, '$class'})):append(Target_N70061, get({get({This, sqlTypeStrings}), 'FOUR_INT_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({get({PaymentTransactionKeysFactory, 'REASON1'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'REASON1'}))))))),
        (fun(Target_N70221) -> (get({Target_N70221, '$class'})):append(Target_N70221, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N70228) -> (get({Target_N70228, '$class'})):append(Target_N70228, get({'OrderData', 'ID'})) end)((fun(Target_N70235) -> (get({Target_N70235, '$class'})):append(Target_N70235, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N70242) -> (get({Target_N70242, '$class'})):append(Target_N70242, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N70249) -> (get({Target_N70249, '$class'})):append(Target_N70249, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N70256) -> (get({Target_N70256, '$class'})):append(Target_N70256, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N70263) -> (get({Target_N70263, '$class'})):append(Target_N70263, get({'EntryData':getInstance(), 'LASTMODIFIED'})) end)((fun(Target_N70270) -> (get({Target_N70270, '$class'})):append(Target_N70270, get({get({This, sqlTypeStrings}), 'FOUR_INT_NOT_NULL'})) end)((fun(Target_N70277) -> (get({Target_N70277, '$class'})):append(Target_N70277, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION7'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION7'}))) end)((fun(Target_N70284) -> (get({Target_N70284, '$class'})):append(Target_N70284, get({get({This, sqlTypeStrings}), 'FOUR_INT_NOT_NULL'})) end)((fun(Target_N70291) -> (get({Target_N70291, '$class'})):append(Target_N70291, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION6'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION6'}))) end)((fun(Target_N70298) -> (get({Target_N70298, '$class'})):append(Target_N70298, get({get({This, sqlTypeStrings}), 'FOUR_INT_NOT_NULL'})) end)((fun(Target_N70305) -> (get({Target_N70305, '$class'})):append(Target_N70305, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION5'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION5'}))) end)((fun(Target_N70312) -> (get({Target_N70312, '$class'})):append(Target_N70312, get({get({This, sqlTypeStrings}), 'FOUR_INT_NOT_NULL'})) end)((fun(Target_N70319) -> (get({Target_N70319, '$class'})):append(Target_N70319, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION4'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION4'}))) end)((fun(Target_N70326) -> (get({Target_N70326, '$class'})):append(Target_N70326, get({get({This, sqlTypeStrings}), 'FOUR_INT_NOT_NULL'})) end)((fun(Target_N70333) -> (get({Target_N70333, '$class'})):append(Target_N70333, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION3'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION3'}))) end)((fun(Target_N70340) -> (get({Target_N70340, '$class'})):append(Target_N70340, get({get({This, sqlTypeStrings}), 'FOUR_INT_NOT_NULL'})) end)((fun(Target_N70347) -> (get({Target_N70347, '$class'})):append(Target_N70347, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION2'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION2'}))) end)((fun(Target_N70354) -> (get({Target_N70354, '$class'})):append(Target_N70354, get({get({This, sqlTypeStrings}), 'FOUR_INT_NOT_NULL'})) end)((fun(Target_N70361) -> (get({Target_N70361, '$class'})):append(Target_N70361, (get({get({PaymentTransactionKeysFactory, 'EXCEPTION1'}), '$class'})):toString(get({PaymentTransactionKeysFactory, 'EXCEPTION1'}))) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'FOUR_INT_NOT_NULL'}))))))))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

