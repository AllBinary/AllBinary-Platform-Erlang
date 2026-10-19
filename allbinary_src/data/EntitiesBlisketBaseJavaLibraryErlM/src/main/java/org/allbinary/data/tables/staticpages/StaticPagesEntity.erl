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
% package org.allbinary.data.tables.staticpages
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.init.db.StaticPagesDbInitInfo
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.control.search.SearchData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonSeps

-module('StaticPagesEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements StaticPagesEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, 'TABLENAME'}, "staticpages"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
        'AbSqlBean':init(This, 'StaticPagesDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, 'TABLENAME'})).

insert(This, Values) ->
        try
            'AbSqlBean':insert(This, Values),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'SUCCESS'}), This, get({'StaticPagesEntity', 'INSERT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({'StaticPagesEntity', 'INSERT'}), E);
                false -> ok
            end
        end.

getFile(This, Store, Keywords) when (is_list(Store) orelse Store =:= undefined), (is_list(Keywords) orelse Keywords =:= undefined) ->
        WhereHashMap = (fun(Target_N66794) -> (get({Target_N66794, '$class'})):createHashMap(Target_N66794) end)('StdUtil':getInstance()),
        (get({WhereHashMap, '$class'})):put(WhereHashMap, get({'StoreFrontData':getInstance(), 'NAME'}), Store),
        (get({WhereHashMap, '$class'})):put(WhereHashMap, get({get({This, basicItemData}), 'KEYWORDS'}), Keywords),
        File = 'AbSqlBean':getField(This, WhereHashMap, get({'SearchData', 'PAGE'})),
        File.

delete(This, Keywords) when (is_list(Keywords) orelse Keywords =:= undefined) ->
        'AbSqlBean':deleteWhere(This, get({get({This, basicItemData}), 'KEYWORDS'}), Keywords).

dropTable(This) ->
        ReturnStr = 'AbSqlBean':dropTable(This),
        ReturnStr.

update(This, UpdatedValues) ->
        'AbSqlBean':updateWhere(This, get({get({This, basicItemData}), 'KEYWORDS'}), (get({UpdatedValues, '$class'})):get(UpdatedValues, get({get({This, basicItemData}), 'KEYWORDS'})), UpdatedValues).

createTableStatement(This) ->
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N67431) -> (get({Target_N67431, '$class'})):append(Target_N67431, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N67438) -> (get({Target_N67438, '$class'})):append(Target_N67438, get({get({This, basicItemData}), 'KEYWORDS'})) end)((fun(Target_N67445) -> (get({Target_N67445, '$class'})):append(Target_N67445, get({'CommonSeps':getInstance(), 'COMMA_SEP'})) end)((fun(Target_N67452) -> (get({Target_N67452, '$class'})):append(Target_N67452, get({'StoreFrontData':getInstance(), 'NAME'})) end)((fun(Target_N67459) -> (get({Target_N67459, '$class'})):append(Target_N67459, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N67466) -> (get({Target_N67466, '$class'})):append(Target_N67466, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67473) -> (get({Target_N67473, '$class'})):append(Target_N67473, get({'SearchData', 'PAGE'})) end)((fun(Target_N67480) -> (get({Target_N67480, '$class'})):append(Target_N67480, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67487) -> (get({Target_N67487, '$class'})):append(Target_N67487, get({get({This, basicItemData}), 'KEYWORDS'})) end)((fun(Target_N67494) -> (get({Target_N67494, '$class'})):append(Target_N67494, get({get({This, sqlTypeStrings}), 'SIXTY_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N67501) -> (get({Target_N67501, '$class'})):append(Target_N67501, get({'StoreFrontData':getInstance(), 'NAME'})) end)((fun(Target_N67508) -> (get({Target_N67508, '$class'})):append(Target_N67508, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N67515) -> (get({Target_N67515, '$class'})):append(Target_N67515, get({This, 'TABLENAME'})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'}))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

