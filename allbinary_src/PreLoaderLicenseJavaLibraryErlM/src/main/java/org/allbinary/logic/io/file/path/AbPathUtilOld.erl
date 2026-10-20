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
% package org.allbinary.logic.io.file.path
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.FilePathData
% import org.allbinary.logic.io.path.AbFilePath
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil

-module('AbPathUtilOld').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbPathUtilOld':new()),
    put({?MODULE, 'MIN'}, 4),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abPathData}, 'AbPathData':getInstance()),
    put({This, filePathData}, 'FilePathData':getInstance()),
    ok.


getInstance() ->
        get({'AbPathUtilOld', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getExtension(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        case (string:length(FilePath) < get({'AbPathUtilOld', 'MIN'})) of
            true ->
            erlang:error({'Exception', "Could not be a file path since its less that 4 characters"});
            false -> ok
        end,
        BeginIndex = (string:length(FilePath) - get({'AbPathUtilOld', 'MIN'})),
        Extension = string:slice(FilePath, (BeginIndex + 1)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["FileExtension: ", Extension]), This, "getExtension()");
            false -> ok
        end,
        Extension;
% throws Exception
getExtension(This, AbFilePath) ->
        (get({This, '$class'})):getExtension(This, (get({AbFilePath, '$class'})):toString(AbFilePath));
% throws Exception
getExtension(This, AbPath) ->
        (get({This, '$class'})):getExtension(This, (get({AbPath, '$class'})):toString(AbPath)).



% throws Exception
getWithoutExtension(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        case (string:length(FilePath) < get({'AbPathUtilOld', 'MIN'})) of
            true ->
            erlang:error({'Exception', "Could not be a file path since its less that 4 characters"});
            false -> ok
        end,
        EndIndex = (string:length(FilePath) - get({'AbPathUtilOld', 'MIN'})),
        PathWithoutExtension = string:slice(FilePath, 0, (EndIndex) - (0)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["FileWithoutExtension: ", PathWithoutExtension]), This, "getWithoutExtension()");
            false -> ok
        end,
        PathWithoutExtension;
% throws Exception
getWithoutExtension(This, AbFilePath) ->
        (get({This, '$class'})):getWithoutExtension(This, (get({AbFilePath, '$class'})):toString(AbFilePath));
% throws Exception
getWithoutExtension(This, AbPath) ->
        (get({This, '$class'})):getWithoutExtension(This, (get({AbPath, '$class'})):toString(AbPath)).



isValid(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
        case (get({This, '$class'})):isValidStart(This, Path) of
            true ->
            case (get({This, '$class'})):isValidEnd(This, Path) of
                true ->
                throw({'$return', true});
                false -> ok
            end;
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isValidStart(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
        case (lists:nth((0) + 1, Path) =:= get({get({This, abPathData}), 'SEPARATORCHAR'})) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isValidEnd(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
        case (fun(Target_N67777) -> (get({Target_N67777, '$class'})):isEmpty(Target_N67777, Path) end)('StringValidationUtil':getInstance()) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        case (lists:nth(((string:length(Path) - 1)) + 1, Path) =:= get({get({This, abPathData}), 'SEPARATORCHAR'})) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

adjustStart(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        put({local, path}, Path),
        case (not (get({This, '$class'})):isValidStart(This, get({local, path}))) of
            true ->
            put({local, path}, lists:concat([get({get({This, abPathData}), 'SEPARATOR'}), get({local, path})]));
            false -> ok
        end,
        get({local, path}).

adjustEnd(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        put({local, path}, Path),
        case (not (get({This, '$class'})):isValidEnd(This, get({local, path}))) of
            true ->
            put({local, path}, lists:concat([get({local, path}), get({get({This, abPathData}), 'SEPARATOR'})]));
            false -> ok
        end,
        get({local, path}).

adjust(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        put({local, path}, Path),
        try
        case (fun(Target_N68277) -> (get({Target_N68277, '$class'})):isEmpty(Target_N68277, get({local, path})) end)('StringValidationUtil':getInstance()) of
            true ->
            throw({'$return', get({get({This, abPathData}), 'SEPARATOR'})});
            false -> ok
        end,
        case (allbinary_java:index_of(get({local, path}), "\\") >= 0) of
            true ->
            put({local, path}, (get({get({local, path}), '$class'})):replace(get({local, path}), $\\, get({get({This, abPathData}), 'SEPARATORCHAR'})));
            false -> ok
        end,
        get({local, path})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getNameFromPath(This, CategoryPath) when (is_list(CategoryPath) orelse CategoryPath =:= undefined) ->
        try
        put({local, endIndex}, (get({CategoryPath, '$class'})):lastIndexOf(CategoryPath, get({get({This, abPathData}), 'SEPARATOR'}))),
        case (get({local, endIndex}) < 0) of
            true ->
            put({local, endIndex}, (get({CategoryPath, '$class'})):lastIndexOf(CategoryPath, get({get({This, filePathData}), 'SEPARATORCHAR'})));
            false -> ok
        end,
        case (get({local, endIndex}) < 0) of
            true ->
            CategoryPath;
            false -> ok
        end,
        case (string:length(CategoryPath) =:= (get({local, endIndex}) + 1)) of
            true ->
            put({local, categoryName}, string:slice(CategoryPath, 0, (get({local, endIndex})) - (0))),
            throw({'$return', (get({This, '$class'})):getNameFromPath(This, get({local, categoryName}))});
            false ->
            put({local, categoryName}, string:slice(CategoryPath, (get({local, endIndex}) + 1))),
            throw({'$return', get({local, categoryName})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
removeNameFromPath(This, CategoryPath) when (is_list(CategoryPath) orelse CategoryPath =:= undefined) ->
        try
        put({local, endIndex}, (get({CategoryPath, '$class'})):lastIndexOf(CategoryPath, get({get({This, abPathData}), 'SEPARATOR'}))),
        case (get({local, endIndex}) < 0) of
            true ->
            put({local, endIndex}, (get({CategoryPath, '$class'})):lastIndexOf(CategoryPath, get({get({This, filePathData}), 'SEPARATORCHAR'})));
            false -> ok
        end,
        case (get({local, endIndex}) < 0) of
            true ->
            throw({'$return', 'AbPath':createAbPath()});
            false -> ok
        end,
        case (string:length(CategoryPath) =:= (get({local, endIndex}) + 1)) of
            true ->
            throw({'$return', (get({This, '$class'})):removeNameFromPath(This, string:slice(CategoryPath, 0, ((get({local, endIndex}) - 1)) - (0)))});
            false ->
            CategoryName = string:slice(CategoryPath, 0, (get({local, endIndex})) - (0)),
            throw({'$return', 'AbPath':new(CategoryName, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

