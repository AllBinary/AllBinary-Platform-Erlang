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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.StdUtil

-module('UserEmailEventConfigurationMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TableMappingInterface

init_fields(This) ->
    put({This, userEmailEventConfigurationInterface}, undefined),
    ok.


new(UserEmailEventConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, UserEmailEventConfigurationInterface),
    This.

'$init'(This, UserEmailEventConfigurationInterface) ->
    init_fields(This),
        put({This, userEmailEventConfigurationInterface}, UserEmailEventConfigurationInterface).

toHashMap(This) ->
        HashMap = (fun(Target_N65858) -> (get({Target_N65858, '$class'})):createHashMap(Target_N65858) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'UserEmailEventConfigurationData', 'NAME'}), (get({get({This, userEmailEventConfigurationInterface}), '$class'})):getName(get({This, userEmailEventConfigurationInterface}))),
        (get({HashMap, '$class'})):put(HashMap, get({'UserEmailEventConfigurationData', 'LISTENER_CLASSPATH'}), (get({get({This, userEmailEventConfigurationInterface}), '$class'})):getEventListenerClassPath(get({This, userEmailEventConfigurationInterface}))),
        HashMap.

% throws Exception
getKey(This) ->
        get({'UserEmailEventConfigurationData', 'NAME'}).

% throws Exception
toVector(This) ->
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):add(Vector, (get({get({This, userEmailEventConfigurationInterface}), '$class'})):getName(get({This, userEmailEventConfigurationInterface}))),
        (get({Vector, '$class'})):add(Vector, (get({get({This, userEmailEventConfigurationInterface}), '$class'})):getEventListenerClassPath(get({This, userEmailEventConfigurationInterface}))),
        Vector.

