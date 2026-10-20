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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfiguration
% import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface
% import org.allbinary.string.CommonStrings

-module('UserEmailConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UserEmailConfigurationInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, userEmailEventsConfigurationInterface}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'CONSTRUCTOR'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        (get({This, '$class'})):setUserEmailEventsConfigurationInterface(This, 'UserEmailEventsConfiguration':new()).

new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap),
    This.

'$init'(This, HashMap) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'CONSTRUCTOR'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'}));
            false -> ok
        end,
        (get({This, '$class'})):setUserEmailEventsConfigurationInterface(This, 'UserEmailEventsConfiguration':new(HashMap)).

getUserEmailEventsConfigurationInterface(This) ->
        get({This, userEmailEventsConfigurationInterface}).

setUserEmailEventsConfigurationInterface(This, UserEmailEventsConfigurationInterface) ->
        put({This, userEmailEventsConfigurationInterface}, UserEmailEventsConfigurationInterface).

