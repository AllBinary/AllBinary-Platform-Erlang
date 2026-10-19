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
% package org.allbinary.logic.system.os.android
% import org.allbinary.android.AndroidInfoFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.string.CommonSeps

-module('AndroidOS').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GenericOperatingSystem', Function, Arguments).

init_fields(This) ->
    put({This, stringBuffer}, 'StringMaker':new()),
    put({This, 'DEVICE_ID'}, "DeviceId"),
    put({This, 'DEVICE_SOFTWARE_VERSION'}, "DeviceSoftwareVersion"),
    put({This, 'LINE_1_NUMBER'}, "Line1Number"),
    put({This, 'OUYA'}, "ouya"),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'GenericOperatingSystem':init(This),
    init_fields(This),
        SDK_VERSION = (fun(Target_N65905) -> (get({Target_N65905, '$class'})):getVersion(Target_N65905) end)('AndroidInfoFactory':getInstance()),
        case (SDK_VERSION > 10) of
            true ->
            put({This, scalable}, true);
            false -> ok
        end,
        Properties = 'AndroidSystemProperties':getInstance(),
        CommonStrings = 'CommonSeps':getInstance(),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({This, 'DEVICE_ID'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getDeviceId(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({This, 'DEVICE_SOFTWARE_VERSION'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getDeviceSoftwareVersion(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({This, 'LINE_1_NUMBER'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getLine1Number(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "NetworkCountryIso"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getNetworkCountryIso(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "NetworkOperator"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getNetworkOperator(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "NetworkOperatorName"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getNetworkOperatorName(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "NetworkType"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):appendint(get({This, stringBuffer}), trunc((get({Properties, '$class'})):getNetworkType(Properties))),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "PhoneType"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):appendint(get({This, stringBuffer}), trunc((get({Properties, '$class'})):getPhoneType(Properties))),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "SimCountryIso"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getSimCountryIso(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "SimOperator"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getSimOperator(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "SimOperatorName"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getSimOperatorName(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "SimSerialNumber"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getSimSerialNumber(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "SubscriberId"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getSubscriberId(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "VoiceMailAlphaTag"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getVoiceMailAlphaTag(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), "VoiceMailNumber"),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'EQUALS'})),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), (get({Properties, '$class'})):getVoiceMailNumber(Properties)),
        (get({get({This, stringBuffer}), '$class'})):append(get({This, stringBuffer}), get({CommonStrings, 'SPACE'})).

isOverScan(This) ->
        try
        Properties = 'AndroidSystemProperties':getInstance(),
        case (allbinary_java:index_of((fun(Target_N68582) -> (get({Target_N68582, '$class'})):toLowerCase(Target_N68582) end)((get({Properties, '$class'})):getDevice(Properties)), get({This, 'OUYA'})) >= 0) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getOverScanXPercent(This) ->
        90.

getOverScanYPercent(This) ->
        90.

toString(This) ->
        OsBuffer = 'StringMaker':new(),
        (get({OsBuffer, '$class'})):append(OsBuffer, 'GenericOperatingSystem':toString(This)),
        (get({OsBuffer, '$class'})):append(OsBuffer, get({'CommonSeps':getInstance(), 'SPACE'})),
        (get({OsBuffer, '$class'})):append(OsBuffer, "Other System Info: \n"),
        (get({OsBuffer, '$class'})):append(OsBuffer, (get({get({This, stringBuffer}), '$class'})):toString(get({This, stringBuffer}))),
        (get({OsBuffer, '$class'})):toString(OsBuffer).

