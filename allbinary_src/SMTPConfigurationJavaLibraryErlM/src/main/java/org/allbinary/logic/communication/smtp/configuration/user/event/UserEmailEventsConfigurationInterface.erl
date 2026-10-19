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
% import org.allbinary.business.user.UserInterface
% import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface
% import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

-module('UserEmailEventsConfigurationInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getEventConfigurationHashMap(This) ->
    erlang:error({abstract_method, getEventConfigurationHashMap}).

addUserEmailEventConfiguration(This, UserEmailEventConfigurationInterface) ->
    erlang:error({abstract_method, addUserEmailEventConfiguration}).

% throws Exception
getEventListener(This, AbeClientInformation, UserEmailEventNameData, UserInterface) ->
    erlang:error({abstract_method, getEventListener}).

