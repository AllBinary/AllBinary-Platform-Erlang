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
% package org.allbinary.business.installer
% import org.allbinary.business.init.InitInfoEntity
% import org.allbinary.business.init.db.DatabaseConnectionInfoInterface
% import org.allbinary.business.init.db.DbConnectionInfo
% import org.allbinary.business.init.db.HistoryDbInitInfo
% import org.allbinary.business.init.db.InventoryDbInitInfo
% import org.allbinary.business.init.db.LogDbInitInfo
% import org.allbinary.business.init.db.StaticPagesDbInitInfo
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory
% import org.allbinary.data.tables.log.LogTableEntityFactory
% import org.allbinary.data.tables.staticpages.StaticPagesEntityFactory
% import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder
% import org.allbinary.data.tables.user.UserEntityFactory
% import org.allbinary.data.tables.user.address.billing.BillingAddressesEntityFactory
% import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntityFactory
% import org.allbinary.data.tables.user.commerce.money.payment.PaymentEntityFactory
% import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory
% import org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionEntityFactory
% import org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionResultEntityFactory
% import org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbDatabaseManagement
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.DataOutputStreamFactory
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileFactory
% import org.allbinary.logic.string.StringMaker

-module('InitDbCrypted').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbDatabaseManagement', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, userDbInitInfo}, undefined),
    put({This, inventoryDbInitInfo}, undefined),
    put({This, historyDbInitInfo}, undefined),
    put({This, staticpagesDbInitInfo}, undefined),
    put({This, logDbInitInfo}, undefined),
    put({This, 'SQL_FILE'}, "initWeblisket.sql"),
    ok.


new(DatabaseConnectionInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, DatabaseConnectionInfoInterface),
    This.

init(This, DatabaseConnectionInfoInterface) ->
        'AbDatabaseManagement':init(This, DatabaseConnectionInfoInterface),
        init_fields(This).

