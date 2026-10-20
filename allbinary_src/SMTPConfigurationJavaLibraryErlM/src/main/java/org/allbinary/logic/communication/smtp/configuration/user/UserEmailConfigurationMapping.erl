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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.StdUtil

-module('UserEmailConfigurationMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TableMappingInterface

init_fields(This) ->
    put({This, userEmailConfigurationInterface}, undefined),
    ok.


new(UserEmailConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, UserEmailConfigurationInterface),
    This.

'$init'(This, UserEmailConfigurationInterface) ->
    init_fields(This),
        put({This, userEmailConfigurationInterface}, UserEmailConfigurationInterface).

toHashMap(This) ->
        HashMap = (fun(Target_N65853) -> (get({Target_N65853, '$class'})):createHashMap(Target_N65853) end)('StdUtil':getInstance()),
        HashMap.

% throws Exception
getKey(This) ->
        get({'UserEmailConfigurationData', 'NAME'}).

% throws Exception
toVector(This) ->
        Vector = 'BasicArrayListD':new(),
        Vector.

