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
% package org.allbinary.business.context.modules.storefront.statistics.users
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.UserInterface
% import org.allbinary.business.user.role.UserRole
% import org.allbinary.data.tables.user.UserEntityFactory
% import org.allbinary.data.tables.user.UserEntityInterface
% import org.allbinary.logic.StdUtil

-module('StoreFrontUsersStatistics').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements StoreFrontUsersStatisticsInterface

init_fields(This) ->
    put({This, totalNumberOfUsers}, undefined),
    put({This, totalUsersByRoleHashMap}, undefined),
    ok.


new(StoreFrontInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, StoreFrontInterface),
    This.

'$init'(This, StoreFrontInterface) ->
    init_fields(This),
        put({This, totalUsersByRoleHashMap}, (fun(Target_N65990) -> (get({Target_N65990, '$class'})):createHashMap(Target_N65990) end)('StdUtil':getInstance())),
        UserEntityInterface = 'UserEntityFactory':getInstance(),
        UserVector = (get({UserEntityInterface, '$class'})):getCustomers(UserEntityInterface),
        put({This, totalNumberOfUsers}, (get({UserVector, '$class'})):size(UserVector)),
        Size = (get({UserVector, '$class'})):size(UserVector),
        lists:foreach(fun(Index) ->
            UserInterface = (get({UserVector, '$class'})):get(UserVector, Index),
            NextUserRole = (get({UserInterface, '$class'})):getRole(UserInterface),
            CurrentNumberOfUsersForRole = (get({This, '$class'})):getNewTotal(This, NextUserRole),
            (get({get({This, totalUsersByRoleHashMap}), '$class'})):put(get({This, totalUsersByRoleHashMap}), NextUserRole, CurrentNumberOfUsersForRole)
        end, lists:seq(0, Size - 1)).

getNewTotal(This, UserRole) ->
        put({local, numberOfUsersForRoleLong}, (get({get({This, totalUsersByRoleHashMap}), '$class'})):get(get({This, totalUsersByRoleHashMap}), UserRole)),
        case (get({local, numberOfUsersForRoleLong}) =:= undefined) of
            true ->
            put({local, numberOfUsersForRoleLong}, 0);
            false -> ok
        end,
        ((get({get({local, numberOfUsersForRoleLong}), '$class'})):longValue(get({local, numberOfUsersForRoleLong})) + 1).

getNumberOfUsers(This) ->
        get({This, totalNumberOfUsers}).

getNumberOfUsersByRole(This, Role) when (is_list(Role) orelse Role =:= undefined) ->
        TotalForRole = (get({get({This, totalUsersByRoleHashMap}), '$class'})):get(get({This, totalUsersByRoleHashMap}), Role),
        TotalForRole.

toHashMap(This) ->
        HashMap = (fun(Target_N66957) -> (get({Target_N66957, '$class'})):createHashMap(Target_N66957) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({'StoreFrontUsersStatisticsData':getInstance(), 'NUMBEROFUSERS'}), (fun(Target_N67041) -> (get({Target_N67041, '$class'})):toString(Target_N67041) end)((get({This, '$class'})):getNumberOfUsers(This))),
        SetOfUserRoles = (get({get({This, totalUsersByRoleHashMap}), '$class'})):keySet(get({This, totalUsersByRoleHashMap})),
        put({local, nextUserRole}, undefined),
        UserRoleArray = (get({SetOfUserRoles, '$class'})):toArray(SetOfUserRoles),
        Size = array:size(UserRoleArray),
        lists:foreach(fun(Index) ->
            put({local, nextUserRole}, array:get(Index, UserRoleArray)),
            TotalForRole = (get({get({This, totalUsersByRoleHashMap}), '$class'})):get(get({This, totalUsersByRoleHashMap}), get({local, nextUserRole})),
            (get({HashMap, '$class'})):put(HashMap, (get({get({local, nextUserRole}), '$class'})):toString(get({local, nextUserRole})), (get({TotalForRole, '$class'})):toString(TotalForRole))
        end, lists:seq(0, Size - 1)),
        HashMap.

toVector(This) ->
        undefined.

getKey(This) ->
        undefined.

