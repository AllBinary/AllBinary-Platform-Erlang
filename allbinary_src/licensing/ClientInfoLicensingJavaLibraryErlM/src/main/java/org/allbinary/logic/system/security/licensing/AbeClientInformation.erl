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
% import org.allbinary.business.init.LicenseInitInfo
% import org.allbinary.business.init.LicenseInitInfoUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.system.os.OperatingSystemFactory
% import org.allbinary.string.CommonStrings

-module('AbeClientInformation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ClientInformation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(Name, Version, SpecialName, ShortName) when (is_list(Name) orelse Name =:= undefined), (is_list(Version) orelse Version =:= undefined), (is_list(SpecialName) orelse SpecialName =:= undefined), (is_list(ShortName) orelse ShortName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, Version, SpecialName, ShortName),
    This.

init(This, Name, Version, SpecialName, ShortName) when (is_list(Name) orelse Name =:= undefined), (is_list(Version) orelse Version =:= undefined), (is_list(SpecialName) orelse SpecialName =:= undefined), (is_list(ShortName) orelse ShortName =:= undefined) ->
        'ClientInformation':init(This, Name, Version, SpecialName, ShortName),
        init_fields(This).

init(This) ->
        try
            (get({This, '$class'})):setOperatingSystemInterface(This, (fun(Target_N66100) -> (get({Target_N66100, '$class'})):getOperatingSystemInstance(Target_N66100) end)('OperatingSystemFactory':getInstance())),
            LicenseInitInfo = (fun(Target_N66145) -> (get({Target_N66145, '$class'})):read(Target_N66145) end)('LicenseInitInfoUtil':getInstance()),
            (get({This, '$class'})):setLicenseId(This, (get({LicenseInitInfo, '$class'})):getLicenseId(LicenseInitInfo)),
            (get({This, '$class'})):setLicenseServers(This, (get({LicenseInitInfo, '$class'})):getServerList(LicenseInitInfo)),
            StringValidationUtil = 'StringValidationUtil':getInstance(),
            case (get({StringValidationUtil, '$class'})):isEmpty(StringValidationUtil, (get({This, '$class'})):getLicenseId(This)) of
                true ->
                NONE = "No License Id",
                (get({This, '$class'})):setLicenseId(This, NONE);
                false -> ok
            end,
            put({local, commonStrings}, 'CommonStrings':getInstance()),
            'PreLogUtil':put((fun(Target_N66478) -> (get({Target_N66478, '$class'})):toString(Target_N66478) end)((fun(Target_N66485) -> (get({Target_N66485, '$class'})):append(Target_N66485, (get({This, '$class'})):getSpecialName(This)) end)((fun(Target_N66492) -> (get({Target_N66492, '$class'})):append(Target_N66492, "Special Name: ") end)('StringMaker':new()))), This, get({get({local, commonStrings}), 'CONSTRUCTOR'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            LogUtil = 'LogUtil':getInstance(),
            put({local, commonStrings}, 'CommonStrings':getInstance()),
            (get({LogUtil, '$class'})):put(LogUtil, get({get({local, commonStrings}), 'EXCEPTION'}), This, get({get({local, commonStrings}), 'CONSTRUCTOR'}), E)
        end.

