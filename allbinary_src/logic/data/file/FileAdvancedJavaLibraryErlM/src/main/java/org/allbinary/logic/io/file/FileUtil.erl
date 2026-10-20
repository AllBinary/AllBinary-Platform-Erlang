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
% package org.allbinary.logic.io.file
% import java.io.InputStream
% import java.io.OutputStream
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.AbFileInputStream
% import org.allbinary.logic.io.AbFileLocalInputStream
% import org.allbinary.logic.io.AbIOSystem
% import org.allbinary.logic.io.DataOutputStreamFactory
% import org.allbinary.logic.io.FileStreamFactory
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('FileUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FileUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, directory}, 'Directory':getInstance()),
    put({This, logConfigTypeFactory}, 'LogConfigTypeFactory':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, streamUtil}, 'StreamUtil':getInstance()),
    put({This, 'WRITE_LABEL'}, "Write file: "),
    put({This, 'DATA_LABEL'}, " data: "),
    put({This, 'WRITE_METHOD'}, "write"),
    ok.


getInstance() ->
        get({'FileUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
write(This, FilePath, String) when (is_list(FilePath) orelse FilePath =:= undefined), (is_list(String) orelse String =:= undefined) ->
        put({local, dataOutputStream}, undefined),
        try
            'PreLogUtil':put((fun(Target_N81785) -> (get({Target_N81785, '$class'})):toString(Target_N81785) end)((fun(Target_N81792) -> (get({Target_N81792, '$class'})):append(Target_N81792, String) end)((fun(Target_N81799) -> (get({Target_N81799, '$class'})):append(Target_N81799, get({This, 'DATA_LABEL'})) end)((fun(Target_N81806) -> (get({Target_N81806, '$class'})):append(Target_N81806, FilePath) end)((fun(Target_N81813) -> (get({Target_N81813, '$class'})):append(Target_N81813, get({This, 'WRITE_LABEL'})) end)('StringMaker':new()))))), This, get({This, 'WRITE_METHOD'})),
            FileInputStreamFactory = 'FileStreamFactory':getInstance(),
            FileOutputStream = (get({FileInputStreamFactory, '$class'})):getFileOutputStreamInstance(FileInputStreamFactory, get({'StringUtil':getInstance(), 'EMPTY_STRING'}), FilePath),
            put({local, dataOutputStream}, 'AbDataOutputStream':new(FileOutputStream)),
            (get({get({local, dataOutputStream}), '$class'})):write(get({local, dataOutputStream}), (get({String, '$class'})):getBytes(String), 0, string:length(String)),
            (get({get({local, dataOutputStream}), '$class'})):flush(get({local, dataOutputStream}))
        after
            (fun(Target_N81722) -> (get({Target_N81722, '$class'})):close(Target_N81722, get({local, dataOutputStream})) end)('StreamUtil':getInstance())
        end;
% throws Exception
write(This, InputStream, File) ->
        DataOutputStream = (fun(Target_N66622) -> (get({Target_N66622, '$class'})):getInstanceForAbFile(Target_N66622, File) end)('DataOutputStreamFactory':getInstance()),
        (get({This, '$class'})):write(This, InputStream, DataOutputStream);
% throws Exception
write(This, InputStream, DataOutputStream) ->
        put({local, dataOutputStream}, DataOutputStream),
        try
            put({local, dataOutputStream}, (fun(Target_N66856) -> (get({Target_N66856, '$class'})):get(Target_N66856, InputStream, get({local, dataOutputStream}), array:new(16384, {default, 0})) end)('StreamUtil':getInstance())),
            (get({get({local, dataOutputStream}), '$class'})):flush(get({local, dataOutputStream}))
        after
            (fun(Target_N66795) -> (get({Target_N66795, '$class'})):close(Target_N66795, get({local, dataOutputStream})) end)('StreamUtil':getInstance())
        end.


% throws Exception
write(This, InputStream, DataOutputStream, Buffer) when (is_tuple(Buffer) orelse Buffer =:= undefined) ->
        put({local, dataOutputStream}, DataOutputStream),
        try
            put({local, dataOutputStream}, (fun(Target_N67097) -> (get({Target_N67097, '$class'})):get(Target_N67097, InputStream, get({local, dataOutputStream}), Buffer) end)('StreamUtil':getInstance())),
            (get({get({local, dataOutputStream}), '$class'})):flush(get({local, dataOutputStream}))
        after
            (fun(Target_N67036) -> (get({Target_N67036, '$class'})):close(Target_N67036, get({local, dataOutputStream})) end)('StreamUtil':getInstance())
        end.

% throws Exception
copy(This, DataInputStream, DataOutputStream) ->
        put({local, dataOutputStream}, DataOutputStream),
        try
            put({local, dataOutputStream}, (fun(Target_N67384) -> (get({Target_N67384, '$class'})):get(Target_N67384, DataInputStream, get({local, dataOutputStream}), array:new(16384, {default, 0})) end)('StreamUtil':getInstance())),
            (get({get({local, dataOutputStream}), '$class'})):flush(get({local, dataOutputStream}))
        after
            (fun(Target_N67284) -> (get({Target_N67284, '$class'})):close(Target_N67284, get({local, dataOutputStream})) end)('StreamUtil':getInstance()),
            (fun(Target_N67323) -> (get({Target_N67323, '$class'})):close(Target_N67323, DataInputStream) end)('StreamUtil':getInstance())
        end;
% throws Exception
copy(This, FromAbPath, To) ->
        COPY = "copy",
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Copying AbPaths from: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({FromAbPath, '$class'})):toString(FromAbPath)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({To, '$class'})):toString(To)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), COPY);
                false -> ok
            end,
            case (FromAbPath =:= undefined) of
                true ->
                erlang:error({'Exception', "Cannot Copy From A Null Location"});
                false -> ok
            end,
            case (To =:= undefined) of
                true ->
                erlang:error({'Exception', "Cannot Copy To A Null Location"});
                false -> ok
            end,
            FromLocationFile = 'AbFile':createAbFileFromAbPath(FromAbPath),
            ToLocationFile = 'AbFile':createAbFileFromAbPath(To),
            case (get({FromLocationFile, '$class'})):isFile(FromLocationFile) of
                true ->
                case (get({ToLocationFile, '$class'})):isDirectory(ToLocationFile) of
                    true ->
                    put({local, file}, 'AbFile':createAbFileWithChild(ToLocationFile, (get({FromLocationFile, '$class'})):getName(FromLocationFile))),
                    (get({This, '$class'})):copyFile(This, FromLocationFile, get({local, file})),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                        true ->
                        put({local, stringBuffer}, 'StringMaker':new()),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Copied file="),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({FromLocationFile, '$class'})):getName(FromLocationFile)),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " from: "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({FromLocationFile, '$class'})):getPath(FromLocationFile)),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to: "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({ToLocationFile, '$class'})):getPath(ToLocationFile)),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), COPY);
                        false -> ok
                    end;
                    false ->
                    (get({This, '$class'})):copyFile(This, FromLocationFile, ToLocationFile),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                        true ->
                        put({local, stringBuffer}, 'StringMaker':new()),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Copied file with new name "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " from: "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({FromLocationFile, '$class'})):getPath(FromLocationFile)),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to: "),
                        (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({ToLocationFile, '$class'})):getPath(ToLocationFile)),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), COPY);
                        false -> ok
                    end
                end;
                false ->
                case ((get({FromLocationFile, '$class'})):isDirectory(FromLocationFile) andalso (get({ToLocationFile, '$class'})):isDirectory(ToLocationFile)) of
                true ->
                case ((fun(Target_N78543) -> (get({Target_N78543, '$class'})):charAt(Target_N78543, ((fun(Target_N78572) -> (get({Target_N78572, '$class'})):length(Target_N78572) end)((get({FromAbPath, '$class'})):toFileSystemString(FromAbPath)) - 1)) end)((get({FromAbPath, '$class'})):toFileSystemString(FromAbPath)) =:= get({get({get({'java', io}), 'File'}), separatorChar})) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Copying subdirectories", getInstance(), COPY);
                        false -> ok
                    end,
                    FileArray = 'FileWrapperUtil':wrapFiles((get({FromLocationFile, '$class'})):listFiles(FromLocationFile)),
                    lists:foreach(fun(Index) ->
                        put({local, file}, array:get(Index, FileArray)),
                        case (get({get({local, file}), '$class'})):isFile(get({local, file})) of
                            true ->
                            AFile = 'AbFile':createAbFileWithChild(ToLocationFile, (get({get({local, file}), '$class'})):getName(get({local, file}))),
                            (get({This, '$class'})):copyFile(This, get({local, file}), AFile);
                            false ->
                            case (get({get({local, file}), '$class'})):isDirectory(get({local, file})) of
                            true ->
                            (get({This, '$class'})):copyDirectory(This, get({local, file}), ToLocationFile);
                            false ->
                            erlang:error({'Exception', "File Copy Error"})
                        end
                        end
                    end, lists:seq(0, array:size(FileArray) - 1)),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Copied subdirectories", getInstance(), COPY);
                        false -> ok
                    end;
                    false ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Copyinhg directory", getInstance(), COPY);
                        false -> ok
                    end,
                    (get({This, '$class'})):copyDirectory(This, FromLocationFile, ToLocationFile),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Copied directory", getInstance(), COPY);
                        false -> ok
                    end
                end;
                false -> ok
            end
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILEERROR'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Error Copying fromAbPath: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({FromAbPath, '$class'})):toString(FromAbPath)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({To, '$class'})):toString(To)),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), COPY, E);
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
fixPath(This, File, Path, RealPath, Cloud) when (is_list(Cloud) orelse Cloud =:= undefined) ->
        BeginIndex = ((fun(Target_N67568) -> (get({Target_N67568, '$class'})):indexOf(Target_N67568, Cloud) end)((get({File, '$class'})):getPath(File)) + string:length(Cloud)),
        EndIndex = (fun(Target_N67643) -> (get({Target_N67643, '$class'})):indexOf(Target_N67643, (get({File, '$class'})):getName(File)) end)((get({File, '$class'})):getPath(File)),
        FixedPathString = lists:concat([(get({RealPath, '$class'})):toFileSystemString(RealPath), (fun(Target_N67733) -> (get({Target_N67733, '$class'})):substring(Target_N67733, BeginIndex, EndIndex) end)((get({File, '$class'})):getPath(File))]),
        FixedPath = 'AbPath':new(FixedPathString, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        (get({get({This, directory}), '$class'})):create(get({This, directory}), FixedPath),
        String = (get({FixedPath, '$class'})):toFileSystemString(FixedPath),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), String, This, "fixPath");
            false -> ok
        end,
        OutPath = 'AbPath':new(String, (get({File, '$class'})):getName(File)),
        OutPath.

