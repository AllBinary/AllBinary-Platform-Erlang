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
% package org.allbinary.business.context.configuration
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationData
% import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface
% import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationView
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('ContextConfigurationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, contextConfigurationInterface}, undefined),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This;
new(ContextConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ContextConfigurationInterface),
    This.

init(This, Node) ->
    init_fields(This),
        ChildNodeList = (get({Node, '$class'})):getChildNodes(Node),
        put({This, contextConfigurationInterface}, 'ContextConfiguration':new()),
        EmailConfigurationNode = 'DomSearchHelper':getNode(get({'EmailServerConfigurationData', 'NAME'}), ChildNodeList),
        EmailServerConfigurationView = 'EmailServerConfigurationView':new(EmailConfigurationNode),
        (get({get({This, contextConfigurationInterface}), '$class'})):setEmailServerConfigurationInterface(get({This, contextConfigurationInterface}), (get({EmailServerConfigurationView, '$class'})):getEmailConfigurationInterface(EmailServerConfigurationView));
init(This, ContextConfigurationInterface) ->
    init_fields(This),
        put({This, contextConfigurationInterface}, ContextConfigurationInterface).


getContextConfigurationInterface(This) ->
        get({This, contextConfigurationInterface}).

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'ContextConfigurationData':getInstance(), 'NAME'})),
        EmailServerConfigurationView = 'EmailServerConfigurationView':new((fun(Target_N66428) -> (get({Target_N66428, '$class'})):getEmailServerConfigurationInterface(Target_N66428) end)((get({This, '$class'})):getContextConfigurationInterface(This))),
        (get({Node, '$class'})):appendChild(Node, (get({EmailServerConfigurationView, '$class'})):toXmlNode(EmailServerConfigurationView, Document)),
        Node.

