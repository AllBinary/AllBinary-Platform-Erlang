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
% import org.allbinary.input.automation.robot.InputRobotInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('MouseInputAutomationProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
process(MouseActionScriptInputInterface) ->
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({LogUtil, '$class'})):putF(LogUtil, (fun(Target_N65883) -> (get({Target_N65883, '$class'})):toString(Target_N65883) end)((fun(Target_N65890) -> (get({Target_N65890, '$class'})):appendint(Target_N65890, trunc((get({MouseActionScriptInputInterface, '$class'})):getButtonClicks(MouseActionScriptInputInterface))) end)((fun(Target_N65897) -> (get({Target_N65897, '$class'})):append(Target_N65897, " clicks: ") end)((fun(Target_N65904) -> (get({Target_N65904, '$class'})):append(Target_N65904, (fun(Target_N65940) -> (get({Target_N65940, '$class'})):toString(Target_N65940) end)((get({MouseActionScriptInputInterface, '$class'})):getPoint(MouseActionScriptInputInterface))) end)((fun(Target_N65911) -> (get({Target_N65911, '$class'})):append(Target_N65911, "Start - Processing Mouse Input at: ") end)('StringMaker':new()))))), "MouseInputAutomationProcessor", get({CommonStrings, 'PROCESS'})),
        InputRobotInterface = (get({MouseActionScriptInputInterface, '$class'})):getInputRobotInterface(MouseActionScriptInputInterface),
        case ((get({(get({MouseActionScriptInputInterface, '$class'})):getPoint(MouseActionScriptInputInterface), x}) =/= (-1)) andalso (get({(get({MouseActionScriptInputInterface, '$class'})):getPoint(MouseActionScriptInputInterface), y}) =/= (-1))) of
            true ->
            (get({InputRobotInterface, '$class'})):mouseMove(InputRobotInterface, (get({MouseActionScriptInputInterface, '$class'})):getPoint(MouseActionScriptInputInterface));
            false -> ok
        end,
        timer:sleep((get({MouseActionScriptInputInterface, '$class'})):getTime(MouseActionScriptInputInterface)),
        case ((get({MouseActionScriptInputInterface, '$class'})):getButtonClicks(MouseActionScriptInputInterface) =/= 0) of
            true ->
            (get({InputRobotInterface, '$class'})):mousePress(InputRobotInterface, (get({MouseActionScriptInputInterface, '$class'})):getButtonClicks(MouseActionScriptInputInterface)),
            timer:sleep((get({MouseActionScriptInputInterface, '$class'})):getTime(MouseActionScriptInputInterface)),
            (get({InputRobotInterface, '$class'})):mouseRelease(InputRobotInterface, (get({MouseActionScriptInputInterface, '$class'})):getButtonClicks(MouseActionScriptInputInterface));
            false -> ok
        end,
        timer:sleep((get({MouseActionScriptInputInterface, '$class'})):getTime(MouseActionScriptInputInterface)).

