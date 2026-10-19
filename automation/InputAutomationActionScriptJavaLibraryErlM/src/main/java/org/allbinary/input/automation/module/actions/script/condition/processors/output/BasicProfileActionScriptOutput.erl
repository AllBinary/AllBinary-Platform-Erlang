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
% package org.allbinary.input.automation.module.actions.script.condition.processors.output
% import org.allbinary.input.automation.actions.script.condition.processors.BasicProfileActionScriptProcessor
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('BasicProfileActionScriptOutput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ProfileActionScriptOutputInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicProfileActionScriptProcessor', Function, Arguments).

init_fields(This) ->
    ok.


new(Label, Node) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label, Node),
    This.

init(This, Label, Node) when (is_list(Label) orelse Label =:= undefined) ->
        'BasicProfileActionScriptProcessor':init(This, Label, Node).

new(Label) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label),
    This.

init(This, Label) when (is_list(Label) orelse Label =:= undefined) ->
        'BasicProfileActionScriptProcessor':init(This, Label).

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'GenericProfileActionScriptOutputData', 'NAME'})),
        Node.

