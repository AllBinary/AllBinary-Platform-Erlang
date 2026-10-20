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
% package org.allbinary.logic.io.path
% import org.allbinary.logic.io.file.FilePathData
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil

-module('PathUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PathUtil':new()),
    ok.

init_fields(This) ->
    put({This, abPathData}, 'AbPathData':getInstance()),
    put({This, filePathData}, 'FilePathData':getInstance()),
    ok.


getInstance() ->
        get({'PathUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getExtensionWithAbFilePath(This, AbFilePath) ->
        (get({get({This, abPathData}), '$class'})):getExtension(get({This, abPathData}), (get({AbFilePath, '$class'})):toString(AbFilePath)).

getExtensionWithAbPath(This, AbPath) ->
        (get({get({This, abPathData}), '$class'})):getExtension(get({This, abPathData}), (get({AbPath, '$class'})):toString(AbPath)).

% throws Exception
getWithoutExtensionWithAbFilePath(This, AbFilePath) ->
        (get({This, '$class'})):getWithoutExtension(This, (get({AbFilePath, '$class'})):toString(AbFilePath)).

% throws Exception
getWithoutExtensionWithAbPath(This, AbPath) ->
        (get({This, '$class'})):getWithoutExtension(This, (get({AbPath, '$class'})):toString(AbPath)).

% throws Exception
getWithoutExtension(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        IndexOfFileExtensionDelmiter = (get({get({This, abPathData}), '$class'})):getExtensionIndex(get({This, abPathData}), FilePath),
        put({local, pathWithoutExtension}, FilePath),
        case (IndexOfFileExtensionDelmiter >= 0) of
            true ->
            put({local, pathWithoutExtension}, string:slice(FilePath, 0, (IndexOfFileExtensionDelmiter) - (0)));
            false -> ok
        end,
        get({local, pathWithoutExtension}).

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
        case ((lists:nth((0) + 1, Path) =:= get({get({This, abPathData}), 'SEPARATORCHAR'})) orelse (lists:nth((0) + 1, Path) =:= $.)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isValidEnd(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, Path) of
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
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, get({local, path})) of
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

% throws Exception
removeNameFromPath(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
        put({local, endIndex}, (get({Path, '$class'})):lastIndexOf(Path, get({get({This, abPathData}), 'SEPARATOR'}))),
        case (get({local, endIndex}) < 0) of
            true ->
            put({local, endIndex}, (get({Path, '$class'})):lastIndexOf(Path, get({get({This, filePathData}), 'SEPARATORCHAR'})));
            false -> ok
        end,
        case (get({local, endIndex}) < 0) of
            true ->
            throw({'$return', 'AbPath':createAbPath()});
            false -> ok
        end,
        case (string:length(Path) =:= (get({local, endIndex}) + 1)) of
            true ->
            throw({'$return', (get({This, '$class'})):removeNameFromPath(This, string:slice(Path, 0, ((get({local, endIndex}) - 1)) - (0)))});
            false ->
            PathWithoutName = string:slice(Path, 0, (get({local, endIndex})) - (0)),
            throw({'$return', 'AbPath':new(PathWithoutName, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

