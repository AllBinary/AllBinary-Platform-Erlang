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
% import java.util.HashMap
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfiguration
% import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface
% import org.allbinary.string.CommonStrings

-module('ContextConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ContextConfigurationInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, emailServerConfigurationInterface}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "ContextConfiguration"),
        (get({This, '$class'})):setEmailServerConfigurationInterface(This, 'EmailServerConfiguration':new()).

new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap),
    This.

init(This, HashMap) ->
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "ContextConfiguration(HashMap)"),
        (get({This, '$class'})):setEmailServerConfigurationInterface(This, 'EmailServerConfiguration':new(HashMap)).

getEmailServerConfigurationInterface(This) ->
        get({This, emailServerConfigurationInterface}).

setEmailServerConfigurationInterface(This, EmailServerConfigurationInterface) ->
        put({This, emailServerConfigurationInterface}, EmailServerConfigurationInterface).

