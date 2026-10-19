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
% import org.allbinary.TsUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.logic.system.os.NoOperatingSystem
% import org.allbinary.logic.system.os.OperatingSystems
% import org.allbinary.logic.system.os.SystemProperties
% import org.allbinary.string.CommonStrings

-module('AndroidOperatingSystemFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AndroidOperatingSystemFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, tsUtil}, 'TsUtil':getInstance()),
    ok.


getInstance() ->
        get({'AndroidOperatingSystemFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getOperatingSystemInstance(This) ->
        try
            put({local, 'GenericOperatingSystem'}, undefined),
            SystemProperties = 'SystemProperties':getInstance(),
            OsName = (get({SystemProperties, '$class'})):getName(SystemProperties),
            case ((get({get({This, tsUtil}), '$class'})):compareTo(get({This, tsUtil}), OsName, get({'OperatingSystems':getInstance(), 'ANDROID'})) =:= 0) of
                true ->
                put({local, 'GenericOperatingSystem'}, 'AndroidOS':new());
                false ->
                case (fun(Target_N66249) -> (get({Target_N66249, '$class'})):isUnknownSpecificOSAllowed(Target_N66249) end)('OperatingSystems':getInstance()) of
                    true ->
                    put({local, 'GenericOperatingSystem'}, 'AndroidOS':new());
                    false ->
                    erlang:error({'Exception', lists:concat(["Specific Android OS Not Supported: ", OsName])})
                end
            end,
            get({local, 'GenericOperatingSystem'})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to get OperatingSystem returning NoOperatingSystem", This, get({CommonStrings, 'GET_INSTANCE'}), E),
            get({'NoOperatingSystem', 'NO_OPERATING_SYSTEM'})
        end.