addUsers(This) ->
        try
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({This, 'METHOD_ADD_USERS'})),
            put({This, userDbInitInfo}, 'UserDbInitInfo':new()),
            put({This, inventoryDbInitInfo}, 'InventoryDbInitInfo':new()),
            put({This, historyDbInitInfo}, 'HistoryDbInitInfo':new()),
            put({This, staticpagesDbInitInfo}, 'StaticPagesDbInitInfo':new()),
            put({This, logDbInitInfo}, 'LogDbInitInfo':new()),
            CUSTOMERDB = (get({get({This, userDbInitInfo}), '$class'})):getName(get({This, userDbInitInfo})),
            CUSTOMERDBUSER = (get({get({This, userDbInitInfo}), '$class'})):getUserName(get({This, userDbInitInfo})),
            CUSTOMERDBPASSWORD = (get({get({This, userDbInitInfo}), '$class'})):getPassword(get({This, userDbInitInfo})),
            case (not (get({This, '$class'})):addDbUser(This, CUSTOMERDB, CUSTOMERDBUSER, CUSTOMERDBPASSWORD)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_USER'}), CUSTOMERDBUSER]), This, get({This, 'METHOD_ADD_USERS'})),
                throw({'$return', false});
                false -> ok
            end,
            INVENTORYDB = (get({get({This, inventoryDbInitInfo}), '$class'})):getName(get({This, inventoryDbInitInfo})),
            INVENTORYDBUSER = (get({get({This, inventoryDbInitInfo}), '$class'})):getUserName(get({This, inventoryDbInitInfo})),
            INVENTORYDBPASSWORD = (get({get({This, inventoryDbInitInfo}), '$class'})):getPassword(get({This, inventoryDbInitInfo})),
            case (not (get({This, '$class'})):addDbUser(This, INVENTORYDB, INVENTORYDBUSER, INVENTORYDBPASSWORD)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_USER'}), INVENTORYDBUSER]), This, get({This, 'METHOD_ADD_USERS'})),
                throw({'$return', false});
                false -> ok
            end,
            HISTORYDB = (get({get({This, historyDbInitInfo}), '$class'})):getName(get({This, historyDbInitInfo})),
            HISTORYDBUSER = (get({get({This, historyDbInitInfo}), '$class'})):getUserName(get({This, historyDbInitInfo})),
            HISTORYDBPASSWORD = (get({get({This, historyDbInitInfo}), '$class'})):getPassword(get({This, historyDbInitInfo})),
            case (not (get({This, '$class'})):addDbUser(This, HISTORYDB, HISTORYDBUSER, HISTORYDBPASSWORD)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_USER'}), HISTORYDBUSER]), This, get({This, 'METHOD_ADD_USERS'})),
                throw({'$return', false});
                false -> ok
            end,
            STATICPAGESDB = (get({get({This, staticpagesDbInitInfo}), '$class'})):getName(get({This, staticpagesDbInitInfo})),
            STATICPAGESDBUSER = (get({get({This, staticpagesDbInitInfo}), '$class'})):getUserName(get({This, staticpagesDbInitInfo})),
            STATICPAGESDBPASSWORD = (get({get({This, staticpagesDbInitInfo}), '$class'})):getPassword(get({This, staticpagesDbInitInfo})),
            case (not (get({This, '$class'})):addDbUser(This, STATICPAGESDB, STATICPAGESDBUSER, STATICPAGESDBPASSWORD)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_USER'}), STATICPAGESDBUSER]), This, get({This, 'METHOD_ADD_USERS'})),
                throw({'$return', false});
                false -> ok
            end,
            LOGDB = (get({get({This, logDbInitInfo}), '$class'})):getName(get({This, logDbInitInfo})),
            LOGDBUSER = (get({get({This, logDbInitInfo}), '$class'})):getUserName(get({This, logDbInitInfo})),
            LOGDBPASSWORD = (get({get({This, logDbInitInfo}), '$class'})):getPassword(get({This, logDbInitInfo})),
            case (not (get({This, '$class'})):addDbUser(This, LOGDB, LOGDBUSER, LOGDBPASSWORD)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_USER'}), LOGDBUSER]), This, get({This, 'METHOD_ADD_USERS'})),
                throw({'$return', false});
                false -> ok
            end,
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({This, 'METHOD_ADD_USERS'})),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'METHOD_ADD_USERS'}), E),
            true
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

addDatabases(This) ->
        try
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({This, 'METHOD_ADD_DATABASES'})),
            put({This, userDbInitInfo}, 'UserDbInitInfo':new()),
            put({This, inventoryDbInitInfo}, 'InventoryDbInitInfo':new()),
            put({This, historyDbInitInfo}, 'HistoryDbInitInfo':new()),
            put({This, staticpagesDbInitInfo}, 'StaticPagesDbInitInfo':new()),
            put({This, logDbInitInfo}, 'LogDbInitInfo':new()),
            CUSTOMERDB = (get({get({This, userDbInitInfo}), '$class'})):getName(get({This, userDbInitInfo})),
            case (not (get({This, '$class'})):addDb(This, CUSTOMERDB)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_DATABASE'}), CUSTOMERDB]), This, get({This, 'METHOD_ADD_DATABASES'})),
                throw({'$return', false});
                false -> ok
            end,
            INVENTORYDB = (get({get({This, inventoryDbInitInfo}), '$class'})):getName(get({This, inventoryDbInitInfo})),
            case (not (get({This, '$class'})):addDb(This, INVENTORYDB)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_DATABASE'}), INVENTORYDB]), This, get({This, 'METHOD_ADD_DATABASES'})),
                throw({'$return', false});
                false -> ok
            end,
            HISTORYDB = (get({get({This, historyDbInitInfo}), '$class'})):getName(get({This, historyDbInitInfo})),
            case (not (get({This, '$class'})):addDb(This, HISTORYDB)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_DATABASE'}), HISTORYDB]), This, get({This, 'METHOD_ADD_DATABASES'})),
                throw({'$return', false});
                false -> ok
            end,
            STATICPAGESDB = (get({get({This, staticpagesDbInitInfo}), '$class'})):getName(get({This, staticpagesDbInitInfo})),
            case (not (get({This, '$class'})):addDb(This, STATICPAGESDB)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_DATABASE'}), STATICPAGESDB]), This, get({This, 'METHOD_ADD_DATABASES'})),
                throw({'$return', false});
                false -> ok
            end,
            LOGDB = (get({get({This, logDbInitInfo}), '$class'})):getName(get({This, logDbInitInfo})),
            case (not (get({This, '$class'})):addDb(This, LOGDB)) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'UNABLE_TO_CREATE_DATABASE'}), LOGDB]), This, get({This, 'METHOD_ADD_DATABASES'})),
                throw({'$return', false});
                false -> ok
            end,
            File = (fun(Target_N70031) -> (get({Target_N70031, '$class'})):getInstance(Target_N70031, get({This, 'SQL_FILE'})) end)('FileFactory':getInstance()),
            (get({File, '$class'})):createNewFile(File),
            IdOutData = (fun(Target_N70116) -> (get({Target_N70116, '$class'})):getInstanceForAbFile(Target_N70116, File) end)('DataOutputStreamFactory':getInstance()),
            (get({IdOutData, '$class'})):writeBytes(IdOutData, (get({get({This, sqlCommandLog}), '$class'})):toString(get({This, sqlCommandLog}))),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'METHOD_ADD_DATABASES'}), E),
            true
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

