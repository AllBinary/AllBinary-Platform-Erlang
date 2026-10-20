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
% package org.allbinary.logic.visual.transform.info

-module('BasicViewData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'BasicViewData':new()),
    ok.

init_fields(This) ->
    put({This, 'GENERICDIR'}, "generic/"),
    put({This, 'USERDIR'}, lists:concat([get({This, 'GENERICDIR'}), "user/"])),
    put({This, 'ADDRESSDIR'}, lists:concat([get({This, 'USERDIR'}), "address/"])),
    put({This, 'BILLINGADDRESSDIR'}, lists:concat([get({This, 'ADDRESSDIR'}), "billing/"])),
    put({This, 'SHIPPINGADDRESSDIR'}, lists:concat([get({This, 'ADDRESSDIR'}), "shipping/"])),
    put({This, 'COMMERCEDIR'}, lists:concat([get({This, 'USERDIR'}), "commerce/"])),
    put({This, 'INVENTORYDIR'}, lists:concat([get({This, 'COMMERCEDIR'}), "inventory/"])),
    put({This, 'BASKETDIR'}, lists:concat([get({This, 'INVENTORYDIR'}), "basket/"])),
    put({This, 'ITEMDIR'}, lists:concat([get({This, 'INVENTORYDIR'}), "item/"])),
    put({This, 'MONEYDIR'}, lists:concat([get({This, 'COMMERCEDIR'}), "money/"])),
    put({This, 'SHIPPINGDIR'}, lists:concat([get({This, 'COMMERCEDIR'}), "shipping/"])),
    put({This, 'ORDERDIR'}, lists:concat([get({This, 'INVENTORYDIR'}), "order/"])),
    put({This, 'ORDEREMAILDIR'}, lists:concat([get({This, 'ORDERDIR'}), "email/"])),
    put({This, 'ORDERHISTORYDIR'}, lists:concat([get({This, 'ORDERDIR'}), "history/"])),
    put({This, 'ORDERREVIEWDIR'}, lists:concat([get({This, 'ORDERDIR'}), "review/"])),
    put({This, 'PAYMENTDIR'}, lists:concat([get({This, 'MONEYDIR'}), "payment/"])),
    put({This, 'GENERATIONDIR'}, lists:concat([get({This, 'GENERICDIR'}), "generation/"])),
    put({This, 'PRODUCTSDIR'}, lists:concat([get({This, 'GENERICDIR'}), "products/"])),
    put({This, 'IGNOREXMLXSL'}, lists:concat([get({This, 'GENERICDIR'}), "ignoreXmlView.xsl"])),
    put({This, 'REVIEWORDERVIEWXSL'}, lists:concat([get({This, 'ORDERREVIEWDIR'}), "reviewOrderView.xsl"])),
    put({This, 'ORDERVIEWXSL'}, get({This, 'REVIEWORDERVIEWXSL'})),
    put({This, 'INVENTORYXSL'}, lists:concat([get({This, 'INVENTORYDIR'}), "inventory.xsl"])),
    put({This, 'BASKETXSL'}, lists:concat([get({This, 'BASKETDIR'}), "basket.xsl"])),
    put({This, 'CHECKOUTBASKETXSL'}, lists:concat([get({This, 'BASKETDIR'}), "staticBasket.xsl"])),
    put({This, 'MINIBASKETXSL'}, lists:concat([get({This, 'BASKETDIR'}), "miniBasket.xsl"])),
    put({This, 'BILLINGADDRESSCHANGEFORMXSL'}, lists:concat([get({This, 'BILLINGADDRESSDIR'}), "billingAddressChangeForm.xsl"])),
    put({This, 'BILLINGADDRESSINPUTFORMXSL'}, lists:concat([get({This, 'BILLINGADDRESSDIR'}), "billingAddressInputForm.xsl"])),
    put({This, 'BILLINGADDRESSVIEWXSL'}, lists:concat([get({This, 'BILLINGADDRESSDIR'}), "billingAddressView.xsl"])),
    put({This, 'SHIPPINGADDRESSCHANGEFORMXSL'}, lists:concat([get({This, 'SHIPPINGADDRESSDIR'}), "shippingAddressChangeForm.xsl"])),
    put({This, 'SHIPPINGADDRESSINPUTFORMXSL'}, lists:concat([get({This, 'SHIPPINGADDRESSDIR'}), "shippingAddressInputForm.xsl"])),
    put({This, 'SHIPPINGADDRESSVIEWXSL'}, lists:concat([get({This, 'SHIPPINGADDRESSDIR'}), "shippingAddressView.xsl"])),
    put({This, 'NEWTAXADDRESSXSL'}, lists:concat([get({This, 'SHIPPINGADDRESSDIR'}), "newTaxAddressView.xsl"])),
    put({This, 'EDITTAXADDRESSXSL'}, lists:concat([get({This, 'SHIPPINGADDRESSDIR'}), "editTaxAddressView.xsl"])),
    put({This, 'SHIPPINGMETHODSXSL'}, lists:concat([get({This, 'SHIPPINGDIR'}), "shippingMethods.xsl"])),
    put({This, 'ORDERCUSTOMEREMAILVIEWXSL'}, lists:concat([get({This, 'ORDEREMAILDIR'}), "orderCustomerEmailView.xsl"])),
    put({This, 'ORDERMANAGEREMAILVIEWXSL'}, lists:concat([get({This, 'ORDEREMAILDIR'}), "orderManagerEmailView.xsl"])),
    put({This, 'EDITCUSTOMERXSL'}, lists:concat([get({This, 'USERDIR'}), "editCustomerInputForm.xsl"])),
    put({This, 'ORDERHISTORYXSL'}, lists:concat([get({This, 'ORDERHISTORYDIR'}), "orderHistory.xsl"])),
    put({This, 'PAYMENTVIEWXSL'}, lists:concat([get({This, 'PAYMENTDIR'}), "paymentView.xsl"])),
    put({This, 'SUMMARYXSL'}, lists:concat([get({This, 'ITEMDIR'}), "summary/summary.xsl"])),
    put({This, 'PAYMENTGATEWAYOPTIONSXSL'}, lists:concat([get({This, 'PAYMENTDIR'}), "paymentGatewayOptions.xsl"])),
    put({This, 'MAKEPAYMENTVIEWXSL'}, lists:concat([lists:concat([get({This, 'PAYMENTDIR'}), "invoice/"]), "makePayment.xsl"])),
    ok.


getInstance() ->
        get({'BasicViewData', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

