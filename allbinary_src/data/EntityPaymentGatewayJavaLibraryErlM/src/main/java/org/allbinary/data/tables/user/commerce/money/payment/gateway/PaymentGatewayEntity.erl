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
% package org.allbinary.data.tables.user.commerce.money.payment.gateway
% import java.util.Calendar
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.commerce.money.payment.PaymentData
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayEncryptedMapping
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactory
% import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType
% import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil
% import org.allbinary.data.generator.PaymentGatewayIdGenerator
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.control.crypt.SuperCrypt
% import org.allbinary.logic.string.StringMaker

-module('PaymentGatewayEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PaymentGatewayEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "paymentgateways"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'AbSqlBean':init(This, 'UserDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, tableName})),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'CONSTRUCTOR'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end.

add(This, PaymentGatewayInterface) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "add");
                false -> ok
            end,
            Vector = 'BasicArrayListD':new(),
            (get({Vector, '$class'})):add(Vector, (fun(Target_N67095) -> (get({Target_N67095, '$class'})):getNext(Target_N67095) end)('PaymentGatewayIdGenerator':new())),
            (get({Vector, '$class'})):addAllList(Vector, (fun(Target_N67138) -> (get({Target_N67138, '$class'})):toVector(Target_N67138) end)('PaymentGatewayEncryptedMapping':new(PaymentGatewayInterface))),
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N67243) -> (get({Target_N67243, '$class'})):toString(Target_N67243) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            (get({Vector, '$class'})):add(Vector, Time),
            (get({Vector, '$class'})):add(Vector, Time),
            'AbSqlBean':insert(This, Vector),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, "add");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "add", E);
                false -> ok
            end
        end.

update(This, PaymentGatewayInterface) ->
        try
            Calendar = 'Calendar':getInstance(),
            Time = allbinary_java:to_string((fun(Target_N68002) -> (get({Target_N68002, '$class'})):toString(Target_N68002) end)((get({Calendar, '$class'})):getTimeInMillis(Calendar))),
            (get({PaymentGatewayInterface, '$class'})):setLastModified(PaymentGatewayInterface, Time),
            WhereKeyValuePairs = (fun(Target_N68101) -> (get({Target_N68101, '$class'})):createHashMap(Target_N68101) end)('StdUtil':getInstance()),
            (get({WhereKeyValuePairs, '$class'})):put(WhereKeyValuePairs, (fun(Target_N68161) -> (get({Target_N68161, '$class'})):toString(Target_N68161) end)(get({'StoreFrontData':getInstance(), 'NAME'})), (get({PaymentGatewayInterface, '$class'})):getStoreName(PaymentGatewayInterface)),
            (get({WhereKeyValuePairs, '$class'})):put(WhereKeyValuePairs, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'})), (get({PaymentGatewayInterface, '$class'})):getName(PaymentGatewayInterface)),
            case ((get({WhereKeyValuePairs, '$class'})):get(WhereKeyValuePairs, get({'EntryData':getInstance(), 'TIMECREATED'})) =/= undefined) of
                true ->
                erlang:error({'Exception', "Don't update TimeCreated for update"});
                false -> ok
            end,
            UpdateHashMap = (fun(Target_N68371) -> (get({Target_N68371, '$class'})):toHashMap(Target_N68371) end)('PaymentGatewayEncryptedMapping':new(PaymentGatewayInterface)),
            'AbSqlBean':updateWhere(This, WhereKeyValuePairs, UpdateHashMap),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "update");
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "update", E);
                false -> ok
            end
        end.