addTables(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({This, 'METHOD_ADD_TABLES'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70510) -> (get({Target_N70510, '$class'})):createTable(Target_N70510) end)('UserEntityFactory':getInstance())),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70557) -> (get({Target_N70557, '$class'})):createTable(Target_N70557) end)((fun(Target_N70564) -> (get({Target_N70564, '$class'})):getStoreFrontsEntityInstance(Target_N70564) end)('StoreFrontsEntityFactory':getInstance()))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70612) -> (get({Target_N70612, '$class'})):createTable(Target_N70612) end)((fun(Target_N70619) -> (get({Target_N70619, '$class'})):getInstance(Target_N70619, get({get({This, stringUtil}), 'EMPTY_STRING'})) end)('BillingAddressesEntityFactory':getInstance()))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70689) -> (get({Target_N70689, '$class'})):createTable(Target_N70689) end)((fun(Target_N70696) -> (get({Target_N70696, '$class'})):getInstance(Target_N70696, get({get({This, stringUtil}), 'EMPTY_STRING'})) end)('ShippingAddressesEntityFactory':getInstance()))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70766) -> (get({Target_N70766, '$class'})):createTable(Target_N70766) end)((fun(Target_N70773) -> (get({Target_N70773, '$class'})):getPaymentEntityInstance(Target_N70773) end)('PaymentEntityFactory':getInstance()))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70821) -> (get({Target_N70821, '$class'})):createTable(Target_N70821) end)((fun(Target_N70828) -> (get({Target_N70828, '$class'})):getQuoteRequestEntityInstance(Target_N70828) end)('QuoteRequestEntityFactory':getInstance()))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70876) -> (get({Target_N70876, '$class'})):createTable(Target_N70876) end)('OrderHistoryEntityFactory':getInstance())),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70923) -> (get({Target_N70923, '$class'})):createTable(Target_N70923) end)('OrderItemsEntityFactory':getInstance())),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70970) -> (get({Target_N70970, '$class'})):createTable(Target_N70970) end)((fun(Target_N70977) -> (get({Target_N70977, '$class'})):getTransactionEntityInstance(Target_N70977) end)('TransactionEntityFactory':getInstance()))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N71025) -> (get({Target_N71025, '$class'})):createTable(Target_N71025) end)((fun(Target_N71032) -> (get({Target_N71032, '$class'})):getTransactionResultEntityInstance(Target_N71032) end)('TransactionResultEntityFactory':getInstance()))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N71080) -> (get({Target_N71080, '$class'})):createTable(Target_N71080) end)('PaymentGatewayEntityFactory':getInstance())),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N71127) -> (get({Target_N71127, '$class'})):createTable(Target_N71127) end)((fun(Target_N71134) -> (get({Target_N71134, '$class'})):getInventoryEntityInstance(Target_N71134) end)('InventoryEntityFactory':getInstance()))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N71186) -> (get({Target_N71186, '$class'})):createTable(Target_N71186) end)('InitInfoEntity':new())),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N71233) -> (get({Target_N71233, '$class'})):createTable(Target_N71233) end)((fun(Target_N71240) -> (get({Target_N71240, '$class'})):getLogTableEntityInstance(Target_N71240) end)('LogTableEntityFactory':getInstance()))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N71288) -> (get({Target_N71288, '$class'})):createTable(Target_N71288) end)((fun(Target_N71295) -> (get({Target_N71295, '$class'})):getStaticPagesEntityInstance(Target_N71295) end)('StaticPagesEntityFactory':getInstance()))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N71343) -> (get({Target_N71343, '$class'})):createTable(Target_N71343) end)('TransformInfoEntityBuilder':getInstance())),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({'InitDbCrypted', 'ADD_TABLES_RESULTS_LABEL'}), (get({StringBuffer, '$class'})):toString(StringBuffer)]), This, get({This, 'METHOD_ADD_TABLES'})),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'METHOD_ADD_TABLES'}), E),
            false
        end.

