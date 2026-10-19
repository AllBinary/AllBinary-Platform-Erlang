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
% import bundle.input.automation.robot.InputAutomationRobotServiceInterface
% import org.allbinary.input.automation.robot.InputRobotFactory
% import org.allbinary.input.automation.robot.InputRobotInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.osgi.OSGIServiceInterface
% import org.allbinary.osgi.OSGIServiceVisitorInterface
% import org.allbinary.string.CommonStrings

-module('InputAutomationRobotOSGIServiceVisitor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements OSGIServiceVisitorInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

visit(This, AnyType) ->
        (get({This, '$class'})):visit(This, AnyType);
visit(This, OsgiServiceInterface) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "visit"),
            InputAutomationRobotServiceInterface = OsgiServiceInterface,
            InputRobotInterfaceArray = (get({InputAutomationRobotServiceInterface, '$class'})):getInputRobotInterfaceArray(InputAutomationRobotServiceInterface),
            lists:foreach(fun(Index) ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Adding: ", (fun(Target_N66243) -> (get({Target_N66243, '$class'})):getName(Target_N66243) end)(array:get(Index, InputRobotInterfaceArray))]), This, "visit"),
                (fun(Target_N66285) -> (get({Target_N66285, '$class'})):add(Target_N66285, array:get(Index, InputRobotInterfaceArray)) end)('InputRobotFactory':getInstance())
            end, lists:seq(0, array:size(InputRobotInterfaceArray) - 1)),
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "visit", E),
            false
        end.


