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

-module('AdminRoleFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AdminRoleFactory':new()),
    ok.

init_fields(This) ->
    put({This, adminRoles}, 'BasicArrayListD':new()),
    put({This, storeAdminRoles}, 'BasicArrayListD':new()),
    put({This, storeManagementRoles}, 'BasicArrayListD':new()),
    put({This, productManagementRoles}, 'BasicArrayListD':new()),
    put({This, reviewManagementRoles}, 'BasicArrayListD':new()),
    put({This, customerManagementRoles}, 'BasicArrayListD':new()),
    put({This, workflowManagementRoles}, 'BasicArrayListD':new()),
    put({This, orderManagementRoles}, 'BasicArrayListD':new()),
    put({This, adjusterManagementRoles}, 'BasicArrayListD':new()),
    put({This, shippingManagementRoles}, 'BasicArrayListD':new()),
    put({This, webManagementRoles}, 'BasicArrayListD':new()),
    ok.


getInstance() ->
        get({'AdminRoleFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        BasicUserRoleFactory = 'BasicUserRoleFactory':getInstance(),
        (get({get({This, adminRoles}), '$class'})):add(get({This, adminRoles}), get({BasicUserRoleFactory, 'ADMINISTRATOR'})),
        (get({get({This, storeAdminRoles}), '$class'})):add(get({This, storeAdminRoles}), get({BasicUserRoleFactory, 'ADMINISTRATOR'})),
        (get({get({This, storeAdminRoles}), '$class'})):add(get({This, storeAdminRoles}), get({BasicUserRoleFactory, 'STOREMANAGER'})),
        (get({get({This, storeManagementRoles}), '$class'})):add(get({This, storeManagementRoles}), get({BasicUserRoleFactory, 'ADMINISTRATOR'})),
        (get({get({This, storeManagementRoles}), '$class'})):add(get({This, storeManagementRoles}), get({BasicUserRoleFactory, 'STOREMANAGER'})),
        (get({get({This, storeManagementRoles}), '$class'})):add(get({This, storeManagementRoles}), get({BasicUserRoleFactory, 'CUSTOMERMANAGER'})),
        (get({get({This, storeManagementRoles}), '$class'})):add(get({This, storeManagementRoles}), get({BasicUserRoleFactory, 'ADJUSTER'})),
        (get({get({This, storeManagementRoles}), '$class'})):add(get({This, storeManagementRoles}), get({BasicUserRoleFactory, 'PRODUCTMANAGER'})),
        (get({get({This, storeManagementRoles}), '$class'})):add(get({This, storeManagementRoles}), get({BasicUserRoleFactory, 'REVIEWER'})),
        (get({get({This, storeManagementRoles}), '$class'})):add(get({This, storeManagementRoles}), get({BasicUserRoleFactory, 'SHIPPING'})),
        (get({get({This, productManagementRoles}), '$class'})):add(get({This, productManagementRoles}), get({BasicUserRoleFactory, 'ADMINISTRATOR'})),
        (get({get({This, productManagementRoles}), '$class'})):add(get({This, productManagementRoles}), get({BasicUserRoleFactory, 'STOREMANAGER'})),
        (get({get({This, productManagementRoles}), '$class'})):add(get({This, productManagementRoles}), get({BasicUserRoleFactory, 'PRODUCTMANAGER'})),
        (get({get({This, reviewManagementRoles}), '$class'})):add(get({This, reviewManagementRoles}), get({BasicUserRoleFactory, 'ADMINISTRATOR'})),
        (get({get({This, reviewManagementRoles}), '$class'})):add(get({This, reviewManagementRoles}), get({BasicUserRoleFactory, 'STOREMANAGER'})),
        (get({get({This, reviewManagementRoles}), '$class'})):add(get({This, reviewManagementRoles}), get({BasicUserRoleFactory, 'REVIEWER'})),
        (get({get({This, customerManagementRoles}), '$class'})):add(get({This, customerManagementRoles}), get({BasicUserRoleFactory, 'ADMINISTRATOR'})),
        (get({get({This, customerManagementRoles}), '$class'})):add(get({This, customerManagementRoles}), get({BasicUserRoleFactory, 'STOREMANAGER'})),
        (get({get({This, customerManagementRoles}), '$class'})):add(get({This, customerManagementRoles}), get({BasicUserRoleFactory, 'CUSTOMERMANAGER'})),
        (get({get({This, workflowManagementRoles}), '$class'})):add(get({This, workflowManagementRoles}), get({BasicUserRoleFactory, 'ADMINISTRATOR'})),
        (get({get({This, workflowManagementRoles}), '$class'})):add(get({This, workflowManagementRoles}), get({BasicUserRoleFactory, 'STOREMANAGER'})),
        (get({get({This, workflowManagementRoles}), '$class'})):add(get({This, workflowManagementRoles}), get({BasicUserRoleFactory, 'WORKFLOWEDITOR'})),
        (get({get({This, orderManagementRoles}), '$class'})):add(get({This, orderManagementRoles}), get({BasicUserRoleFactory, 'ADMINISTRATOR'})),
        (get({get({This, orderManagementRoles}), '$class'})):add(get({This, orderManagementRoles}), get({BasicUserRoleFactory, 'STOREMANAGER'})),
        (get({get({This, adjusterManagementRoles}), '$class'})):add(get({This, adjusterManagementRoles}), get({BasicUserRoleFactory, 'ADMINISTRATOR'})),
        (get({get({This, adjusterManagementRoles}), '$class'})):add(get({This, adjusterManagementRoles}), get({BasicUserRoleFactory, 'STOREMANAGER'})),
        (get({get({This, adjusterManagementRoles}), '$class'})):add(get({This, adjusterManagementRoles}), get({BasicUserRoleFactory, 'ADJUSTER'})),
        (get({get({This, shippingManagementRoles}), '$class'})):add(get({This, shippingManagementRoles}), get({BasicUserRoleFactory, 'ADMINISTRATOR'})),
        (get({get({This, shippingManagementRoles}), '$class'})):add(get({This, shippingManagementRoles}), get({BasicUserRoleFactory, 'STOREMANAGER'})),
        (get({get({This, shippingManagementRoles}), '$class'})):add(get({This, shippingManagementRoles}), get({BasicUserRoleFactory, 'SHIPPING'})),
        (get({get({This, webManagementRoles}), '$class'})):add(get({This, webManagementRoles}), get({BasicUserRoleFactory, 'ADMINISTRATOR'})),
        (get({get({This, webManagementRoles}), '$class'})):add(get({This, webManagementRoles}), get({BasicUserRoleFactory, 'STOREMANAGER'})),
        (get({get({This, webManagementRoles}), '$class'})):add(get({This, webManagementRoles}), get({BasicUserRoleFactory, 'WEBMANAGER'})),
        (get({get({This, webManagementRoles}), '$class'})):add(get({This, webManagementRoles}), get({BasicUserRoleFactory, 'WORKFLOWEDITOR'})),
        (get({get({This, webManagementRoles}), '$class'})):add(get({This, webManagementRoles}), get({BasicUserRoleFactory, 'VIEWEDITOR'})).

getProductManagementRoles(This) ->
        get({This, productManagementRoles}).

getAdminRoles(This) ->
        get({This, adminRoles}).

getStoreAdminRoles(This) ->
        get({This, storeAdminRoles}).

getStoreManagementRoles(This) ->
        get({This, storeManagementRoles}).

getReviewManagementRoles(This) ->
        get({This, reviewManagementRoles}).

getCustomerManagementRoles(This) ->
        get({This, customerManagementRoles}).

getWorkflowManagementRoles(This) ->
        get({This, workflowManagementRoles}).

getWebManagementRoles(This) ->
        get({This, webManagementRoles}).

getShippingManagementRoles(This) ->
        get({This, shippingManagementRoles}).

getAdjusterManagementRoles(This) ->
        get({This, adjusterManagementRoles}).

getOrderManagementRoles(This) ->
        get({This, orderManagementRoles}).

