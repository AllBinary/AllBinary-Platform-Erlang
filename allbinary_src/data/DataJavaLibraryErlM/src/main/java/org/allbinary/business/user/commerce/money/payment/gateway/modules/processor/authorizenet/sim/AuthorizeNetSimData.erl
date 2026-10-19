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
% package org.allbinary.business.user.commerce.money.payment.gateway.modules.processor.authorizenet.sim

-module('AuthorizeNetSimData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'X_FP_HASH'}, "x_fp_hash"),
    put({?MODULE, 'X_FP_SEQUENCE'}, "x_fp_sequence"),
    put({?MODULE, 'X_FP_TIMESTAMP'}, "x_fp_timestamp"),
    put({?MODULE, 'X_SHOW_FORM'}, "x_show_form"),
    put({?MODULE, 'X_HEADER_HTML_PAYMENT_FORM'}, "x_header_html_payment_form"),
    put({?MODULE, 'X_FOOTER_HTML_PAYMENT_FORM'}, "x_footer_html_payment_form"),
    put({?MODULE, 'X_HEADER_HTML_RECEIPT'}, "x_header_html_receipt"),
    put({?MODULE, 'X_FOOTER_HTML_RECEIPT'}, "x_footer_html_receipt"),
    put({?MODULE, 'X_RECEIPT_LINK_TEXT'}, "x_receipt_link_text"),
    put({?MODULE, 'X_RECEIPT_LINK_URL'}, "x_receipt_link_url"),
    put({?MODULE, 'X_LOGO_URL'}, "x_logo_url"),
    put({?MODULE, 'X_BACKGROUND_URL'}, "x_background_url"),
    put({?MODULE, 'X_COLOR_BACKGROUND'}, "x_color_background"),
    put({?MODULE, 'X_COLOR_LINK'}, "x_color_link"),
    put({?MODULE, 'X_COLOR_TEXT'}, "x_color_text"),
    put({?MODULE, 'X_RELAY_URL'}, "x_relay_url"),
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

