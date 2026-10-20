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
% package org.allbinary.bundle.logic.system.loader
% import java.io.ByteArrayInputStream
% import java.io.InputStream
% import org.allbinary.globals.Globals
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.gui.dialog.BasicTextJDialog
% import org.allbinary.gui.dialog.ExitCloseListener
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.AbCryptUtil
% import org.allbinary.logic.system.security.AbKeys
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.AbeLicenseInterface
% import org.allbinary.logic.system.security.licensing.AbeLicenseInterfaceFactory
% import org.allbinary.logic.system.security.licensing.AbeNoLicense
% import org.allbinary.logic.system.security.licensing.LicensingException
% import org.allbinary.string.CommonStrings

-module('CryptService').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, abCryptUtil}, 'AbCryptUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        (fun(Target_N66234) -> (get({Target_N66234, '$class'})):init(Target_N66234, (get({get({This, '$class'}), '$class'})):getClassLoader(get({This, '$class'})), "./") end)('Globals':getInstance()),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Set Globals: ", (get({get({'CryptService', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'CryptService', 'URLGLOBALS'}))]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})).

getDecryptedInputStream(This, AbeClientInformation, Name, InputStream) when (is_list(Name) orelse Name =:= undefined) ->
        try
            Key = (fun(Target_N66406) -> (get({Target_N66406, '$class'})):getKey(Target_N66406, AbeClientInformation, Name) end)('AbKeys':getInstance()),
            Decrypted = (get({get({This, abCryptUtil}), '$class'})):decrypt(get({This, abCryptUtil}), InputStream, Key),
            'ByteArrayInputStream':new(Decrypted)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({This, '$class'})):showLicenseDialog(This, AbeClientInformation, E)
        end,
        undefined.

showLicenseDialog(This, AbeClientInformation, E) ->
        try
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E),
            BasicTextJDialog = 'BasicTextJDialog':new(allbinary_java:to_string(E)),
            try
                AbeLicenseInterface = (fun(Target_N66985) -> (get({Target_N66985, '$class'})):getLicenseInstance(Target_N66985, AbeClientInformation) end)('AbeLicenseInterfaceFactory':getInstance()),
                case (AbeLicenseInterface =/= 'AbeNoLicense':getInstance()) of
                    true ->
                    case (get({AbeLicenseInterface, '$class'})):isValid(AbeLicenseInterface) of
                        true ->
                        (get({BasicTextJDialog, '$class'})):setText(BasicTextJDialog, "Subscription Invalid");
                        false -> ok
                    end;
                    false -> ok
                end
            catch _:E2 when E2 =/= '$break', E2 =/= '$continue', (not is_tuple(E2) orelse element(1, E2) =/= '$return') ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E2)
            end,
            (get({BasicTextJDialog, '$class'})):addCloseListener(BasicTextJDialog, 'ExitCloseListener':new()),
            (get({BasicTextJDialog, '$class'})):setVisible(BasicTextJDialog, true)
        catch _:E3 when E3 =/= '$break', E3 =/= '$continue', (not is_tuple(E3) orelse element(1, E3) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E3)
        end.

