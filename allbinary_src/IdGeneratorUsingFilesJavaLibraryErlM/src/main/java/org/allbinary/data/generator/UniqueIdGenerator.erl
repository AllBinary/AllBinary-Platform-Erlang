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
% package org.allbinary.data.generator
% import java.io.IOException
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.AbDataInputStream
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.AbFileInputStream
% import org.allbinary.logic.io.AbFileOutputStream
% import org.allbinary.logic.io.DataOutputStreamFactory
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.string.CommonStrings

-module('UniqueIdGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements IdGeneratorInterface

static_init() ->
    put({?MODULE, 'EXT'}, ".unq"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, newFile}, undefined),
    put({This, id}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

initialize(This, Value) when is_integer(Value) ->
        try
            (get({get({This, newFile}), '$class'})):createNewFile(get({This, newFile})),
            IdData = (fun(Target_N66120) -> (get({Target_N66120, '$class'})):getInstanceForAbFile(Target_N66120, get({This, newFile})) end)('DataOutputStreamFactory':getInstance()),
            (get({IdData, '$class'})):writeLong(IdData, Value)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'IDLOGGING'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "initialize", E);
                false -> ok
            end
        end.

% throws Exception
setFile(This, FilePathName, Name) when (is_list(FilePathName) orelse FilePathName =:= undefined), (is_list(Name) orelse Name =:= undefined) ->
        put({This, newFile}, 'AbFile':createAbFile(FilePathName)).

% throws IOException
getNext(This) ->
        put({local, idData}, undefined),
        put({local, idOutData}, undefined),
        try
            IdFile = 'AbFileInputStream':new(get({This, newFile})),
            put({local, idData}, 'AbDataInputStream':new(IdFile)),
            put({This, id}, (get({get({local, idData}), '$class'})):readLong(get({local, idData}))),
            IdOutFile = 'AbFileOutputStream':createFromAbFile(get({This, newFile})),
            put({local, idOutData}, 'AbDataOutputStream':new(IdOutFile)),
            (get({get({local, idOutData}), '$class'})):writeLong(get({local, idOutData}), (get({This, id}) + 1)),
            IdLong = get({This, id}),
            (get({IdLong, '$class'})):toString(IdLong)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'IDLOGGING'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "getNext", E);
                false -> ok
            end,
            "Error"
        after
            (fun(Target_N66781) -> (get({Target_N66781, '$class'})):close(Target_N66781, get({local, idData})) end)('StreamUtil':getInstance()),
            (fun(Target_N66820) -> (get({Target_N66820, '$class'})):close(Target_N66820, get({local, idOutData})) end)('StreamUtil':getInstance())
        end.

