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
% import org.allbinary.logic.io.file.FilePathUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.string.CommonSeps

-module('AbPath').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NETWORK_SEP'}, ":/"),
    ok.

init_fields(This) ->
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, abPathData}, 'AbPathData':getInstance()),
    put({This, abPathUtil}, 'PathUtil':getInstance()),
    put({This, 'EMPTY_STRING'}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, schema}, get({This, 'EMPTY_STRING'})),
    put({This, path}, get({This, 'EMPTY_STRING'})),
    put({This, nameP}, get({This, 'EMPTY_STRING'})),
    put({This, hasSchemaP}, false),
    put({This, numberOfSeps}, 0),
    ok.


createAbPath() ->
        try
            EMPTY_STRING = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
            'AbPath':new(EMPTY_STRING, EMPTY_STRING)
        catch _:Ex when Ex =/= '$break', Ex =/= '$continue', (not is_tuple(Ex) orelse element(1, Ex) =/= '$return') ->
            erlang:error({'RuntimeException'})
        end.

new(APath, Name) when (is_list(APath) orelse APath =:= undefined), (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, APath, Name),
    This.

init(This, APath, Name) when (is_list(APath) orelse APath =:= undefined), (is_list(Name) orelse Name =:= undefined) ->
    init_fields(This),
        StringValidationUtil = 'StringValidationUtil':getInstance(),
        case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, APath)) of
            true ->
            put({This, schema}, (get({This, '$class'})):getSchema(This, APath)),
            put({This, nameP}, Name),
            put({This, path}, (get({get({This, abPathUtil}), '$class'})):adjustEnd(get({This, abPathUtil}), (get({get({This, abPathUtil}), '$class'})):adjust(get({This, abPathUtil}), (get({This, '$class'})):getPathFromPath(This, APath))));
            false ->
            (get({This, '$class'})):init(This),
            case (not (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, Name)) of
                true ->
                put({This, nameP}, Name);
                false -> ok
            end
        end.

init(This) ->
        put({This, schema}, get({This, 'EMPTY_STRING'})),
        (get({This, '$class'})):setPath(This, get({get({This, abPathData}), 'SEPARATOR'})),
        put({This, nameP}, get({This, 'EMPTY_STRING'})).

getSchema(This, APath) when (is_list(APath) orelse APath =:= undefined) ->
        try
        BeginIndex = allbinary_java:index_of(APath, get({get({This, commonSeps}), 'COLON'})),
        case (BeginIndex >= 0) of
            true ->
            put({This, hasSchemaP}, true),
            throw({'$return', string:slice(APath, 0, (BeginIndex) - (0))});
            false -> ok
        end,
        put({This, hasSchemaP}, false),
        get({This, 'EMPTY_STRING'})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

hasSchema(This) ->
        get({This, hasSchemaP}).

% throws Exception
getPathFromPath(This, APath) when (is_list(APath) orelse APath =:= undefined) ->
        FilePathData = 'FilePathData':getInstance(),
        put({local, tempPath}, APath),
        case (not (get({This, '$class'})):hasSchema(This)) of
            true ->
            put({local, tempPath}, (get({get({This, abPathUtil}), '$class'})):adjustStart(get({This, abPathUtil}), get({local, tempPath})));
            false ->
            put({local, beginIndex}, allbinary_java:index_of(get({local, tempPath}), get({get({This, commonSeps}), 'COLON'}))),
            case (get({local, beginIndex}) >= 0) of
                true ->
                put({local, beginIndex}, get({local, beginIndex}) + 1),
                (fun Loop() -> case ((lists:nth((get({local, beginIndex})) + 1, get({local, tempPath})) =:= get({get({This, abPathData}), 'SEPARATORCHAR'})) orelse (lists:nth((get({local, beginIndex})) + 1, get({local, tempPath})) =:= get({FilePathData, 'SEPARATORCHAR'}))) of true ->
                    put({local, beginIndex}, get({local, beginIndex}) + 1),
                    put({This, numberOfSeps}, get({This, numberOfSeps}) + 1),
                    case (get({This, numberOfSeps}) > 2) of
                        true ->
                        erlang:error({'Exception', "Should Not Have More Than Two Seps"});
                        false -> ok
                    end,
                    Loop();
                false -> ok end end)(),
                put({local, tempPath}, string:slice(get({local, tempPath}), get({local, beginIndex}), (string:length(get({local, tempPath}))) - (get({local, beginIndex}))));
                false -> ok
            end
        end,
        get({local, tempPath}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, nameP}, Name).

getName(This) ->
        get({This, nameP}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        case (get({This, '$class'})):hasSchema(This) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, schema})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPath', 'NETWORK_SEP'}));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):getPath(This)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, nameP})),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

toFileSystemString(This) ->
        try
        case (get({This, '$class'})):hasSchema(This) of
            true ->
            FilePathData = 'FilePathData':getInstance(),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, schema})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'COLON'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({FilePathData, 'PATH_START'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, 'FilePathUtil':adjust((get({This, '$class'})):getPath(This))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, nameP})),
            throw({'$return', (get({StringBuffer, '$class'})):toString(StringBuffer)});
            false ->
            throw({'$return', lists:concat(['FilePathUtil':adjust((get({This, '$class'})):getPath(This)), get({This, nameP})])})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getPath(This) ->
        get({This, path}).

setPath(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        put({This, path}, Path).

