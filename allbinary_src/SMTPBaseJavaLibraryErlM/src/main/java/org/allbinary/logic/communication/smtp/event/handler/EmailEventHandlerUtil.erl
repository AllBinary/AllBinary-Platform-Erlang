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
% package org.allbinary.logic.communication.smtp.event.handler
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.UserInterface
% import org.allbinary.business.user.modules.configuration.UserConfigurationInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface
% import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface
% import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface
% import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData
% import org.allbinary.logic.communication.smtp.event.modules.log.LogUserEmailEventListenerModule
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

-module('EmailEventHandlerUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'EmailEventHandlerUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'EmailEventHandlerUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getEventHandler(This, AbeClientInformation, UserEmailEventNameData, UserVector) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Returning UserEmailEventHandler for "),
            (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({UserVector, '$class'})):size(UserVector)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " users."),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "getEventHandler");
            false -> ok
        end,
        UserEmailEventHandler = 'UserEmailEventHandler':new(),
        (get({UserEmailEventHandler, '$class'})):addListener(UserEmailEventHandler, 'LogUserEmailEventListenerModule':new()),
        Size = (get({UserVector, '$class'})):size(UserVector),
        lists:foreach(fun(Index) ->
            UserInterface = (get({UserVector, '$class'})):get(UserVector, Index),
            Vector = 'EmailEventHandlerUtil':getUserEmailEventListenerVector(AbeClientInformation, UserEmailEventNameData, UserInterface),
            (get({UserEmailEventHandler, '$class'})):addListener(UserEmailEventHandler, Vector)
        end, lists:seq(0, Size - 1)),
        UserEmailEventHandler.

% throws Exception
getUserEmailEventListenerVector(AbeClientInformation, UserEmailEventNameData, UserInterface) ->
        UserConfigurationInterface = (get({UserInterface, '$class'})):getUserConfigurationInterface(UserInterface),
        UserEmailConfigurationInterface = (get({UserConfigurationInterface, '$class'})):getUserEmailConfigurationInterface(UserConfigurationInterface),
        UserEmailEventsConfigurationInterface = (get({UserEmailConfigurationInterface, '$class'})):getUserEmailEventsConfigurationInterface(UserEmailConfigurationInterface),
        UserEmailEventListenerInterface = (get({UserEmailEventsConfigurationInterface, '$class'})):getEventListener(UserEmailEventsConfigurationInterface, AbeClientInformation, UserEmailEventNameData, UserInterface),
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):add(Vector, UserEmailEventListenerInterface),
        Vector.

