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
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData
% import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewaysData
% import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType
% import org.allbinary.business.user.commerce.money.payment.types.PaymentTypeUtil
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('PaymentGatewaysView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, paymentGatewayVector}, undefined),
    ok.


new(TransformInfoInterface, GatewayVector) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, GatewayVector),
    This.

init(This, TransformInfoInterface, GatewayVector) ->
        'HttpStoreComponentView':init(This, TransformInfoInterface),
        init_fields(This),
        put({This, paymentGatewayVector}, GatewayVector).

% throws Exception
toXmlNode(This, Document) ->
        try
            StoreName = (fun(Target_N66356) -> (get({Target_N66356, '$class'})):getStoreName(Target_N66356) end)((get({This, '$class'})):getTransformInfoInterface(This)),
            PaymentGatewaysNode = (get({Document, '$class'})):createElement(Document, get({'PaymentGatewaysData', 'NAME'})),
            Size = (get({get({This, paymentGatewayVector}), '$class'})):size(get({This, paymentGatewayVector})),
            lists:foreach(fun(Index) ->
                PaymentType = (get({get({This, paymentGatewayVector}), '$class'})):get(get({This, paymentGatewayVector}), Index),
                HashMap = (get({PaymentType, '$class'})):toHashMap(PaymentType),
                (get({HashMap, '$class'})):put(HashMap, get({'EntryData':getInstance(), 'DEFAULT'}), (fun(Target_N66659) -> (get({Target_N66659, '$class'})):getName(Target_N66659) end)((fun(Target_N66666) -> (get({Target_N66666, '$class'})):getBasicPaymentType(Target_N66666) end)((fun(Target_N66673) -> (get({Target_N66673, '$class'})):getDefault(Target_N66673, StoreName) end)('PaymentTypeUtil':getInstance())))),
                PaymentGatewayNode = 'ModDomHelper':createNodeWithValueNodes(Document, (get({get({'PaymentGatewayData', 'NAME'}), '$class'})):toString(get({'PaymentGatewayData', 'NAME'})), HashMap),
                (get({PaymentGatewaysNode, '$class'})):appendChild(PaymentGatewaysNode, PaymentGatewayNode)
            end, lists:seq(0, Size - 1)),
            PaymentGatewaysNode
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'XSLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "toXmlNode", E);
                false -> ok
            end,
            erlang:error(E)
        end.

addDomNodeInterfaces(This) ->
        (get({This, '$class'})):addDomNodeInterface(This, This).

view(This) ->
        try
            (get({This, '$class'})):addDomNodeInterfaces(This),
            'HttpStoreComponentView':view(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to view payment gateways",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            Error
        end.

