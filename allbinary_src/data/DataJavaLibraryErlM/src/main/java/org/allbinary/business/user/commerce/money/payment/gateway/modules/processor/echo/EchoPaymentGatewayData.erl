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
% package org.allbinary.business.user.commerce.money.payment.gateway.modules.processor.echo

-module('EchoPaymentGatewayData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'TRANSACTION_TYPE'}, "transaction_type"),
    put({?MODULE, 'MERCHANT_ECHO_ID'}, "merchant_echo_id"),
    put({?MODULE, 'ORDER_TYPE'}, "order_type"),
    put({?MODULE, 'MERCHANT_PIN'}, "merchant_pin"),
    put({?MODULE, 'ISP_ECHO_ID'}, "isp_echo_id"),
    put({?MODULE, 'ISP_PIN'}, "isp_pin"),
    put({?MODULE, 'BILLING_IP_ADDRESS'}, "billing_ip_address"),
    put({?MODULE, 'MERCHANT_EMAIL'}, "merchant_email"),
    put({?MODULE, 'AUTHORIZATION'}, "authorization"),
    put({?MODULE, 'BILLING_PREFIX'}, "billing_prefix"),
    put({?MODULE, 'BILLING_NAME'}, "billing_name"),
    put({?MODULE, 'BILLING_FIRST_NAME'}, "billing_first_name"),
    put({?MODULE, 'BILLING_LAST_NAME'}, "billing_last_name"),
    put({?MODULE, 'BILLING_COMPANY_NAME'}, "billing_company_name"),
    put({?MODULE, 'BILLING_ADDRESS1'}, "billing_address1"),
    put({?MODULE, 'BILLING_ADDRESS2'}, "billing_address2"),
    put({?MODULE, 'BILLING_CITY'}, "billing_city"),
    put({?MODULE, 'BILLING_STATE'}, "billing_state"),
    put({?MODULE, 'BILLING_ZIP'}, "billing_zip"),
    put({?MODULE, 'BILLING_COUNTRY'}, "billing_country"),
    put({?MODULE, 'BILLING_PHONE'}, "billing_phone"),
    put({?MODULE, 'BILLING_FAX'}, "billing_fax"),
    put({?MODULE, 'BILLING_EMAIL'}, "billing_email"),
    put({?MODULE, 'CC_NUMBER'}, "cc_number"),
    put({?MODULE, 'CCEXP_MONTH'}, "ccexp_month"),
    put({?MODULE, 'CCEXP_YEAR'}, "ccexp_year"),
    put({?MODULE, 'CNP_RECURRING'}, "cnp_recurring"),
    put({?MODULE, cnp_security}, "cnp_security"),
    put({?MODULE, 'COUNTER'}, "counter"),
    put({?MODULE, 'DEBUG'}, "debug"),
    put({?MODULE, 'EC_ACCOUNT'}, "ec_account"),
    put({?MODULE, 'EC_ACCOUNT_TYPE'}, "ec_account_type"),
    put({?MODULE, 'EC_ADDRESS1'}, "ec_address1"),
    put({?MODULE, 'EC_ADDRESS2'}, "ec_address2"),
    put({?MODULE, 'EC_BANK_NAME'}, "ec_bank_name"),
    put({?MODULE, 'EC_CITY'}, "ec_city"),
    put({?MODULE, 'EC_EMAIL'}, "ec_email"),
    put({?MODULE, 'EC_FIRST_NAME'}, "ec_first_name"),
    put({?MODULE, 'EC_ID_COUNTRY'}, "ec_id_country"),
    put({?MODULE, 'EC_ID_EXP_MM'}, "ec_id_exp_mm"),
    put({?MODULE, 'EC_ID_EXP_DD'}, "ec_id_exp_dd"),
    put({?MODULE, 'EC_ID_EXP_YY'}, "ec_id_exp_yy"),
    put({?MODULE, 'EC_ID_NUMBER'}, "ec_id_number"),
    put({?MODULE, 'EC_ID_STATE'}, "ec_id_state"),
    put({?MODULE, 'EC_ID_TYPE'}, "ec_id_type"),
    put({?MODULE, 'EC_LAST_NAME'}, "ec_last_name"),
    put({?MODULE, 'EC_BUSINESS_NAME'}, "ec_BUSINESS_NAME"),
    put({?MODULE, 'EC_LICENSE_NUMBER'}, "ec_LICENSE_NUMBER"),
    put({?MODULE, 'EC_LICENSE_STATE'}, "ec_LICENSE_STATE"),
    put({?MODULE, 'EC_MERCHANT_REF'}, "ec_MERCHANT_REF"),
    put({?MODULE, 'EC_NBDS_CODE'}, "ec_NBDS_CODE"),
    put({?MODULE, 'EC_OTHER_NAME'}, "ec_other_name"),
    put({?MODULE, 'EC_PAYEE'}, "ec_payee"),
    put({?MODULE, 'EC_PAYMENT_TYPE'}, "ec_payment_type"),
    put({?MODULE, 'EC_RT'}, "ec_rt"),
    put({?MODULE, 'EC_SERIAL_NUMBER'}, "ec_serial_number"),
    put({?MODULE, 'EC_STATE'}, "ec_state"),
    put({?MODULE, 'EC_TRANSACTION_DT'}, "ec_transaction_dt"),
    put({?MODULE, 'EC_ZIP'}, "ec_zip"),
    put({?MODULE, 'GRAND_TOTAL'}, "grand_total"),
    put({?MODULE, 'MERCHANT_TRACE_NBR'}, "merchant_trace_nbr"),
    put({?MODULE, 'ORDER_NUMBER'}, "order_number"),
    put({?MODULE, 'ORIGINAL_AMOUNT'}, "original_amount"),
    put({?MODULE, 'ORIGINAL_TRANDATE_MM'}, "original_trandate_mm"),
    put({?MODULE, 'ORIGINAL_TRANDATE_DD'}, "original_trandate_dd"),
    put({?MODULE, 'ORIGINAL_TRANDATE_YYYY'}, "original_trandate_yyyy"),
    put({?MODULE, 'ORIGINAL_REFERENCE'}, "original_reference"),
    put({?MODULE, 'PRODUCT_DESCRIPTION'}, "product_description"),
    put({?MODULE, 'PURCHASE_ORDER_NUMBER'}, "purchase_order_number"),
    put({?MODULE, 'SALES_TAX'}, "sales_tax"),
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

