% 
% AllBinary Open License Version 1 
% Copyright (c) 2026 AllBinary 
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

-module('BasicUserRoles').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicUserRoles':new()),
    ok.

init_fields(This) ->
    put({This, roleVector}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'BasicUserRoles', instance}).

% throws Exception
getRole(This, Role) when (is_list(Role) orelse Role =:= undefined) ->
        try
        RoleVector = (get({This, '$class'})):getAll(This),
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
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getAll(This) ->
        get({This, roleVector}).

