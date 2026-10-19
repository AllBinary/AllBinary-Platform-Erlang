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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('BasicUserRole').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements Serializable

static_init() ->
    put({?MODULE, roleVector}, 'BasicArrayListD':new()),
    ok.

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
    init(This, ARole, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout),
    This.

init(This, ARole, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout) when (is_list(ARole) orelse ARole =:= undefined), is_integer(A_int_RoleId), is_integer(ASessionTimeout), is_integer(ASessionInactivityTimeout) ->
        init(This, ARole, ARole, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout).

new(ARole, ADisplayValue, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout) when (is_list(ARole) orelse ARole =:= undefined), (is_list(ADisplayValue) orelse ADisplayValue =:= undefined), is_integer(A_int_RoleId), is_integer(ASessionTimeout), is_integer(ASessionInactivityTimeout) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ARole, ADisplayValue, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout),
    This.

init(This, ARole, ADisplayValue, A_int_RoleId, ASessionTimeout, ASessionInactivityTimeout) when (is_list(ARole) orelse ARole =:= undefined), (is_list(ADisplayValue) orelse ADisplayValue =:= undefined), is_integer(A_int_RoleId), is_integer(ASessionTimeout), is_integer(ASessionInactivityTimeout) ->
    init_fields(This),
        put({This, m_int_RoleId}, A_int_RoleId),
        put({This, role}, ARole),
        put({This, displayValue}, ADisplayValue),
        put({This, sessionTimeout}, ASessionTimeout),
        put({This, sessionInactivityTimeout}, ASessionInactivityTimeout),
        (get({get({'BasicUserRole', roleVector}), '$class'})):add(get({'BasicUserRole', roleVector}), This).

getRoleId(This) ->
        get({This, m_int_RoleId}).

% throws Exception
getRole(Role) when (is_list(Role) orelse Role =:= undefined) ->
        try
        RoleVector = 'BasicUserRole':getAll(),
        Size = (get({RoleVector, '$class'})):size(RoleVector),
        lists:foreach(fun(Index) ->
            UserRole = (get({RoleVector, '$class'})):get(RoleVector, Index),
            case ((get({Role, '$class'})):compareTo(Role, (get({UserRole, '$class'})):toString(UserRole)) =:= 0) of
                true ->
                throw({'$return', UserRole});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        erlang:error({'Exception', "Unable to get role - Unknown Role"})
        catch throw:{'$return', ReturnValue} -> ReturnValue end;
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


getAll() ->
        get({'BasicUserRole', roleVector}).

