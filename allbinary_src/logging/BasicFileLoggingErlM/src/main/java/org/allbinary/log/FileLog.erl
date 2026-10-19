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
% package org.allbinary.log
% import java.io.BufferedReader
% import java.io.BufferedWriter
% import java.io.File
% import java.io.FileReader
% import java.io.FileWriter
% import java.io.RandomAccessFile
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.communication.log.LogFormatUtil
% import org.allbinary.logic.string.StringMaker

-module('FileLog').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, stringUtil}, 'StringUtil':getInstance()),
    put({?MODULE, logLength}, 33000000),
    put({?MODULE, logPath}, "g:\\log\\"),
    put({?MODULE, extension}, allbinary_java:to_string("dat")),
    put({?MODULE, fileName}, allbinary_java:to_string(lists:concat(["log.", get({'FileLog', extension})]))),
    put({?MODULE, backupFileName}, (get({get({'FileLog', fileName}), '$class'})):concat(get({'FileLog', fileName}), ".bak")),
    put({?MODULE, 'ORG_ALLBINARY'}, "org.allbinary: "),
    put({?MODULE, firstTime}, true),
    put({?MODULE, logFile}, 'File':new(get({'FileLog', logPath}), get({'FileLog', fileName}))),
    put({?MODULE, logFileBak}, undefined),
    put({?MODULE, fileOut}, undefined),
    put({?MODULE, backupIndex}, 0),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

createLogFile() ->
        try
            put({'FileLog', logFile}, 'File':new(get({'FileLog', logPath}), get({'FileLog', fileName}))),
            case (not get({'FileLog', firstTime})) of
                true ->
                put({'FileLog', fileOut}, 'BufferedWriter':new('FileWriter':new(get({'FileLog', logFile}))));
                false ->
                put({'FileLog', firstTime}, false),
                RaFile = 'RandomAccessFile':new(get({'FileLog', logFile}), "rw"),
                (get({RaFile, '$class'})):seek(RaFile, (get({RaFile, '$class'})):length(RaFile)),
                put({'FileLog', fileOut}, 'BufferedWriter':new('FileWriter':new((get({RaFile, '$class'})):getFD(RaFile))))
            end,
            CanWrite = (get({get({'FileLog', logFile}), '$class'})):canWrite(get({'FileLog', logFile})),
            CanWrite
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~ts~n", [allbinary_java:to_string(lists:concat(["Error Creating Log: ", E]))]),
            false
        end.

