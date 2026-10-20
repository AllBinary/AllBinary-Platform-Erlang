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
% package org.allbinary.business.init.db
% import org.allbinary.logic.system.loader.AbeFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('InitDbHelperFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'CLASSNAME'}, "org.allbinary.business.installer.InitDbCrypted"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws LicensingException
getInstance(AbeClientInformation, DatabaseConnectionInfoInterface) ->
        Params = array:new(1, {default, undefined}),
        Classes = array:new(1, {default, undefined}),
        array:set(0, 'DatabaseConnectionInfoInterface', Classes),
        array:set(0, DatabaseConnectionInfoInterface, Params),
        AnyType = (fun(Target_N65986) -> (get({Target_N65986, '$class'})):getInstance(Target_N65986, AbeClientInformation, get({'InitDbHelperFactory', 'CLASSNAME'}), Classes, Params) end)('AbeFactory':getInstance()),
        AnyType.

% throws LicensingException
getInstance(AbeClientInformation) ->
        AnyType = (fun(Target_N66177) -> (get({Target_N66177, '$class'})):getInstance(Target_N66177, AbeClientInformation, get({'InitDbHelperFactory', 'CLASSNAME'}), undefined, undefined) end)('AbeFactory':getInstance()),
        AnyType.

