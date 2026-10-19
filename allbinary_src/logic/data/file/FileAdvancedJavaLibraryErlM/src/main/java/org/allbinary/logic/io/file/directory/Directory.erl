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
% package org.allbinary.logic.io.file.directory
% import java.io.FileFilter
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.FileFactory
% import org.allbinary.logic.io.file.FileWrapperUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('Directory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'Directory':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'Directory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

create(This, Directory) when (is_list(Directory) orelse Directory =:= undefined) ->
        try
        try
            DirectoryFile = (fun(Target_N66186) -> (get({Target_N66186, '$class'})):getInstance(Target_N66186, Directory) end)('FileFactory':getInstance()),
            case (not (get({DirectoryFile, '$class'})):isDirectory(DirectoryFile)) of
                true ->
                'PreLogUtil':put(lists:concat(["Creating Directories: ", Directory]), This, "create"),
                case (not (get({DirectoryFile, '$class'})):mkdirs(DirectoryFile)) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end;
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE(lists:concat(["Error Creating Directories: ", Directory]), This, "create", E),
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end;
create(This, DirectoryAbPath) ->
        (get({This, '$class'})):create(This, (get({DirectoryAbPath, '$class'})):toFileSystemString(DirectoryAbPath)).

% throws Exception
remove(This, ExistingDirectory) when (is_list(ExistingDirectory) orelse ExistingDirectory =:= undefined) ->
        ExistingDirectoryFile = (fun(Target_N66552) -> (get({Target_N66552, '$class'})):getInstance(Target_N66552, ExistingDirectory) end)('FileFactory':getInstance()),
        case (get({ExistingDirectoryFile, '$class'})):isDirectory(ExistingDirectoryFile) of
            true ->
            case (array:size((get({ExistingDirectoryFile, '$class'})):list(ExistingDirectoryFile)) > 0) of
                true ->
                erlang:error({'Exception', lists:concat([lists:concat(["Did not remove category: ", ExistingDirectory]), " because files exist"])});
                false ->
                case (get({ExistingDirectoryFile, '$class'})):delete(ExistingDirectoryFile) of
                true ->
                'PreLogUtil':put(lists:concat(["Successfully Removed: ", ExistingDirectory]), "Directory", "remove");
                false -> ok
            end
            end;
            false ->
            erlang:error({'Exception', lists:concat(["Category Directory Is Missing:", ExistingDirectory])})
        end;
% throws Exception
remove(This, ExistingDirectoryAbPath) ->
        (get({This, '$class'})):remove(This, (get({ExistingDirectoryAbPath, '$class'})):toFileSystemString(ExistingDirectoryAbPath)).



search(This, File, IsRecursiveSearch) when is_boolean(IsRecursiveSearch) ->
        try
        FileList = 'BasicArrayListD':new(),
        put({local, recursiveFileList}, undefined),
        case (get({File, '$class'})):isDirectory(File) of
            true ->
            FileArray = (get({File, '$class'})):listFiles(File),
            case (FileArray =:= undefined) of
                true ->
                throw({'$return', FileList});
                false -> ok
            end,
            Files = 'FileWrapperUtil':wrapFiles(FileArray),
            case (Files =:= undefined) of
                true ->
                throw({'$return', FileList});
                false -> ok
            end,
            lists:foreach(fun(Index) ->
                (get({FileList, '$class'})):add(FileList, array:get(Index, Files)),
                case IsRecursiveSearch of
                    true ->
                    put({local, recursiveFileList}, (get({This, '$class'})):search(This, array:get(Index, Files), IsRecursiveSearch)),
                    (get({FileList, '$class'})):addAllList(FileList, get({local, recursiveFileList}));
                    false -> ok
                end
            end, lists:seq(0, array:size(Files) - 1));
            false -> ok
        end,
        FileList
        catch throw:{'$return', ReturnValue} -> ReturnValue end;
search(This, SearchValue, File) when (is_list(SearchValue) orelse SearchValue =:= undefined) ->
        (get({This, '$class'})):search(This, SearchValue, File, false);
search(This, Level, File) when is_integer(Level) ->
        (get({This, '$class'})):search(This, Level, File, false);
search(This, FileFilter, File) ->
        (get({This, '$class'})):search(This, FileFilter, File, false).

search(This, SearchValue, File, IsRecursiveSearch) when (is_list(SearchValue) orelse SearchValue =:= undefined), is_boolean(IsRecursiveSearch) ->
        try
        FileList = 'BasicArrayListD':new(),
        put({local, recursiveFileList}, undefined),
        case (get({File, '$class'})):isDirectory(File) of
            true ->
            FileArray = (get({File, '$class'})):listFiles(File),
            case (FileArray =:= undefined) of
                true ->
                throw({'$return', FileList});
                false -> ok
            end,
            Files = 'FileWrapperUtil':wrapFiles(FileArray),
            case (Files =:= undefined) of
                true ->
                throw({'$return', FileList});
                false -> ok
            end,
            lists:foreach(fun(Index) ->
                case ((fun(Target_N68881) -> (get({Target_N68881, '$class'})):indexOf(Target_N68881, SearchValue) end)((fun(Target_N68888) -> (get({Target_N68888, '$class'})):getPath(Target_N68888) end)(array:get(Index, Files))) >= 0) of
                    true ->
                    (get({FileList, '$class'})):add(FileList, array:get(Index, Files));
                    false -> ok
                end,
                case IsRecursiveSearch of
                    true ->
                    put({local, recursiveFileList}, (get({This, '$class'})):search(This, SearchValue, array:get(Index, Files), IsRecursiveSearch)),
                    (get({FileList, '$class'})):addAllList(FileList, get({local, recursiveFileList}));
                    false -> ok
                end
            end, lists:seq(0, array:size(Files) - 1));
            false -> ok
        end,
        FileList
        catch throw:{'$return', ReturnValue} -> ReturnValue end;
search(This, Level, File, IsRecursiveSearch) when is_integer(Level), is_boolean(IsRecursiveSearch) ->
        try
        FileList = 'BasicArrayListD':new(),
        put({local, recursiveFileList}, undefined),
        case (get({File, '$class'})):isDirectory(File) of
            true ->
            FileArray = (get({File, '$class'})):listFiles(File),
            case (FileArray =:= undefined) of
                true ->
                throw({'$return', FileList});
                false -> ok
            end,
            Files = 'FileWrapperUtil':wrapFiles(FileArray),
            case (Files =:= undefined) of
                true ->
                throw({'$return', FileList});
                false -> ok
            end,
            lists:foreach(fun(Index) ->
                (get({FileList, '$class'})):add(FileList, array:get(Index, Files)),
                case (Level =< 0) of
                    true ->
                    throw({'$return', FileList});
                    false -> ok
                end,
                put({local, recursiveFileList}, (get({This, '$class'})):search(This, (Level - 1), array:get(Index, Files), IsRecursiveSearch)),
                (get({FileList, '$class'})):addAllList(FileList, get({local, recursiveFileList}))
            end, lists:seq(0, array:size(Files) - 1));
            false -> ok
        end,
        FileList
        catch throw:{'$return', ReturnValue} -> ReturnValue end;
search(This, FileFilter, File, IsRecursiveSearch) when is_boolean(IsRecursiveSearch) ->
        try
        FileList = 'BasicArrayListD':new(),
        put({local, recursiveFileList}, undefined),
        case (get({File, '$class'})):isDirectory(File) of
            true ->
            FileArray = (get({File, '$class'})):listFilesFileFilter(File, FileFilter),
            case (FileArray =:= undefined) of
                true ->
                throw({'$return', FileList});
                false -> ok
            end,
            Files = 'FileWrapperUtil':wrapFiles(FileArray),
            case (Files =:= undefined) of
                true ->
                throw({'$return', FileList});
                false -> ok
            end,
            Size = array:size(Files),
            lists:foreach(fun(Index) ->
                (get({FileList, '$class'})):add(FileList, array:get(Index, Files)),
                case IsRecursiveSearch of
                    true ->
                    put({local, recursiveFileList}, (get({This, '$class'})):search(This, FileFilter, array:get(Index, Files), IsRecursiveSearch)),
                    (get({FileList, '$class'})):addAllList(FileList, get({local, recursiveFileList}));
                    false -> ok
                end
            end, lists:seq(0, Size - 1));
            false -> ok
        end,
        FileList
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

search(This, File) ->
        (get({This, '$class'})):search(This, File, false).






