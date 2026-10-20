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
% import bundle.input.automation.module.InputAutomationModuleService
% import org.allbinary.input.automation.InputAutomationJFrame
% import org.allbinary.input.automation.configuration.InputAutomationConfigurationUtil
% import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.osgi.OSGIServiceInterface
% import org.allbinary.osgi.OSGIServiceVisitorInterface
% import org.allbinary.string.CommonStrings

-module('InputAutomationModuleOSGIServiceVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements OSGIServiceVisitorInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

visit(This, AnyType) ->
        (get({This, '$class'})):visit(This, AnyType);
visit(This, OsgiServiceInterface) ->
        try
            InputAutomationModuleService = OsgiServiceInterface,
            InputAutomationModuleInterfaceArray = (get({InputAutomationModuleService, '$class'})):getInputAutomationModuleInterfaceArray(InputAutomationModuleService),
            lists:foreach(fun(Index) ->
                (fun(Target_N66193) -> (get({Target_N66193, '$class'})):onAdd(Target_N66193, 'InputAutomationConfigurationUtil':getChangeEvent(array:get(Index, InputAutomationModuleInterfaceArray))) end)('InputAutomationJFrame':getInstance())
            end, lists:seq(0, array:size(InputAutomationModuleInterfaceArray) - 1)),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "visit", E),
            false
        end.


