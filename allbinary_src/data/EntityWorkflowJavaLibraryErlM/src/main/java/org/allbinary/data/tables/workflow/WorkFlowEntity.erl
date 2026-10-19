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
% package org.allbinary.data.tables.workflow
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.DynamicObjectData
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.control.workflow.DbWorkFlowFactory
% import org.allbinary.logic.control.workflow.WorkFlowData
% import org.allbinary.logic.control.workflow.WorkFlowInterface
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.LicensingException
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory

-module('WorkFlowEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements WorkFlowEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, tableName}, "workflows"),
    put({This, 'METHOD_GET'}, "get()"),
    put({This, 'METHOD_UPDATE'}, "update"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'AbSqlBean':init(This, 'UserDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, tableName})).

insert(This, Values) ->
        try
            'AbSqlBean':insert(This, Values),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'WorkFlowEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'WorkFlowEntity', 'INSERT'}), E);
                false -> ok
            end
        end.

delete(This, Name, StoreName) when (is_list(Name) orelse Name =:= undefined), (is_list(StoreName) orelse StoreName =:= undefined) ->
        try
            KeysAndValues = (fun(Target_N67067) -> (get({Target_N67067, '$class'})):createHashMap(Target_N67067) end)('StdUtil':getInstance()),
            (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'WorkFlowData':getInstance(), 'NAME'}), Name),
            (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), StoreName),
            'AbSqlBean':deleteWhere(This, KeysAndValues),
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

% throws Exception, LicensingException
get(This, Name, StoreName) when (is_list(Name) orelse Name =:= undefined), (is_list(StoreName) orelse StoreName =:= undefined) ->
        try
            KeysAndValues = (fun(Target_N67869) -> (get({Target_N67869, '$class'})):createHashMap(Target_N67869) end)('StdUtil':getInstance()),
            (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'WorkFlowData':getInstance(), 'NAME'}), Name),
            (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), StoreName),
            HashMap = 'AbSqlBean':getRow(This, KeysAndValues),
            (fun(Target_N68081) -> (get({Target_N68081, '$class'})):getInstance(Target_N68081, get({This, abeClientInformation}), HashMap) end)('DbWorkFlowFactory':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({This, 'METHOD_GET'}), E);
                false -> ok
            end,
            erlang:error(E)
        end.

get(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        try
            WorkFlowsVector = 'BasicArrayListD':new(),
            KeysAndValues = (fun(Target_N68857) -> (get({Target_N68857, '$class'})):createHashMap(Target_N68857) end)('StdUtil':getInstance()),
            (get({KeysAndValues, '$class'})):put(KeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), StoreName),
            HashMapVector = 'AbSqlBean':getRows(This, KeysAndValues),
            Size = (get({HashMapVector, '$class'})):size(HashMapVector),
            lists:foreach(fun(I) ->
                WorkFlowHashMap = (get({HashMapVector, '$class'})):get(HashMapVector, I),
                case (WorkFlowHashMap =/= undefined) of
                    true ->
                    (get({WorkFlowsVector, '$class'})):add(WorkFlowsVector, (fun(Target_N69158) -> (get({Target_N69158, '$class'})):getInstance(Target_N69158, get({This, abeClientInformation}), WorkFlowHashMap) end)('DbWorkFlowFactory':getInstance()));
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            WorkFlowsVector
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({This, 'METHOD_GET'}), E);
                false -> ok
            end,
            undefined
        end.

update(This, UpdatedValues) ->
        try
            WherekeysAndValues = (fun(Target_N69636) -> (get({Target_N69636, '$class'})):createHashMap(Target_N69636) end)('StdUtil':getInstance()),
            (get({WherekeysAndValues, '$class'})):put(WherekeysAndValues, get({'WorkFlowData':getInstance(), 'NAME'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({'WorkFlowData':getInstance(), 'NAME'}))),
            (get({WherekeysAndValues, '$class'})):put(WherekeysAndValues, get({'StoreFrontData':getInstance(), 'NAME'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({'StoreFrontData':getInstance(), 'NAME'}))),
            'AbSqlBean':updateWhere(This, WherekeysAndValues, UpdatedValues)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({This, 'METHOD_UPDATE'}), E);
                false -> ok
            end
        end.

createTableStatement(This) ->
        WorkFlowData = 'WorkFlowData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N70330) -> (get({Target_N70330, '$class'})):append(Target_N70330, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N70337) -> (get({Target_N70337, '$class'})):append(Target_N70337, get({WorkFlowData, 'NAME'})) end)((fun(Target_N70344) -> (get({Target_N70344, '$class'})):append(Target_N70344, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N70351) -> (get({Target_N70351, '$class'})):append(Target_N70351, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N70358) -> (get({Target_N70358, '$class'})):append(Target_N70358, get({'EntryData':getInstance(), 'LASTMODIFIED'})) end)((fun(Target_N70365) -> (get({Target_N70365, '$class'})):append(Target_N70365, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N70372) -> (get({Target_N70372, '$class'})):append(Target_N70372, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N70379) -> (get({Target_N70379, '$class'})):append(Target_N70379, get({get({This, sqlTypeStrings}), 'BLOB_NOT_NULL'})) end)((fun(Target_N70386) -> (get({Target_N70386, '$class'})):append(Target_N70386, get({WorkFlowData, 'DATA'})) end)((fun(Target_N70393) -> (get({Target_N70393, '$class'})):append(Target_N70393, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N70400) -> (get({Target_N70400, '$class'})):append(Target_N70400, get({'DynamicObjectData', 'NAME'})) end)((fun(Target_N70407) -> (get({Target_N70407, '$class'})):append(Target_N70407, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N70414) -> (get({Target_N70414, '$class'})):append(Target_N70414, get({'StoreFrontData':getInstance(), 'NAME'})) end)((fun(Target_N70421) -> (get({Target_N70421, '$class'})):append(Target_N70421, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N70428) -> (get({Target_N70428, '$class'})):append(Target_N70428, get({WorkFlowData, 'NAME'})) end)((fun(Target_N70435) -> (get({Target_N70435, '$class'})):append(Target_N70435, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N70442) -> (get({Target_N70442, '$class'})):append(Target_N70442, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'}))))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

