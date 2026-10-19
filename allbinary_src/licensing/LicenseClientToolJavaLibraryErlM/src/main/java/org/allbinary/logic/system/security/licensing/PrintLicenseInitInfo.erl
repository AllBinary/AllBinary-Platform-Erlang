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
% package org.allbinary.logic.system.security.licensing
% import org.allbinary.business.init.LicenseInitInfo
% import org.allbinary.business.init.LicenseInitInfoUtil
% import org.allbinary.logic.io.file.FileFactory
% import org.allbinary.globals.PATH_GLOBALS
% import org.allbinary.util.BasicArrayList

-module('PrintLicenseInitInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'PATH'}, "G:\\mnt\\bc\\mydev\\work\\allbinary_src\\licensing\\data\\"),
    ok.

init_fields(This) ->
    ok.


new(Options) when (is_tuple(Options) orelse Options =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Options),
    This.

init(This, Options) when (is_tuple(Options) orelse Options =:= undefined) ->
    init_fields(This),
        (fun(Target_N65799) -> (get({Target_N65799, '$class'})):setFilePath(Target_N65799, (get({'PrintLicenseInitInfo', 'PATH'}) + get({(get({get({'PrintLicenseInitInfo', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'PrintLicenseInitInfo', 'PATH_GLOBALS'})), 'INIT_PATH'}))) end)('LicenseInitInfoUtil':getInstance()).

% throws Exception
getLicenseInitInfo(This) ->
        try
        LicenseInitInfoUtil = 'LicenseInitInfoUtil':getInstance(),
        case (fun(Target_N65991) -> (get({Target_N65991, '$class'})):isFile(Target_N65991, (get({LicenseInitInfoUtil, '$class'})):getFilePath(LicenseInitInfoUtil)) end)('FileFactory':getInstance()) of
            true ->
            throw({'$return', (get({LicenseInitInfoUtil, '$class'})):read(LicenseInitInfoUtil)});
            false ->
            io:format("~ts~n", [allbinary_java:to_string(lists:concat(["No Licence File at: ", (get({LicenseInitInfoUtil, '$class'})):getFilePath(LicenseInitInfoUtil)]))]),
            throw({'$return', 'LicenseInitInfo':new()})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

printInitInfo(This) ->
        try
            LicenseInitInfo = (get({This, '$class'})):getLicenseInitInfo(This),
            io:format("~ts~n", [allbinary_java:to_string(lists:concat(["License ID: ", (get({LicenseInitInfo, '$class'})):getLicenseId(LicenseInitInfo)]))]),
            List = (get({LicenseInitInfo, '$class'})):getServerList(LicenseInitInfo),
            Size = (get({List, '$class'})):size(List),
            lists:foreach(fun(Index) ->
                io:format("~ts~n", [allbinary_java:to_string(lists:concat(["Lic Serv: ", (get({List, '$class'})):get(List, Index)]))])
            end, lists:seq(0, Size - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~ts", [allbinary_java:to_string(lists:concat(["Error: ", E]))]),
            io:format("~p~n", [E])
        end.

% throws Exception
main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        InitInfo = 'PrintLicenseInitInfo':new(Args),
        (get({InitInfo, '$class'})):printInitInfo(InitInfo).

