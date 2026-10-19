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
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('UserEmailEventsConfigurationView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, userEmailEventsConfigurationInterface}, undefined),
    ok.


new(Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Node),
    This;
new(UserEmailEventsConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, UserEmailEventsConfigurationInterface),
    This.

init(This, Node) ->
    init_fields(This),
        put({This, userEmailEventsConfigurationInterface}, 'UserEmailEventsConfiguration':new()),
        ChildNodeList = (get({Node, '$class'})):getChildNodes(Node),
        EmailEventConfigurationNodeVector = 'DomSearchHelper':getAllNodesNoThrow(get({'UserEmailEventConfigurationData', 'NAME'}), ChildNodeList),
        Size = (get({EmailEventConfigurationNodeVector, '$class'})):size(EmailEventConfigurationNodeVector),
        lists:foreach(fun(Index) ->
            UserEmailConfigurationNode = (get({EmailEventConfigurationNodeVector, '$class'})):get(EmailEventConfigurationNodeVector, Index),
            UserEmailEventConfigurationView = 'UserEmailEventConfigurationView':new(UserEmailConfigurationNode),
            (get({get({This, userEmailEventsConfigurationInterface}), '$class'})):addUserEmailEventConfiguration(get({This, userEmailEventsConfigurationInterface}), (get({UserEmailEventConfigurationView, '$class'})):getUserEmailEventConfigurationInterface(UserEmailEventConfigurationView))
        end, lists:seq(0, Size - 1));
init(This, UserEmailEventsConfigurationInterface) ->
    init_fields(This),
        put({This, userEmailEventsConfigurationInterface}, UserEmailEventsConfigurationInterface).


getUserEmailEventsConfigurationInterface(This) ->
        get({This, userEmailEventsConfigurationInterface}).

% throws Exception
toXmlNode(This, Document) ->
        UserEmailConfigurationMapping = 'UserEmailEventsConfigurationMapping':new(get({This, userEmailEventsConfigurationInterface})),
        Node = (get({Document, '$class'})):createElement(Document, get({'UserEmailEventsConfigurationData', 'NAME'})),
        EmailEventHashMap = (fun(Target_N66780) -> (get({Target_N66780, '$class'})):getEventConfigurationHashMap(Target_N66780) end)((get({This, '$class'})):getUserEmailEventsConfigurationInterface(This)),
        Set = (get({EmailEventHashMap, '$class'})):keySet(EmailEventHashMap),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Email Events Specified in file: ", (get({Set, '$class'})):size(Set)]), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        EventNameArray = (get({Set, '$class'})):toArray(Set),
        Size = array:size(EventNameArray),
        lists:foreach(fun(Index) ->
            EventName = array:get(Index, EventNameArray),
            UserEmailEventsConfigurationInterface = (get({EmailEventHashMap, '$class'})):get(EmailEventHashMap, EventName),
            UserEmailEventConfigurationView = 'UserEmailEventConfigurationView':new(UserEmailEventsConfigurationInterface),
            (get({Node, '$class'})):appendChild(Node, (get({UserEmailEventConfigurationView, '$class'})):toXmlNode(UserEmailEventConfigurationView, Document))
        end, lists:seq(0, Size - 1)),
        Node.

