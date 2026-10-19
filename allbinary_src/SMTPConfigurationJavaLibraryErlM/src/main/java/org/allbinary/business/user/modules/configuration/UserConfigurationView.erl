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
% package org.allbinary.business.user.modules.configuration
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.time.created.TimeCreatedView
% import org.allbinary.business.time.modified.TimeLastModifiedView
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationData
% import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface
% import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationView
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('UserConfigurationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, userConfigurationInterface}, undefined),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This;
new(UserConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, UserConfigurationInterface),
    This.

init(This, Node) ->
    init_fields(This),
        put({This, userConfigurationInterface}, 'UserConfiguration':new()),
        ChildNodeList = (get({Node, '$class'})):getChildNodes(Node),
        EmailConfigurationNode = 'DomSearchHelper':getNode(get({'UserEmailConfigurationData', 'NAME'}), ChildNodeList),
        UserEmailConfigurationView = 'UserEmailConfigurationView':new(EmailConfigurationNode),
        UserEmailConfigurationInterface = (get({UserEmailConfigurationView, '$class'})):getEmailConfigurationInterface(UserEmailConfigurationView),
        (get({get({This, userConfigurationInterface}), '$class'})):setUserEmailConfigurationInterface(get({This, userConfigurationInterface}), UserEmailConfigurationInterface),
        TimeCreatedNode = 'DomSearchHelper':getNode(get({'EntryData':getInstance(), 'TIMECREATED'}), ChildNodeList),
        TimeCreatedView = 'TimeCreatedView':new(TimeCreatedNode),
        (get({get({This, userConfigurationInterface}), '$class'})):setTimeCreated(get({This, userConfigurationInterface}), (get({TimeCreatedView, '$class'})):getTimeCreated(TimeCreatedView)),
        TimeLastModifiedNode = 'DomSearchHelper':getNode(get({'EntryData':getInstance(), 'LASTMODIFIED'}), ChildNodeList),
        TimeLastModifiedView = 'TimeLastModifiedView':new(TimeLastModifiedNode),
        (get({get({This, userConfigurationInterface}), '$class'})):setTimeLastModified(get({This, userConfigurationInterface}), (get({TimeLastModifiedView, '$class'})):getTimeLastModified(TimeLastModifiedView));
init(This, UserConfigurationInterface) ->
    init_fields(This),
        put({This, userConfigurationInterface}, UserConfigurationInterface).


getUserConfigurationInterface(This) ->
        get({This, userConfigurationInterface}).

% throws Exception
toXmlNode(This, Document) ->
        Node = (get({Document, '$class'})):createElement(Document, get({'UserConfigurationData', 'NAME'})),
        UserEmailConfigurationView = 'UserEmailConfigurationView':new((get({get({This, userConfigurationInterface}), '$class'})):getUserEmailConfigurationInterface(get({This, userConfigurationInterface}))),
        (get({Node, '$class'})):appendChild(Node, (get({UserEmailConfigurationView, '$class'})):toXmlNode(UserEmailConfigurationView, Document)),
        TimeCreatedView = 'TimeCreatedView':new((get({get({This, userConfigurationInterface}), '$class'})):getTimeCreated(get({This, userConfigurationInterface}))),
        (get({Node, '$class'})):appendChild(Node, (get({TimeCreatedView, '$class'})):toXmlNode(TimeCreatedView, Document)),
        TimeLastModifiedView = 'TimeLastModifiedView':new((get({get({This, userConfigurationInterface}), '$class'})):getTimeLastModified(get({This, userConfigurationInterface}))),
        (get({Node, '$class'})):appendChild(Node, (get({TimeLastModifiedView, '$class'})):toXmlNode(TimeLastModifiedView, Document)),
        Node.