% throws Exception
copyToCloud(This, File, OutFile, OverwriteNewer, OverwriteAll) when is_boolean(OverwriteNewer), is_boolean(OverwriteAll) ->
        try
        try
            put({local, stringBuffer}, 'StringMaker':new()),
            case (not (get({This, '$class'})):copyPrepare(This, File, OutFile, OverwriteNewer, OverwriteAll)) of
                true ->
                throw({'$return', ok});
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                    true ->
                    (get({get({local, stringBuffer}), '$class'})):delete(get({local, stringBuffer}), 0, (get({get({local, stringBuffer}), '$class'})):length(get({local, stringBuffer}))),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Out File: "),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({OutFile, '$class'})):getPath(OutFile)),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " In File: "),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({File, '$class'})):getPath(File)),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to cloud."),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), "copyToCloud");
                    false -> ok
                end
            end,
            DataOutputStream = (fun(Target_N70294) -> (get({Target_N70294, '$class'})):getInstanceForAbFile(Target_N70294, OutFile) end)('DataOutputStreamFactory':getInstance()),
            FileInputStream = 'AbFileLocalInputStream':new(File),
            (get({This, '$class'})):copy(This, FileInputStream, DataOutputStream)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILEERROR'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Error Copying File File: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({File, '$class'})):toString(File)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to cloud."),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), "copyToCloud", E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end;
