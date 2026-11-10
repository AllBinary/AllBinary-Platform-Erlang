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
% package org.allbinary.data.tables.log
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.init.db.LogDbInitInfo
% import org.allbinary.logic.communication.http.request.AbeHttpRequestInfoData
% import org.allbinary.logic.communication.sql.AbSqlBean
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.util.BasicArrayList

-module('LogTableEntity').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements LogTableEntityInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AbSqlBean', Function, Arguments).

init_fields(This) ->
    put({This, tableName}, "log"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'AbSqlBean':'$init'(This, 'LogDbInitInfo':new()),
        init_fields(This),
        (get({This, '$class'})):setTableName(This, get({This, tableName})).

createTableStatement(This) ->
        AbeHttpRequestInfoData = 'AbeHttpRequestInfoData':getInstance(),
        StringBuffer = 'StringMaker':new(),
        (fun(Target_N66014) -> (get({Target_N66014, '$class'})):append(Target_N66014, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N66021) -> (get({Target_N66021, '$class'})):append(Target_N66021, get({get({This, sqlStrings}), 'ID'})) end)((fun(Target_N66028) -> (get({Target_N66028, '$class'})):append(Target_N66028, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N66035) -> (get({Target_N66035, '$class'})):append(Target_N66035, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N66042) -> (get({Target_N66042, '$class'})):append(Target_N66042, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N66049) -> (get({Target_N66049, '$class'})):append(Target_N66049, get({get({This, sqlTypeStrings}), 'MAX_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N66056) -> (get({Target_N66056, '$class'})):append(Target_N66056, get({AbeHttpRequestInfoData, 'REMOTE_PORT'})) end)((fun(Target_N66063) -> (get({Target_N66063, '$class'})):append(Target_N66063, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66070) -> (get({Target_N66070, '$class'})):append(Target_N66070, get({AbeHttpRequestInfoData, 'REQUEST_FILE_PATH'})) end)((fun(Target_N66077) -> (get({Target_N66077, '$class'})):append(Target_N66077, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66084) -> (get({Target_N66084, '$class'})):append(Target_N66084, get({AbeHttpRequestInfoData, 'REMOTE_ADDRESS'})) end)((fun(Target_N66091) -> (get({Target_N66091, '$class'})):append(Target_N66091, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N66098) -> (get({Target_N66098, '$class'})):append(Target_N66098, get({AbeHttpRequestInfoData, 'REMOTE_HOST'})) end)((fun(Target_N66105) -> (get({Target_N66105, '$class'})):append(Target_N66105, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66112) -> (get({Target_N66112, '$class'})):append(Target_N66112, get({AbeHttpRequestInfoData, 'HTTP_USER_AGENT'})) end)((fun(Target_N66119) -> (get({Target_N66119, '$class'})):append(Target_N66119, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66126) -> (get({Target_N66126, '$class'})):append(Target_N66126, get({get({This, sqlStrings}), 'ID'})) end)((fun(Target_N66133) -> (get({Target_N66133, '$class'})):append(Target_N66133, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N66140) -> (get({Target_N66140, '$class'})):append(Target_N66140, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'}))))))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

deleteWhere(This, Key, Value) when (is_list(Key) orelse Key =:= undefined), (is_list(Value) orelse Value =:= undefined) ->
        'AbSqlBean':deleteWhere(This, Key, Value).

insert(This, Values) ->
        'AbSqlBean':insert(This, Values).

dropTable(This) ->
        'AbSqlBean':dropTable(This).

