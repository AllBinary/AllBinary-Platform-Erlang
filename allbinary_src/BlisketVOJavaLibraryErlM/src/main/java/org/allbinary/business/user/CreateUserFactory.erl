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
% package org.allbinary.business.user
% import java.util.HashMap
% import org.allbinary.business.user.role.UserRole
% import org.allbinary.business.user.role.UserRoleB
% import org.allbinary.business.user.role.UserRoleData
% import org.allbinary.logic.string.StringValidationUtil

-module('CreateUserFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(HashMap) ->
        try
        case (HashMap =/= undefined) of
            true ->
            RoleString = (get({HashMap, '$class'})):get(HashMap, (get({get({'UserRoleData', 'NAME'}), '$class'})):toString(get({'UserRoleData', 'NAME'}))),
            case (not (fun(Target_N65907) -> (get({Target_N65907, '$class'})):isEmpty(Target_N65907, RoleString) end)('StringValidationUtil':getInstance())) of
                true ->
                Role = 'UserRoleB':getRole(RoleString),
                throw({'$return', (fun(Target_N66035) -> (get({Target_N66035, '$class'})):getInstance(Target_N66035, HashMap) end)((get({Role, '$class'})):getUserFactory(Role))});
                false ->
                erlang:error({'Exception', "No Role Specified"})
            end;
            false ->
            erlang:error({'Exception', "Null HashMap"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

