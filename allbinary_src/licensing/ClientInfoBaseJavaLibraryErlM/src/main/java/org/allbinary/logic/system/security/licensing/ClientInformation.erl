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
% import org.allbinary.TsUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.system.hardware.HardwareInterface
% import org.allbinary.logic.system.hardware.SystemHardwareFactory
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.logic.system.os.NoOperatingSystem
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListUtil
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('ClientInformation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AbeClientInformationInterface

init_fields(This) ->
    put({This, operatingSystemInterface}, get({'NoOperatingSystem', 'NO_OPERATING_SYSTEM'})),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    put({This, name}, undefined),
    put({This, shortName}, undefined),
    put({This, version}, undefined),
    put({This, specialName}, undefined),
    put({This, hardSale}, true),
    put({This, licenseId}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, licenseServers}, (fun(Target_N66284) -> (get({Target_N66284, '$class'})):getImmutableInstance(Target_N66284) end)('BasicArrayListUtil':getInstance())),
    ok.


new(Name, Version, SpecialName, ShortName) when (is_list(Name) orelse Name =:= undefined), (is_list(Version) orelse Version =:= undefined), (is_list(SpecialName) orelse SpecialName =:= undefined), (is_list(ShortName) orelse ShortName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, Version, SpecialName, ShortName),
    This.

init(This, Name, Version, SpecialName, ShortName) when (is_list(Name) orelse Name =:= undefined), (is_list(Version) orelse Version =:= undefined), (is_list(SpecialName) orelse SpecialName =:= undefined), (is_list(ShortName) orelse ShortName =:= undefined) ->
    init_fields(This),
        put({This, name}, Name),
        put({This, version}, Version),
        put({This, specialName}, SpecialName),
        put({This, shortName}, (fun(Target_N66433) -> (get({Target_N66433, '$class'})):toString(Target_N66433) end)((fun(Target_N66440) -> (get({Target_N66440, '$class'})):append(Target_N66440, Version) end)((fun(Target_N66447) -> (get({Target_N66447, '$class'})):append(Target_N66447, get({'CommonSeps':getInstance(), 'UNDERSCORE'})) end)((fun(Target_N66454) -> (get({Target_N66454, '$class'})):append(Target_N66454, ShortName) end)('StringMaker':new()))))),
        (get({This, '$class'})):init(This).

init(This) ->
        ok.

getOperatingSystemInterface(This) ->
        get({This, operatingSystemInterface}).

getName(This) ->
        get({This, name}).

getSpecialName(This) ->
        get({This, specialName}).

getVersion(This) ->
        get({This, version}).

getLicenseId(This) ->
        get({This, licenseId}).

getLicenseServers(This) ->
        get({This, licenseServers}).

getLicenseServer(This, Index) when is_integer(Index) ->
        array:get(Index, get({get({This, licenseServers}), objectArray})).

getNumberOfLicenseServers(This) ->
        (get({get({This, licenseServers}), '$class'})):size(get({This, licenseServers})).

toHashtable(This) ->
        AbeClientInformationData = 'AbeClientInformationData':getInstance(),
        GenericOperatingSystem = (get({This, '$class'})):getOperatingSystemInterface(This),
        ClientInfoHashtable = (fun(Target_N67341) -> (get({Target_N67341, '$class'})):createHashtable(Target_N67341) end)('StdUtil':getInstance()),
        (get({ClientInfoHashtable, '$class'})):put(ClientInfoHashtable, get({AbeClientInformationData, 'NAME'}), get({This, name})),
        (get({ClientInfoHashtable, '$class'})):put(ClientInfoHashtable, get({AbeClientInformationData, 'VERSION'}), get({This, version})),
        (get({ClientInfoHashtable, '$class'})):put(ClientInfoHashtable, get({AbeClientInformationData, 'SPECIALNAME'}), get({This, specialName})),
        (get({ClientInfoHashtable, '$class'})):put(ClientInfoHashtable, get({AbeClientInformationData, 'LICENSEID'}), (get({This, '$class'})):getLicenseId(This)),
        (get({ClientInfoHashtable, '$class'})):put(ClientInfoHashtable, get({AbeClientInformationData, 'OSNAME'}), (get({GenericOperatingSystem, '$class'})):getName(GenericOperatingSystem)),
        (get({ClientInfoHashtable, '$class'})):put(ClientInfoHashtable, get({AbeClientInformationData, 'OSARCH'}), (get({GenericOperatingSystem, '$class'})):getArch(GenericOperatingSystem)),
        (get({ClientInfoHashtable, '$class'})):put(ClientInfoHashtable, get({AbeClientInformationData, 'OSVERSION'}), (get({GenericOperatingSystem, '$class'})):getVersion(GenericOperatingSystem)),
        (get({ClientInfoHashtable, '$class'})):put(ClientInfoHashtable, get({AbeClientInformationData, 'OS'}), (get({GenericOperatingSystem, '$class'})):toString(GenericOperatingSystem)),
        HardwareInterface = (fun(Target_N67838) -> (get({Target_N67838, '$class'})):getInstance(Target_N67838, GenericOperatingSystem) end)('SystemHardwareFactory':getInstance()),
        HardwareString = (get({HardwareInterface, '$class'})):toString(HardwareInterface),
        (get({ClientInfoHashtable, '$class'})):put(ClientInfoHashtable, get({AbeClientInformationData, 'HARDWARE'}), HardwareString),
        ClientInfoHashtable.

isSameId(This, AlicenseId) when (is_list(AlicenseId) orelse AlicenseId =:= undefined) ->
        try
        case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), (get({This, '$class'})):getLicenseId(This), AlicenseId) =:= 0) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

isLargerOrDifferentServerList(This, List) ->
        try
        Size = ((get({List, '$class'})):size(List) - 1),
        CurrentSize = ((get({get({This, licenseServers}), '$class'})):size(get({This, licenseServers})) - 1),
        case (Size > CurrentSize) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        lists:foreach(fun(Index) ->
            NewServerName = array:get(Index, get({List, objectArray})),
            lists:foreach(fun(Index2) ->
                NextOldServerName = array:get(Index, get({get({This, licenseServers}), objectArray})),
                case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), NewServerName, NextOldServerName) =/= 0) of
                    true ->
                    throw({'$return', true});
                    false -> ok
                end
            end, lists:seq(CurrentSize, 0, -1))
        end, lists:seq(Size, 0, -1)),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setHardSale(This, HardSale) when is_boolean(HardSale) ->
        put({This, hardSale}, HardSale).

isHardSale(This) ->
        get({This, hardSale}).

setOperatingSystemInterface(This, OperatingSystemInterface) ->
        put({This, operatingSystemInterface}, OperatingSystemInterface).

setLicenseId(This, LicenseId) when (is_list(LicenseId) orelse LicenseId =:= undefined) ->
        put({This, licenseId}, LicenseId).

setLicenseServers(This, LicenseServers) ->
        put({This, licenseServers}, LicenseServers).

toShortString(This) ->
        get({This, shortName}).

