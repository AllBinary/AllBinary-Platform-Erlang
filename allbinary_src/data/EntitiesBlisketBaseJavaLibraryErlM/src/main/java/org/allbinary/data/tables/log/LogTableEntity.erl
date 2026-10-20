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
        (fun(Target_N65989) -> (get({Target_N65989, '$class'})):append(Target_N65989, get({get({This, sqlStrings}), 'END'})) end)((fun(Target_N65996) -> (get({Target_N65996, '$class'})):append(Target_N65996, get({get({This, sqlStrings}), 'ID'})) end)((fun(Target_N66003) -> (get({Target_N66003, '$class'})):append(Target_N66003, get({get({This, sqlStrings}), 'PRIMARY_KEY'})) end)((fun(Target_N66010) -> (get({Target_N66010, '$class'})):append(Target_N66010, get({get({This, sqlTypeStrings}), 'MAX_BIG_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N66017) -> (get({Target_N66017, '$class'})):append(Target_N66017, get({'EntryData':getInstance(), 'TIMECREATED'})) end)((fun(Target_N66024) -> (get({Target_N66024, '$class'})):append(Target_N66024, get({get({This, sqlTypeStrings}), 'MAX_INT_UNSIGNED_NOT_NULL'})) end)((fun(Target_N66031) -> (get({Target_N66031, '$class'})):append(Target_N66031, get({AbeHttpRequestInfoData, 'REMOTE_PORT'})) end)((fun(Target_N66038) -> (get({Target_N66038, '$class'})):append(Target_N66038, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66045) -> (get({Target_N66045, '$class'})):append(Target_N66045, get({AbeHttpRequestInfoData, 'REQUEST_FILE_PATH'})) end)((fun(Target_N66052) -> (get({Target_N66052, '$class'})):append(Target_N66052, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66059) -> (get({Target_N66059, '$class'})):append(Target_N66059, get({AbeHttpRequestInfoData, 'REMOTE_ADDRESS'})) end)((fun(Target_N66066) -> (get({Target_N66066, '$class'})):append(Target_N66066, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN'})) end)((fun(Target_N66073) -> (get({Target_N66073, '$class'})):append(Target_N66073, get({AbeHttpRequestInfoData, 'REMOTE_HOST'})) end)((fun(Target_N66080) -> (get({Target_N66080, '$class'})):append(Target_N66080, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66087) -> (get({Target_N66087, '$class'})):append(Target_N66087, get({AbeHttpRequestInfoData, 'HTTP_USER_AGENT'})) end)((fun(Target_N66094) -> (get({Target_N66094, '$class'})):append(Target_N66094, get({get({This, sqlTypeStrings}), 'MAX_CHAR_COLUMN_NOT_NULL'})) end)((fun(Target_N66101) -> (get({Target_N66101, '$class'})):append(Target_N66101, get({get({This, sqlStrings}), 'ID'})) end)((fun(Target_N66108) -> (get({Target_N66108, '$class'})):append(Target_N66108, get({get({This, sqlStrings}), 'START'})) end)((fun(Target_N66115) -> (get({Target_N66115, '$class'})):append(Target_N66115, get({This, tableName})) end)((get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'CREATE_TABLE'}))))))))))))))))))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

createTable(This) ->
        'AbSqlBean':createTable(This, (get({This, '$class'})):createTableStatement(This)).

