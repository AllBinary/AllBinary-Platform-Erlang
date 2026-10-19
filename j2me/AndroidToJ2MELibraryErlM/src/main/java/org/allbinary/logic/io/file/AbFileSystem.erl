% 
% AllBinary Open License Version 1 
% Copyright (c) 2026 AllBinary 
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
% import java.io.File
% import java.io.FileInputStream
% import java.io.InputStream
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('AbFileSystem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbFileSystem':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'AbFileSystem', instance}).

isDirectoryOrFile(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        File = 'File':new(Path),
        ((get({File, '$class'})):isDirectory(File) orelse (get({File, '$class'})):isFile(File)).

isDirectory(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        (fun(Target_N66133) -> (get({Target_N66133, '$class'})):isDirectory(Target_N66133) end)('File':new(Path)).

getFilesAsStringArrayForPath(This, CurrentDirPath) when (is_list(CurrentDirPath) orelse CurrentDirPath =:= undefined) ->
        try
        File = 'File':new(CurrentDirPath),
        case (get({File, '$class'})):exists(File) of
            true ->
            throw({'$return', (get({File, '$class'})):list(File)});
            false ->
            throw({'$return', (fun(Target_N66302) -> (get({Target_N66302, '$class'})):getArrayInstance(Target_N66302) end)('StringUtil':getInstance())})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

readAsString(This, FileName) when (is_list(FileName) orelse FileName =:= undefined) ->
        Bytes = array:new(1000000, {default, 0}),
        (get({This, '$class'})):readAsString(This, FileName, Bytes).

readAsString(This, FileName, Bytes) when (is_list(FileName) orelse FileName =:= undefined), (is_tuple(Bytes) orelse Bytes =:= undefined) ->
        try
        put({local, closeable}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
        try
            IdFile = 'FileInputStream':new(FileName),
            put({local, closeable}, IdFile),
            Size = (get({IdFile, '$class'})):read(IdFile, Bytes),
            case (Size > 0) of
                true ->
                throw({'$return', allbinary_java:to_string(Bytes, 0, Size)});
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "readAsString", E)
        after
            (get({This, '$class'})):close(This, get({local, closeable}))
        end,
        get({'StringUtil':getInstance(), 'EMPTY_STRING'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

close(This, Closeable) ->
        try
            case (Closeable =/= undefined) of
                true ->
                InputStream = (Closeable),
                (get({InputStream, '$class'})):close(InputStream);
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CLOSE'}), E),
            false
        end.

