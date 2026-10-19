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
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('BasicProfileActionScriptOutputNode').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This.

init(This, Node) ->
    init_fields(This),
        ActionNode = 'DomSearchHelper':getNode(get({'GenericProfileActionScriptOutputData', 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'GenericProfileActionScriptOutputData', 'NAME'})),
        Node.

