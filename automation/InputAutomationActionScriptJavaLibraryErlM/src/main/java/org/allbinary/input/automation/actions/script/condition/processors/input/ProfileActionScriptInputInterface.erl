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
% package org.allbinary.input.automation.actions.script.condition.processors.input
% import org.allbinary.input.automation.actions.script.condition.processors.ProfileActionScriptProcessorInterface
% import org.allbinary.input.automation.robot.InputRobotInterface

-module('ProfileActionScriptInputInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProfileActionScriptProcessorInterface', Function, Arguments).


setInputRobotInterface(This, InputRobotInterface) ->
    erlang:error({abstract_method, setInputRobotInterface}).

getInputRobotInterface(This) ->
    erlang:error({abstract_method, getInputRobotInterface}).

getTime(This) ->
    erlang:error({abstract_method, getTime}).

setTime(This, Time) when is_integer(Time) ->
    erlang:error({abstract_method, setTime}).

