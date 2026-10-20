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
% package org.allbinary.logic.io.file.zip
% import java.util.zip.ZipEntry
% import java.util.zip.ZipInputStream
% import java.util.zip.ZipOutputStream
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.AbFileInputStream
% import org.allbinary.logic.io.AbFileOutputStream
% import org.allbinary.logic.io.DataOutputStreamFactory
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('ZipFileUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ZipFileUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ZipFileUtil', instance}).

create(This, OutFilename, FileBasicArrayList) when (is_list(OutFilename) orelse OutFilename =:= undefined) ->
        try
            ZipFile = 'AbFile':createAbFile(OutFilename),
            case (get({ZipFile, '$class'})):exists(ZipFile) of
                true ->
                (get({ZipFile, '$class'})):delete(ZipFile);
                false -> ok
            end,
            (get({ZipFile, '$class'})):createNewFile(ZipFile),
            OutputStream = 'ZipOutputStream':new('AbFileOutputStream':createFromAbFile(ZipFile)),
            StreamUtil = 'StreamUtil':getInstance(),
            StringBuffer = 'StringMaker':new(),
            ByteArray = array:new(16384, {default, 0}),
            put({local, fileInputStream}, undefined),
            Size = (get({FileBasicArrayList, '$class'})):size(FileBasicArrayList),
            put({local, current}, 0),
            lists:foreach(fun(I) ->
                File = (get({FileBasicArrayList, '$class'})):get(FileBasicArrayList, I),
                case (get({File, '$class'})):isDirectory(File) of
                    true ->
                    ok;
                    false ->
                    case (get({File, '$class'})):isFile(File) of
                    true ->
                    (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                    (get({StringBuffer, '$class'})):appendint(StringBuffer, get({local, current})),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " Creating Zip File Entry: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({File, '$class'})):getPath(File)),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "create()"),
                    try
                        put({local, fileInputStream}, 'AbFileInputStream':new(File)),
                        (get({OutputStream, '$class'})):putNextEntry(OutputStream, 'ZipEntry':new((get({File, '$class'})):getPath(File))),
                        (get({StreamUtil, '$class'})):get(StreamUtil, get({local, fileInputStream}), OutputStream, ByteArray),
                        (get({OutputStream, '$class'})):closeEntry(OutputStream),
                        (get({StreamUtil, '$class'})):close(StreamUtil, get({local, fileInputStream}))
                    catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Skipping File (Probably Local): ", (get({File, '$class'})):getPath(File)]), This, "create()")
                    end;
                    false -> ok
                end
                end,
                put({local, current}, get({local, current}) + 1)
            end, lists:seq(0, Size - 1)),
            (get({StreamUtil, '$class'})):close(StreamUtil, OutputStream)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "create", E)
        end.

% throws Exception
unzip(This, Path, ZipFile, FileName) when (is_list(Path) orelse Path =:= undefined), (is_list(FileName) orelse FileName =:= undefined) ->
        Buffer = array:new(16384, {default, 0}),
        put({local, inputStream}, undefined),
        try
            put({local, inputStream}, 'ZipInputStream':new('AbFileInputStream':new(ZipFile))),
            put({local, zipEntry}, undefined),
            StringBuffer = 'StringMaker':new(),
            FileUtil = 'FileUtil':getInstance(),
            (fun Loop() -> case ((begin put({local, zipEntry}, (get({get({local, inputStream}), '$class'})):getNextEntry(get({local, inputStream}))), get({local, zipEntry}) end) =/= undefined) of true ->
                EntryName = (get({get({local, zipEntry}), '$class'})):getName(get({local, zipEntry})),
                case (get({get({local, zipEntry}), '$class'})):isDirectory(get({local, zipEntry})) of
                    true ->
                    ok;
                    false ->
                    EntryFile = 'AbFile':createAbFile(lists:concat([Path, EntryName])),
                    (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "ZipEntry Name: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, EntryName),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " isFile: "),
                    (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({EntryFile, '$class'})):isFile(EntryFile)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " isDirectory: "),
                    (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({EntryFile, '$class'})):isDirectory(EntryFile)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, " getParent: "),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({EntryFile, '$class'})):getParent(EntryFile)),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "unzip"),
                    DataOutputStream = (fun(Target_N68370) -> (get({Target_N68370, '$class'})):getInstanceForAbFile(Target_N68370, EntryFile) end)('DataOutputStreamFactory':getInstance()),
                    (get({FileUtil, '$class'})):write(FileUtil, get({local, inputStream}), DataOutputStream, Buffer)
                end,
                (get({get({local, inputStream}), '$class'})):closeEntry(get({local, inputStream})),
                Loop();
            false -> ok end end)()
        after
            (fun(Target_N67648) -> (get({Target_N67648, '$class'})):close(Target_N67648, get({local, inputStream})) end)('StreamUtil':getInstance())
        end.

