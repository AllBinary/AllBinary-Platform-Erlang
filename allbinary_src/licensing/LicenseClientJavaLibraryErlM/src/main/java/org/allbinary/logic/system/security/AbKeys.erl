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
% package org.allbinary.logic.system.security
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.AbeLicenseInterfaceFactory
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('AbKeys').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AbKeys':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'AbKeys', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws LicensingException
getKey(This, AbeClientInformation, KeyName) when (is_list(KeyName) orelse KeyName =:= undefined) ->
        try
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Getting Key: ", KeyName]), This, "getKey"),
            case (((((get({KeyName, '$class'})):compareTo(KeyName, "DirectX 8") =:= 0) orelse ((get({KeyName, '$class'})):compareTo(KeyName, "DirectX") =:= 0)) orelse ((get({KeyName, '$class'})):compareTo(KeyName, "Low Level") =:= 0)) orelse ((get({KeyName, '$class'})):compareTo(KeyName, "System Drivers") =:= 0)) of
                true ->
                throw({'$return', "Temp For Input Library"});
                false -> ok
            end,
            (fun(Target_N66154) -> (get({Target_N66154, '$class'})):getKey(Target_N66154, KeyName) end)((fun(Target_N66161) -> (get({Target_N66161, '$class'})):getLicenseInstance(Target_N66161, AbeClientInformation) end)('AbeLicenseInterfaceFactory':getInstance()))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

