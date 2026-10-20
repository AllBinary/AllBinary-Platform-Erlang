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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.UserFactoryInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.string.StringValidationUtil

-module('UserRoleB').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('UserRole', Function, Arguments).

static_init() ->
    put({?MODULE, roleVector}, 'BasicArrayListD':new()),
    ok.

init_fields(This) ->
    ok.


new(ABasicUserRole, AUserFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ABasicUserRole, AUserFactoryInterface),
    This.

'$init'(This, ABasicUserRole, AUserFactoryInterface) ->
        'UserRole':'$init'(This, ABasicUserRole, AUserFactoryInterface),
        (get({get({'UserRoleB', roleVector}), '$class'})):add(get({'UserRoleB', roleVector}), This).

% throws Exception
getRole(Role) when (is_list(Role) orelse Role =:= undefined) ->
        try
        'UserRoleFactory':getInstance(),
        case (not (fun(Target_N65936) -> (get({Target_N65936, '$class'})):isEmpty(Target_N65936, Role) end)('StringValidationUtil':getInstance())) of
            true ->
            RoleVector = 'UserRoleB':getAll(),
            Size = (get({RoleVector, '$class'})):size(RoleVector),
            lists:foreach(fun(Index) ->
                UserRole = (get({RoleVector, '$class'})):get(RoleVector, Index),
                case ((get({Role, '$class'})):compareTo(Role, (get({UserRole, '$class'})):toString(UserRole)) =:= 0) of
                    true ->
                    throw({'$return', UserRole});
                    false -> ok
                end
            end, lists:seq(0, Size - 1));
            false -> ok
        end,
        erlang:error({'Exception', lists:concat(["Unable to get role - Unknown Role = ", Role])})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getAll() ->
        'UserRoleFactory':getInstance(),
        get({'UserRoleB', roleVector}).

