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

-module('BasicUserRoleFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicUserRoleFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'INACTIVITYTIMEOUT'}, 360000000),
    put({This, 'CUSTOMERTIMEOUT'}, 360000000),
    put({This, 'CUSTOMERMAXSESSIONTIME'}, 360000000),
    put({This, 'MAXSESSIONTIME'}, 360000000),
    put({This, 'INSTALLER'}, 'BasicUserRole':new("Installer", 16, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'ADMINISTRATOR'}, 'BasicUserRole':new("Administrator", 0, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'CUSTOMER'}, 'BasicUserRole':new("CustomerUser", "Customer User", 1, get({This, 'CUSTOMERTIMEOUT'}), get({This, 'CUSTOMERMAXSESSIONTIME'}))),
    put({This, 'SUBSCRIBERCUSTOMER'}, 'BasicUserRole':new("SubscriberUser", "Subscriber User", 2, get({This, 'CUSTOMERTIMEOUT'}), get({This, 'CUSTOMERMAXSESSIONTIME'}))),
    put({This, 'WHOLESALECUSTOMER'}, 'BasicUserRole':new("WholesaleUser", "Wholesale User", 3, get({This, 'CUSTOMERTIMEOUT'}), get({This, 'CUSTOMERMAXSESSIONTIME'}))),
    put({This, 'STOREMANAGER'}, 'BasicUserRole':new("StoreManager", "Store Manager", 4, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'PRODUCTMANAGER'}, 'BasicUserRole':new("ProductManager", "Product Manager", 5, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'CUSTOMERMANAGER'}, 'BasicUserRole':new("UserManager", "User Manager", 6, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'PAYMENTMANAGER'}, 'BasicUserRole':new("PaymentManager", "Payment Manager", 7, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'ORDERMANAGER'}, 'BasicUserRole':new("OrderManager", "Order Manager", 8, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'WEBMANAGER'}, 'BasicUserRole':new("WebManager", "Web Manager", 9, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'REVIEWER'}, 'BasicUserRole':new("Reviewer", 10, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'SHIPPING'}, 'BasicUserRole':new("Shipping", 11, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'ADJUSTER'}, 'BasicUserRole':new("Adjuster", 12, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'WORKFLOWEDITOR'}, 'BasicUserRole':new("WorkFlowEditor", "WorkFlow Editor", 13, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'WIZARD'}, 'BasicUserRole':new("WizardUser", "Wizard User", 14, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    put({This, 'VIEWEDITOR'}, 'BasicUserRole':new("ViewEditor", "View Editor", 15, get({This, 'MAXSESSIONTIME'}), get({This, 'INACTIVITYTIMEOUT'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'BasicUserRoleFactory', instance}).

