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
% import java.io.BufferedReader
% import java.io.InputStreamReader
% import org.allbinary.business.init.LicenseInitInfo
% import org.allbinary.business.init.LicenseInitInfoUtil
% import org.allbinary.logic.io.file.FileFactory
% import org.allbinary.globals.PATH_GLOBALS
% import java.io.File
% import java.io.FileReader
% import java.io.LineNumberReader
% import org.allbinary.util.BasicArrayList

-module('SetLicenseInitInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, stdinput}, 'BufferedReader':new('InputStreamReader':new(get({'System', in})))),
    ok.

init_fields(This) ->
    put({This, vector}, 'BasicArrayListD':new()),
    ok.


new(Options) when (is_tuple(Options) orelse Options =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Options),
    This.

'$init'(This, Options) when (is_tuple(Options) orelse Options =:= undefined) ->
    init_fields(This),
        (fun(Target_N65975) -> (get({Target_N65975, '$class'})):setFilePath(Target_N65975, (get({'PrintLicenseInitInfo', 'PATH'}) + get({(get({get({'SetLicenseInitInfo', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'SetLicenseInitInfo', 'PATH_GLOBALS'})), 'INIT_PATH'}))) end)('LicenseInitInfoUtil':getInstance()),
        lists:foreach(fun(Index) ->
            (get({get({This, vector}), '$class'})):add(get({This, vector}), array:get(Index, Options))
        end, lists:seq(1, array:size(Options) - 1)).

% throws Exception
getLicenseInitInfo(This) ->
        try
        LicenseInitInfoUtil = 'LicenseInitInfoUtil':getInstance(),
        case (fun(Target_N66284) -> (get({Target_N66284, '$class'})):isFile(Target_N66284, get({LicenseInitInfoUtil, 'INITFILENAME'})) end)('FileFactory':getInstance()) of
            true ->
            throw({'$return', (get({LicenseInitInfoUtil, '$class'})):read(LicenseInitInfoUtil)});
            false ->
            throw({'$return', 'LicenseInitInfo':new()})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

createNewLicenseInitInfo(This, LicenceServerVector) ->
        try
            case (LicenceServerVector =:= undefined) of
                true ->
                erlang:error({'Exception', "null BasicArrayList Passed - Just Make Empty if you want"});
                false -> ok
            end,
            LicenseInitInfo = (get({This, '$class'})):getLicenseInitInfo(This),
            io:format("~ts~n", [allbinary_java:to_string("License Serv Example: http://www.dartstatistics.com/LicServ/serverssl.php")]),
            (get({LicenseInitInfo, '$class'})):clearServers(LicenseInitInfo),
            File = 'File':new(lists:concat([get({'PrintLicenseInitInfo', 'PATH'}), "licenseservers.txt"])),
            Reader = 'FileReader':new(File),
            LineNumberReader = 'LineNumberReader':new(Reader),
            (fun Loop() -> case true of true ->
                Line = (get({LineNumberReader, '$class'})):readLine(LineNumberReader),
                case (Line =/= undefined) of
                    true ->
                    (get({LicenseInitInfo, '$class'})):addServer(LicenseInitInfo, Line);
                    false ->
                    throw('$break')
                end,
                Loop();
            false -> ok end end)(),
            (fun(Target_N66870) -> (get({Target_N66870, '$class'})):write(Target_N66870, LicenseInitInfo) end)('LicenseInitInfoUtil':getInstance()),
            (fun(Target_N66909) -> (get({Target_N66909, '$class'})):read(Target_N66909) end)('LicenseInitInfoUtil':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            io:format("~ts", [allbinary_java:to_string(lists:concat(["Error: ", E]))]),
            io:format("~p~n", [E])
        end.

% throws Exception
main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        InitInfo = 'SetLicenseInitInfo':new(Args),
        (get({InitInfo, '$class'})):createNewLicenseInitInfo(InitInfo, 'BasicArrayListD':new()).

