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
% package org.allbinary.data.tables.advertisement.areas
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.advertisement.area.AdvertisementArea
% import org.allbinary.business.advertisement.area.AdvertisementAreaData
% import org.allbinary.business.advertisement.area.AdvertisementAreaInterface
% import org.allbinary.business.advertisement.campaign.AdvertisementCampaignData
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('AdvertisementAreasEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdvertisementAreasEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "advertisements"),
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
            'AbSqlBean':deleteWhere(This, get({'EntryData':getInstance(), 'ID'}), Value),
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
get(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        KeysAndValues = (fun(Target_N66864) -> (get({Target_N66864, '$class'})):createHashMap(Target_N66864) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), StoreName),
        HashMapVector = 'AbSqlBean':getRows(This, KeysAndValues),
        Vector = 'BasicArrayListD':new(),
        Size = (get({HashMapVector, '$class'})):size(HashMapVector),
        lists:foreach(fun(Index) ->
            HashMap = (get({HashMapVector, '$class'})):get(HashMapVector, Index),
            case (HashMap =/= undefined) of
                true ->
                (get({Vector, '$class'})):add(Vector, 'AdvertisementArea':new(HashMap));
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        Vector.

% throws Exception
get(This, StoreName, AdvertisementAreaName) when (is_list(StoreName) orelse StoreName =:= undefined), (is_list(AdvertisementAreaName) orelse AdvertisementAreaName =:= undefined) ->
        try
        KeysAndValues = (fun(Target_N67410) -> (get({Target_N67410, '$class'})):createHashMap(Target_N67410) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), StoreName),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'AdvertisementAreaData':getInstance(), 'NAME'}), AdvertisementAreaName),
        HashMap = 'AbSqlBean':getRow(This, KeysAndValues),
        case (HashMap =/= undefined) of
            true ->
            throw({'$return', 'AdvertisementArea':new(HashMap)});
            false ->
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

createTableStatement(This) ->
        AdvertisementAreaData = 'AdvertisementAreaData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'START'})),
        (fun(Target_N67970) -> (get({Target_N67970, '$class'})):append(Target_N67970, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N67977) -> (get({Target_N67977, '$class'})):append(Target_N67977, get({AdvertisementAreaData, 'NAME'})) end)((fun(Target_N67984) -> (get({Target_N67984, '$class'})):append(Target_N67984, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N67991) -> (get({Target_N67991, '$class'})):append(Target_N67991, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67998) -> (get({Target_N67998, '$class'})):append(Target_N67998, get({'EntryData':getInstance(), 'LASTMODIFIED'})) end)((fun(Target_N68005) -> (get({Target_N68005, '$class'})):append(Target_N68005, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N68012) -> (get({Target_N68012, '$class'})):append(Target_N68012, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N68019) -> (get({Target_N68019, '$class'})):append(Target_N68019, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N68026) -> (get({Target_N68026, '$class'})):append(Target_N68026, get({'AdvertisementCampaignData':getInstance(), 'NAME'})) end)((fun(Target_N68033) -> (get({Target_N68033, '$class'})):append(Target_N68033, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})) end)((fun(Target_N68040) -> (get({Target_N68040, '$class'})):append(Target_N68040, get({AdvertisementAreaData, 'CONSTRAINTS'})) end)((fun(Target_N68047) -> (get({Target_N68047, '$class'})):append(Target_N68047, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N68054) -> (get({Target_N68054, '$class'})):append(Target_N68054, get({AdvertisementAreaData, 'DESCRIPTION'})) end)((fun(Target_N68061) -> (get({Target_N68061, '$class'})):append(Target_N68061, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N68068) -> (get({Target_N68068, '$class'})):append(Target_N68068, get({'StoreFrontData':getInstance(), 'NAME'})) end)((fun(Target_N68075) -> (get({Target_N68075, '$class'})):append(Target_N68075, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({AdvertisementAreaData, 'NAME'})))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        ReturnStr = 'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)),
        ReturnStr.

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({'AdvertisementAreaData':getInstance(), 'NAME'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({'AdvertisementAreaData':getInstance(), 'NAME'})), UpdatedValues).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

