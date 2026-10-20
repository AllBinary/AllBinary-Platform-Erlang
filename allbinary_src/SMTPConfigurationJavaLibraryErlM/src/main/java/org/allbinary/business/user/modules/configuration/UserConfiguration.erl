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
% import java.util.HashMap
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.time.created.TimeCreated
% import org.allbinary.business.time.modified.TimeLastModified
% import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfiguration
% import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface

-module('UserConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UserConfigurationInterface

init_fields(This) ->
    put({This, userEmailConfigurationInterface}, undefined),
    put({This, timeCreated}, undefined),
    put({This, timeLastModified}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, userEmailConfigurationInterface}, 'UserEmailConfiguration':new()),
        put({This, timeCreated}, 'TimeCreated':new(0)),
        put({This, timeLastModified}, 'TimeLastModified':new(0)).

new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This.

'$init'(This, HashMap) ->
    init_fields(This),
        put({This, userEmailConfigurationInterface}, 'UserEmailConfiguration':new(HashMap)),
        put({This, timeCreated}, 'TimeCreated':new((get({HashMap, '$class'})):get(HashMap, get({'EntryData':getInstance(), 'TIMECREATED'})))),
        put({This, timeLastModified}, 'TimeLastModified':new((get({HashMap, '$class'})):get(HashMap, get({'EntryData':getInstance(), 'LASTMODIFIED'})))).

getUserEmailConfigurationInterface(This) ->
        get({This, userEmailConfigurationInterface}).

setUserEmailConfigurationInterface(This, UserEmailConfigurationInterface) ->
        put({This, userEmailConfigurationInterface}, UserEmailConfigurationInterface).

getTimeCreated(This) ->
        get({This, timeCreated}).

getTimeLastModified(This) ->
        get({This, timeLastModified}).

setTimeCreated(This, TimeCreated) ->
        put({This, timeCreated}, TimeCreated).

setTimeLastModified(This, TimeLastModified) ->
        put({This, timeLastModified}, TimeLastModified).