% throws Exception
copyToCloud(This, File, Path, RealPath, Cloud) when (is_list(Cloud) orelse Cloud =:= undefined) ->
        (get({This, '$class'})):copyToCloud(This, File, Path, RealPath, Cloud, false, false).

% throws Exception
copyToCloud(This, File, Path, RealPath, Cloud, OverwriteNewer, OverwriteAll) when (is_list(Cloud) orelse Cloud =:= undefined), is_boolean(OverwriteNewer), is_boolean(OverwriteAll) ->
        try
        try
            OutPath = (get({This, '$class'})):fixPath(This, File, Path, RealPath, Cloud),
            OutFile = 'AbFile':createAbFileFromAbPath(OutPath),
            case (not (get({This, '$class'})):copyPrepare(This, File, OutFile, OverwriteNewer, OverwriteAll)) of
                true ->
                throw({'$return', ok});
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                    true ->
                    put({local, stringBuffer}, 'StringMaker':new()),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Out File: "),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({OutFile, '$class'})):getPath(OutFile)),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " In File: "),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({File, '$class'})):getPath(File)),
                    (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to cloud."),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), "copyToCloud");
                    false -> ok
                end
            end,
            DataOutputStream = (fun(Target_N69051) -> (get({Target_N69051, '$class'})):getInstanceForAbFile(Target_N69051, OutFile) end)('DataOutputStreamFactory':getInstance()),
            FileInputStream = 'AbFileLocalInputStream':new(File),
            (get({This, '$class'})):copy(This, FileInputStream, DataOutputStream)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILEERROR'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Error Copying File File: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({File, '$class'})):toString(File)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to cloud."),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), "copyToCloud", E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
copyToCloud(This, File, OutFile) ->
        (get({This, '$class'})):copyToCloud(This, File, OutFile, false, false).


% throws Exception
copyPrepare(This, FromFile, ToFile, OverwriteNewer, OverwriteAll) when is_boolean(OverwriteNewer), is_boolean(OverwriteAll) ->
        try
        case (get({ToFile, '$class'})):exists(ToFile) of
            true ->
            StringBuffer = 'StringMaker':new(),
            case OverwriteAll of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                    true ->
                    (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Overwriting File: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({ToFile, '$class'})):getPath(ToFile)),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), getInstance(), "copyFile");
                    false -> ok
                end,
                (get({ToFile, '$class'})):delete(ToFile),
                (get({ToFile, '$class'})):createNewFile(ToFile);
                false ->
                case (((get({ToFile, '$class'})):lastModified(ToFile) < (get({FromFile, '$class'})):lastModified(FromFile)) andalso OverwriteNewer) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                    true ->
                    (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Newer by: "),
                    (get({StringBuffer, '$class'})):appendlong(StringBuffer, trunc(((get({FromFile, '$class'})):lastModified(FromFile) - (get({ToFile, '$class'})):lastModified(ToFile)))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "ms "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "Copying File: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({ToFile, '$class'})):getPath(ToFile)),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), getInstance(), "copyFile");
                    false -> ok
                end,
                (get({ToFile, '$class'})):delete(ToFile),
                (get({ToFile, '$class'})):createNewFile(ToFile);
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                    true ->
                    (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "File Already Exists"),
                    case OverwriteNewer of
                        true ->
                        (get({StringBuffer, '$class'})):append(StringBuffer, " And Is Not Older");
                        false ->
                        (get({StringBuffer, '$class'})):append(StringBuffer, " And Not A In Overwrite Mode")
                    end,
                    (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'COLON_SEP'})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({ToFile, '$class'})):getPath(ToFile)),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), getInstance(), "copyFile");
                    false -> ok
                end,
                throw({'$return', false})
            end
            end;
            false ->
            (get({ToFile, '$class'})):createNewFile(ToFile)
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
copyFile(This, FromFile, ToFile) ->
        (get({This, '$class'})):copyFile(This, FromFile, ToFile, false, false).

