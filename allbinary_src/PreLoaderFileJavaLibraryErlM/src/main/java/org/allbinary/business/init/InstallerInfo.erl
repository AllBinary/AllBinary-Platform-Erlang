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
% import org.allbinary.globals.PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.AbDataInputStream
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.AbFileLocalInputStream
% import org.allbinary.logic.io.DataOutputStreamFactory
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.security.crypt.DatabaseEncoder
% import org.allbinary.logic.system.security.crypt.WeakCrypt

-module('InstallerInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InstallerInfo':new()),
    put({?MODULE, 'INITFILENAME'}, "installerdata.dat"),
    put({?MODULE, 'PACKAGE'}, get({(get({get({'InstallerInfo', 'PATH_GLOBALS'}), '$class'})):getInstance(get({'InstallerInfo', 'PATH_GLOBALS'})), 'INIT_PATH'})),
    put({?MODULE, userName}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({?MODULE, password}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({?MODULE, hasRead}, false),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
write(This) ->
        FILEABPATH = 'AbPath':new(((get({get({'InstallerInfo', 'URLGLOBALS'}), '$class'})):getMainPath(get({'InstallerInfo', 'URLGLOBALS'})) + get({'InstallerInfo', 'PACKAGE'})), get({'InstallerInfo', 'INITFILENAME'})),
        try
            NewFile = 'AbFile':createAbFileFromAbPath(FILEABPATH),
            (get({NewFile, '$class'})):createNewFile(NewFile),
            DataOutputStream = (fun(Target_N66540) -> (get({Target_N66540, '$class'})):getInstanceForAbFile(Target_N66540, NewFile) end)('DataOutputStreamFactory':getInstance()),
            CryptedUserName = (fun(Target_N66602) -> (get({Target_N66602, '$class'})):getBytes(Target_N66602) end)((fun(Target_N66609) -> (get({Target_N66609, '$class'})):encrypt(Target_N66609, (get({This, '$class'})):getUserName(This)) end)('WeakCrypt':new(1))),
            CryptedPassword = (fun(Target_N66679) -> (get({Target_N66679, '$class'})):getBytes(Target_N66679) end)((fun(Target_N66686) -> (get({Target_N66686, '$class'})):encrypt(Target_N66686, (get({This, '$class'})):getPassword(This)) end)('WeakCrypt':new(2))),
            (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, 'DatabaseEncoder':encode(CryptedUserName)),
            (get({DataOutputStream, '$class'})):writeUTF(DataOutputStream, 'DatabaseEncoder':encode(CryptedPassword)),
            put({'InstallerInfo', hasRead}, false)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRELOADERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Failed", This, "write");
                false -> ok
            end,
            erlang:error(E)
        end.

% throws Exception
read(This) ->
        FILEABPATH = 'AbPath':new(((get({get({'InstallerInfo', 'URLGLOBALS'}), '$class'})):getMainPath(get({'InstallerInfo', 'URLGLOBALS'})) + get({'InstallerInfo', 'PACKAGE'})), get({'InstallerInfo', 'INITFILENAME'})),
        try
            File = 'AbFile':createAbFileFromAbPath(FILEABPATH),
            case (get({File, '$class'})):isFile(File) of
                true ->
                IFile = 'AbFileLocalInputStream':new(File),
                IData = 'AbDataInputStream':new(IFile),
                DecryptedUserName = allbinary_java:to_string('DatabaseEncoder':decode((get({IData, '$class'})):readUTF(IData))),
                DecryptedPassword = allbinary_java:to_string('DatabaseEncoder':decode((get({IData, '$class'})):readUTF(IData))),
                (get({This, '$class'})):setUserName(This, (fun(Target_N67860) -> (get({Target_N67860, '$class'})):decrypt(Target_N67860, DecryptedUserName) end)('WeakCrypt':new(1))),
                (get({This, '$class'})):setPassword(This, (fun(Target_N67916) -> (get({Target_N67916, '$class'})):decrypt(Target_N67916, DecryptedPassword) end)('WeakCrypt':new(2)));
                false ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRELOADER'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Not a File - Failed Loading: ", (get({FILEABPATH, '$class'})):toString(FILEABPATH)]), This, "read");
                    false -> ok
                end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRELOADERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Failed", This, "read");
                false -> ok
            end
        end.

setHasRead(Value) when is_boolean(Value) ->
        put({'InstallerInfo', hasRead}, Value).

setUserName(This, UserName) when (is_list(UserName) orelse UserName =:= undefined) ->
        put({'InstallerInfo', userName}, UserName).

setPassword(This, Password) when (is_list(Password) orelse Password =:= undefined) ->
        put({'InstallerInfo', password}, Password).

% throws Exception
updateIfNeeded(This) ->
        case (not get({'InstallerInfo', hasRead})) of
            true ->
            put({'InstallerInfo', hasRead}, true),
            (get({This, '$class'})):read(This),
            case ((get({'InstallerInfo', userName}) =:= undefined) orelse (get({'InstallerInfo', password}) =:= undefined)) of
                true ->
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRELOADER'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Failed", This, "updateIfNeeded");
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end.

% throws Exception
getUserName(This) ->
        (get({This, '$class'})):updateIfNeeded(This),
        get({'InstallerInfo', userName}).

% throws Exception
getPassword(This) ->
        (get({This, '$class'})):updateIfNeeded(This),
        get({'InstallerInfo', password}).

% throws Exception
isValid(This, UserName, Password) when (is_list(UserName) orelse UserName =:= undefined), (is_list(Password) orelse Password =:= undefined) ->
        try
        (get({This, '$class'})):updateIfNeeded(This),
        case ((((get({?MODULE, userName}) =/= undefined) andalso ((get({get({?MODULE, userName}), '$class'})):compareTo(get({?MODULE, userName}), UserName) =:= 0)) andalso (get({?MODULE, password}) =/= undefined)) andalso ((get({get({?MODULE, password}), '$class'})):compareTo(get({?MODULE, password}), Password) =:= 0)) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

