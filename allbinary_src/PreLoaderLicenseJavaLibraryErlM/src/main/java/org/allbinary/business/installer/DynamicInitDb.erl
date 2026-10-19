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
% package org.allbinary.business.installer
% import org.allbinary.business.init.db.DatabaseConnectionInfoInterface
% import org.allbinary.business.init.db.InitDbHelperFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.LicensingException

-module('DynamicInitDb').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InitDb', Function, Arguments).

init_fields(This) ->
    ok.


new(AbeClientInformation) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation),
    This.

init(This, AbeClientInformation) ->
    'InitDb':init(This),
    init_fields(This),
        (get({This, '$class'})):setHelper(This, 'InitDbHelperFactory':getInstance(AbeClientInformation)).

new(AbeClientInformation, DatabaseConnectionInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AbeClientInformation, DatabaseConnectionInfoInterface),
    This.

init(This, AbeClientInformation, DatabaseConnectionInfoInterface) ->
    'InitDb':init(This),
    init_fields(This),
        (get({This, '$class'})):setHelper(This, 'InitDbHelperFactory':getInstance(AbeClientInformation, DatabaseConnectionInfoInterface)).

