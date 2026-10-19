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
% package org.allbinary.logic.communication.smtp.configuration.user
% import java.util.HashMap
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationData
% import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface
% import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationView
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('UserEmailConfigurationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, userEmailConfigurationInterface}, undefined),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This;
new(UserEmailConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, UserEmailConfigurationInterface),
    This.

init(This, Node) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'CONSTRUCTOR'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        put({This, userEmailConfigurationInterface}, 'UserEmailConfiguration':new()),
        ChildNodeList = (get({Node, '$class'})):getChildNodes(Node),
        UserEmailEventsConfigurationNode = 'DomSearchHelper':getNodeNoThrow(get({'UserEmailEventsConfigurationData', 'NAME'}), ChildNodeList),
        UserEmailEventsConfigurationView = 'UserEmailEventsConfigurationView':new(UserEmailEventsConfigurationNode),
        (get({get({This, userEmailConfigurationInterface}), '$class'})):setUserEmailEventsConfigurationInterface(get({This, userEmailConfigurationInterface}), (get({UserEmailEventsConfigurationView, '$class'})):getUserEmailEventsConfigurationInterface(UserEmailEventsConfigurationView));
init(This, UserEmailConfigurationInterface) ->
    init_fields(This),
        put({This, userEmailConfigurationInterface}, UserEmailConfigurationInterface).


getEmailConfigurationInterface(This) ->
        get({This, userEmailConfigurationInterface}).

% throws Exception
toXmlNode(This, Document) ->
        EmailConfigurationMapping = 'UserEmailConfigurationMapping':new(get({This, userEmailConfigurationInterface})),
        HashMap = (get({EmailConfigurationMapping, '$class'})):toHashMap(EmailConfigurationMapping),
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'UserEmailConfigurationData', 'NAME'}), HashMap),
        UserEmailConfigurationInterface = (get({This, '$class'})):getEmailConfigurationInterface(This),
        UserEmailEventsConfigurationInterface = (get({UserEmailConfigurationInterface, '$class'})):getUserEmailEventsConfigurationInterface(UserEmailConfigurationInterface),
        UserEmailEventsConfigurationView = 'UserEmailEventsConfigurationView':new(UserEmailEventsConfigurationInterface),
        (get({Node, '$class'})):appendChild(Node, (get({UserEmailEventsConfigurationView, '$class'})):toXmlNode(UserEmailEventsConfigurationView, Document)),
        Node.

