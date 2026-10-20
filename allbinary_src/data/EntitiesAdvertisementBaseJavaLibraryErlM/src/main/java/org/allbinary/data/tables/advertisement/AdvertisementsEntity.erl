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
% package org.allbinary.data.tables.advertisement
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.DynamicObjectData
% import org.allbinary.business.advertisement.AdvertisementData
% import org.allbinary.business.advertisement.AdvertisementInterface
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker

-module('AdvertisementsEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdvertisementsEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "advertisements"),
    put({This, '_INDEX'}, "_index"),
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

get(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        KeysAndValues = (fun(Target_N66842) -> (get({Target_N66842, '$class'})):createHashMap(Target_N66842) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), StoreName),
        HashMapVector = 'AbSqlBean':getRows(This, KeysAndValues),
        Vector = 'BasicArrayListD':new(),
        Size = (get({HashMapVector, '$class'})):size(HashMapVector),
        lists:foreach(fun(Index) ->
            HashMap = (get({HashMapVector, '$class'})):get(HashMapVector, Index)
        end, lists:seq(0, Size - 1)),
        Vector.

get(This, StoreName, AdvertismentName) when (is_list(StoreName) orelse StoreName =:= undefined), (is_list(AdvertismentName) orelse AdvertismentName =:= undefined) ->
        KeysAndValues = (fun(Target_N67288) -> (get({Target_N67288, '$class'})):createHashMap(Target_N67288) end)('StdUtil':getInstance()),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), StoreName),
        (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'AdvertisementData':getInstance(), 'NAME'}), AdvertismentName),
        HashMap = 'AbSqlBean':getRow(This, KeysAndValues),
        undefined.

createTableStatement(This) ->
        AdvertisementData = 'AdvertisementData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})),
        (fun(Target_N67699) -> (get({Target_N67699, '$class'})):append(Target_N67699, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67706) -> (get({Target_N67706, '$class'})):append(Target_N67706, get({AdvertisementData, 'DESCRIPTION'})) end)((fun(Target_N67713) -> (get({Target_N67713, '$class'})):append(Target_N67713, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67720) -> (get({Target_N67720, '$class'})):append(Target_N67720, get({'StoreFrontData':getInstance(), 'NAME'})) end)((fun(Target_N67727) -> (get({Target_N67727, '$class'})):append(Target_N67727, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67734) -> (get({Target_N67734, '$class'})):append(Target_N67734, get({AdvertisementData, 'NAME'})) end)((fun(Target_N67741) -> (get({Target_N67741, '$class'})):append(Target_N67741, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N67748) -> (get({Target_N67748, '$class'})):append(Target_N67748, get({This, '_INDEX'})) end)((fun(Target_N67755) -> (get({Target_N67755, '$class'})):append(Target_N67755, get({AdvertisementData, 'NAME'})) end)((fun(Target_N67762) -> (get({Target_N67762, '$class'})):append(Target_N67762, get({get({This, sqlStrings}), 'START'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)))))))))))),
        (fun(Target_N68018) -> (get({Target_N68018, '$class'})):append(Target_N68018, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N68025) -> (get({Target_N68025, '$class'})):append(Target_N68025, get({AdvertisementData, 'NAME'})) end)((fun(Target_N68032) -> (get({Target_N68032, '$class'})):append(Target_N68032, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N68039) -> (get({Target_N68039, '$class'})):append(Target_N68039, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N68046) -> (get({Target_N68046, '$class'})):append(Target_N68046, get({'EntryData':getInstance(), 'LASTMODIFIED'})) end)((fun(Target_N68053) -> (get({Target_N68053, '$class'})):append(Target_N68053, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N68060) -> (get({Target_N68060, '$class'})):append(Target_N68060, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N68067) -> (get({Target_N68067, '$class'})):append(Target_N68067, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({'DynamicObjectData', 'NAME'})))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        ReturnStr = 'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)),
        ReturnStr.

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({'EntryData':getInstance(), 'ID'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({'EntryData':getInstance(), 'ID'})), UpdatedValues).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

