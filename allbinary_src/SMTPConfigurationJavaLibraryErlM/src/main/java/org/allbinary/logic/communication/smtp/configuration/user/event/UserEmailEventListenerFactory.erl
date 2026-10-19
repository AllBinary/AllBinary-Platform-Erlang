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
% import org.allbinary.business.user.UserInterface
% import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface
% import org.allbinary.logic.system.loader.AbeFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

-module('UserEmailEventListenerFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(AbeClientInformation, UserEmailEventConfigurationInterface, UserInterface) ->
        Params = array:new(1, {default, undefined}),
        Classes = array:new(1, {default, undefined}),
        array:set(0, 'UserInterface', Classes),
        array:set(0, UserInterface, Params),
        (fun(Target_N65972) -> (get({Target_N65972, '$class'})):getInstance(Target_N65972, AbeClientInformation, (get({UserEmailEventConfigurationInterface, '$class'})):getEventListenerClassPath(UserEmailEventConfigurationInterface), Classes, Params) end)('AbeFactory':getInstance()).

