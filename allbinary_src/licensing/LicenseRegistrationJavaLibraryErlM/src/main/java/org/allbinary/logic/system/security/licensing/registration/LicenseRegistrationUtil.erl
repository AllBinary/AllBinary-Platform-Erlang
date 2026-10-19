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
% package org.allbinary.logic.system.security.licensing.registration
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.canvas.SpecialMessageUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.util.ABHashtable

-module('LicenseRegistrationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

process(AbeClientInformation, RegistrationId) when (is_list(RegistrationId) orelse RegistrationId =:= undefined) ->
        try
            CommonStrings = 'CommonStrings':getInstance(),
            'PreLogUtil':put(lists:concat([get({'CommonLabels':getInstance(), 'START_LABEL'}), "License Registration"]), "LicenseRegistrationUtil", get({CommonStrings, 'PROCESS'})),
            RegistrationConfiguration = 'RegistrationConfiguration':getInstance(),
            (get({RegistrationConfiguration, '$class'})):setRegistrationCode(RegistrationConfiguration, RegistrationId),
            (get({RegistrationConfiguration, '$class'})):write(RegistrationConfiguration),
            Hashtable = (get({AbeClientInformation, '$class'})):toHashtable(AbeClientInformation),
            (get({Hashtable, '$class'})):put(Hashtable, get({'RegistrationConfiguration':getInstance(), 'NAME'}), RegistrationId),
            (get({Hashtable, '$class'})):put(Hashtable, "message", (fun(Target_N66186) -> (get({Target_N66186, '$class'})):get(Target_N66186) end)('SpecialMessageUtil':getInstance())),
            (fun(Target_N66216) -> (get({Target_N66216, '$class'})):get(Target_N66216, Hashtable) end)('XmlRpcRemoteLicenseRegistrationClient':new(AbeClientInformation))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            'PreLogUtil':putOE("License Registration Exception", "LicenseRegistrationUtil", "License Registration", E)
        end.

