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
% package org.allbinary.data.tables.user.commerce.inventory.item.permissions
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.InventoryDbInitInfo
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.permission.PermissionItemData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('PermissionItemsEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PermissionItemsEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, tableName}, "permissionitems"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'AbSqlBean':'$init'(This, 'InventoryDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, tableName})).

insert(This, Values) ->
        try
            'AbSqlBean':insert(This, Values),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'PermissionItemsEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'PermissionItemsEntity', 'INSERT'}), E);
                false -> ok
            end
        end.

delete(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        try
            'AbSqlBean':deleteWhere(This, get({get({This, basicItemData}), 'ID'}), Value),
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

createTableStatement(This) ->
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N67419) -> (get({Target_N67419, '$class'})):append(Target_N67419, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67426) -> (get({Target_N67426, '$class'})):append(Target_N67426, get({'EntryData':getInstance(), 'ENABLE'})) end)((fun(Target_N67433) -> (get({Target_N67433, '$class'})):append(Target_N67433, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67440) -> (get({Target_N67440, '$class'})):append(Target_N67440, get({get({This, basicItemData}), 'NUMBER'})) end)((fun(Target_N67447) -> (get({Target_N67447, '$class'})):append(Target_N67447, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67454) -> (get({Target_N67454, '$class'})):append(Target_N67454, get({get({This, basicItemData}), 'ID'})) end)((fun(Target_N67461) -> (get({Target_N67461, '$class'})):append(Target_N67461, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N67468) -> (get({Target_N67468, '$class'})):append(Target_N67468, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})))))))))),
        (fun(Target_N67689) -> (get({Target_N67689, '$class'})):append(Target_N67689, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N67696) -> (get({Target_N67696, '$class'})):append(Target_N67696, get({get({This, basicItemData}), 'ID'})) end)((fun(Target_N67703) -> (get({Target_N67703, '$class'})):append(Target_N67703, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N67710) -> (get({Target_N67710, '$class'})):append(Target_N67710, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67717) -> (get({Target_N67717, '$class'})):append(Target_N67717, get({'EntryData':getInstance(), 'LASTMODIFIED'})) end)((fun(Target_N67724) -> (get({Target_N67724, '$class'})):append(Target_N67724, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67731) -> (get({Target_N67731, '$class'})):append(Target_N67731, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N67738) -> (get({Target_N67738, '$class'})):append(Target_N67738, " DECIMAL (11,2) NOT NULL,") end)((fun(Target_N67745) -> (get({Target_N67745, '$class'})):append(Target_N67745, get({get({This, basicItemData}), 'PRICE'})) end)((fun(Target_N67752) -> (get({Target_N67752, '$class'})):append(Target_N67752, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67759) -> (get({Target_N67759, '$class'})):append(Target_N67759, get({'PermissionItemData', 'END_TIME'})) end)((fun(Target_N67766) -> (get({Target_N67766, '$class'})):append(Target_N67766, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67773) -> (get({Target_N67773, '$class'})):append(Target_N67773, get({'PermissionItemData', 'START_TIME'})) end)((fun(Target_N67780) -> (get({Target_N67780, '$class'})):append(Target_N67780, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67787) -> (get({Target_N67787, '$class'})):append(Target_N67787, get({'PermissionItemData', 'REMOTE_ADDR'})) end)((fun(Target_N67794) -> (get({Target_N67794, '$class'})):append(Target_N67794, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67801) -> (get({Target_N67801, '$class'})):append(Target_N67801, get({'PermissionItemData', 'TYPE'})) end)((fun(Target_N67808) -> (get({Target_N67808, '$class'})):append(Target_N67808, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67815) -> (get({Target_N67815, '$class'})):append(Target_N67815, get({'PermissionItemData', 'WHAT'})) end)((fun(Target_N67822) -> (get({Target_N67822, '$class'})):append(Target_N67822, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'PermissionItemData', 'WHO'})))))))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({get({This, basicItemData}), 'ID'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({get({This, basicItemData}), 'ID'})), UpdatedValues).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