% throws Exception
copyFile(This, FromFile, ToFile, OverwriteNewer, OverwriteAll) when is_boolean(OverwriteNewer), is_boolean(OverwriteAll) ->
        try
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Copying "),
                (get({get({local, stringBuffer}), '$class'})):appendlong(get({local, stringBuffer}), (get({FromFile, '$class'})):length(FromFile)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " bytes from File: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({FromFile, '$class'})):getPath(FromFile)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({ToFile, '$class'})):getPath(ToFile)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), "copyFile");
                false -> ok
            end,
            case (not (get({This, '$class'})):copyPrepare(This, FromFile, ToFile, OverwriteNewer, OverwriteAll)) of
                true ->
                throw({'$return', ok});
                false -> ok
            end,
            DataOutputStream = (fun(Target_N72945) -> (get({Target_N72945, '$class'})):getInstanceForAbFile(Target_N72945, ToFile) end)('DataOutputStreamFactory':getInstance()),
            FileInputStream = 'AbFileInputStream':new(FromFile),
            (get({This, '$class'})):copy(This, FileInputStream, DataOutputStream)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILEERROR'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Error Copying File fromFile: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({FromFile, '$class'})):toString(FromFile)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({ToFile, '$class'})):toString(ToFile)),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), "copyFile", E);
                false -> ok
            end,
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getNewDirectory(FromFile) ->
        put({local, newDirectory}, (get({FromFile, '$class'})):getPath(FromFile)),
        put({local, separatorChar}, get({'FilePathData':getInstance(), 'PATH_START'})),
        case (fun(Target_N73672) -> (get({Target_N73672, '$class'})):isType(Target_N73672, "com.vobject.appengine.java.io") end)('AbIOSystem':getInstance()) of
            true ->
            put({local, separatorChar}, get({'AbPathData':getInstance(), 'SEPARATOR'}));
            false -> ok
        end,
        put({local, lastIndex}, (get({get({local, newDirectory}), '$class'})):lastIndexOf(get({local, newDirectory}), get({local, separatorChar}))),
        case (get({local, lastIndex}) >= string:length(get({local, newDirectory}))) of
            true ->
            put({local, newDirectory}, string:slice(get({local, newDirectory}), 0, ((string:length(get({local, newDirectory})) - 1)) - (0))),
            put({local, lastIndex}, (get({get({local, newDirectory}), '$class'})):lastIndexOf(get({local, newDirectory}), get({local, separatorChar})));
            false -> ok
        end,
        string:slice(get({local, newDirectory}), get({local, lastIndex}), (string:length(get({local, newDirectory}))) - (get({local, lastIndex}))).

% throws Exception
copyDirectoryPortion(This, FromDirectoryAbPath, ToDirectoryAbPath, OverwriteNewer, OverwriteAll, Current, Total) when is_boolean(OverwriteNewer), is_boolean(OverwriteAll), is_integer(Current), is_integer(Total) ->
        File = 'AbFile':createAbFileFromAbPath(FromDirectoryAbPath),
        case (not (get({File, '$class'})):isDirectory(File)) of
            true ->
            erlang:error({'Exception', lists:concat(["Not a directory: ", (get({File, '$class'})):getPath(File)])});
            false -> ok
        end,
        FileList = (get({get({This, directory}), '$class'})):search(get({This, directory}), File, true),
        Size = (get({FileList, '$class'})):size(FileList),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Searched: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({File, '$class'})):getPath(File)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Total: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Size),
        Portion = ((Size div Total) + 1),
        Start = (Portion * Current),
        put({local, 'end'}, (Start + Portion)),
        case (get({local, 'end'}) > Size) of
            true ->
            put({local, 'end'}, Size);
            false -> ok
        end,
        (get({StringBuffer, '$class'})):append(StringBuffer, " Section: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Start),
        (get({StringBuffer, '$class'})):append(StringBuffer, " - "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({local, 'end'})),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), getInstance(), "copySomeFilesToDirectory()");
            false -> ok
        end,
        put({local, nextFile}, undefined),
        lists:foreach(fun(Index) ->
            put({local, nextFile}, (get({FileList, '$class'})):get(FileList, Index)),
            case (get({get({local, nextFile}), '$class'})):isDirectory(get({local, nextFile})) of
                true ->
                ok;
                false ->
                Path = (fun(Target_N75109) -> (get({Target_N75109, '$class'})):getPath(Target_N75109) end)('AbPath':new((get({get({local, nextFile}), '$class'})):getPath(get({local, nextFile})), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
                put({local, beginIndex}, (fun(Target_N75199) -> (get({Target_N75199, '$class'})):length(Target_N75199) end)((get({FromDirectoryAbPath, '$class'})):getPath(FromDirectoryAbPath))),
                case ((get({Path, '$class'})):indexOf(Path, (get({get({'FileUtil', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'FileUtil', 'URLGLOBALS'}))) < 0) of
                    true ->
                    put({local, beginIndex}, (get({local, beginIndex}) - (fun(Target_N75306) -> (get({Target_N75306, '$class'})):length(Target_N75306) end)((fun(Target_N75313) -> (get({Target_N75313, '$class'})):getPath(Target_N75313) end)('AbPath':new((get({get({'FileUtil', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'FileUtil', 'URLGLOBALS'})), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))))));
                    false -> ok
                end,
                NewPath = lists:concat([(get({ToDirectoryAbPath, '$class'})):toFileSystemString(ToDirectoryAbPath), (get({Path, '$class'})):substring(Path, get({local, beginIndex}))]),
                ToFile = 'AbFile':createAbFileFromAbPath('AbPath':new(NewPath, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
                (get({This, '$class'})):copyFile(This, get({local, nextFile}), ToFile, OverwriteNewer, OverwriteAll)
            end
        end, lists:seq(Start, get({local, 'end'}) - 1)).

% throws Exception
copyDirectory(This, FromFile, To) ->
        try
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Copying Directory from: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({FromFile, '$class'})):getPath(FromFile)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({To, '$class'})):getPath(To)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), "copyDirectory");
                false -> ok
            end,
            NewDirectory = 'FileUtil':getNewDirectory(FromFile),
            NewDirectoryAbPath = 'AbPath':new(lists:concat([((get({To, '$class'})):getPath(To) + get({'AbPathData':getInstance(), 'SEPARATOR'})), NewDirectory]), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            case (not (get({get({This, directory}), '$class'})):create(get({This, directory}), NewDirectoryAbPath)) of
                true ->
                erlang:error({'Exception', lists:concat(["Failed to create directory: ", NewDirectoryAbPath])});
                false -> ok
            end,
            FileArray = 'FileWrapperUtil':wrapFiles((get({FromFile, '$class'})):listFiles(FromFile)),
            Size = array:size(FileArray),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILE'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Copying "),
                (get({get({local, stringBuffer}), '$class'})):appendint(get({local, stringBuffer}), Size),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " files from: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({FromFile, '$class'})):getPath(FromFile)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({To, '$class'})):getPath(To)),
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), "copyDirectory");
                false -> ok
            end,
            put({local, file}, undefined),
            lists:foreach(fun(Index) ->
                put({local, file}, array:get(Index, FileArray)),
                case (get({get({local, file}), '$class'})):isFile(get({local, file})) of
                    true ->
                    (get({This, '$class'})):copyFile(This, get({local, file}), 'AbFile':createAbFilePathAndName((get({NewDirectoryAbPath, '$class'})):toString(NewDirectoryAbPath), (get({get({local, file}), '$class'})):getName(get({local, file}))));
                    false ->
                    case (get({get({local, file}), '$class'})):isDirectory(get({local, file})) of
                    true ->
                    (get({This, '$class'})):copyDirectory(This, get({local, file}), 'AbFile':createAbFileFromAbPath(NewDirectoryAbPath));
                    false ->
                    erlang:error({'Exception', "File Copy Error"})
                end
                end
            end, lists:seq(0, Size - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({get({This, logConfigTypeFactory}), 'FILEERROR'})) of
                true ->
                put({local, stringBuffer}, 'StringMaker':new()),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), "Error Copying Directory fromFile: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({FromFile, '$class'})):toString(FromFile)),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), " to: "),
                (get({get({local, stringBuffer}), '$class'})):append(get({local, stringBuffer}), (get({To, '$class'})):toString(To)),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), (get({get({local, stringBuffer}), '$class'})):toString(get({local, stringBuffer})), getInstance(), "copyDirectory", E);
                false -> ok
            end,
            erlang:error(E)
        end.


shouldSkip(This, File, SkipFiles) when (is_tuple(SkipFiles) orelse SkipFiles =:= undefined) ->
        try
        Size = array:size(SkipFiles),
        put({local, skipFile}, undefined),
        lists:foreach(fun(Index) ->
            put({local, skipFile}, array:get(Index, SkipFiles)),
            case ((fun(Target_N81351) -> (get({Target_N81351, '$class'})):compareTo(Target_N81351, get({local, skipFile})) end)((get({File, '$class'})):getPath(File)) =:= 0) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.


loadFileAsList(This, File, Max, ByteArray1) when is_integer(Max), (is_tuple(ByteArray1) orelse ByteArray1 =:= undefined) ->
        (fun(Target_N82255) -> (get({Target_N82255, '$class'})):loadFileAsList(Target_N82255, File, Max, ByteArray1) end)('FileUtil2':getInstance()).

