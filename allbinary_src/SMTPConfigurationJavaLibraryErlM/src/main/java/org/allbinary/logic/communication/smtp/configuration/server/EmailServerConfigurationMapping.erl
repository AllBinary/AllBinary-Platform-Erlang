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
% package org.allbinary.logic.communication.smtp.configuration.server
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.StdUtil

-module('EmailServerConfigurationMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TableMappingInterface

init_fields(This) ->
    put({This, emailServerConfigurationInterface}, undefined),
    ok.


new(EmailServerConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, EmailServerConfigurationInterface),
    This.

'$init'(This, EmailServerConfigurationInterface) ->
    init_fields(This),
        put({This, emailServerConfigurationInterface}, EmailServerConfigurationInterface).

toHashMap(This) ->
        HashMap = (fun(Target_N65853) -> (get({Target_N65853, '$class'})):createHashMap(Target_N65853) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'EmailServerConfigurationData', 'SERVER'}), (get({get({This, emailServerConfigurationInterface}), '$class'})):getSmtpServer(get({This, emailServerConfigurationInterface}))),
        (get({HashMap, '$class'})):put(HashMap, get({'EmailServerConfigurationData', 'ACCOUNT'}), (get({get({This, emailServerConfigurationInterface}), '$class'})):getAccountName(get({This, emailServerConfigurationInterface}))),
        (get({HashMap, '$class'})):put(HashMap, get({'EmailServerConfigurationData', 'PASSWORD'}), (get({get({This, emailServerConfigurationInterface}), '$class'})):getPassword(get({This, emailServerConfigurationInterface}))),
        HashMap.

% throws Exception
getKey(This) ->
        get({'EmailServerConfigurationData', 'NAME'}).

% throws Exception
toVector(This) ->
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):add(Vector, (get({get({This, emailServerConfigurationInterface}), '$class'})):getSmtpServer(get({This, emailServerConfigurationInterface}))),
        Vector.

