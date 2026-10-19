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
% package org.allbinary.business.user.commerce.money.payment.gateway.modules.processor.authorizenet

-module('AuthorizeNetData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'X_LOGIN'}, "x_login"),
    put({?MODULE, 'X_TRAN_KEY'}, "x_tran_key"),
    put({?MODULE, 'X_VERSION'}, "x_version"),
    put({?MODULE, 'X_TEST_REQUEST'}, "x_test_request"),
    put({?MODULE, 'X_RELAY_RESPONSE'}, "x_relay_response"),
    put({?MODULE, 'X_DUPLICATE_WINDOW'}, "x_duplicate_window"),
    put({?MODULE, 'X_FIRST_NAME'}, "x_first_name"),
    put({?MODULE, 'X_LAST_NAME'}, "x_last_name"),
    put({?MODULE, 'X_COMPANY'}, "x_company"),
    put({?MODULE, 'X_ADDRESS'}, "x_address"),
    put({?MODULE, 'X_CITY'}, "x_city"),
    put({?MODULE, 'X_STATE'}, "x_state"),
    put({?MODULE, 'X_ZIP'}, "x_zip"),
    put({?MODULE, 'X_COUNTRY'}, "x_country"),
    put({?MODULE, 'X_PHONE'}, "x_phone"),
    put({?MODULE, 'X_FAX'}, "x_fax"),
    put({?MODULE, 'X_CUST_ID'}, "x_cust_id"),
    put({?MODULE, 'X_CUSTOMER_IP'}, "x_customer_ip"),
    put({?MODULE, 'X_CUSTOMER_TAX_ID'}, "x_customer_tax_id"),
    put({?MODULE, 'X_EMAIL_CUSTOMER'}, "x_email_customer"),
    put({?MODULE, 'X_EMAIL'}, "x_email"),
    put({?MODULE, 'X_EMAIL_MERCHANT'}, "x_email_merchant"),
    put({?MODULE, 'X_INVOICE_NUM'}, "x_invoice_num"),
    put({?MODULE, 'X_DESCRIPTION'}, "x_description"),
    put({?MODULE, 'X_SHIP_TO_FIRST_NAME'}, "x_ship_to_first_name"),
    put({?MODULE, 'X_SHIP_TO_LAST_NAME'}, "x_ship_to_last_name"),
    put({?MODULE, 'X_SHIP_TO_COMPANY'}, "x_ship_to_company"),
    put({?MODULE, 'X_SHIP_TO_ADDRESS'}, "x_ship_to_address"),
    put({?MODULE, 'X_SHIP_TO_CITY'}, "x_ship_to_city"),
    put({?MODULE, 'X_SHIP_TO_STATE'}, "x_ship_to_state"),
    put({?MODULE, 'X_SHIP_TO_ZIP'}, "x_ship_to_zip"),
    put({?MODULE, 'X_SHIP_TO_COUNTRY'}, "x_ship_to_country"),
    put({?MODULE, 'X_AMOUNT'}, "x_amount"),
    put({?MODULE, 'X_CURRENCY_CODE'}, "x_currency_code"),
    put({?MODULE, 'X_METHOD'}, "x_method"),
    put({?MODULE, 'X_TYPE'}, "x_type"),
    put({?MODULE, 'X_RECURRING_BILLING'}, "x_recurring_billing"),
    put({?MODULE, 'X_BANK_ABA_CODE'}, "x_bank_aba_code"),
    put({?MODULE, 'X_BANK_ACCT_NUM'}, "x_bank_acct_num"),
    put({?MODULE, 'X_BANK_ACCT_TYPE'}, "x_bank_acct_type"),
    put({?MODULE, 'X_BANK_NAME'}, "x_bank_name"),
    put({?MODULE, 'X_BANK_ACCT_NAME'}, "x_bank_acct_name"),
    put({?MODULE, 'X_ECHECK_TYPE'}, "x_echeck_type"),
    put({?MODULE, 'X_CARD_NUM'}, "x_card_num"),
    put({?MODULE, 'X_EXP_DATE'}, "x_exp_date"),
    put({?MODULE, 'X_CARD_CODE'}, "x_card_code"),
    put({?MODULE, 'X_TRANS_ID'}, "x_trans_id"),
    put({?MODULE, 'X_AUTH_CODE'}, "x_auth_code"),
    put({?MODULE, 'X_PO_NUM'}, "x_po_num"),
    put({?MODULE, 'X_TAX'}, "x_tax"),
    put({?MODULE, 'X_TAX_EXEMPT'}, "x_tax_exempt"),
    put({?MODULE, 'X_FREIGHT'}, "x_freight"),
    put({?MODULE, 'X_DUTY'}, "x_duty"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

