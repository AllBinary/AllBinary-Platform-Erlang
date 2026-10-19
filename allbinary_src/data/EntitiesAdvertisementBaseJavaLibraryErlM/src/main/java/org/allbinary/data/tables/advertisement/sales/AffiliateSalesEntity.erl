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
    init(This),
    This.

init(This) ->
        'AbSqlBean':init(This, 'UserDbInitInfo':new()),
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
        (fun(Target_N66901) -> (get({Target_N66901, '$class'})):append(Target_N66901, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N66908) -> (get({Target_N66908, '$class'})):append(Target_N66908, get({EntryData, 'ID'})) end)((fun(Target_N66915) -> (get({Target_N66915, '$class'})):append(Target_N66915, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N66922) -> (get({Target_N66922, '$class'})):append(Target_N66922, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N66929) -> (get({Target_N66929, '$class'})):append(Target_N66929, get({EntryData, 'LASTMODIFIED'})) end)((fun(Target_N66936) -> (get({Target_N66936, '$class'})):append(Target_N66936, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N66943) -> (get({Target_N66943, '$class'})):append(Target_N66943, get({EntryData, 'TIMECREATED'})) end)((fun(Target_N66950) -> (get({Target_N66950, '$class'})):append(Target_N66950, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66957) -> (get({Target_N66957, '$class'})):append(Target_N66957, get({'DynamicObjectData', 'NAME'})) end)((fun(Target_N66964) -> (get({Target_N66964, '$class'})):append(Target_N66964, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66971) -> (get({Target_N66971, '$class'})):append(Target_N66971, get({'GroupData', 'NAME'})) end)((fun(Target_N66983) -> (get({Target_N66983, '$class'})):append(Target_N66983, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66990) -> (get({Target_N66990, '$class'})):append(Target_N66990, get({'StoreFrontData':getInstance(), 'NAME'})) end)((fun(Target_N66997) -> (get({Target_N66997, '$class'})):append(Target_N66997, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({EntryData, 'ID'})))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        ReturnStr = 'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)),
        ReturnStr.

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({'EntryData':getInstance(), 'ID'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({'EntryData':getInstance(), 'ID'})), UpdatedValues).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

