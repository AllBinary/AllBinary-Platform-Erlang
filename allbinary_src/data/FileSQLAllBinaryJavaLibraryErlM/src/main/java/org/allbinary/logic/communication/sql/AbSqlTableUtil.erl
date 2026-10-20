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
% import org.allbinary.logic.string.StringMaker
% import java.sql.ResultSet
% import java.sql.ResultSetMetaData
% import java.util.Calendar
% import org.allbinary.business.installer.Portion
% import org.allbinary.logic.io.AbFileOutputStream
% import org.allbinary.logic.io.BufferedLineReader
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileUtil
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.globals.PATH_GLOBALS
% import java.io.OutputStream
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringUtil

-module('AbSqlTableUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbSqlTableUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'EXTENSION'}, ".adb"),
    put({This, 'END'}, "')\n"),
    put({This, 'SAVING_BACKUP_PATH'}, "Saving Backup: Path: "),
    put({This, 'FILE_LABEL'}, " File: "),
    put({This, 'METHOD_RESTORE_TABLE'}, "restoreTable()"),
    put({This, 'METHOD_BACKUP_TABLE'}, "backupTable()"),
    put({This, 'METHOD_BACKUP_FILE'}, "backupFile()"),
    put({This, 'METHOD_GET_OUTPUT_STREAM'}, "getOutputStream()"),
    put({This, 'TABLE_CREATION_SUCCESS'}, "Table Creation Successful: "),
    put({This, 'DROPPED_SUCCESS'}, " Dropped Successfully"),
    put({This, 'SAVING'}, "Saving: "),
    put({This, 'APPENDING'}, "Appending: "),
    put({This, 'TABLE_LABEL'}, "Table: "),
    put({This, 'BACKUP_SUCCESS'}, " Backup Success"),
    put({This, 'ERROR_CREATING'}, "Error Creating: "),
    put({This, 'TOTAL_LABEL'}, " Total: "),
    put({This, 'SECTION_LABEL'}, " Section: "),
    put({This, 'DASH'}, " - "),
    put({This, 'PORTION_RESTORED'}, " Portion Restored"),
    put({This, specialCharArray}, array:from_list([$\n, $\f, $\r])),
    put({This, 'NEW_LINE'}, "\\n"),
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

getOutputStream(This, BackupPath, TableName) when (is_list(BackupPath) orelse BackupPath =:= undefined), (is_list(TableName) orelse TableName =:= undefined) ->
        try
            FileName = lists:concat([TableName, get({This, 'EXTENSION'})]),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'SAVING'}), TableName]), This, get({This, 'METHOD_GET_OUTPUT_STREAM'}));
                false -> ok
            end,
            BackupFilePath = 'AbPath':new(BackupPath, FileName),
            BackupFile = 'AbFile':createAbFile(BackupFilePath),
            case (get({BackupFile, '$class'})):exists(BackupFile) of
                true ->
                (get({This, '$class'})):backupFile(This, BackupFilePath, BackupPath, TableName),
                (get({BackupFile, '$class'})):delete(BackupFile);
                false -> ok
            end,
            (get({BackupFile, '$class'})):createNewFile(BackupFile),
            OutputStream = 'AbFileOutputStream':new(BackupFile),
            OutputStream
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Create File", This, get({This, 'METHOD_GET_OUTPUT_STREAM'}), E);
                false -> ok
            end,
            undefined
        end.

