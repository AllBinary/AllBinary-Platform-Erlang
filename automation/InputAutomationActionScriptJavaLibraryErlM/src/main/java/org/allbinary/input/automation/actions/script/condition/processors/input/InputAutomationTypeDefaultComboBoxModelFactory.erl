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
% import java.util.Set
% import javax.swing
% import org.allbinary.input.automation.robot.InputRobotFactory

-module('InputAutomationTypeDefaultComboBoxModelFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance() ->
        DefaultComboBoxModel = 'DefaultComboBoxModel':new(),
        Set = (fun(Target_N65754) -> (get({Target_N65754, '$class'})):keySet(Target_N65754) end)((fun(Target_N65761) -> (get({Target_N65761, '$class'})):get(Target_N65761) end)('InputRobotFactory':getInstance())),
        NameArray = (get({Set, '$class'})):toArray(Set),
        Size = array:size(NameArray),
        lists:foreach(fun(Index) ->
            (get({DefaultComboBoxModel, '$class'})):addElement(DefaultComboBoxModel, array:get(Index, NameArray))
        end, lists:seq(0, Size - 1)),
        DefaultComboBoxModel.

