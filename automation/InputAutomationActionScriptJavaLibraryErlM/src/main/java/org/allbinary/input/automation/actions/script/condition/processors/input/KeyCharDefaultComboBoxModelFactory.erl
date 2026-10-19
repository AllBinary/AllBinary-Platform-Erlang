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
% import javax.swing
% import abbot.tester.KeyStrokeMap
% import org.allbinary.input.KeySingletonFactory

-module('KeyCharDefaultComboBoxModelFactory').
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

getInstance() ->
        DefaultComboBoxModel = 'DefaultComboBoxModel':new(),
        KeyArray = 'KeySingletonFactory':getArray(),
        lists:foreach(fun(Index) ->
            NextKey = array:get(Index, KeyArray),
            KeyStroke = 'KeyStroke':getKeyStroke((get({NextKey, '$class'})):intValue(NextKey), 0),
            KeyChar = 'KeyStrokeMap':getChar(KeyStroke),
            (get({DefaultComboBoxModel, '$class'})):addElement(DefaultComboBoxModel, allbinary_java:to_string(KeyChar))
        end, lists:seq(0, array:size(KeyArray) - 1)),
        DefaultComboBoxModel.

