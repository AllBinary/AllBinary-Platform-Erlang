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
% package org.allbinary.business.init.db
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.http.HttpData
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.io.AbDataInputStream
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.AbFileInputStream
% import org.allbinary.logic.io.DataOutputStreamFactory
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.crypt.DatabaseEncoder
% import org.allbinary.logic.system.security.crypt.WeakCrypt
% import org.allbinary.string.CommonStrings

-module('DbInitInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('DbConnectionInfo', Function, Arguments).

init_fields(This) ->
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, directory}, 'Directory':getInstance()),
    put({This, httpData}, 'HttpData':getInstance()),
    put({This, 'GET_URL'}, "getUrl"),
    put({This, 'PACKAGE'}, get({(get({get({'DbInitInfo', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'DbInitInfo', 'FREEBLISKET_PATH_GLOBALS'})), 'DBINITPATH'})),
    put({This, initFileName}, undefined),
    put({This, hasRead}, false),
    ok.


new(InitFileName, Read) when (is_list(InitFileName) orelse InitFileName =:= undefined), is_boolean(Read) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, InitFileName, Read),
    This.

'$init'(This, InitFileName, Read) when (is_list(InitFileName) orelse InitFileName =:= undefined), is_boolean(Read) ->
        'DbConnectionInfo':'$init'(This),
        init_fields(This),
        put({This, initFileName}, InitFileName),
        case Read of
            true ->
            (get({This, '$class'})):updateIfNeeded(This);
            false ->
            (get({This, '$class'})):setHasRead(This, true)
        end.

getUrl(This) ->
        Url = 'DbConnectionInfo':getUrl(This),
        case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADER'})) of
            true ->
            'PreLogUtil':put(lists:concat([get({get({This, httpData}), 'URL_LABEL'}), Url]), This, get({This, 'GET_URL'}));
            false -> ok
        end,
        Url.

% throws Exception
write(This) ->
        PATH = 'AbPath':new(lists:concat([(get({get({'DbInitInfo', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'DbInitInfo', 'URLGLOBALS'})), get({This, 'PACKAGE'})]), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        (get({get({This, directory}), '$class'})):create(get({This, directory}), PATH),
        FILEABPATH = 'AbPath':new(lists:concat([(get({get({'DbInitInfo', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'DbInitInfo', 'URLGLOBALS'})), get({This, 'PACKAGE'})]), get({This, initFileName})),
        try
            NewFile = 'AbFile':createAbFileFromAbPath(FILEABPATH),
            (get({NewFile, '$class'})):createNewFile(NewFile),
            DataOutputStream = (fun(Target_N67234) -> (get({Target_N67234, '$class'})):getInstanceForAbFile(Target_N67234, NewFile) end)('DataOutputStreamFactory':getInstance()),
            try
                CryptedJdbcDriver = (fun(Target_N67361) -> (get({Target_N67361, '$class'})):getBytes(Target_N67361) end)((fun(Target_N67368) -> (get({Target_N67368, '$class'})):encrypt(Target_N67368, (get({This, '$class'})):getJdbcDriver(This)) end)('WeakCrypt':new(1))),
                CryptedName = (fun(Target_N67445) -> (get({Target_N67445, '$class'})):getBytes(Target_N67445) end)((fun(Target_N67452) -> (get({Target_N67452, '$class'})):encrypt(Target_N67452, (get({This, '$class'})):getName(This)) end)('WeakCrypt':new(2))),
                CryptedUserName = (fun(Target_N67529) -> (get({Target_N67529, '$class'})):getBytes(Target_N67529) end)((fun(Target_N67536) -> (get({Target_N67536, '$class'})):encrypt(Target_N67536, (get({This, '$class'})):getUserName(This)) end)('WeakCrypt':new(3))),
                CryptedPassword = (fun(Target_N67613) -> (get({Target_N67613, '$class'})):getBytes(Target_N67613) end)((fun(Target_N67620) -> (get({Target_N67620, '$class'})):encrypt(Target_N67620, (get({This, '$class'})):getPassword(This)) end)('WeakCrypt':new(4))),
                CryptedSchema = (fun(Target_N67697) -> (get({Target_N67697, '$class'})):getBytes(Target_N67697) end)((fun(Target_N67704) -> (get({Target_N67704, '$class'})):encrypt(Target_N67704, (get({This, '$class'})):getSchema(This)) end)('WeakCrypt':new(5))),
                CryptedServer = (fun(Target_N67781) -> (get({Target_N67781, '$class'})):getBytes(Target_N67781) end)((fun(Target_N67788) -> (get({Target_N67788, '$class'})):encrypt(Target_N67788, (get({This, '$class'})):getServer(This)) end)('WeakCrypt':new(6))),
                CryptedPort = (fun(Target_N67865) -> (get({Target_N67865, '$class'})):getBytes(Target_N67865) end)((fun(Target_N67872) -> (get({Target_N67872, '$class'})):encrypt(Target_N67872, (get({This, '$class'})):getPort(This)) end)('WeakCrypt':new(7))),
                (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, 'DatabaseEncoder':encode(CryptedJdbcDriver)),
                (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, 'DatabaseEncoder':encode(CryptedName)),
                (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, 'DatabaseEncoder':encode(CryptedUserName)),
                (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, 'DatabaseEncoder':encode(CryptedPassword)),
                (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, 'DatabaseEncoder':encode(CryptedSchema)),
                (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, 'DatabaseEncoder':encode(CryptedServer)),
                (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, 'DatabaseEncoder':encode(CryptedPort)),
                put({This, hasRead}, false)
            after
                (fun(Target_N67300) -> (get({Target_N67300, '$class'})):close(Target_N67300, DataOutputStream) end)('StreamUtil':getInstance())
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                'PreLogUtil':putOE(lists:concat(["Failed Write: ", (get({FILEABPATH, '$class'})):toString(FILEABPATH)]), This, "write", E);
                false -> ok
            end
        end.

% throws Exception
load(This) ->
        FILEABPATH = 'AbPath':new(lists:concat([(get({get({'DbInitInfo', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'DbInitInfo', 'URLGLOBALS'})), get({This, 'PACKAGE'})]), get({This, initFileName})),
        try
            File = 'AbFile':createAbFileFromAbPath(FILEABPATH),
            case (get({File, '$class'})):isFile(File) of
                true ->
                IFile = 'AbFileInputStream':new(File),
                IData = 'AbDataInputStream':new(IFile),
                try
                    DecryptedJdbcDriver = allbinary_java:to_string('DatabaseEncoder':decode((get({IData, '$class'})):readUTF(IData))),
                    DecryptedName = allbinary_java:to_string('DatabaseEncoder':decode((get({IData, '$class'})):readUTF(IData))),
                    DecryptedUserName = allbinary_java:to_string('DatabaseEncoder':decode((get({IData, '$class'})):readUTF(IData))),
                    DecryptedPassword = allbinary_java:to_string('DatabaseEncoder':decode((get({IData, '$class'})):readUTF(IData))),
                    DecryptedSchema = allbinary_java:to_string('DatabaseEncoder':decode((get({IData, '$class'})):readUTF(IData))),
                    DecryptedServer = allbinary_java:to_string('DatabaseEncoder':decode((get({IData, '$class'})):readUTF(IData))),
                    DecryptedPort = allbinary_java:to_string('DatabaseEncoder':decode((get({IData, '$class'})):readUTF(IData))),
                    (get({This, '$class'})):setJdbcDriver(This, (fun(Target_N69622) -> (get({Target_N69622, '$class'})):decrypt(Target_N69622, DecryptedJdbcDriver) end)('WeakCrypt':new(1))),
                    (get({This, '$class'})):setName(This, (fun(Target_N69678) -> (get({Target_N69678, '$class'})):decrypt(Target_N69678, DecryptedName) end)('WeakCrypt':new(2))),
                    (get({This, '$class'})):setUserName(This, (fun(Target_N69734) -> (get({Target_N69734, '$class'})):decrypt(Target_N69734, DecryptedUserName) end)('WeakCrypt':new(3))),
                    (get({This, '$class'})):setPassword(This, (fun(Target_N69790) -> (get({Target_N69790, '$class'})):decrypt(Target_N69790, DecryptedPassword) end)('WeakCrypt':new(4))),
                    (get({This, '$class'})):setSchema(This, (fun(Target_N69846) -> (get({Target_N69846, '$class'})):decrypt(Target_N69846, DecryptedSchema) end)('WeakCrypt':new(5))),
                    (get({This, '$class'})):setServer(This, (fun(Target_N69902) -> (get({Target_N69902, '$class'})):decrypt(Target_N69902, DecryptedServer) end)('WeakCrypt':new(6))),
                    (get({This, '$class'})):setPort(This, (fun(Target_N69958) -> (get({Target_N69958, '$class'})):decrypt(Target_N69958, DecryptedPort) end)('WeakCrypt':new(7))),
                    StringUtil = 'StringUtil':getInstance()
                after
                    (fun(Target_N68976) -> (get({Target_N68976, '$class'})):close(Target_N68976, IData) end)('StreamUtil':getInstance())
                end;
                false ->
                put({This, hasRead}, false),
                case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADER'})) of
                    true ->
                    'PreLogUtil':put(lists:concat(["Not a File - Failed Loading: ", (get({FILEABPATH, '$class'})):toString(FILEABPATH)]), This, get({get({This, commonStrings}), 'LOAD'}));
                    false -> ok
                end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                'PreLogUtil':putOE(lists:concat(["Failed Loading: ", (get({FILEABPATH, '$class'})):toString(FILEABPATH)]), This, get({get({This, commonStrings}), 'LOAD'}), E);
                false -> ok
            end
        end.

setHasRead(This, Value) when is_boolean(Value) ->
        put({This, hasRead}, Value).

updateIfNeeded(This) ->
        try
            case (not get({This, hasRead})) of
                true ->
                put({This, hasRead}, true),
                (get({This, '$class'})):load(This);
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADERERROR'})) of
                true ->
                'PreLogUtil':putOE(get({get({This, commonStrings}), 'EXCEPTION'}), This, "updateIfNeeded", E);
                false -> ok
            end
        end.

getName(This) ->
        (get({This, '$class'})):updateIfNeeded(This),
        case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADER'})) of
            true ->
            'PreLogUtil':put(lists:concat(["Name: ", 'DbConnectionInfo':getName(This)]), This, "getName");
            false -> ok
        end,
        'DbConnectionInfo':getName(This).

getUserName(This) ->
        (get({This, '$class'})):updateIfNeeded(This),
        case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'PRELOADER'})) of
            true ->
            'PreLogUtil':put(lists:concat(["Name: ", 'DbConnectionInfo':getUserName(This)]), This, "getUserName");
            false -> ok
        end,
        'DbConnectionInfo':getUserName(This).

getPassword(This) ->
        (get({This, '$class'})):updateIfNeeded(This),
        'DbConnectionInfo':getPassword(This).

getSchema(This) ->
        (get({This, '$class'})):updateIfNeeded(This),
        'DbConnectionInfo':getSchema(This).

getServer(This) ->
        (get({This, '$class'})):updateIfNeeded(This),
        'DbConnectionInfo':getServer(This).

getPort(This) ->
        (get({This, '$class'})):updateIfNeeded(This),
        'DbConnectionInfo':getPort(This).

