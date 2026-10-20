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
% package org.allbinary.logic.system.security.licensing.client
% import org.allbinary.business.init.LicenseInitInfo
% import org.allbinary.business.init.LicenseInitInfoUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.AbeLicenseInterface
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList

-module('AbeLicenseClient').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'MINSERVERS'}, 3),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
get(This, AbeClientInformation) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'GET'})),
            XmlRpcAbeLicenseClient = 'XmlRpcAbeLicenseRetrievalClient':new(AbeClientInformation),
            AbeLicenseInterface = (get({XmlRpcAbeLicenseClient, '$class'})):get(XmlRpcAbeLicenseClient, undefined),
            LicenseId = (get({AbeLicenseInterface, '$class'})):getLicenseId(AbeLicenseInterface),
            Servers = (get({AbeLicenseInterface, '$class'})):getServers(AbeLicenseInterface),
            put({local, isNewLicenseId}, false),
            put({local, isBetterServerList}, false),
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            case ((get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({AbeClientInformation, '$class'})):getLicenseId(AbeClientInformation)) andalso (not (get({AbeClientInformation, '$class'})):isSameId(AbeClientInformation, LicenseId))) of
                true ->
                put({local, isNewLicenseId}, true);
                false -> ok
            end,
            case (((get({Servers, '$class'})):size(Servers) >= get({This, 'MINSERVERS'})) andalso (get({AbeClientInformation, '$class'})):isLargerOrDifferentServerList(AbeClientInformation, Servers)) of
                true ->
                put({local, isBetterServerList}, true);
                false -> ok
            end,
            case (get({local, isBetterServerList}) orelse get({local, isNewLicenseId})) of
                true ->
                InitInfo = (fun(Target_N66711) -> (get({Target_N66711, '$class'})):read(Target_N66711) end)('LicenseInitInfoUtil':getInstance()),
                (get({InitInfo, '$class'})):setLicenseId(InitInfo, LicenseId),
                (get({InitInfo, '$class'})):setServerList(InitInfo, Servers),
                (fun(Target_N66816) -> (get({Target_N66816, '$class'})):write(Target_N66816, InitInfo) end)('LicenseInitInfoUtil':getInstance()),
                (get({AbeClientInformation, '$class'})):init(AbeClientInformation);
                false -> ok
            end,
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'END'}), This, get({get({This, commonStrings}), 'GET'})),
            AbeLicenseInterface
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end.