createLogFileBackup() ->
        try
            StringMaker = 'StringMaker':new(),
            put({'FileLog', logFileBak}, 'File':new(get({'FileLog', logPath}), (fun(Target_N67085) -> (get({Target_N67085, '$class'})):toString(Target_N67085) end)((fun(Target_N67092) -> (get({Target_N67092, '$class'})):appendint(Target_N67092, get({'FileLog', backupIndex})) end)((fun(Target_N67099) -> (get({Target_N67099, '$class'})):append(Target_N67099, get({'CommonSeps':getInstance(), 'PERIOD'})) end)((get({StringMaker, '$class'})):append(StringMaker, get({'FileLog', backupFileName}))))))),
            (fun Loop() -> case (get({get({'FileLog', logFileBak}), '$class'})):isFile(get({'FileLog', logFileBak})) of true ->
                put({'FileLog', backupIndex}, get({'FileLog', backupIndex}) + 1),
                (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
                put({'FileLog', logFileBak}, 'File':new(get({'FileLog', logPath}), (fun(Target_N67298) -> (get({Target_N67298, '$class'})):toString(Target_N67298) end)((fun(Target_N67305) -> (get({Target_N67305, '$class'})):appendint(Target_N67305, get({'FileLog', backupIndex})) end)((fun(Target_N67312) -> (get({Target_N67312, '$class'})):append(Target_N67312, get({'CommonSeps':getInstance(), 'PERIOD'})) end)((get({StringMaker, '$class'})):append(StringMaker, get({'FileLog', backupFileName}))))))),
                Loop();
            false -> ok end end)(),
            put({local, line}, ""),
            TmpOut = 'BufferedWriter':new('FileWriter':new(get({'FileLog', logFileBak}))),
            TmpIn = 'BufferedReader':new('FileReader':new(get({'FileLog', logFile}))),
            (fun Loop() -> case ((begin put({local, line}, (get({TmpIn, '$class'})):readLine(TmpIn)), get({local, line}) end) =/= undefined) of true ->
                (get({TmpOut, '$class'})):write(TmpOut, get({local, line}), 0, string:length(get({local, line}))),
                (get({TmpOut, '$class'})):newLine(TmpOut),
                Loop();
            false -> ok end end)(),
            (get({TmpOut, '$class'})):flush(TmpOut),
            (get({TmpOut, '$class'})):close(TmpOut),
            (get({TmpIn, '$class'})):close(TmpIn),
            (get({get({'FileLog', logFile}), '$class'})):delete(get({'FileLog', logFile})),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~ts~n", [allbinary_java:to_string(lists:concat(["Error Creating Backup: ", E]))]),
            false
        end.

put(SpecialMessage, ClassName, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        'FileLog':put(SpecialMessage, ClassName, FunctionName, undefined);
put(SpecialMessage, AnyType, FunctionName) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        'FileLog':put(SpecialMessage, AnyType, FunctionName, undefined).

put(SpecialMessage, ClassName, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(ClassName) orelse ClassName =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, specialMessage}, SpecialMessage),
        put({local, functionName}, FunctionName),
        try
        try
            case (get({'FileLog', firstTime}) =:= true) of
                true ->
                'FileLog':createLogFileBackup(),
                case (createLogFile() =:= false) of
                    true ->
                    throw({'$return', allbinary_java:to_string("Log File Creation Error")});
                    false -> ok
                end;
                false -> ok
            end,
            Length = (get({get({'FileLog', logFile}), '$class'})):length(get({'FileLog', logFile})),
            case (Length > get({'FileLog', logLength})) of
                true ->
                case ((not (createLogFileBackup())) orelse (createLogFile() =:= false)) of
                    true ->
                    throw({'$return', allbinary_java:to_string("Couldn't Create a Backup file")});
                    false -> ok
                end;
                false -> ok
            end,
            case (get({local, functionName}) =:= undefined) of
                true ->
                put({local, functionName}, allbinary_java:to_string(get({get({'FileLog', stringUtil}), 'NULL_STRING'})));
                false -> ok
            end,
            case (get({local, specialMessage}) =:= undefined) of
                true ->
                put({local, specialMessage}, allbinary_java:to_string(get({get({'FileLog', stringUtil}), 'NULL_STRING'})));
                false -> ok
            end,
            Message = (fun(Target_N69700) -> (get({Target_N69700, '$class'})):get(Target_N69700, ClassName, get({local, functionName}), get({local, specialMessage}), Exception) end)('LogFormatUtil':getInstance()),
            (get({get({'FileLog', fileOut}), '$class'})):write(get({'FileLog', fileOut}), Message, 0, string:length(Message)),
            (get({get({'FileLog', fileOut}), '$class'})):newLine(get({'FileLog', fileOut})),
            (get({get({'FileLog', fileOut}), '$class'})):flush(get({'FileLog', fileOut})),
            allbinary_java:to_string(lists:concat([get({'FileLog', 'ORG_ALLBINARY'}), Message]))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            allbinary_java:to_string(lists:concat(["Error: ", E]))
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end;
put(SpecialMessage, AnyType, FunctionName, Exception) when (is_list(SpecialMessage) orelse SpecialMessage =:= undefined), (is_list(FunctionName) orelse FunctionName =:= undefined) ->
        put({local, specialMessage}, SpecialMessage),
        put({local, functionName}, FunctionName),
        try
        try
            case (get({'FileLog', firstTime}) =:= true) of
                true ->
                'FileLog':createLogFileBackup(),
                case (createLogFile() =:= false) of
                    true ->
                    throw({'$return', allbinary_java:to_string("Log File Creation Error")});
                    false -> ok
                end;
                false -> ok
            end,
            Length = (get({get({'FileLog', logFile}), '$class'})):length(get({'FileLog', logFile})),
            case (Length > get({'FileLog', logLength})) of
                true ->
                case ((not (createLogFileBackup())) orelse (createLogFile() =:= false)) of
                    true ->
                    throw({'$return', allbinary_java:to_string("Couldn't Create a Backup file")});
                    false -> ok
                end;
                false -> ok
            end,
            put({local, className}, allbinary_java:to_string(get({get({'FileLog', stringUtil}), 'NULL_STRING'}))),
            case (get({local, functionName}) =:= undefined) of
                true ->
                put({local, functionName}, allbinary_java:to_string(get({get({'FileLog', stringUtil}), 'NULL_STRING'})));
                false -> ok
            end,
            case (get({local, specialMessage}) =:= undefined) of
                true ->
                put({local, specialMessage}, allbinary_java:to_string(get({get({'FileLog', stringUtil}), 'NULL_STRING'})));
                false -> ok
            end,
            case (atom_to_list(get({AnyType, '$class'})) =/= undefined) of
                true ->
                put({local, className}, allbinary_java:to_string(atom_to_list(get({AnyType, '$class'}))));
                false -> ok
            end,
            Message = (fun(Target_N68675) -> (get({Target_N68675, '$class'})):get(Target_N68675, get({local, className}), get({local, functionName}), get({local, specialMessage}), Exception) end)('LogFormatUtil':getInstance()),
            (get({get({'FileLog', fileOut}), '$class'})):write(get({'FileLog', fileOut}), Message, 0, string:length(Message)),
            (get({get({'FileLog', fileOut}), '$class'})):newLine(get({'FileLog', fileOut})),
            (get({get({'FileLog', fileOut}), '$class'})):flush(get({'FileLog', fileOut})),
            allbinary_java:to_string(lists:concat([get({'FileLog', 'ORG_ALLBINARY'}), Message]))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            allbinary_java:to_string(lists:concat(["Error: ", E]))
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.



getFilePath() ->
        (get({'FileLog', logPath}) + get({'FileLog', fileName})).

