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
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface
% import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil
% import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface

-module('GatewayView').
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

getFormData(This, Request) ->
        'PaymentGatewayViewAbstract':getFormData(This, Request),
        case (fun(Target_N66033) -> (get({Target_N66033, '$class'})):isEmpty(Target_N66033, (fun(Target_N66058) -> (get({Target_N66058, '$class'})):getName(Target_N66058) end)((get({This, '$class'})):getPaymentGatewayPrimaryKey(This))) end)('StringValidationUtil':getInstance()) of
            true ->
            (fun(Target_N66087) -> (get({Target_N66087, '$class'})):setName(Target_N66087, (fun(Target_N66107) -> (get({Target_N66107, '$class'})):getPaymentMethod(Target_N66107) end)((get({This, '$class'})):getWeblisketSession(This))) end)((get({This, '$class'})):getPaymentGatewayPrimaryKey(This));
            false -> ok
        end.

% throws Exception
view(This) ->
        try
            PaymentGatewayInterface = (fun(Target_N66196) -> (get({Target_N66196, '$class'})):getPaymentGatewayInterface(Target_N66196, (fun(Target_N66221) -> (get({Target_N66221, '$class'})):getStoreName(Target_N66221) end)((get({This, '$class'})):getPaymentGatewayPrimaryKey(This)), (fun(Target_N66240) -> (get({Target_N66240, '$class'})):get(Target_N66240, (fun(Target_N66265) -> (get({Target_N66265, '$class'})):getName(Target_N66265) end)((get({This, '$class'})):getPaymentGatewayPrimaryKey(This))) end)('BasicPaymentTypeUtil':getInstance())) end)('PaymentGatewayEntityFactory':getInstance()),
            (fun(Target_N66307) -> (get({Target_N66307, '$class'})):view(Target_N66307) end)('PaymentGatewayComponent':new((get({This, '$class'})):getTransformInfoInterface(This), PaymentGatewayInterface))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "edit()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

