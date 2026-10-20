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
% package org.allbinary.logic.communication.smtp.configuration.server
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('EmailServerConfigurationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, emailServerConfigurationInterface}, undefined),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Node),
    This;
new(EmailServerConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, EmailServerConfigurationInterface),
    This.

'$init'(This, Node) ->
    init_fields(This),
        ChildNodeList = (get({Node, '$class'})):getChildNodes(Node),
        Server = 'DomNodeHelper':getTextNodeValue(get({'EmailServerConfigurationData', 'SERVER'}), ChildNodeList),
        AccountName = 'DomNodeHelper':getTextNodeValue(get({'EmailServerConfigurationData', 'ACCOUNT'}), ChildNodeList),
        Password = 'DomNodeHelper':getTextNodeValue(get({'EmailServerConfigurationData', 'PASSWORD'}), ChildNodeList),
        put({This, emailServerConfigurationInterface}, 'EmailServerConfiguration':new(AccountName, Password, Server));
'$init'(This, EmailServerConfigurationInterface) ->
    init_fields(This),
        put({This, emailServerConfigurationInterface}, EmailServerConfigurationInterface).


getEmailConfigurationInterface(This) ->
        get({This, emailServerConfigurationInterface}).

% throws Exception
toXmlNode(This, Document) ->
        EmailConfigurationMapping = 'EmailServerConfigurationMapping':new(get({This, emailServerConfigurationInterface})),
        HashMap = (get({EmailConfigurationMapping, '$class'})):toHashMap(EmailConfigurationMapping),
        Node = 'ModDomHelper':createNodeWithValueNodes(Document, get({'EmailServerConfigurationData', 'NAME'}), HashMap),
        Node.

