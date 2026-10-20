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
% package org.allbinary.data.tables.user.commerce.inventory.item.downloads
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.InventoryDbInitInfo
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.download.DownloadItemData
% import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('DownloadItemsEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DownloadItemsEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, tableName}, "downloaditems"),
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
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'DownloadItemsEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'DownloadItemsEntity', 'INSERT'}), E);
                false -> ok
            end
        end.

delete(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        try
            'AbSqlBean':deleteWhere(This, get({'DownloadItemData', 'ID'}), Value),
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

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({'DownloadItemData', 'ID'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({'DownloadItemData', 'ID'})), UpdatedValues).

getForItem(This, Id) when (is_list(Id) orelse Id =:= undefined) ->
        ReturnVector = 'BasicArrayListD':new(),
        KeysAndValues = (fun(Target_N67636) -> (get({Target_N67636, '$class'})):createHashMap(Target_N67636) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({get({This, basicItemData}), 'ID'}), Id),
        Vector = 'AbSqlBean':getRows(This, KeysAndValues),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            HashMap = (get({Vector, '$class'})):get(Vector, Index),
            (get({ReturnVector, '$class'})):add(ReturnVector, 'DownloadableItem':new(HashMap))
        end, lists:seq(0, Size - 1)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Found: ", Size]), This, "getForItem");
            false -> ok
        end,
        ReturnVector.

getForItem(This, Id, DownloadItemId) when (is_list(Id) orelse Id =:= undefined), (is_list(DownloadItemId) orelse DownloadItemId =:= undefined) ->
        ReturnVector = 'BasicArrayListD':new(),
        KeysAndValues = (fun(Target_N68340) -> (get({Target_N68340, '$class'})):createHashMap(Target_N68340) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({get({This, basicItemData}), 'ID'}), Id),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'DownloadItemData', 'ID'}), DownloadItemId),
        Vector = 'AbSqlBean':getRows(This, KeysAndValues),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            HashMap = (get({Vector, '$class'})):get(Vector, Index),
            (get({ReturnVector, '$class'})):add(ReturnVector, 'DownloadableItem':new(HashMap))
        end, lists:seq(0, Size - 1)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Found: ", Size]), This, "getForItem");
            false -> ok
        end,
        ReturnVector.

createTableStatement(This) ->
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N69100) -> (get({Target_N69100, '$class'})):append(Target_N69100, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N69107) -> (get({Target_N69107, '$class'})):append(Target_N69107, get({'DownloadItemData', 'LICENSE_FILE'})) end)((fun(Target_N69114) -> (get({Target_N69114, '$class'})):append(Target_N69114, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N69121) -> (get({Target_N69121, '$class'})):append(Target_N69121, get({'DownloadItemData', 'PLATFORM'})) end)((fun(Target_N69128) -> (get({Target_N69128, '$class'})):append(Target_N69128, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N69135) -> (get({Target_N69135, '$class'})):append(Target_N69135, get({'DownloadItemData', 'SYSTEM'})) end)((fun(Target_N69142) -> (get({Target_N69142, '$class'})):append(Target_N69142, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})) end)((fun(Target_N69149) -> (get({Target_N69149, '$class'})):append(Target_N69149, get({'DownloadItemData', 'CHANGES'})) end)((fun(Target_N69156) -> (get({Target_N69156, '$class'})):append(Target_N69156, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N69163) -> (get({Target_N69163, '$class'})):append(Target_N69163, get({'DownloadItemData', 'VERSION'})) end)((fun(Target_N69170) -> (get({Target_N69170, '$class'})):append(Target_N69170, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N69177) -> (get({Target_N69177, '$class'})):append(Target_N69177, get({'DownloadItemData', 'SPECIAL_NAME'})) end)((fun(Target_N69184) -> (get({Target_N69184, '$class'})):append(Target_N69184, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N69191) -> (get({Target_N69191, '$class'})):append(Target_N69191, get({'EntryData':getInstance(), 'ENABLE'})) end)((fun(Target_N69198) -> (get({Target_N69198, '$class'})):append(Target_N69198, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N69205) -> (get({Target_N69205, '$class'})):append(Target_N69205, get({get({This, basicItemData}), 'ID'})) end)((fun(Target_N69212) -> (get({Target_N69212, '$class'})):append(Target_N69212, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N69219) -> (get({Target_N69219, '$class'})):append(Target_N69219, get({'DownloadItemData', 'ID'})) end)((fun(Target_N69226) -> (get({Target_N69226, '$class'})):append(Target_N69226, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N69233) -> (get({Target_N69233, '$class'})):append(Target_N69233, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})))))))))))))))))))))),
        (fun(Target_N69712) -> (get({Target_N69712, '$class'})):append(Target_N69712, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N69719) -> (get({Target_N69719, '$class'})):append(Target_N69719, get({'DownloadItemData', 'ID'})) end)((fun(Target_N69726) -> (get({Target_N69726, '$class'})):append(Target_N69726, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N69733) -> (get({Target_N69733, '$class'})):append(Target_N69733, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N69740) -> (get({Target_N69740, '$class'})):append(Target_N69740, get({'EntryData':getInstance(), 'LASTMODIFIED'})) end)((fun(Target_N69747) -> (get({Target_N69747, '$class'})):append(Target_N69747, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N69754) -> (get({Target_N69754, '$class'})):append(Target_N69754, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N69761) -> (get({Target_N69761, '$class'})):append(Target_N69761, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N69768) -> (get({Target_N69768, '$class'})):append(Target_N69768, get({'DownloadItemData', 'RETRIES'})) end)((fun(Target_N69775) -> (get({Target_N69775, '$class'})):append(Target_N69775, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N69782) -> (get({Target_N69782, '$class'})):append(Target_N69782, get({'DownloadItemData', 'VALID_TIME'})) end)((fun(Target_N69789) -> (get({Target_N69789, '$class'})):append(Target_N69789, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N69796) -> (get({Target_N69796, '$class'})):append(Target_N69796, get({'DownloadItemData', 'SIZE'})) end)((fun(Target_N69803) -> (get({Target_N69803, '$class'})):append(Target_N69803, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'DownloadItemData', 'FILE'})))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

