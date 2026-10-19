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
% package org.allbinary.data.tables.user.commerce.inventory.item.groups
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.InventoryDbInitInfo
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.group.BasicGroupItemData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('BasicGroupItemsEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BasicGroupItemsEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, tableName}, "basicgroupeditems"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'AbSqlBean':init(This, 'InventoryDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, tableName})).

insert(This, Values) ->
        try
            'AbSqlBean':insert(This, Values),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'BasicGroupItemsEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'BasicGroupItemsEntity', 'INSERT'}), E);
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
        (fun(Target_N67419) -> (get({Target_N67419, '$class'})):append(Target_N67419, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N67426) -> (get({Target_N67426, '$class'})):append(Target_N67426, get({get({This, basicItemData}), 'ID'})) end)((fun(Target_N67433) -> (get({Target_N67433, '$class'})):append(Target_N67433, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N67440) -> (get({Target_N67440, '$class'})):append(Target_N67440, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67447) -> (get({Target_N67447, '$class'})):append(Target_N67447, get({'EntryData':getInstance(), 'LASTMODIFIED'})) end)((fun(Target_N67454) -> (get({Target_N67454, '$class'})):append(Target_N67454, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67461) -> (get({Target_N67461, '$class'})):append(Target_N67461, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N67468) -> (get({Target_N67468, '$class'})):append(Target_N67468, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67475) -> (get({Target_N67475, '$class'})):append(Target_N67475, get({'BasicGroupItemData', 'ITEM_TEN'})) end)((fun(Target_N67482) -> (get({Target_N67482, '$class'})):append(Target_N67482, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67489) -> (get({Target_N67489, '$class'})):append(Target_N67489, get({'BasicGroupItemData', 'ITEM_NINE'})) end)((fun(Target_N67496) -> (get({Target_N67496, '$class'})):append(Target_N67496, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67503) -> (get({Target_N67503, '$class'})):append(Target_N67503, get({'BasicGroupItemData', 'ITEM_EIGHT'})) end)((fun(Target_N67510) -> (get({Target_N67510, '$class'})):append(Target_N67510, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67517) -> (get({Target_N67517, '$class'})):append(Target_N67517, get({'BasicGroupItemData', 'ITEM_SEVEN'})) end)((fun(Target_N67524) -> (get({Target_N67524, '$class'})):append(Target_N67524, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67531) -> (get({Target_N67531, '$class'})):append(Target_N67531, get({'BasicGroupItemData', 'ITEM_SIX'})) end)((fun(Target_N67538) -> (get({Target_N67538, '$class'})):append(Target_N67538, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67545) -> (get({Target_N67545, '$class'})):append(Target_N67545, get({'BasicGroupItemData', 'ITEM_FIVE'})) end)((fun(Target_N67552) -> (get({Target_N67552, '$class'})):append(Target_N67552, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67559) -> (get({Target_N67559, '$class'})):append(Target_N67559, get({'BasicGroupItemData', 'ITEM_FOUR'})) end)((fun(Target_N67566) -> (get({Target_N67566, '$class'})):append(Target_N67566, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67573) -> (get({Target_N67573, '$class'})):append(Target_N67573, get({'BasicGroupItemData', 'ITEM_THREE'})) end)((fun(Target_N67580) -> (get({Target_N67580, '$class'})):append(Target_N67580, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67587) -> (get({Target_N67587, '$class'})):append(Target_N67587, get({'BasicGroupItemData', 'ITEM_TWO'})) end)((fun(Target_N67594) -> (get({Target_N67594, '$class'})):append(Target_N67594, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67601) -> (get({Target_N67601, '$class'})):append(Target_N67601, get({'BasicGroupItemData', 'ITEM_ONE'})) end)((fun(Target_N67608) -> (get({Target_N67608, '$class'})):append(Target_N67608, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67615) -> (get({Target_N67615, '$class'})):append(Target_N67615, get({get({This, basicItemData}), 'ID'})) end)((fun(Target_N67622) -> (get({Target_N67622, '$class'})):append(Target_N67622, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N67629) -> (get({Target_N67629, '$class'})):append(Target_N67629, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'}))))))))))))))))))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({get({This, basicItemData}), 'ID'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({get({This, basicItemData}), 'ID'})), UpdatedValues).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

