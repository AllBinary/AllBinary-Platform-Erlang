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
% package org.allbinary.logic.system.loader
% import org.allbinary.logic.system.security.AbKeys
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('SecuredNativeLibraryHelperWrapper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('NativeLibraryHelperWrapper', Function, Arguments).

init_fields(This) ->
    put({This, securedNativeLibraryInterface}, undefined),
    ok.


new(SecuredNativeLibraryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, SecuredNativeLibraryInterface),
    This.

'$init'(This, SecuredNativeLibraryInterface) ->
        'NativeLibraryHelperWrapper':'$init'(This, (get({SecuredNativeLibraryInterface, '$class'})):getLibraryName(SecuredNativeLibraryInterface)),
        init_fields(This),
        put({This, securedNativeLibraryInterface}, SecuredNativeLibraryInterface).

% throws LicensingException
unlock(This, AbeClientInformation) ->
        (get({get({This, securedNativeLibraryInterface}), '$class'})):unlock(get({This, securedNativeLibraryInterface}), (fun(Target_N65876) -> (get({Target_N65876, '$class'})):getKey(Target_N65876, AbeClientInformation, (get({get({This, securedNativeLibraryInterface}), '$class'})):getName(get({This, securedNativeLibraryInterface}))) end)('AbKeys':getInstance())).

