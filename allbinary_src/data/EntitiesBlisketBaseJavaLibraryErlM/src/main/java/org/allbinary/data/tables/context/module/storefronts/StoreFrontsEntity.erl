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
% package org.allbinary.data.tables.context.module.storefronts
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFront
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('StoreFrontsEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements StoreFrontsEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "storefronts"),
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
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'StoreFrontsEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'StoreFrontsEntity', 'INSERT'}), E);
                false -> ok
            end
        end.

delete(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        try
            'AbSqlBean':deleteWhere(This, get({'StoreFrontData':getInstance(), 'NAME'}), Value),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({get({This, commonStrings}), delete}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), delete}), E);
                false -> ok
            end
        end.

% throws Exception
getStoreFrontInterface(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        try
        KeysAndValues = (fun(Target_N67346) -> (get({Target_N67346, '$class'})):createHashMap(Target_N67346) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), Name),
        StoreHashMap = 'AbSqlBean':getRow(This, KeysAndValues),
        case (StoreHashMap =/= undefined) of
            true ->
            throw({'$return', 'StoreFront':new(StoreHashMap)});
            false ->
            throw({'$return', 'StoreFront':new()})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getStoreFrontNames(This) ->
        StoreFrontNames = 'AbSqlBean':getColumn(This, get({'StoreFrontData':getInstance(), 'NAME'})),
        StoreFrontNames.

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({'StoreFrontData':getInstance(), 'NAME'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({'StoreFrontData':getInstance(), 'NAME'})), UpdatedValues).

createTableStatement(This) ->
        StoreFrontData = 'StoreFrontData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, tableName})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'START'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'SIXTY_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'HOMEHOSTNAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'HOMEHOSTNAMEPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'HOSTNAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'HOSTNAMEPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'TESTHOMEHOSTNAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'TESTHOMEHOSTNAMEPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'TESTHOSTNAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'TESTHOSTNAMEPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'IMAGEPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'STATICPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'CATEGORYPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'INVENTORYCONTROL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'CONFIGURATION'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'SUBSTORES'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'TAGLOCATION'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'PACKAGELOCATION'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'FTP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'FTPPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'FTPUSERNAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'FTPPASSWORD'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'TESTFTP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'TESTFTPPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'TESTFTPUSERNAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'TESTFTPPASSWORD'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'EntryData':getInstance(), 'TIMECREATED'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(fun(Target_N70230) -> (get({Target_N70230, '$class'})):getInstance(Target_N70230) end)('EntryData':getInstance()), 'LASTMODIFIED'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'PRIMARY_KEY'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({StoreFrontData, 'NAME'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'END'})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

