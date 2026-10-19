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
% package org.allbinary.input.automation.module.generic
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('CaptureWorkerUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
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
processProfileActionConditions(Vector, Frame) ->
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        (get({LogUtil, '$class'})):putF(LogUtil, get({CommonStrings, 'START'}), "CaptureWorkerUtil", "processProfileActionConditions"),
        Size = (get({Vector, '$class'})):size(Vector),
        lists:foreach(fun(Index) ->
            ProfileActionConditionInterface = (get({Vector, '$class'})):get(Vector, Index),
            case (get({ProfileActionConditionInterface, '$class'})):shouldProcess(ProfileActionConditionInterface, Frame) of
                true ->
                (get({ProfileActionConditionInterface, '$class'})):process(ProfileActionConditionInterface, Frame);
                false ->
                ok
            end
        end, lists:seq(0, Size - 1)).

