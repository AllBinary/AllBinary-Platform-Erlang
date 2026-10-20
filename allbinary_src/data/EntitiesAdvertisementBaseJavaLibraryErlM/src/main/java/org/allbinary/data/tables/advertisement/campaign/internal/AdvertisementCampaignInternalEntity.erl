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
% package org.allbinary.data.tables.advertisement.campaign.internal
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.advertisement.campaign.AdvertisementCampaign
% import org.allbinary.business.advertisement.campaign.AdvertisementCampaignData
% import org.allbinary.business.advertisement.campaign.AdvertisementCampaignInterface
% import org.allbinary.business.advertisement.campaign.AdvertisementCampaigns
% import org.allbinary.business.advertisement.campaign.AdvertisementCampaignsInterface
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.business.time.TimeData
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('AdvertisementCampaignInternalEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdvertisementCampaignInternalEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "adCampaignInternal"),
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

getCampaignsInStore(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        KeysAndValues = (fun(Target_N66934) -> (get({Target_N66934, '$class'})):createHashMap(Target_N66934) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), StoreName),
        HashMapVector = 'AbSqlBean':getRows(This, KeysAndValues),
        Vector = 'BasicArrayListD':new(),
        Size = (get({HashMapVector, '$class'})):size(HashMapVector),
        lists:foreach(fun(Index) ->
            HashMap = (get({HashMapVector, '$class'})):get(HashMapVector, Index),
            case (HashMap =/= undefined) of
                true ->
                (get({Vector, '$class'})):add(Vector, 'AdvertisementCampaign':new(HashMap));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        'AdvertisementCampaigns':new(Vector).

get(This, StoreName, Name) when (is_list(StoreName) orelse StoreName =:= undefined), (is_list(Name) orelse Name =:= undefined) ->
        try
        KeysAndValues = (fun(Target_N67488) -> (get({Target_N67488, '$class'})):createHashMap(Target_N67488) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), StoreName),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'AdvertisementCampaignData':getInstance(), 'NAME'}), Name),
        HashMap = 'AbSqlBean':getRow(This, KeysAndValues),
        case (HashMap =/= undefined) of
            true ->
            throw({'$return', 'AdvertisementCampaign':new(HashMap)});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({(fun(Target_N67856) -> (get({Target_N67856, '$class'})):getInstance(Target_N67856) end)('EntryData':getInstance()), 'ID'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({(fun(Target_N67908) -> (get({Target_N67908, '$class'})):getInstance(Target_N67908) end)('EntryData':getInstance()), 'ID'})), UpdatedValues).

createTableStatement(This) ->
        EntryData = (fun(Target_N68011) -> (get({Target_N68011, '$class'})):getInstance(Target_N68011) end)('EntryData':getInstance()),
        AdvertisementCampaignData = 'AdvertisementCampaignData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'START'})),
        (fun(Target_N68254) -> (get({Target_N68254, '$class'})):append(Target_N68254, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N68261) -> (get({Target_N68261, '$class'})):append(Target_N68261, get({EntryData, 'ID'})) end)((fun(Target_N68268) -> (get({Target_N68268, '$class'})):append(Target_N68268, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N68275) -> (get({Target_N68275, '$class'})):append(Target_N68275, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N68282) -> (get({Target_N68282, '$class'})):append(Target_N68282, get({EntryData, 'LASTMODIFIED'})) end)((fun(Target_N68289) -> (get({Target_N68289, '$class'})):append(Target_N68289, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N68296) -> (get({Target_N68296, '$class'})):append(Target_N68296, get({EntryData, 'TIMECREATED'})) end)((fun(Target_N68303) -> (get({Target_N68303, '$class'})):append(Target_N68303, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N68310) -> (get({Target_N68310, '$class'})):append(Target_N68310, get({'TimeData':getInstance(), 'END'})) end)((fun(Target_N68317) -> (get({Target_N68317, '$class'})):append(Target_N68317, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N68324) -> (get({Target_N68324, '$class'})):append(Target_N68324, get({'TimeData':getInstance(), 'START'})) end)((fun(Target_N68331) -> (get({Target_N68331, '$class'})):append(Target_N68331, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})) end)((fun(Target_N68338) -> (get({Target_N68338, '$class'})):append(Target_N68338, get({AdvertisementCampaignData, 'CONFIG'})) end)((fun(Target_N68345) -> (get({Target_N68345, '$class'})):append(Target_N68345, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N68352) -> (get({Target_N68352, '$class'})):append(Target_N68352, get({AdvertisementCampaignData, 'DESCRIPTION'})) end)((fun(Target_N68359) -> (get({Target_N68359, '$class'})):append(Target_N68359, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N68366) -> (get({Target_N68366, '$class'})):append(Target_N68366, get({AdvertisementCampaignData, 'NAME'})) end)((fun(Target_N68373) -> (get({Target_N68373, '$class'})):append(Target_N68373, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N68380) -> (get({Target_N68380, '$class'})):append(Target_N68380, get({'StoreFrontData':getInstance(), 'NAME'})) end)((fun(Target_N68387) -> (get({Target_N68387, '$class'})):append(Target_N68387, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({EntryData, 'ID'})))))))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        ReturnStr = 'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)),
        ReturnStr.

dropTable(This) ->
        'AbSqlBean':dropTable(This).

