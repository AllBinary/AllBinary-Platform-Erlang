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
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonStrings
% import org.allbinary.time.TimeDelayHelper

-module('KeyboardInputAutomationProcessor').
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
process(KeyActionScriptInputInterface) ->
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({LogUtil, '$class'})):putF(LogUtil, lists:concat([get({'CommonLabels':getInstance(), 'START'}), (get({KeyActionScriptInputInterface, '$class'})):toString(KeyActionScriptInputInterface)]), "KeyInputAutomationProcessor", get({CommonStrings, 'PROCESS'})),
        InputRobotInterface = (get({KeyActionScriptInputInterface, '$class'})):getInputRobotInterface(KeyActionScriptInputInterface),
        Integer = (get({KeyActionScriptInputInterface, '$class'})):getKeyArray(KeyActionScriptInputInterface),
        case ((get({KeyActionScriptInputInterface, '$class'})):getDelayBetweenKeys(KeyActionScriptInputInterface) =:= 0) of
            true ->
            lists:foreach(fun(Index) ->
                case (get({KeyActionScriptInputInterface, '$class'})):isPress(KeyActionScriptInputInterface) of
                    true ->
                    (get({InputRobotInterface, '$class'})):keyPress(InputRobotInterface, array:get(Index, Integer));
                    false -> ok
                end
            end, lists:seq(0, array:size((get({KeyActionScriptInputInterface, '$class'})):getKeyArray(KeyActionScriptInputInterface)) - 1)),
            timer:sleep((get({KeyActionScriptInputInterface, '$class'})):getTime(KeyActionScriptInputInterface)),
            lists:foreach(fun(Index) ->
                case (get({KeyActionScriptInputInterface, '$class'})):isRelease(KeyActionScriptInputInterface) of
                    true ->
                    (get({InputRobotInterface, '$class'})):keyRelease(InputRobotInterface, array:get(Index, Integer));
                    false -> ok
                end
            end, lists:seq((array:size((get({KeyActionScriptInputInterface, '$class'})):getKeyArray(KeyActionScriptInputInterface)) - 1), 0, -1));
            false ->
            lists:foreach(fun(Index) ->
                case (get({KeyActionScriptInputInterface, '$class'})):isPress(KeyActionScriptInputInterface) of
                    true ->
                    (get({InputRobotInterface, '$class'})):keyPress(InputRobotInterface, array:get(Index, Integer));
                    false -> ok
                end,
                timer:sleep((get({KeyActionScriptInputInterface, '$class'})):getTime(KeyActionScriptInputInterface)),
                case (get({KeyActionScriptInputInterface, '$class'})):isRelease(KeyActionScriptInputInterface) of
                    true ->
                    (get({InputRobotInterface, '$class'})):keyRelease(InputRobotInterface, array:get(Index, Integer));
                    false -> ok
                end,
                TimeHelper = 'TimeDelayHelper':new((get({KeyActionScriptInputInterface, '$class'})):getDelayBetweenKeys(KeyActionScriptInputInterface)),
                put({local, toLong}, 0),
                (fun Loop() -> case ((not (get({TimeHelper, '$class'})):isTimeTNT(TimeHelper)) orelse (get({local, toLong}) > 6000)) of true ->
                    put({local, toLong}, get({local, toLong}) + 1),
                    timer:sleep(50),
                    Loop();
                false -> ok end end)()
            end, lists:seq(0, array:size((get({KeyActionScriptInputInterface, '$class'})):getKeyArray(KeyActionScriptInputInterface)) - 1))
        end.

