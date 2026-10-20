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
% package org.allbinary.data.tables.user.commerce.inventory.item.options
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.InventoryDbInitInfo
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.option.BasicOptionItemData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('BasicOptionItemsEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BasicOptionItemsEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, tableName}, "basicoptionitems"),
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
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'BasicOptionItemsEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'BasicOptionItemsEntity', 'INSERT'}), E);
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
        (fun(Target_N67419) -> (get({Target_N67419, '$class'})):append(Target_N67419, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67426) -> (get({Target_N67426, '$class'})):append(Target_N67426, get({get({This, basicItemData}), 'ID'})) end)((fun(Target_N67433) -> (get({Target_N67433, '$class'})):append(Target_N67433, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N67440) -> (get({Target_N67440, '$class'})):append(Target_N67440, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})))))),
        (fun(Target_N67567) -> (get({Target_N67567, '$class'})):append(Target_N67567, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67574) -> (get({Target_N67574, '$class'})):append(Target_N67574, get({'BasicOptionItemData', 'DEFAULT_OPTION_VALUE'})) end)((fun(Target_N67581) -> (get({Target_N67581, '$class'})):append(Target_N67581, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67588) -> (get({Target_N67588, '$class'})):append(Target_N67588, get({'BasicOptionItemData', 'DEFAULT_OPTION_ITEM'})) end)((fun(Target_N67595) -> (get({Target_N67595, '$class'})):append(Target_N67595, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'BasicOptionItemData', 'OPTION_ONE_TITLE'}))))))),
        (fun(Target_N67754) -> (get({Target_N67754, '$class'})):append(Target_N67754, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N67761) -> (get({Target_N67761, '$class'})):append(Target_N67761, get({get({This, basicItemData}), 'ID'})) end)((fun(Target_N67768) -> (get({Target_N67768, '$class'})):append(Target_N67768, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N67775) -> (get({Target_N67775, '$class'})):append(Target_N67775, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67782) -> (get({Target_N67782, '$class'})):append(Target_N67782, get({'EntryData':getInstance(), 'LASTMODIFIED'})) end)((fun(Target_N67789) -> (get({Target_N67789, '$class'})):append(Target_N67789, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67796) -> (get({Target_N67796, '$class'})):append(Target_N67796, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N67803) -> (get({Target_N67803, '$class'})):append(Target_N67803, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67810) -> (get({Target_N67810, '$class'})):append(Target_N67810, get({'BasicOptionItemData', 'OPTION_ONE_NINE_VALUE'})) end)((fun(Target_N67817) -> (get({Target_N67817, '$class'})):append(Target_N67817, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67824) -> (get({Target_N67824, '$class'})):append(Target_N67824, get({'BasicOptionItemData', 'OPTION_ONE_NINE_ITEM'})) end)((fun(Target_N67831) -> (get({Target_N67831, '$class'})):append(Target_N67831, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67838) -> (get({Target_N67838, '$class'})):append(Target_N67838, get({'BasicOptionItemData', 'OPTION_ONE_EIGHT_VALUE'})) end)((fun(Target_N67845) -> (get({Target_N67845, '$class'})):append(Target_N67845, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67852) -> (get({Target_N67852, '$class'})):append(Target_N67852, get({'BasicOptionItemData', 'OPTION_ONE_EIGHT_ITEM'})) end)((fun(Target_N67859) -> (get({Target_N67859, '$class'})):append(Target_N67859, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67866) -> (get({Target_N67866, '$class'})):append(Target_N67866, get({'BasicOptionItemData', 'OPTION_ONE_SEVEN_VALUE'})) end)((fun(Target_N67873) -> (get({Target_N67873, '$class'})):append(Target_N67873, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67880) -> (get({Target_N67880, '$class'})):append(Target_N67880, get({'BasicOptionItemData', 'OPTION_ONE_SEVEN_ITEM'})) end)((fun(Target_N67887) -> (get({Target_N67887, '$class'})):append(Target_N67887, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67894) -> (get({Target_N67894, '$class'})):append(Target_N67894, get({'BasicOptionItemData', 'OPTION_ONE_SIX_VALUE'})) end)((fun(Target_N67901) -> (get({Target_N67901, '$class'})):append(Target_N67901, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67908) -> (get({Target_N67908, '$class'})):append(Target_N67908, get({'BasicOptionItemData', 'OPTION_ONE_SIX_ITEM'})) end)((fun(Target_N67915) -> (get({Target_N67915, '$class'})):append(Target_N67915, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67922) -> (get({Target_N67922, '$class'})):append(Target_N67922, get({'BasicOptionItemData', 'OPTION_ONE_FIVE_VALUE'})) end)((fun(Target_N67929) -> (get({Target_N67929, '$class'})):append(Target_N67929, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67936) -> (get({Target_N67936, '$class'})):append(Target_N67936, get({'BasicOptionItemData', 'OPTION_ONE_FIVE_ITEM'})) end)((fun(Target_N67943) -> (get({Target_N67943, '$class'})):append(Target_N67943, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67950) -> (get({Target_N67950, '$class'})):append(Target_N67950, get({'BasicOptionItemData', 'OPTION_ONE_FOUR_VALUE'})) end)((fun(Target_N67957) -> (get({Target_N67957, '$class'})):append(Target_N67957, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67964) -> (get({Target_N67964, '$class'})):append(Target_N67964, get({'BasicOptionItemData', 'OPTION_ONE_FOUR_ITEM'})) end)((fun(Target_N67971) -> (get({Target_N67971, '$class'})):append(Target_N67971, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67978) -> (get({Target_N67978, '$class'})):append(Target_N67978, get({'BasicOptionItemData', 'OPTION_ONE_THREE_VALUE'})) end)((fun(Target_N67985) -> (get({Target_N67985, '$class'})):append(Target_N67985, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67992) -> (get({Target_N67992, '$class'})):append(Target_N67992, get({'BasicOptionItemData', 'OPTION_ONE_THREE_ITEM'})) end)((fun(Target_N67999) -> (get({Target_N67999, '$class'})):append(Target_N67999, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N68006) -> (get({Target_N68006, '$class'})):append(Target_N68006, get({'BasicOptionItemData', 'OPTION_ONE_TWO_VALUE'})) end)((fun(Target_N68013) -> (get({Target_N68013, '$class'})):append(Target_N68013, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N68020) -> (get({Target_N68020, '$class'})):append(Target_N68020, get({'BasicOptionItemData', 'OPTION_ONE_TWO_ITEM'})) end)((fun(Target_N68027) -> (get({Target_N68027, '$class'})):append(Target_N68027, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N68034) -> (get({Target_N68034, '$class'})):append(Target_N68034, get({'BasicOptionItemData', 'OPTION_ONE_ONE_VALUE'})) end)((fun(Target_N68041) -> (get({Target_N68041, '$class'})):append(Target_N68041, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'BasicOptionItemData', 'OPTION_ONE_ONE_ITEM'})))))))))))))))))))))))))))))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({get({This, basicItemData}), 'ID'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({get({This, basicItemData}), 'ID'})), UpdatedValues).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

