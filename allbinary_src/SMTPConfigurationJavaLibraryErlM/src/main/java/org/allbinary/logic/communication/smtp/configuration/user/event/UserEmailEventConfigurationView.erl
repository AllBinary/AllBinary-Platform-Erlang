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
% package org.allbinary.logic.communication.smtp.configuration.user.event
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.StdUtil
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('UserEmailEventConfigurationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, userEmailEventConfigurationInterface}, undefined),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Node),
    This;
new(UserEmailEventConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, UserEmailEventConfigurationInterface),
    This.

'$init'(This, Node) ->
    init_fields(This),
        ChildNodeList = (get({Node, '$class'})):getChildNodes(Node),
        HashMap = (fun(Target_N65931) -> (get({Target_N65931, '$class'})):createHashMap(Target_N65931) end)('StdUtil':getInstance()),
        Name = 'DomNodeHelper':getTextNodeValue(get({'UserEmailEventConfigurationData', 'NAME'}), ChildNodeList),
        (get({HashMap, '$class'})):put(HashMap, get({'UserEmailEventConfigurationData', 'NAME'}), Name),
        EventListenerClassPath = 'DomNodeHelper':getTextNodeValue(get({'UserEmailEventConfigurationData', 'LISTENER_CLASSPATH'}), ChildNodeList),
        (get({HashMap, '$class'})):put(HashMap, get({'UserEmailEventConfigurationData', 'LISTENER_CLASSPATH'}), EventListenerClassPath),
        (get({This, '$class'})):setUserEmailEventConfigurationInterface(This, 'UserEmailEventConfiguration':new(HashMap));
'$init'(This, UserEmailEventConfigurationInterface) ->
    init_fields(This),
        (get({This, '$class'})):setUserEmailEventConfigurationInterface(This, UserEmailEventConfigurationInterface).


% throws Exception
toXmlNode(This, Document) ->
        UserEmailEventConfigurationMapping = 'UserEmailEventConfigurationMapping':new((get({This, '$class'})):getUserEmailEventConfigurationInterface(This)),
        HashMap = (get({UserEmailEventConfigurationMapping, '$class'})):toHashMap(UserEmailEventConfigurationMapping),
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'UserEmailEventConfigurationData', 'NAME'}), HashMap),
        Node.

getUserEmailEventConfigurationInterface(This) ->
        get({This, userEmailEventConfigurationInterface}).

setUserEmailEventConfigurationInterface(This, UserEmailEventConfigurationInterface) ->
        put({This, userEmailEventConfigurationInterface}, UserEmailEventConfigurationInterface).

