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
% package org.allbinary.business.user.commerce.money.payment.gateway

-module('PaymentGatewayData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'CRYPTNUM'}, 5),
    put({?MODULE, 'ID'}, 'PaymentGatewayData':new("PAYMENTGATEWAY_ID")),
    put({?MODULE, 'NAME'}, 'PaymentGatewayData':new("PAYMENTGATEWAY_NAME")),
    put({?MODULE, 'VALUE'}, 'PaymentGatewayData':new("PAYMENTGATEWAY_VALUE")),
    put({?MODULE, 'PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE'}, 'PaymentGatewayData':new("PAYMENTGATEWAY_PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE")),
    put({?MODULE, 'PAYMENTPROCESSORINTERFACEFACTORYINTERFACE'}, 'PaymentGatewayData':new("PAYMENTGATEWAY_PAYMENTPROCESSORINTERFACEFACTORYINTERFACE")),
    put({?MODULE, 'MODE'}, 'PaymentGatewayData':new("MODE")),
    put({?MODULE, 'SERVERPROTOCOL'}, 'PaymentGatewayData':new("SERVERPROTOCOL")),
    put({?MODULE, 'SERVER'}, 'PaymentGatewayData':new("SERVER")),
    put({?MODULE, 'SERVERPORT'}, 'PaymentGatewayData':new("SERVERPORT")),
    put({?MODULE, 'SERVERPATH'}, 'PaymentGatewayData':new("SERVERPATH")),
    put({?MODULE, 'TESTPROTOCOL'}, 'PaymentGatewayData':new("TESTSERVERPROTOCOL")),
    put({?MODULE, 'TESTSERVER'}, 'PaymentGatewayData':new("TESTSERVER")),
    put({?MODULE, 'TESTPORT'}, 'PaymentGatewayData':new("TESTPORT")),
    put({?MODULE, 'TESTPATH'}, 'PaymentGatewayData':new("TESTSERVERPATH")),
    put({?MODULE, 'TIMEOUT'}, 'PaymentGatewayData':new("TIMEOUT")),
    put({?MODULE, 'PROXYPROTOCOL'}, 'PaymentGatewayData':new("PROXYPROTOCOL")),
    put({?MODULE, 'PROXYSERVER'}, 'PaymentGatewayData':new("PROXYSERVER")),
    put({?MODULE, 'PROXYPATH'}, 'PaymentGatewayData':new("PROXYPATH")),
    put({?MODULE, 'PROXYUSERNAME'}, 'PaymentGatewayData':new("PROXYUSERNAME")),
    put({?MODULE, 'PROXYPASSWORD'}, 'PaymentGatewayData':new("PROXYPASSWORD")),
    put({?MODULE, 'PROXYPORT'}, 'PaymentGatewayData':new("PROXYPORT")),
    put({?MODULE, 'PROXYTIMEOUT'}, 'PaymentGatewayData':new("PROXYTIMEOUT")),
    put({?MODULE, 'SPECIAL1'}, 'PaymentGatewayData':new("SPECIAL1")),
    put({?MODULE, 'SPECIAL2'}, 'PaymentGatewayData':new("SPECIAL2")),
    put({?MODULE, 'SPECIAL3'}, 'PaymentGatewayData':new("SPECIAL3")),
    put({?MODULE, 'SPECIAL4'}, 'PaymentGatewayData':new("SPECIAL4")),
    put({?MODULE, 'SPECIAL5'}, 'PaymentGatewayData':new("SPECIAL5")),
    put({?MODULE, 'SPECIAL6'}, 'PaymentGatewayData':new("SPECIAL6")),
    put({?MODULE, 'SPECIAL7'}, 'PaymentGatewayData':new("SPECIAL7")),
    put({?MODULE, 'SPECIAL8'}, 'PaymentGatewayData':new("SPECIAL8")),
    put({?MODULE, 'SPECIAL9'}, 'PaymentGatewayData':new("SPECIAL9")),
    ok.

init_fields(This) ->
    put({This, key}, undefined),
    ok.


new(Value) when (is_list(Value) orelse Value =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Value),
    This.

init(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    init_fields(This),
        put({This, key}, Value).

toString(This) ->
        get({This, key}).

