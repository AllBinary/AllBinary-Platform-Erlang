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
% package org.allbinary.data.tables.advertisement.sales
% import java.util.HashMap
% import org.allbinary.business.DynamicObjectData
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.UserDbInitInfo
% import org.allbinary.business.user.group.GroupData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList

-module('AffiliateSalesEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AffiliateSalesEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tableName}, "affiliate"),
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

createTableStatement(This) ->
        EntryData = 'EntryData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getTableName(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'START'})),
        (fun(Target_N66926) -> (get({Target_N66926, '$class'})):append(Target_N66926, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N66933) -> (get({Target_N66933, '$class'})):append(Target_N66933, get({EntryData, 'ID'})) end)((fun(Target_N66940) -> (get({Target_N66940, '$class'})):append(Target_N66940, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N66947) -> (get({Target_N66947, '$class'})):append(Target_N66947, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N66954) -> (get({Target_N66954, '$class'})):append(Target_N66954, get({EntryData, 'LASTMODIFIED'})) end)((fun(Target_N66961) -> (get({Target_N66961, '$class'})):append(Target_N66961, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N66968) -> (get({Target_N66968, '$class'})):append(Target_N66968, get({EntryData, 'TIMECREATED'})) end)((fun(Target_N66975) -> (get({Target_N66975, '$class'})):append(Target_N66975, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66982) -> (get({Target_N66982, '$class'})):append(Target_N66982, get({'DynamicObjectData', 'NAME'})) end)((fun(Target_N66989) -> (get({Target_N66989, '$class'})):append(Target_N66989, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66996) -> (get({Target_N66996, '$class'})):append(Target_N66996, get({'GroupData', 'NAME'})) end)((fun(Target_N67008) -> (get({Target_N67008, '$class'})):append(Target_N67008, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67015) -> (get({Target_N67015, '$class'})):append(Target_N67015, get({'StoreFrontData':getInstance(), 'NAME'})) end)((fun(Target_N67022) -> (get({Target_N67022, '$class'})):append(Target_N67022, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({EntryData, 'ID'})))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        ReturnStr = 'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)),
        ReturnStr.

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({'EntryData':getInstance(), 'ID'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({'EntryData':getInstance(), 'ID'})), UpdatedValues).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

insert(This, Values) ->
        'AbSqlBean':insert(This, Values).

