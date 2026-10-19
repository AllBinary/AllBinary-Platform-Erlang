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
% import java.io.File
% import java.io.FileFilter
% import java.io.FilenameFilter
% import java.io.IOException
% import java.net.URI
% import org.allbinary.TsUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringUtil

-module('AbFile').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements AbFileInterface

static_init() ->
    put({?MODULE, 'NULL_FILE'}, 'AbFile':createAbFileFromRawPath(get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
    ok.

init_fields(This) ->
    put({This, file}, undefined),
    ok.


% throws Exception
createAbFileWithChild(File, ChildPathName) when (is_list(ChildPathName) orelse ChildPathName =:= undefined) ->
        'AbFile':new('File':new((get({File, '$class'})):getFile(File), ChildPathName)).

% throws Exception
createAbFile(FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        'AbFile':new('File':new((fun(Target_N66042) -> (get({Target_N66042, '$class'})):toFileSystemString(Target_N66042) end)('AbPath':new(FilePath, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))))).

% throws Exception
createAbFilePathAndName(FilePath, FileName) when (is_list(FilePath) orelse FilePath =:= undefined), (is_list(FileName) orelse FileName =:= undefined) ->
        'AbFile':new('File':new((fun(Target_N66196) -> (get({Target_N66196, '$class'})):toFileSystemString(Target_N66196) end)('AbPath':new(FilePath, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))), FileName)).

createAbFileFromAbPath(AbPath) ->
        'AbFile':new('File':new((get({AbPath, '$class'})):toFileSystemString(AbPath))).

createAbFileFromRawPath(FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        'AbFile':new('File':new(FilePath)).

new(File) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, File),
    This.

init(This, File) ->
    init_fields(This),
        put({This, file}, File).

getFile(This) ->
        get({This, file}).

getName(This) ->
        (get({get({This, file}), '$class'})):getName(get({This, file})).

getParent(This) ->
        (get({get({This, file}), '$class'})):getParent(get({This, file})).

getParentFile(This) ->
        (get({get({This, file}), '$class'})):getParentFile(get({This, file})).

getPath(This) ->
        (get({get({This, file}), '$class'})):getPath(get({This, file})).

isAbsolute(This) ->
        (get({get({This, file}), '$class'})):isAbsolute(get({This, file})).

getAbsolutePath(This) ->
        (get({get({This, file}), '$class'})):getAbsolutePath(get({This, file})).

getAbsoluteFile(This) ->
        (get({get({This, file}), '$class'})):getAbsoluteFile(get({This, file})).

% throws IOException
getCanonicalPath(This) ->
        (get({get({This, file}), '$class'})):getCanonicalPath(get({This, file})).

% throws IOException
getCanonicalFile(This) ->
        (get({get({This, file}), '$class'})):getCanonicalFile(get({This, file})).

toURI(This) ->
        (get({get({This, file}), '$class'})):toURI(get({This, file})).

canRead(This) ->
        (get({get({This, file}), '$class'})):canRead(get({This, file})).

canWrite(This) ->
        (get({get({This, file}), '$class'})):canWrite(get({This, file})).

exists(This) ->
        (get({get({This, file}), '$class'})):exists(get({This, file})).

isDirectory(This) ->
        (get({get({This, file}), '$class'})):isDirectory(get({This, file})).

isFile(This) ->
        (get({get({This, file}), '$class'})):isFile(get({This, file})).

isHidden(This) ->
        (get({get({This, file}), '$class'})):isHidden(get({This, file})).

lastModified(This) ->
        (get({get({This, file}), '$class'})):lastModified(get({This, file})).

length(This) ->
        (get({get({This, file}), '$class'})):length(get({This, file})).

% throws IOException
createNewFile(This) ->
        (get({get({This, file}), '$class'})):createNewFile(get({This, file})).

% throws IOException
delete(This) ->
        (get({get({This, file}), '$class'})):delete(get({This, file})).

deleteOnExit(This) ->
        (get({get({This, file}), '$class'})):deleteOnExit(get({This, file})).

list(This) ->
        (get({get({This, file}), '$class'})):list(get({This, file})).

listWithFilter(This, Filter) ->
        (get({get({This, file}), '$class'})):list(get({This, file}), Filter).

listFiles(This) ->
        (get({get({This, file}), '$class'})):listFiles(get({This, file})).

listFilesFileNameFilter(This, Filter) ->
        (get({get({This, file}), '$class'})):listFiles(get({This, file}), Filter).

listFilesFileFilter(This, Filter) ->
        (get({get({This, file}), '$class'})):listFiles(get({This, file}), Filter).

mkdir(This) ->
        (get({get({This, file}), '$class'})):mkdir(get({This, file})).

mkdirs(This) ->
        (get({get({This, file}), '$class'})):mkdirs(get({This, file})).

renameTo(This, Dest) ->
        (get({get({This, file}), '$class'})):renameTo(get({This, file}), (get({Dest, '$class'})):getFile(Dest)).

setLastModified(This, Time) when is_integer(Time) ->
        (get({get({This, file}), '$class'})):setLastModified(get({This, file}), Time).

setReadOnly(This) ->
        (get({get({This, file}), '$class'})):setReadOnly(get({This, file})).

compareTo(This, Pathname) ->
        (get({get({This, file}), '$class'})):compareTo(get({This, file}), Pathname).

equals(This, Obj) ->
        (fun(Target_N68945) -> (get({Target_N68945, '$class'})):equalsNotstring(Target_N68945, get({This, file}), Obj) end)('TsUtil':getInstance()).

hashCode(This) ->
        (get({get({This, file}), '$class'})):hashCode(get({This, file})).

toString(This) ->
        (get({get({This, file}), '$class'})):toString(get({This, file})).

