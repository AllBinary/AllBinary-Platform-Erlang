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
% package org.allbinary.input.automation.module.generic
% import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface
% import org.allbinary.input.automation.module.osgi.InputAutomationModuleServiceFactory
% import org.allbinary.logic.communication.log.LogUtil

-module('InputAutomationGenericModuleServiceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('InputAutomationModuleServiceFactory', Function, Arguments).

static_init() ->
    put({?MODULE, inputAutomationGenericModuleServiceFactory}, 'InputAutomationGenericModuleServiceFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'InputAutomationModuleServiceFactory':'$init'(This),
    init_fields(This),
        try
            InputAutomationModuleInterfaceArray = array:new(1, {default, undefined}),
            array:set(0, 'GenericModuleFactory':new(), InputAutomationModuleInterfaceArray),
            (get({This, '$class'})):setInputAutomationModuleInterfaceArray(This, InputAutomationModuleInterfaceArray)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}), E)
        end.

getInstance() ->
        get({'InputAutomationGenericModuleServiceFactory', inputAutomationGenericModuleServiceFactory}).

