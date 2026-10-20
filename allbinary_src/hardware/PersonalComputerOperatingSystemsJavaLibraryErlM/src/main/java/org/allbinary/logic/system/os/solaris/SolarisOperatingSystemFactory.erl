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
% package org.allbinary.logic.system.os.solaris
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory
% import org.allbinary.logic.communication.log.config.type.LogConfigTypes
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.logic.system.os.NoOperatingSystem
% import org.allbinary.logic.system.os.OperatingSystems
% import org.allbinary.logic.system.os.SystemProperties
% import org.allbinary.string.CommonStrings

-module('SolarisOperatingSystemFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'SolarisOperatingSystemFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'SolarisOperatingSystemFactory', instance}).

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
            OsName = (fun(Target_N66139) -> (get({Target_N66139, '$class'})):getName(Target_N66139) end)('SystemProperties':getInstance()),
            put({local, operatingSystemInterface}, undefined),
            case ((get({OsName, '$class'})):compareTo(OsName, get({OperatingSystems, 'SOLARIS'})) =:= 0) of
                true ->
                put({local, operatingSystemInterface}, 'SolarisOS':new());
                false ->
                case (get({OperatingSystems, '$class'})):isUnknownSpecificOSAllowed(OperatingSystems) of
                    true ->
                    put({local, operatingSystemInterface}, 'SolarisOS':new());
                    false ->
                    erlang:error({'Exception', lists:concat(["Specific Solaris OS Not Supported: ", OsName])})
                end
            end,
            get({local, operatingSystemInterface})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({'LogConfigTypes', 'LOGGING'}), '$class'})):contains(get({'LogConfigTypes', 'LOGGING'}), get({'LogConfigTypeFactory':getInstance(), 'FACTORYERROR'})) of
                true ->
                CommonStrings = 'CommonStrings':getInstance(),
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E);
                false -> ok
            end,
            get({'NoOperatingSystem', 'NO_OPERATING_SYSTEM'})
        end.

