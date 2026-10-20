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
% package org.allbinary.input.automation.module.osgi
% import org.osgi.framework.Bundle
% import org.osgi.framework.ServiceFactory
% import org.osgi.framework.ServiceRegistration
% import bundle.input.automation.module.InputAutomationModuleService
% import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('InputAutomationModuleServiceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ServiceFactory

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, inputAutomationModuleInterfaceArray}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getService(This, Bundle, Registration) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "getService"),
        'InputAutomationModuleService':new((get({This, '$class'})):getInputAutomationModuleInterfaceArray(This)).

ungetService(This, Bundle, Registration, Service) ->
        ok.

getInputAutomationModuleInterfaceArray(This) ->
        get({This, inputAutomationModuleInterfaceArray}).

setInputAutomationModuleInterfaceArray(This, InputAutomationModuleInterfaceArray) when (is_tuple(InputAutomationModuleInterfaceArray) orelse InputAutomationModuleInterfaceArray =:= undefined) ->
        put({This, inputAutomationModuleInterfaceArray}, InputAutomationModuleInterfaceArray).

