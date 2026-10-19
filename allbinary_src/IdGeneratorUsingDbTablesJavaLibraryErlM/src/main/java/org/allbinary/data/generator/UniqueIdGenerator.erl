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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tables.generator.IdGeneratorEntity
% import org.allbinary.data.tables.generator.IdGeneratorEntityFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil

-module('UniqueIdGenerator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements IdGeneratorInterface

static_init() ->
    put({?MODULE, 'EXT'}, ".unq"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, idGeneratorEntity}, undefined),
    put({This, name}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, idGeneratorEntity}, 'IdGeneratorEntityFactory':getInstance()).

initialize(This, Value) when is_integer(Value) ->
        try
            Vector = 'BasicArrayListD':new(),
            (get({Vector, '$class'})):add(Vector, get({This, name})),
            (get({Vector, '$class'})):add(Vector, (fun(Target_N66154) -> (get({Target_N66154, '$class'})):toString(Target_N66154) end)(allbinary_java:to_string(Value))),
            (get({get({This, idGeneratorEntity}), '$class'})):insert(get({This, idGeneratorEntity}), Vector)
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
        put({This, name}, Name).

% throws IOException
getNext(This) ->
        try
            IdLong = (get({get({This, idGeneratorEntity}), '$class'})):get(get({This, idGeneratorEntity}), get({This, name})),
            NewValue = allbinary_java:to_string(((get({IdLong, '$class'})):longValue(IdLong) + 1)),
            (get({get({This, idGeneratorEntity}), '$class'})):update(get({This, idGeneratorEntity}), get({This, name}), NewValue),
            (get({IdLong, '$class'})):toString(IdLong)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'IDLOGGING'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "getNext", E);
                false -> ok
            end,
            "Error"
        end.

