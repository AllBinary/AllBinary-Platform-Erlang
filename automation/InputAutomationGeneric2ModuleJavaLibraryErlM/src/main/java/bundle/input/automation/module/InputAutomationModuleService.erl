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
% package bundle.input.automation.module
% import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface

-module('InputAutomationModuleService').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements InputAutomationModuleServiceInterface

init_fields(This) ->
    put({This, inputAutomationModuleInterfaceArray}, undefined),
    ok.


new(InputAutomationModuleInterfaceArray) when (is_tuple(InputAutomationModuleInterfaceArray) orelse InputAutomationModuleInterfaceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, InputAutomationModuleInterfaceArray),
    This.

'$init'(This, InputAutomationModuleInterfaceArray) when (is_tuple(InputAutomationModuleInterfaceArray) orelse InputAutomationModuleInterfaceArray =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setInputAutomationModuleInterfaceArray(This, InputAutomationModuleInterfaceArray).

getInputAutomationModuleInterfaceArray(This) ->
        get({This, inputAutomationModuleInterfaceArray}).

setInputAutomationModuleInterfaceArray(This, InputAutomationModuleInterfaceArray) when (is_tuple(InputAutomationModuleInterfaceArray) orelse InputAutomationModuleInterfaceArray =:= undefined) ->
        put({This, inputAutomationModuleInterfaceArray}, InputAutomationModuleInterfaceArray).