getPaymentGatewayInterface(This, StoreName, PaymentType) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        try
        try
            put({local, paymentGatewayHashMap}, (fun(Target_N69010) -> (get({Target_N69010, '$class'})):createHashMap(Target_N69010) end)('StdUtil':getInstance())),
            WhereKeyAndValue = (fun(Target_N69061) -> (get({Target_N69061, '$class'})):createHashMap(Target_N69061) end)('StdUtil':getInstance()),
            (get({WhereKeyAndValue, '$class'})):put(WhereKeyAndValue, (fun(Target_N69121) -> (get({Target_N69121, '$class'})):toString(Target_N69121) end)(get({'StoreFrontData':getInstance(), 'NAME'})), StoreName),
            (get({WhereKeyAndValue, '$class'})):put(WhereKeyAndValue, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'})), (get({PaymentType, '$class'})):getName(PaymentType)),
            put({local, paymentGatewayHashMap}, 'AbSqlBean':getRow(This, WhereKeyAndValue)),
            case (get({local, paymentGatewayHashMap}) =/= undefined) of
                true ->
                UserName = (get({get({local, paymentGatewayHashMap}), '$class'})):get(get({local, paymentGatewayHashMap}), (get({get({'UserData', 'USERNAME'}), '$class'})):toString(get({'UserData', 'USERNAME'}))),
                Password = (get({get({local, paymentGatewayHashMap}), '$class'})):get(get({local, paymentGatewayHashMap}), (get({get({'UserData', 'PASSWORD'}), '$class'})):toString(get({'UserData', 'PASSWORD'}))),
                Special1 = (get({get({local, paymentGatewayHashMap}), '$class'})):get(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL1'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL1'}))),
                Special2 = (get({get({local, paymentGatewayHashMap}), '$class'})):get(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL2'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL2'}))),
                Special3 = (get({get({local, paymentGatewayHashMap}), '$class'})):get(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL3'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL3'}))),
                Special4 = (get({get({local, paymentGatewayHashMap}), '$class'})):get(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL4'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL4'}))),
                Special5 = (get({get({local, paymentGatewayHashMap}), '$class'})):get(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL5'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL5'}))),
                Special6 = (get({get({local, paymentGatewayHashMap}), '$class'})):get(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL6'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL6'}))),
                Special7 = (get({get({local, paymentGatewayHashMap}), '$class'})):get(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL7'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL7'}))),
                Special8 = (get({get({local, paymentGatewayHashMap}), '$class'})):get(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL8'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL8'}))),
                Special9 = (get({get({local, paymentGatewayHashMap}), '$class'})):get(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL9'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL9'}))),
                SuperCrypt = 'SuperCrypt':new(get({'PaymentGatewayData', 'CRYPTNUM'})),
                (get({get({local, paymentGatewayHashMap}), '$class'})):put(get({local, paymentGatewayHashMap}), (get({get({'UserData', 'USERNAME'}), '$class'})):toString(get({'UserData', 'USERNAME'})), (get({SuperCrypt, '$class'})):decrypt(SuperCrypt, UserName)),
                (get({get({local, paymentGatewayHashMap}), '$class'})):put(get({local, paymentGatewayHashMap}), (get({get({'UserData', 'PASSWORD'}), '$class'})):toString(get({'UserData', 'PASSWORD'})), (get({SuperCrypt, '$class'})):decrypt(SuperCrypt, Password)),
                (get({get({local, paymentGatewayHashMap}), '$class'})):put(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL1'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL1'})), (get({SuperCrypt, '$class'})):decrypt(SuperCrypt, Special1)),
                (get({get({local, paymentGatewayHashMap}), '$class'})):put(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL2'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL2'})), (get({SuperCrypt, '$class'})):decrypt(SuperCrypt, Special2)),
                (get({get({local, paymentGatewayHashMap}), '$class'})):put(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL3'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL3'})), (get({SuperCrypt, '$class'})):decrypt(SuperCrypt, Special3)),
                (get({get({local, paymentGatewayHashMap}), '$class'})):put(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL4'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL4'})), (get({SuperCrypt, '$class'})):decrypt(SuperCrypt, Special4)),
                (get({get({local, paymentGatewayHashMap}), '$class'})):put(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL5'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL5'})), (get({SuperCrypt, '$class'})):decrypt(SuperCrypt, Special5)),
                (get({get({local, paymentGatewayHashMap}), '$class'})):put(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL6'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL6'})), (get({SuperCrypt, '$class'})):decrypt(SuperCrypt, Special6)),
                (get({get({local, paymentGatewayHashMap}), '$class'})):put(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL7'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL7'})), (get({SuperCrypt, '$class'})):decrypt(SuperCrypt, Special7)),
                (get({get({local, paymentGatewayHashMap}), '$class'})):put(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL8'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL8'})), (get({SuperCrypt, '$class'})):decrypt(SuperCrypt, Special8)),
                (get({get({local, paymentGatewayHashMap}), '$class'})):put(get({local, paymentGatewayHashMap}), (get({get({'PaymentGatewayData', 'SPECIAL9'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL9'})), (get({SuperCrypt, '$class'})):decrypt(SuperCrypt, Special9)),
                PaymentGatewayInterface = (fun(Target_N71117) -> (get({Target_N71117, '$class'})):getInstance(Target_N71117, get({local, paymentGatewayHashMap})) end)('PaymentGatewayInterfaceFactory':new()),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "getPaymentGatewayInterface()");
                    false -> ok
                end,
                throw({'$return', PaymentGatewayInterface});
                false ->
                throw({'$return', (fun(Target_N69293) -> (get({Target_N69293, '$class'})):getInstance(Target_N69293, PaymentType) end)('PaymentGatewayInterfaceFactory':new())})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Command Failed for paymentType: ", (get({PaymentType, '$class'})):getName(PaymentType)]), This, "getPaymentGatewayInterface", E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

findPaymentTypeVectorByStore(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        try
        try
            put({local, paymentGatewayNameVector}, 'BasicArrayListD':new()),
            put({local, paymentGatewayNameVector}, 'AbSqlBean':getColumnWhere(This, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'})), (fun(Target_N71851) -> (get({Target_N71851, '$class'})):toString(Target_N71851) end)(get({'StoreFrontData':getInstance(), 'NAME'})), StoreName)),
            case (get({local, paymentGatewayNameVector}) =/= undefined) of
                true ->
                PaymentGatewayVector = 'BasicArrayListD':new(),
                Size = (get({get({local, paymentGatewayNameVector}), '$class'})):size(get({local, paymentGatewayNameVector})),
                lists:foreach(fun(I) ->
                    PaymentTypeString = (get({get({local, paymentGatewayNameVector}), '$class'})):get(get({local, paymentGatewayNameVector}), I),
                    PaymentType = (fun(Target_N72109) -> (get({Target_N72109, '$class'})):get(Target_N72109, PaymentTypeString) end)('BasicPaymentTypeUtil':getInstance()),
                    (get({PaymentGatewayVector, '$class'})):add(PaymentGatewayVector, PaymentType)
                end, lists:seq(0, Size - 1)),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, "findPaymentTypeVectorByStore()");
                    false -> ok
                end,
                throw({'$return', PaymentGatewayVector});
                false ->
                throw({'$return', 'BasicArrayListD':new()})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "findPaymentTypeVectorByStore", E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

remove(This, StoreName, PaymentType) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        try
            WhereHashMap = (fun(Target_N72842) -> (get({Target_N72842, '$class'})):createHashMap(Target_N72842) end)('StdUtil':getInstance()),
            (get({WhereHashMap, '$class'})):put(WhereHashMap, (fun(Target_N72902) -> (get({Target_N72902, '$class'})):toString(Target_N72902) end)(get({'StoreFrontData':getInstance(), 'NAME'})), StoreName),
            (get({WhereHashMap, '$class'})):put(WhereHashMap, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'})), (get({PaymentType, '$class'})):getName(PaymentType)),
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

createTableStatement(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, tableName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'START'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'ID'}), '$class'})):toString(get({'PaymentGatewayData', 'ID'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'EntryData':getInstance(), 'ENABLE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'StoreFrontData':getInstance(), 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'PaymentData', 'METHOD'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'MODE'}), '$class'})):toString(get({'PaymentGatewayData', 'MODE'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'TESTPROTOCOL'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTPROTOCOL'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'TESTSERVER'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTSERVER'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'TESTPORT'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTPORT'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'TESTPATH'}), '$class'})):toString(get({'PaymentGatewayData', 'TESTPATH'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SERVERPROTOCOL'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVERPROTOCOL'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SERVER'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVER'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SERVERPORT'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVERPORT'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SERVERPATH'}), '$class'})):toString(get({'PaymentGatewayData', 'SERVERPATH'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'UserData', 'USERNAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'UserData', 'PASSWORD'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'TIMEOUT'}), '$class'})):toString(get({'PaymentGatewayData', 'TIMEOUT'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'PROXYPROTOCOL'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPROTOCOL'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'PROXYSERVER'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYSERVER'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'PROXYPORT'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPORT'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'PROXYPATH'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPATH'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'PROXYUSERNAME'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYUSERNAME'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'PROXYPASSWORD'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYPASSWORD'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'PROXYTIMEOUT'}), '$class'})):toString(get({'PaymentGatewayData', 'PROXYTIMEOUT'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SPECIAL1'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL1'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SPECIAL2'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL2'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SPECIAL3'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL3'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SPECIAL4'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL4'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SPECIAL5'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL5'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SPECIAL6'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL6'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SPECIAL7'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL7'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SPECIAL8'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL8'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'SPECIAL9'}), '$class'})):toString(get({'PaymentGatewayData', 'SPECIAL9'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'EntryData':getInstance(), 'LASTMODIFIED'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'EntryData':getInstance(), 'TIMECREATED'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'PRIMARY_KEY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'PaymentGatewayData', 'ID'}), '$class'})):toString(get({'PaymentGatewayData', 'ID'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'END'})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

