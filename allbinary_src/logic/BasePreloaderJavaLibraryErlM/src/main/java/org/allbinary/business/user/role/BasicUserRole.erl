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
% package org.allbinary.business.user.role
% import java.io.Serializable

-module('BasicUserRole').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements Serializable

init_fields(This) ->
    put({This, m_int_RoleId}, 0),
    put({This, role}, undefined),
    put({This, displayValue}, undefined),
    put({This, sessionTimeout}, 0),
    put({This, sessionInactivityTimeout}, 0),
    ok.


new(ARole, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout) when (is_list(ARole) orelse ARole =:= undefined), is_integer(A_int_RoleId), is_integer(ASessionTimeout), is_integer(ASessionInactivityTimeout) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ARole, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout),
    This.

'$init'(This, ARole, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout) when (is_list(ARole) orelse ARole =:= undefined), is_integer(A_int_RoleId), is_integer(ASessionTimeout), is_integer(ASessionInactivityTimeout) ->
        '$init'(This, ARole, ARole, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout).

new(ARole, ADisplayValue, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout) when (is_list(ARole) orelse ARole =:= undefined), (is_list(ADisplayValue) orelse ADisplayValue =:= undefined), is_integer(A_int_RoleId), is_integer(ASessionTimeout), is_integer(ASessionInactivityTimeout) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ARole, ADisplayValue, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout),
    This.

'$init'(This, ARole, ADisplayValue, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout) when (is_list(ARole) orelse ARole =:= undefined), (is_list(ADisplayValue) orelse ADisplayValue =:= undefined), is_integer(A_int_RoleId), is_integer(ASessionTimeout), is_integer(ASessionInactivityTimeout) ->
    init_fields(This),
        put({This, m_int_RoleId}, A_int_RoleId),
        put({This, role}, ARole),
        put({This, displayValue}, ADisplayValue),
        put({This, sessionTimeout}, ASessionTimeout),
        put({This, sessionInactivityTimeout}, ASessionInactivityTimeout),
        (fun(Target_N66050) -> (get({Target_N66050, '$class'})):add(Target_N66050, This) end)(get({'BasicUserRoles':getInstance(), roleVector})).

getRoleId(This) ->
        get({This, m_int_RoleId}).

getRole(This) ->
        get({This, role}).

getSessionTimeout(This) ->
        get({This, sessionTimeout}).

getSessionInactivityTimeout(This) ->
        get({This, sessionInactivityTimeout}).

equals(This, BasicUserRole) ->
        try
        case ((get({This, '$class'})):getRoleId(This) =:= (get({BasicUserRole, '$class'})):getRoleId(BasicUserRole)) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toString(This) ->
        (get({This, '$class'})):getRole(This).

