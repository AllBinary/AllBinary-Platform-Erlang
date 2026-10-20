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
% package org.allbinary.data.tables.user.commerce.inventory.item.customs
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.DynamicObjectData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.InventoryDbInitInfo
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.custom.CustomItemData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('CustomItemsEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CustomItemsEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, tableName}, "customitems"),
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
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'CustomItemsEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'CustomItemsEntity', 'INSERT'}), E);
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
        (fun(Target_N67444) -> (get({Target_N67444, '$class'})):append(Target_N67444, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N67451) -> (get({Target_N67451, '$class'})):append(Target_N67451, get({get({This, basicItemData}), 'ID'})) end)((fun(Target_N67458) -> (get({Target_N67458, '$class'})):append(Target_N67458, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N67465) -> (get({Target_N67465, '$class'})):append(Target_N67465, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67472) -> (get({Target_N67472, '$class'})):append(Target_N67472, get({'EntryData':getInstance(), 'LASTMODIFIED'})) end)((fun(Target_N67479) -> (get({Target_N67479, '$class'})):append(Target_N67479, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67486) -> (get({Target_N67486, '$class'})):append(Target_N67486, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N67493) -> (get({Target_N67493, '$class'})):append(Target_N67493, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67500) -> (get({Target_N67500, '$class'})):append(Target_N67500, get({'CustomItemData', 'PACKAGE'})) end)((fun(Target_N67507) -> (get({Target_N67507, '$class'})):append(Target_N67507, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67514) -> (get({Target_N67514, '$class'})):append(Target_N67514, get({'DynamicObjectData', 'NAME'})) end)((fun(Target_N67521) -> (get({Target_N67521, '$class'})):append(Target_N67521, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67528) -> (get({Target_N67528, '$class'})):append(Target_N67528, get({get({This, basicItemData}), 'ID'})) end)((fun(Target_N67535) -> (get({Target_N67535, '$class'})):append(Target_N67535, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N67542) -> (get({Target_N67542, '$class'})):append(Target_N67542, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'}))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({get({This, basicItemData}), 'ID'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({get({This, basicItemData}), 'ID'})), UpdatedValues).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

