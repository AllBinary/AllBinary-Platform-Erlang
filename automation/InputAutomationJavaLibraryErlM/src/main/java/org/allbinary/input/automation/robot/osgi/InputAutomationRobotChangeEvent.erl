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
% package org.allbinary.input.automation.robot.osgi

-module('InputAutomationRobotChangeEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, inputAutomationRobotInterfaceWrapper}, undefined),
    ok.


new(InputAutomationRobotInterfaceWrapper) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, InputAutomationRobotInterfaceWrapper),
    This.

'$init'(This, InputAutomationRobotInterfaceWrapper) ->
    init_fields(This),
        (get({This, '$class'})):setInputAutomationRobotInterfaceWrapper(This, InputAutomationRobotInterfaceWrapper).

getInputAutomationRobotInterfaceWrapper(This) ->
        get({This, inputAutomationRobotInterfaceWrapper}).

setInputAutomationRobotInterfaceWrapper(This, InputAutomationRobotInterfaceWrapper) ->
        put({This, inputAutomationRobotInterfaceWrapper}, InputAutomationRobotInterfaceWrapper).

