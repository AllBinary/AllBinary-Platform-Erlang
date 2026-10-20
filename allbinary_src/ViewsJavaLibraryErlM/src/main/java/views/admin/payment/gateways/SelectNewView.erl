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
% package views.admin.payment.gateways
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil
% import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory
% import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import views.admin.payment.gateway.PaymentGatewayViewAbstract

-module('SelectNewView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('PaymentGatewayViewAbstract', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'PaymentGatewayViewAbstract':'$init'(This, TransformInfoInterface),
        init_fields(This).

% throws Exception
view(This) ->
        try
            PaymentGatewayEntityInterface = 'PaymentGatewayEntityFactory':getInstance(),
            ExistingGateways = (get({PaymentGatewayEntityInterface, '$class'})):findPaymentTypeVectorByStore(PaymentGatewayEntityInterface, (fun(Target_N66115) -> (get({Target_N66115, '$class'})):getStoreName(Target_N66115) end)((get({This, '$class'})):getPaymentGatewayPrimaryKey(This))),
            AllGatewaysLessExisting = (fun(Target_N66163) -> (get({Target_N66163, '$class'})):difference(Target_N66163, ExistingGateways) end)('BasicPaymentTypeUtil':getInstance()),
            (fun(Target_N66217) -> (get({Target_N66217, '$class'})):view(Target_N66217) end)('PaymentGatewaysView':new((get({This, '$class'})):getTransformInfoInterface(This), AllGatewaysLessExisting))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view", E);
                false -> ok
            end,
            erlang:error(E)
        end.

