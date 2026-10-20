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
% package org.allbinary.logic.communication.sql
% import org.allbinary.business.installer.Portion
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings

-module('AbSqlTableUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbSqlTableUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'TABLE_LABEL'}, "Table: "),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, sqlStrings}, 'SqlStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'AbSqlTableUtil', instance}).

backupTable(This, AbSqlTable) ->
        TableName = (get({AbSqlTable, '$class'})):getTableName(AbSqlTable),
        lists:concat([lists:concat([get({This, 'TABLE_LABEL'}), TableName]), " Backup Failed"]).

restoreTable(This, AbSqlTable, Portion) ->
        TableName = (get({AbSqlTable, '$class'})):getTableName(AbSqlTable),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'TABLE_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, TableName),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Restoration Failed"),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

