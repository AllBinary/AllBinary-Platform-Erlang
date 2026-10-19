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
% import org.allbinary.string.CommonSeps

-module('AbPathData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbPathData':new()),
    ok.

init_fields(This) ->
    put({This, 'EXTENSION_SEP'}, get({'CommonSeps':getInstance(), 'PERIOD'})),
    put({This, 'SEPARATORCHAR'}, $/),
    put({This, 'SEPARATOR'}, get({'CommonSeps':getInstance(), 'FORWARD_SLASH'})),
    ok.


getInstance() ->
        get({'AbPathData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getExtensionIndex(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        try
        IndexOfFileExtensionDelmiter = (get({FilePath, '$class'})):lastIndexOf(FilePath, get({This, 'EXTENSION_SEP'})),
        IndexOfLatDelimiter = (get({FilePath, '$class'})):lastIndexOf(FilePath, get({This, 'SEPARATORCHAR'})),
        case (IndexOfFileExtensionDelmiter < 0) of
            true ->
            throw({'$return', (-1)});
            false -> ok
        end,
        case (IndexOfFileExtensionDelmiter < IndexOfLatDelimiter) of
            true ->
            throw({'$return', (-1)});
            false -> ok
        end,
        IndexOfFileExtensionDelmiter
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getExtensionWithDot(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        IndexOfFileExtensionDelmiter = (get({This, '$class'})):getExtensionIndex(This, FilePath),
        put({local, extension}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        case (IndexOfFileExtensionDelmiter >= 0) of
            true ->
            put({local, extension}, string:slice(FilePath, IndexOfFileExtensionDelmiter));
            false -> ok
        end,
        get({local, extension}).

getExtension(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        IndexOfFileExtensionDelmiter = (get({This, '$class'})):getExtensionIndex(This, FilePath),
        put({local, extension}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        case (IndexOfFileExtensionDelmiter >= 0) of
            true ->
            put({local, extension}, string:slice(FilePath, (IndexOfFileExtensionDelmiter + 1)));
            false -> ok
        end,
        get({local, extension}).

getNameFromPath(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
        put({local, endIndex}, (get({Path, '$class'})):lastIndexOf(Path, get({This, 'SEPARATORCHAR'}))),
        case (get({local, endIndex}) < 0) of
            true ->
            put({local, endIndex}, (get({Path, '$class'})):lastIndexOf(Path, get({'FilePathData':getInstance(), 'SEPARATORCHAR'})));
            false -> ok
        end,
        case (get({local, endIndex}) < 0) of
            true ->
            throw({'$return', Path});
            false -> ok
        end,
        case (string:length(Path) =:= (get({local, endIndex}) + 1)) of
            true ->
            put({local, categoryName}, string:slice(Path, 0, (get({local, endIndex})) - (0))),
            throw({'$return', (get({This, '$class'})):getNameFromPath(This, get({local, categoryName}))});
            false ->
            put({local, categoryName}, string:slice(Path, (get({local, endIndex}) + 1))),
            throw({'$return', get({local, categoryName})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

removeNameFromPath(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
        put({local, endIndex}, (get({Path, '$class'})):lastIndexOf(Path, get({This, 'SEPARATORCHAR'}))),
        case (get({local, endIndex}) < 0) of
            true ->
            put({local, endIndex}, (get({Path, '$class'})):lastIndexOf(Path, get({'FilePathData':getInstance(), 'SEPARATORCHAR'})));
            false -> ok
        end,
        case (get({local, endIndex}) < 0) of
            true ->
            throw({'$return', get({'StringUtil':getInstance(), 'EMPTY_STRING'})});
            false -> ok
        end,
        case (string:length(Path) =:= (get({local, endIndex}) + 1)) of
            true ->
            throw({'$return', (get({This, '$class'})):removeNameFromPath(This, string:slice(Path, 0, ((get({local, endIndex}) - 1)) - (0)))});
            false ->
            PathWithoutName = string:slice(Path, 0, (get({local, endIndex})) - (0)),
            throw({'$return', PathWithoutName})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

