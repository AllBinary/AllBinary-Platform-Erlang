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
% package org.allbinary.business.init
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.directory.SubDirectory
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('WeblisketFinder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'WeblisketFinder':new()),
    put({?MODULE, 'KEY'}, "installerdata.dat"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, subDirectory}, 'SubDirectory':getInstance()),
    ok.


getInstance() ->
        get({'WeblisketFinder', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

findAll(This, Path) when (is_list(Path) orelse Path =:= undefined) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "findAll"),
            (get({get({This, subDirectory}), '$class'})):search(get({This, subDirectory}), get({'WeblisketFinder', 'KEY'}), 'AbFile':createAbFile(Path))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "findAll", E),
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "findAll", E);
                false -> ok
            end,
            undefined
        end.

getInstallationPath(This, File) ->
        try
        try
            FilePath = (get({File, '$class'})):getPath(File),
            End = allbinary_java:index_of(FilePath, get({'WeblisketFinder', 'KEY'})),
            case (End < 0) of
                true ->
                throw({'$return', undefined});
                false -> ok
            end,
            string:slice(FilePath, 0, (End) - (0))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRELOADERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getInstallationPath", E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        StringUtil = 'StringUtil':getInstance(),
        Vector = (fun(Target_N67192) -> (get({Target_N67192, '$class'})):findAll(Target_N67192, get({StringUtil, 'EMPTY_STRING'})) end)('WeblisketFinder':getInstance()),
        io:format("~ts~n", [allbinary_java:to_string((get({Vector, '$class'})):size(Vector))]).