backupFile(This, Path, BackupPath, TableName) when (is_list(BackupPath) orelse BackupPath =:= undefined), (is_list(TableName) orelse TableName =:= undefined) ->
        try
            Calendar = 'Calendar':getInstance(),
            TimeLong = (get({Calendar, '$class'})):getTimeInMillis(Calendar),
            Time = (get({TimeLong, '$class'})):toString(TimeLong),
            StringBuffer = 'StringMaker':new(),
            FileName = lists:concat([TableName, get({This, 'EXTENSION'})]),
            (get({StringBuffer, '$class'})):append(StringBuffer, BackupPath),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, Time),
            BackupAbPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SAVING_BACKUP_PATH'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({BackupAbPath, '$class'})):toFileSystemString(BackupAbPath)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'FILE_LABEL'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, FileName),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'METHOD_BACKUP_FILE'}));
                false -> ok
            end,
            'Directory':create(BackupAbPath),
            BackupFileBak = 'AbFile':createAbFile((get({BackupAbPath, '$class'})):toFileSystemString(BackupAbPath)),
            (get({BackupFileBak, '$class'})):createNewFile(BackupFileBak),
            (fun(Target_N69175) -> (get({Target_N69175, '$class'})):copy(Target_N69175, Path, BackupAbPath) end)('FileUtil':getInstance()),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({This, 'METHOD_BACKUP_FILE'}), E);
                false -> ok
            end,
            false
        end.

convertNewLines(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        put({local, index}, 0),
        put({local, lastIndex}, 0),
        (fun Loop() -> case (get({local, index}) < string:length(Value)) of true ->
            put({local, index}, (get({Value, '$class'})):indexOf(Value, array:get(0, get({This, specialCharArray})), get({local, lastIndex}))),
            case (get({local, index}) =/= (-1)) of
                true ->
                NextLine = string:slice(Value, get({local, lastIndex}), ((get({local, index}) - 1)) - (get({local, lastIndex}))),
                (get({StringBuffer, '$class'})):append(StringBuffer, NextLine),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'NEW_LINE'})),
                put({local, lastIndex}, (get({local, index}) + 1));
                false ->
                throw('$break')
            end,
            Loop();
        false -> ok end end)(),
        case (get({local, lastIndex}) < string:length(Value)) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, string:slice(Value, get({local, lastIndex}), (string:length(Value)) - (get({local, lastIndex}))));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):toString(StringBuffer).

backupTable(This, AbSqlTable) ->
        TableName = (get({AbSqlTable, '$class'})):getTableName(AbSqlTable),
        try
            Count = 0,
            SqlStatement = lists:concat([get({get({This, sqlStrings}), 'SELECT_ALL_FROM'}), TableName]),
            Path = ((get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):getMainPath(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) + get({(get({get({'AbSqlTableUtil', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'AbSqlTableUtil', 'PATH_GLOBALS'})), 'BACKUP_PATH'})),
            case (not 'Directory':create('AbPath':new(Path))) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'ERROR_CREATING'}), Path]), This, get({This, 'METHOD_BACKUP_TABLE'}));
                    false -> ok
                end;
                false -> ok
            end,
            Rset = (get({AbSqlTable, '$class'})):executeSQLStatement(AbSqlTable, SqlStatement),
            Rsmd = (get({Rset, '$class'})):getMetaData(Rset),
            ColNum = (get({Rsmd, '$class'})):getColumnCount(Rsmd),
            QUERY_START = (fun(Target_N70871) -> (get({Target_N70871, '$class'})):toString(Target_N70871) end)((fun(Target_N70878) -> (get({Target_N70878, '$class'})):append(Target_N70878, get({get({This, sqlStrings}), 'VALUES'})) end)((fun(Target_N70885) -> (get({Target_N70885, '$class'})):append(Target_N70885, TableName) end)((fun(Target_N70892) -> (get({Target_N70892, '$class'})):append(Target_N70892, get({get({This, sqlStrings}), 'INSERT_INTO'})) end)('StringBuilder':new())))),
            StringBuffer = 'StringMaker':new(),
            OutputStream = (get({This, '$class'})):getOutputStream(This, Path, TableName),
            (fun Loop() -> case (get({Rset, '$class'})):next(Rset) of true ->
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, QUERY_START),
                lists:foreach(fun(I) ->
                    Value = (get({Rset, '$class'})):getString(Rset, I),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):convertNewLines(This, Value)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, sqlStrings}), 'SINGLE_QUOTE_COMMA_SEP'}))
                end, lists:seq(1, ColNum - 1)),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({Rset, '$class'})):getString(Rset, ColNum)),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'END'})),
                SqlStatementLine = (get({StringBuffer, '$class'})):toString(StringBuffer),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'APPENDING'}), SqlStatementLine]), This, get({This, 'METHOD_BACKUP_TABLE'}));
                    false -> ok
                end,
                (get({OutputStream, '$class'})):write(OutputStream, (get({SqlStatementLine, '$class'})):getBytes(SqlStatementLine)),
                Loop();
            false -> ok end end)(),
            (fun(Target_N71813) -> (get({Target_N71813, '$class'})):close(Target_N71813, OutputStream) end)('StreamUtil':getInstance()),
            lists:concat([lists:concat([get({This, 'TABLE_LABEL'}), TableName]), get({This, 'BACKUP_SUCCESS'})])
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Backup Table Failed\nSQL Statement", This, get({This, 'METHOD_BACKUP_TABLE'}), E);
                false -> ok
            end,
            lists:concat([lists:concat([get({This, 'TABLE_LABEL'}), TableName]), " Backup Failed"])
        end.

