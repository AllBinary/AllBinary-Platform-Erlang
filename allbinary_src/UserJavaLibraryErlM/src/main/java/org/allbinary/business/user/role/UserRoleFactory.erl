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
% import org.allbinary.business.user.modules.UserFactory
% import org.allbinary.business.user.modules.admin.AdminUserFactory
% import org.allbinary.business.user.modules.admin.store.StoreAdminUserFactory
% import org.allbinary.business.user.modules.admin.store.customer.CustomerStoreAdminUserFactory
% import org.allbinary.business.user.modules.admin.store.order.OrderStoreAdminUserFactory
% import org.allbinary.business.user.modules.admin.store.order.adjust.AdjustOrderStoreAdminUserFactory
% import org.allbinary.business.user.modules.admin.store.order.review.ReviewOrderStoreAdminUserFactory
% import org.allbinary.business.user.modules.admin.store.order.ship.ShipOrderStoreAdminUserFactory
% import org.allbinary.business.user.modules.admin.store.payment.PaymentStoreAdminUserFactory
% import org.allbinary.business.user.modules.admin.store.product.ProductStoreAdminUserFactory
% import org.allbinary.business.user.modules.admin.store.web.WebStoreAdminUserFactory
% import org.allbinary.business.user.modules.admin.store.web.view.editor.ViewEditorWebStoreAdminUserFactory
% import org.allbinary.business.user.modules.admin.store.web.wizard.WizardWebStoreAdminUserFactory
% import org.allbinary.business.user.modules.admin.store.web.workflow.editor.WorkflowEditorWebStoreAdminUserFactory
% import org.allbinary.business.user.modules.customer.subscriber.SubscriberUserFactory
% import org.allbinary.business.user.modules.customer.wholesale.WholesaleUserFactory

-module('UserRoleFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'UserRoleFactory':new()),
    ok.

init_fields(This) ->
    put({This, basicUserRoleFactory}, 'BasicUserRoleFactory':getInstance()),
    put({This, 'INSTALLER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'INSTALLER'}), undefined)),
    put({This, 'ADMINISTRATOR'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'ADMINISTRATOR'}), 'AdminUserFactory':new())),
    put({This, 'CUSTOMER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'CUSTOMER'}), 'UserFactory':new())),
    put({This, 'SUBSCRIBERCUSTOMER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'SUBSCRIBERCUSTOMER'}), 'SubscriberUserFactory':new())),
    put({This, 'WHOLESALECUSTOMER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'WHOLESALECUSTOMER'}), 'WholesaleUserFactory':new())),
    put({This, 'STOREMANAGER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'STOREMANAGER'}), 'StoreAdminUserFactory':new())),
    put({This, 'PRODUCTMANAGER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'PRODUCTMANAGER'}), 'ProductStoreAdminUserFactory':new())),
    put({This, 'CUSTOMERMANAGER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'CUSTOMERMANAGER'}), 'CustomerStoreAdminUserFactory':new())),
    put({This, 'PAYMENTMANAGER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'PAYMENTMANAGER'}), 'PaymentStoreAdminUserFactory':new())),
    put({This, 'ORDERMANAGER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'ORDERMANAGER'}), 'OrderStoreAdminUserFactory':new())),
    put({This, 'WEBMANAGER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'WEBMANAGER'}), 'WebStoreAdminUserFactory':new())),
    put({This, 'REVIEWER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'REVIEWER'}), 'ReviewOrderStoreAdminUserFactory':new())),
    put({This, 'SHIPPING'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'SHIPPING'}), 'ShipOrderStoreAdminUserFactory':new())),
    put({This, 'ADJUSTER'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'ADJUSTER'}), 'AdjustOrderStoreAdminUserFactory':new())),
    put({This, 'WORKFLOWEDITOR'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'WORKFLOWEDITOR'}), 'WorkflowEditorWebStoreAdminUserFactory':new())),
    put({This, 'WIZARD'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'WIZARD'}), 'WizardWebStoreAdminUserFactory':new())),
    put({This, 'VIEWEDITOR'}, 'UserRoleB':new(get({get({This, basicUserRoleFactory}), 'VIEWEDITOR'}), 'ViewEditorWebStoreAdminUserFactory':new())),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'UserRoleFactory', instance}).

