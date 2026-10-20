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

-module('StoreRoleFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'StoreRoleFactory':new()),
    ok.

init_fields(This) ->
    put({This, roles}, 'BasicArrayListD':new()),
    put({This, subscriberRoles}, 'BasicArrayListD':new()),
    put({This, wholesaleRoles}, 'BasicArrayListD':new()),
    ok.


getInstance() ->
        get({'StoreRoleFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        BasicUserRoleFactory = 'BasicUserRoleFactory':getInstance(),
        (get({get({This, roles}), '$class'})):add(get({This, roles}), get({BasicUserRoleFactory, 'CUSTOMER'})),
        (get({get({This, roles}), '$class'})):add(get({This, roles}), get({BasicUserRoleFactory, 'SUBSCRIBERCUSTOMER'})),
        (get({get({This, roles}), '$class'})):add(get({This, roles}), get({BasicUserRoleFactory, 'WHOLESALECUSTOMER'})),
        (get({get({This, subscriberRoles}), '$class'})):add(get({This, subscriberRoles}), get({BasicUserRoleFactory, 'SUBSCRIBERCUSTOMER'})),
        (get({get({This, wholesaleRoles}), '$class'})):add(get({This, wholesaleRoles}), get({BasicUserRoleFactory, 'WHOLESALECUSTOMER'})).

getRoles(This) ->
        get({This, roles}).

getSubscriberRoles(This) ->
        get({This, subscriberRoles}).

getWholesaleRoles(This) ->
        get({This, wholesaleRoles}).

