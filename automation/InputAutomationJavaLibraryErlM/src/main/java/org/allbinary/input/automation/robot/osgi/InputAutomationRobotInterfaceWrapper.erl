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
% import org.allbinary.input.automation.robot.InputRobotInterface

-module('InputAutomationRobotInterfaceWrapper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, inputRobotInterface}, undefined),
    ok.


new(InputRobotInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, InputRobotInterface),
    This.

'$init'(This, InputRobotInterface) ->
    init_fields(This),
        (get({This, '$class'})):setInputRobotInterface(This, InputRobotInterface).

getInputRobotInterface(This) ->
        get({This, inputRobotInterface}).

setInputRobotInterface(This, InputRobotInterface) ->
        put({This, inputRobotInterface}, InputRobotInterface).

