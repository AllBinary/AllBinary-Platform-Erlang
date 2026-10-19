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
% import java.io.File
% import java.io.FileReader
% import java.io.LineNumberReader
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.business.init.LicenseInitInfo
% import org.allbinary.business.init.LicenseInitInfoUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.client.XmlRpcAbeLicenseRetrievalClient
% import org.allbinary.globals.PATH_GLOBALS
% import org.allbinary.util.BasicArrayList

-module('LicenseClientAndServerTest').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, vector}, 'BasicArrayListD':new()),
    ok.


new(Options) when (is_tuple(Options) orelse Options =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Options),
    This.

init(This, Options) when (is_tuple(Options) orelse Options =:= undefined) ->
    init_fields(This),
        (fun(Target_N65976) -> (get({Target_N65976, '$class'})):setFilePath(Target_N65976, (get({'PrintLicenseInitInfo', 'PATH'}) + get({(get({get({'LicenseClientAndServerTest', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'LicenseClientAndServerTest', 'PATH_GLOBALS'})), 'INIT_PATH'}))) end)('LicenseInitInfoUtil':getInstance()),
        lists:foreach(fun(Index) ->
            (get({get({This, vector}), '$class'})):add(get({This, vector}), array:get(Index, Options))
        end, lists:seq(1, array:size(Options) - 1)),
        case (array:size(Options) < 2) of
            true ->
            File = 'File':new(lists:concat([get({'PrintLicenseInitInfo', 'PATH'}), "testlicenseservers.txt"])),
            Reader = 'FileReader':new(File),
            LineNumberReader = 'LineNumberReader':new(Reader),
            (fun Loop() -> case true of true ->
                Line = (get({LineNumberReader, '$class'})):readLine(LineNumberReader),
                case (Line =/= undefined) of
                    true ->
                    (get({get({This, vector}), '$class'})):add(get({This, vector}), Line);
                    false ->
                    throw('$break')
                end,
                Loop();
            false -> ok end end)();
            false -> ok
        end.

test(This) ->
        StringBuffer = 'StringMaker':new(),
        try
            List = 'BasicArrayListD':new(),
            TESTING = "Testing with new licence:<br/>",
            PROCESSING = "Processing: <br/>",
            END = "<br/>End<br/>",
            RESULT = "Test Result: ",
            Size = (get({get({This, vector}), '$class'})):size(get({This, vector})),
            lists:foreach(fun(Index) ->
                (get({StringBuffer, '$class'})):append(StringBuffer, TESTING),
                ServerName = (get({get({This, vector}), '$class'})):get(get({This, vector}), Index),
                try
                    LicenseInitInfo = 'LicenseInitInfo':new(),
                    (get({LicenseInitInfo, '$class'})):addServer(LicenseInitInfo, ServerName),
                    (fun(Target_N67047) -> (get({Target_N67047, '$class'})):write(Target_N67047, LicenseInitInfo) end)('LicenseInitInfoUtil':getInstance()),
                    AbeClientInformation = 'AbeClientInformationInterfaceFactory':getInstance(),
                    XmlRpcAbeLicenseClient = 'XmlRpcAbeLicenseRetrievalClient':new(AbeClientInformation),
                    AbeLicenseInterface = (get({XmlRpcAbeLicenseClient, '$class'})):get(XmlRpcAbeLicenseClient, undefined),
                    case (AbeLicenseInterface =/= undefined) of
                        true ->
                        (get({StringBuffer, '$class'})):append(StringBuffer, PROCESSING),
                        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AbeLicenseInterface, '$class'})):toString(AbeLicenseInterface));
                        false -> ok
                    end,
                    (get({StringBuffer, '$class'})):append(StringBuffer, END),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([RESULT, (get({StringBuffer, '$class'})):toString(StringBuffer)]), This, "test"),
                    (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer))
                catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
                    (get({List, '$class'})):add(List, ServerName),
                    (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Test Error: ", (get({StringBuffer, '$class'})):toString(StringBuffer)]), This, "test", E)
                end
            end, lists:seq(0, Size - 1)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["Total Servers Failed: ", (get({List, '$class'})):size(List)]), " Failed Servers: "]), (get({List, '$class'})):toString(List)]), This, "test")
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Test Error: ", (get({StringBuffer, '$class'})):toString(StringBuffer)]), This, "test", E)
        end.

main(Args) when (is_tuple(Args) orelse Args =:= undefined) ->
        try
            LicensingTest = 'LicenseClientAndServerTest':new(Args),
            (get({LicensingTest, '$class'})):test(LicensingTest)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            LogUtil = 'LogUtil':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), "main()", "main()", E)
        end.

