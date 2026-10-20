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
% package org.allbinary.input.automation.configuration
% import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration

-module('InputAutomationConfigurationModuleChangeEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, inputAutomationModuleConfiguration}, undefined),
    ok.


new(InputAutomationModuleConfiguration) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, InputAutomationModuleConfiguration),
    This.

'$init'(This, InputAutomationModuleConfiguration) ->
    init_fields(This),
        (get({This, '$class'})):setInputAutomationModuleConfiguration(This, InputAutomationModuleConfiguration).

getInputAutomationModuleConfiguration(This) ->
        get({This, inputAutomationModuleConfiguration}).

setInputAutomationModuleConfiguration(This, InputAutomationModuleConfiguration) ->
        put({This, inputAutomationModuleConfiguration}, InputAutomationModuleConfiguration).

