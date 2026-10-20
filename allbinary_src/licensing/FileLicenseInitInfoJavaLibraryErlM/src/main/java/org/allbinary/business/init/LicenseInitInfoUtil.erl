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
% import org.allbinary.TsUtil
% import org.allbinary.globals.PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.AbDataInputStream
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.AbFileInputStream
% import org.allbinary.logic.io.DataOutputStreamFactory
% import org.allbinary.logic.io.FileStreamFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.crypt.DatabaseEncoder
% import org.allbinary.logic.system.security.crypt.WeakCrypt
% import org.allbinary.string.CommonLabels

-module('LicenseInitInfoUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LicenseInitInfoUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, 'INITFILENAME'}, "licenseinitdata.dat"),
    put({This, 'ABOUT'}, "about"),
    put({This, 'PRIVACY_POLICY'}, "privacy_policy"),
    put({This, filePath}, get({get({This, stringUtil}), 'EMPTY_STRING'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'LicenseInitInfoUtil', instance}).

setFilePath(This, FilePath) when (is_list(FilePath) orelse FilePath =:= undefined) ->
        put({This, filePath}, FilePath).

% throws Exception
write(This, InitData) ->
        case (get({This, filePath}) =:= get({get({This, stringUtil}), 'EMPTY_STRING'})) of
            true ->
            put({This, filePath}, ((get({get({'LicenseInitInfoUtil', 'URLGLOBALS'}), '$class'})):getMainPath(get({'LicenseInitInfoUtil', 'URLGLOBALS'})) + get({(get({get({'LicenseInitInfoUtil', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'LicenseInitInfoUtil', 'PATH_GLOBALS'})), 'INIT_PATH'})));
            false -> ok
        end,
        try
            TsUtil = 'TsUtil':getInstance(),
            DataOutputStream = (fun(Target_N66642) -> (get({Target_N66642, '$class'})):getInstance(Target_N66642, get({This, filePath}), get({This, 'INITFILENAME'})) end)('DataOutputStreamFactory':getInstance()),
            LicenseIdCrypted = (get({TsUtil, '$class'})):getByteArray(TsUtil, (fun(Target_N66742) -> (get({Target_N66742, '$class'})):encrypt(Target_N66742, (get({InitData, '$class'})):getLicenseId(InitData)) end)('WeakCrypt':new(1))),
            (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, 'DatabaseEncoder':encode(LicenseIdCrypted)),
            NumberOfLicenseServers = (get({InitData, '$class'})):getNumberOfServers(InitData),
            (get({DataOutputStream, '$class'})):writeInt(DataOutputStream, NumberOfLicenseServers),
            put({local, licenseServerCrypted}, undefined),
            lists:foreach(fun(Index) ->
                put({local, licenseServerCrypted}, (get({TsUtil, '$class'})):getByteArray(TsUtil, (fun(Target_N67002) -> (get({Target_N67002, '$class'})):encrypt(Target_N67002, (get({InitData, '$class'})):getServer(InitData, Index)) end)('WeakCrypt':new(3)))),
                (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, 'DatabaseEncoder':encode(get({local, licenseServerCrypted})))
            end, lists:seq(0, NumberOfLicenseServers - 1))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Command Failed: ", get({This, 'INITFILENAME'})]), This, "write", E),
            (fun(Target_N67259) -> (get({Target_N67259, '$class'})):delete(Target_N67259, get({This, filePath}), get({This, 'INITFILENAME'})) end)('FileStreamFactory':getInstance()),
            erlang:error(E)
        end.

% throws Exception
read(This) ->
        (get({This, '$class'})):readAgain(This, 0).

% throws Exception
readAgain(This, InitializeCounter) when is_integer(InitializeCounter) ->
        try
        METHOD_NAME = "readAgain",
        case (get({This, filePath}) =:= get({get({This, stringUtil}), 'EMPTY_STRING'})) of
            true ->
            put({This, filePath}, ((get({get({'LicenseInitInfoUtil', 'URLGLOBALS'}), '$class'})):getMainPath(get({'LicenseInitInfoUtil', 'URLGLOBALS'})) + get({(get({get({'LicenseInitInfoUtil', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'LicenseInitInfoUtil', 'PATH_GLOBALS'})), 'INIT_PATH'})));
            false -> ok
        end,
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["LicenseInitInfo File: ", get({This, 'INITFILENAME'})]), This, METHOD_NAME),
            FileStreamFactory = 'FileStreamFactory':getInstance(),
            IFile = (get({FileStreamFactory, '$class'})):getFileInputStreamInstance(FileStreamFactory, get({This, filePath}), get({This, 'INITFILENAME'})),
            case (IFile =/= undefined) of
                true ->
                IData = 'AbDataInputStream':new(IFile),
                InitInfo = 'LicenseInitInfo':new(),
                put({local, decodedByteArray}, 'DatabaseEncoder':decode((get({IData, '$class'})):readUTF(IData))),
                LicenseIdDecoded = allbinary_java:to_string(get({local, decodedByteArray})),
                (get({InitInfo, '$class'})):setLicenseId(InitInfo, (fun(Target_N68134) -> (get({Target_N68134, '$class'})):decrypt(Target_N68134, LicenseIdDecoded) end)('WeakCrypt':new(1))),
                NumberOfLicenseServers = (get({IData, '$class'})):readInt(IData),
                NEXT_FILE = (fun(Target_N68232) -> (get({Target_N68232, '$class'})):toString(Target_N68232) end)((fun(Target_N68239) -> (get({Target_N68239, '$class'})):append(Target_N68239, " License Server From File: ") end)((fun(Target_N68246) -> (get({Target_N68246, '$class'})):append(Target_N68246, get({'CommonLabels':getInstance(), 'NEXT'})) end)('StringMaker':new()))),
                put({local, licenseServerDecoded}, undefined),
                lists:foreach(fun(Index) ->
                    put({local, decodedByteArray}, 'DatabaseEncoder':decode((get({IData, '$class'})):readUTF(IData))),
                    put({local, licenseServerDecoded}, allbinary_java:to_string(get({local, decodedByteArray}))),
                    (get({InitInfo, '$class'})):setServer(InitInfo, (fun(Target_N68465) -> (get({Target_N68465, '$class'})):decrypt(Target_N68465, get({local, licenseServerDecoded})) end)('WeakCrypt':new(3)), Index),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([NEXT_FILE, (get({InitInfo, '$class'})):getServer(InitInfo, Index)]), This, METHOD_NAME)
                end, lists:seq(0, NumberOfLicenseServers - 1)),
                throw({'$return', InitInfo});
                false ->
                erlang:error({'Exception', lists:concat(["Could Not Load License InitInfo: ", get({This, 'INITFILENAME'})])})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            try
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["Command Failed: ", get({This, 'INITFILENAME'})]), This, METHOD_NAME, E)
            catch _:E2 when E2 =/= '$break', E2 =/= '$continue', (not is_tuple(E2) orelse element(1, E2) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), lists:concat(["LicenseInitInfo Read Retry: ", get({This, 'INITFILENAME'})]), This, "readAgain()", E2)
            end,
            erlang:error({'Exception', lists:concat(["LicenseInitInfo Read Error: ", get({This, 'INITFILENAME'})])})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getFilePath(This) ->
        get({This, filePath}).

