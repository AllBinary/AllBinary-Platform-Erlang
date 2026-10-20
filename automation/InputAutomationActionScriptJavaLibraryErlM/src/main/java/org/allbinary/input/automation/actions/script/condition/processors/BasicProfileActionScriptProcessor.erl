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
% package org.allbinary.input.automation.actions.script.condition.processors
% import java.awt.event.ActionEvent
% import org.allbinary.input.automation.actions.script.JTreeInterfaceFactory
% import org.allbinary.input.automation.actions.script.ProfileActionScriptItem
% import org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('BasicProfileActionScriptProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ProfileActionScriptProcessorInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ProfileActionScriptItem', Function, Arguments).

init_fields(This) ->
    ok.


new(Label, Node) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Label, Node),
    This.

'$init'(This, Label, Node) when (is_list(Label) orelse Label =:= undefined) ->
        'ProfileActionScriptItem':'$init'(This, Label, Node).

new(Label) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Label),
    This.

'$init'(This, Label) when (is_list(Label) orelse Label =:= undefined) ->
        'ProfileActionScriptItem':'$init'(This, Label).

actionPerformed(This, ActionEvent) ->
        'ProfileActionScriptItem':actionPerformed(This, ActionEvent),
        case ((fun(Target_N66029) -> (get({Target_N66029, '$class'})):compareTo(Target_N66029, get({'BasicProfileActionScriptProcessor', 'DELETE'})) end)((get({ActionEvent, '$class'})):getActionCommand(ActionEvent)) =:= 0) of
            true ->
            case allbinary_java:instance_of((get({This, '$class'})):getParent(This), 'ProfileActionScriptConditionInterface') of
                true ->
                ProfileActionScriptConditionInterface = (get({This, '$class'})):getParent(This),
                (get({ProfileActionScriptConditionInterface, '$class'})):removeProcessor(ProfileActionScriptConditionInterface, This),
                (fun(Target_N66196) -> (get({Target_N66196, '$class'})):updateJTree(Target_N66196) end)((fun(Target_N66203) -> (get({Target_N66203, '$class'})):getJTreeInterface(Target_N66203) end)('JTreeInterfaceFactory':getInstance()));
                false -> ok
            end;
            false -> ok
        end.

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'GenericProfileActionScriptProcessorData', 'NAME'})),
        Node.