restoreTable(This, AbSqlTable, Portion) ->
        TableName = (get({AbSqlTable, '$class'})):getTableName(AbSqlTable),
        try
            Path = ((get({get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'}), '$class'})):getMainPath(get({get({get({'org', allbinary}), globals}), 'URLGLOBALS'})) + get({(get({get({'AbSqlTableUtil', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'AbSqlTableUtil', 'PATH_GLOBALS'})), 'BACKUP_PATH'})),
            Current = (fun(Target_N72413) -> (get({Target_N72413, '$class'})):intValue(Target_N72413) end)((get({Portion, '$class'})):getCurrent(Portion)),
            case (Current =:= 0) of
                true ->
                case 'Directory':create('AbPath':new(Path)) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'ERROR_CREATING'}), Path]), This, get({This, 'METHOD_RESTORE_TABLE'}));
                        false -> ok
                    end;
                    false -> ok
                end;
                false -> ok
            end,
            BackupFile = 'AbFile':createAbFile(Path, lists:concat([TableName, get({This, 'EXTENSION'})])),
            BufferedLineReader = 'BufferedLineReader':new(BackupFile),
            Size = (get({BufferedLineReader, '$class'})):getSize(BufferedLineReader),
            Section = ((Size / (fun(Target_N72962) -> (get({Target_N72962, '$class'})):intValue(Target_N72962) end)((get({Portion, '$class'})):getTotal(Portion))) + 1),
            Start = (Section * Current),
            put({local, 'end'}, (Start + Section)),
            case (get({local, 'end'}) > Size) of
                true ->
                put({local, 'end'}, Size);
                false -> ok
            end,
            put({local, stringBuffer}, 'StringMaker':new()),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'TOTAL_LABEL'})),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Size),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'SECTION_LABEL'})),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), Start),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'DASH'})),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({local, 'end'})),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), This, get({This, 'METHOD_RESTORE_TABLE'}));
                false -> ok
            end,
            (get({BufferedLineReader, '$class'})):readUpToLines(BufferedLineReader, Start),
            put({local, line}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
            (fun Loop() -> case (((get({BufferedLineReader, '$class'})):getCurrent(BufferedLineReader) < get({local, 'end'})) andalso ((begin put({local, line}, (get({BufferedLineReader, '$class'})):readLine(BufferedLineReader)), get({local, line}) end) =/= undefined)) of true ->
                case (string:length(get({local, line})) > 1) of
                    true ->
                    (get({AbSqlTable, '$class'})):executeSQLStatement(AbSqlTable, get({local, line}));
                    false -> ok
                end,
                Loop();
            false -> ok end end)(),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({get({This, commonSeps}), 'SPACE'})),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'TABLE_LABEL'})),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), TableName),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'PORTION_RESTORED'})),
            (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Restore Table Failed\nSQL Statement", This, get({This, 'METHOD_RESTORE_TABLE'}), E);
                false -> ok
            end,
            put({local, stringBuffer}, 'StringMaker':new()),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), get({This, 'TABLE_LABEL'})),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), TableName),
            (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " Restoration Failed"),
            (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer}))
        end.

