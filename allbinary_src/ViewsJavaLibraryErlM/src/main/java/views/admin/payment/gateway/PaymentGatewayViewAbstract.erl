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
% package views.admin.payment.gateway
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayPrimaryKey
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpComposite
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface

-module('PaymentGatewayViewAbstract').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TransformInfoHttpComposite', Function, Arguments).

init_fields(This) ->
    put({This, paymentGatewayPrimaryKey}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'TransformInfoHttpComposite':init(This, TransformInfoInterface),
        init_fields(This),
        (get({This, '$class'})):getFormData(This, (fun(Target_N65871) -> (get({Target_N65871, '$class'})):getRequest(Target_N65871) end)((get({This, '$class'})):getPageContext(This))).

getFormData(This, Request) ->
        StoreName = (fun(Target_N65955) -> (get({Target_N65955, '$class'})):getStoreName(Target_N65955) end)((get({This, '$class'})):getWeblisketSession(This)),
        GatewayName = (get({Request, '$class'})):getParameter(Request, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'}))),
        (get({This, '$class'})):setPaymentGatewayPrimaryKey(This, 'PaymentGatewayPrimaryKey':new(StoreName, GatewayName)).

getPaymentGatewayPrimaryKey(This) ->
        get({This, paymentGatewayPrimaryKey}).

setPaymentGatewayPrimaryKey(This, PaymentGatewayPrimaryKey) ->
        put({This, paymentGatewayPrimaryKey}, PaymentGatewayPrimaryKey).

