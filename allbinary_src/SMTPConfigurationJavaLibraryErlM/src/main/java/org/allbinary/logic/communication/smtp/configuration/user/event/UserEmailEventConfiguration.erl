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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil

-module('UserEmailEventConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UserEmailEventConfigurationInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, name}, undefined),
    put({This, eventListenerClassPath}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        (get({This, '$class'})):setEventListenerClassPath(This, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "New", This, " Constructor");
            false -> ok
        end.

new(HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HashMap),
    This.

init(This, HashMap) ->
    init_fields(This),
        (get({This, '$class'})):setName(This, (get({HashMap, '$class'})):get(HashMap, get({'UserEmailEventConfigurationData', 'NAME'}))),
        (get({This, '$class'})):setEventListenerClassPath(This, (get({HashMap, '$class'})):get(HashMap, get({'UserEmailEventConfigurationData', 'LISTENER_CLASSPATH'}))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'EMAILLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Log: ", (get({This, '$class'})):log(This)]), This, " Constructor");
            false -> ok
        end.

getName(This) ->
        get({This, name}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

getEventListenerClassPath(This) ->
        get({This, eventListenerClassPath}).

setEventListenerClassPath(This, EventListenerClassPath) when (is_list(EventListenerClassPath) orelse EventListenerClassPath =:= undefined) ->
        put({This, eventListenerClassPath}, EventListenerClassPath).

log(This) ->
        lists:concat([lists:concat([lists:concat([lists:concat(["\nUser Email Event Log Info:", "\nName: "]), (get({This, '$class'})):getName(This)]), "\nEventListenerClassPath: "]), (get({This, '$class'})):getEventListenerClassPath(This)]).

