% Generated Code Do Not Modify
% package org.allbinary.logic.system.os.env
% import java.io.BufferedReader
% import java.io.InputStreamReader
% import java.util.Properties
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.logic.system.os.OperatingSystemFactory
% import org.allbinary.logic.system.os.OperatingSystems
% import org.allbinary.string.CommonStrings

-module('RuntimeEnvironmentVariables').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getTest1(This) ->
        'System':getProperty("java.java.home").

getVariable(This, Var) when (is_list(Var) orelse Var =:= undefined) ->
        EnvironmentVariables = (get({This, '$class'})):get(This),
        (get({EnvironmentVariables, '$class'})):getProperty(EnvironmentVariables, Var).

get(This) ->
        try
            put({local, process}, undefined),
            EnvironmentVariables = 'Properties':new(),
            OperatingSystemInterface = (fun(Target_N66214) -> (get({Target_N66214, '$class'})):getOperatingSystemInstance(Target_N66214) end)('OperatingSystemFactory':getInstance()),
            OsName = (get({OperatingSystemInterface, '$class'})):getName(OperatingSystemInterface),
            LinuxCommand = "env",
            WindowsCommand = "cmd.exe /c set",
            SolarisCommand = LinuxCommand,
            OperatingSystems = 'OperatingSystems':getInstance(),
            case ((get({OsName, '$class'})):compareTo(OsName, get({OperatingSystems, 'LINUX'})) =:= 0) of
                true ->
                put({local, process}, (fun(Target_N66741) -> (get({Target_N66741, '$class'})):exec(Target_N66741, LinuxCommand) end)('Runtime':getRuntime()));
                false ->
                case (allbinary_java:index_of(OsName, get({OperatingSystems, 'WINDOWS'})) >= 0) of
                true ->
                put({local, process}, (fun(Target_N66681) -> (get({Target_N66681, '$class'})):exec(Target_N66681, WindowsCommand) end)('Runtime':getRuntime()));
                false ->
                case ((get({OsName, '$class'})):compareTo(OsName, get({OperatingSystems, 'SOLARIS'})) =:= 0) of
                true ->
                put({local, process}, (fun(Target_N66621) -> (get({Target_N66621, '$class'})):exec(Target_N66621, SolarisCommand) end)('Runtime':getRuntime()));
                false ->
                erlang:error({'Exception'})
            end
            end
            end,
            ProcessInputStreamReader = 'InputStreamReader':new((get({get({local, process}), '$class'})):getInputStream(get({local, process}))),
            BufferedReader = 'BufferedReader':new(ProcessInputStreamReader),
            put({local, keyValuePair}, undefined),
            (fun Loop() -> case ((begin put({local, keyValuePair}, (get({BufferedReader, '$class'})):readLine(BufferedReader)), get({local, keyValuePair}) end) =/= undefined) of true ->
                Index = allbinary_java:index_of(get({local, keyValuePair}), $=),
                Key = string:slice(get({local, keyValuePair}), 0, (Index) - (0)),
                Value = string:slice(get({local, keyValuePair}), (Index + 1)),
                (get({EnvironmentVariables, '$class'})):put(EnvironmentVariables, Key, Value),
                Loop();
            false -> ok end end)(),
            EnvironmentVariables
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'OSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "get()", E);
                false -> ok
            end,
            undefined
        end.

getTempDir(This) ->
        try
            'System':getProperty("java.io.tmpdir")
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'OSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getTempDir()", E);
                false -> ok
            end,
            undefined
        end.

getLibraryPath(This) ->
        try
            'System':getProperty("java.library.path")
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'OSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getLibraryPath()", E);
                false -> ok
            end,
            undefined
        end.

getClassPath(This) ->
        try
            'System':getProperty("java.class.path")
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'OSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getClassPath()", E);
                false -> ok
            end,
            undefined
        end.

updateLibraryPath(This, LibPath) when (is_list(LibPath) orelse LibPath =:= undefined) ->
        try
            ExistingPath = (get({This, '$class'})):getLibraryPath(This),
            'System':setProperty("java.library.path", lists:concat([lists:concat([LibPath, ":"]), ExistingPath]))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'OSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "updateLibraryPath()", E);
                false -> ok
            end
        end.

getUserHome(This) ->
        try
            'System':getProperty("user.home")
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'OSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getUserHome()", E);
                false -> ok
            end,
            undefined
        end.

getUserDir(This) ->
        try
            'System':getProperty("user.dir")
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'OSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getUserDir()", E);
                false -> ok
            end,
            undefined
        end.

set(This) ->
        try
            ok
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'OSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "get()", E);
                false -> ok
            end
        end.

setVariable(This, Var, Val) when (is_list(Var) orelse Var =:= undefined), (is_list(Val) orelse Val =:= undefined) ->
        try
            put({local, process}, undefined),
            OperatingSystemInterface = (fun(Target_N70028) -> (get({Target_N70028, '$class'})):getOperatingSystemInstance(Target_N70028) end)('OperatingSystemFactory':getInstance()),
            OperatingSystems = 'OperatingSystems':getInstance(),
            OsName = (get({OperatingSystemInterface, '$class'})):getName(OperatingSystemInterface),
            WindowsCommand = lists:concat([lists:concat([lists:concat(["cmd.exe /c set", Var]), "="]), Val]),
            case ((get({OsName, '$class'})):compareTo(OsName, get({OperatingSystems, 'LINUX'})) =:= 0) of
                true ->
                erlang:error({'Exception'});
                false ->
                case (allbinary_java:index_of(OsName, get({OperatingSystems, 'WINDOWS'})) >= 0) of
                true ->
                put({local, process}, (fun(Target_N70432) -> (get({Target_N70432, '$class'})):exec(Target_N70432, WindowsCommand) end)('Runtime':getRuntime()));
                false ->
                case ((get({OsName, '$class'})):compareTo(OsName, get({OperatingSystems, 'SOLARIS'})) =:= 0) of
                true ->
                erlang:error({'Exception'});
                false ->
                erlang:error({'Exception'})
            end
            end
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'OSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "setVariable()", E);
                false -> ok
            end
        end.

