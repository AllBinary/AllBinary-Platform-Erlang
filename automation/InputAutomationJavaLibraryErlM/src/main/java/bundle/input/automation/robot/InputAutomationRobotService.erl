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
% package bundle.input.automation.robot
% import org.allbinary.input.automation.robot.InputRobotInterface

-module('InputAutomationRobotService').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements InputAutomationRobotServiceInterface

init_fields(This) ->
    put({This, inputRobotInterfaceArray}, undefined),
    ok.


new(InputRobotInterfaceArray) when (is_tuple(InputRobotInterfaceArray) orelse InputRobotInterfaceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, InputRobotInterfaceArray),
    This.

'$init'(This, InputRobotInterfaceArray) when (is_tuple(InputRobotInterfaceArray) orelse InputRobotInterfaceArray =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setInputRobotInterfaceArray(This, InputRobotInterfaceArray).

getInputRobotInterfaceArray(This) ->
        get({This, inputRobotInterfaceArray}).

setInputRobotInterfaceArray(This, InputRobotInterfaceArray) when (is_tuple(InputRobotInterfaceArray) orelse InputRobotInterfaceArray =:= undefined) ->
        put({This, inputRobotInterfaceArray}, InputRobotInterfaceArray).

