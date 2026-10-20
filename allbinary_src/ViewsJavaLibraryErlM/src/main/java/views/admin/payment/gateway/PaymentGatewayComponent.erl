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
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface
% import org.allbinary.business.user.commerce.money.payment.gateway.modules.gateway.PaymentGatewayDomNodeFactoryInterface
% import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType
% import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('PaymentGatewayComponent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, paymentGatewayInterface}, undefined),
    ok.


new(TransformInfoInterface, PaymentGatewayInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface, PaymentGatewayInterface),
    This.

'$init'(This, TransformInfoInterface, PaymentGatewayInterface) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        put({This, paymentGatewayInterface}, PaymentGatewayInterface).

% throws Exception
addDomNodeInterfaces(This) ->
        PaymentType = (fun(Target_N66162) -> (get({Target_N66162, '$class'})):get(Target_N66162, (get({get({This, paymentGatewayInterface}), '$class'})):getName(get({This, paymentGatewayInterface}))) end)('BasicPaymentTypeUtil':getInstance()),
        PaymentGatewayDomNodeFactoryInterface = (get({PaymentType, '$class'})):getPaymentGatewayDomNodeFactoryInterface(PaymentType),
        DomNodeInterface = (get({PaymentGatewayDomNodeFactoryInterface, '$class'})):getInstance(PaymentGatewayDomNodeFactoryInterface, get({This, paymentGatewayInterface})),
        (get({This, '$class'})):addDomNodeInterface(This, DomNodeInterface).

view(This) ->
        try
            (get({This, '$class'})):addDomNodeInterfaces(This),
            'HttpStoreComponentView':view(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to view payment gateway",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            Error
        end.

