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
% package org.allbinary.logic.system.os
% import org.allbinary.logic.communication.log.Log
% import org.allbinary.logic.communication.log.LogFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.os.linux.LinuxOperatingSystemFactory
% import org.allbinary.logic.system.os.solaris.SolarisOperatingSystemFactory
% import org.allbinary.logic.system.os.windows.WindowsOperatingSystemFactory
% import org.allbinary.string.CommonStrings

-module('OperatingSystemFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OperatingSystemFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, genericOperatingSystem}, get({'NoOperatingSystem', 'NO_OPERATING_SYSTEM'})),
    put({This, hasDetected}, false),
    ok.


getInstance() ->
        get({'OperatingSystemFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getOperatingSystemInstance(This) ->
        try
            OperatingSystems = 'OperatingSystems':getInstance(),
            SystemProperties = 'SystemProperties':getInstance(),
            OsName = (get({SystemProperties, '$class'})):getName(SystemProperties),
            OsArch = (get({SystemProperties, '$class'})):getArch(SystemProperties),
            OsVersion = (get({SystemProperties, '$class'})):getVersion(SystemProperties),
            case (not get({This, hasDetected})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["osName: ", OsName]), This, get({get({This, commonStrings}), 'GET_INSTANCE'})),
                put({This, hasDetected}, true),
                case (allbinary_java:index_of(OsName, get({OperatingSystems, 'LINUX'})) >= 0) of
                    true ->
                    case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'FACTORYERROR'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Found a Linux OS", This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
                        false -> ok
                    end,
                    put({This, genericOperatingSystem}, (fun(Target_N67359) -> (get({Target_N67359, '$class'})):getOperatingSystemInstance(Target_N67359) end)('LinuxOperatingSystemFactory':getInstance()));
                    false ->
                    case (allbinary_java:index_of(OsName, get({OperatingSystems, 'WINDOWS'})) >= 0) of
                    true ->
                    case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'FACTORYERROR'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Found a Windows OS", This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
                        false -> ok
                    end,
                    put({This, genericOperatingSystem}, (fun(Target_N67193) -> (get({Target_N67193, '$class'})):getOperatingSystemInstance(Target_N67193) end)('WindowsOperatingSystemFactory':getInstance()));
                    false ->
                    case (allbinary_java:index_of(OsName, get({OperatingSystems, 'SOLARIS'})) >= 0) of
                    true ->
                    case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'FACTORYERROR'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Found a Solaris OS", This, get({get({This, commonStrings}), 'GET_INSTANCE'}));
                        false -> ok
                    end,
                    put({This, genericOperatingSystem}, (fun(Target_N67027) -> (get({Target_N67027, '$class'})):getOperatingSystemInstance(Target_N67027) end)('SolarisOperatingSystemFactory':getInstance()));
                    false ->
                    erlang:error({'Exception', (fun(Target_N66831) -> (get({Target_N66831, '$class'})):toString(Target_N66831) end)((fun(Target_N66838) -> (get({Target_N66838, '$class'})):append(Target_N66838, OsName) end)((fun(Target_N66845) -> (get({Target_N66845, '$class'})):append(Target_N66845, "OS Not Supported: ") end)('StringMaker':new())))})
                end
                end
                end,
                Log = 'LogFactory':getInstanceF((fun(Target_N67416) -> (get({Target_N67416, '$class'})):toString(Target_N67416) end)((fun(Target_N67423) -> (get({Target_N67423, '$class'})):append(Target_N67423, (fun(Target_N67459) -> (get({Target_N67459, '$class'})):toString(Target_N67459, get({This, genericOperatingSystem})) end)('StringUtil':getInstance())) end)((fun(Target_N67430) -> (get({Target_N67430, '$class'})):append(Target_N67430, "OperatingSystem Info: ") end)('StringMaker':new()))), This, get({get({This, commonStrings}), 'GET_INSTANCE'})),
                io:format("~ts~n", [allbinary_java:to_string((get({Log, '$class'})):toString(Log))]),
                (get({get({This, logUtil}), '$class'})):putL(get({This, logUtil}), Log);
                false -> ok
            end,
            get({This, genericOperatingSystem})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'FACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'GET_INSTANCE'}), E);
                false -> ok
            end,
            get({'NoOperatingSystem', 'NO_OPERATING_SYSTEM'})
        end.

