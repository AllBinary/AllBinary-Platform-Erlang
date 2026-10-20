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
% package views.generic.order
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.user.commerce.inventory.basket.Basket
% import org.allbinary.business.user.commerce.inventory.basket.BasketReview
% import org.allbinary.business.user.commerce.inventory.order.Order
% import org.allbinary.business.user.commerce.inventory.order.OrderData
% import org.allbinary.business.user.commerce.inventory.order.OrderHistory
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('OrderView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, request}, undefined),
    put({This, order}, undefined),
    put({This, orderHistory}, undefined),
    put({This, basketReview}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        put({This, request}, (fun(Target_N66260) -> (get({Target_N66260, '$class'})):getRequest(Target_N66260) end)((get({This, '$class'})):getPageContext(This))),
        (get({This, '$class'})):getFormData(This).

% throws Exception
getFormData(This) ->
        put({local, id}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderData', 'ID'}))),
        case (get({local, id}) =:= undefined) of
            true ->
            put({local, id}, (fun(Target_N66462) -> (get({Target_N66462, '$class'})):getId(Target_N66462) end)((fun(Target_N66469) -> (get({Target_N66469, '$class'})):getOrder(Target_N66469) end)((get({This, '$class'})):getWeblisketSession(This))));
            false -> ok
        end,
        put({This, order}, 'Order':new('Basket':new())),
        (get({get({This, order}), '$class'})):setId(get({This, order}), get({local, id})).

toXmlNode(This, Document) ->
        try
            OrderHistoryNode = (get({get({This, orderHistory}), '$class'})):toXmlNode(get({This, orderHistory}), Document),
            Node = (get({Document, '$class'})):createElement(Document, (get({get({This, orderHistory}), '$class'})):getPaymentMethod(get({This, orderHistory}))),
            (get({OrderHistoryNode, '$class'})):appendChild(OrderHistoryNode, (get({get({This, basketReview}), '$class'})):toXmlNode(get({This, basketReview}), Document)),
            (get({Node, '$class'})):appendChild(Node, OrderHistoryNode),
            Node
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'XSLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "toXmlNode", E);
                false -> ok
            end,
            undefined
        end.

addDomNodeInterfaces(This) ->
        (get({This, '$class'})):addDomNodeInterface(This, This).

% throws Exception
view(This) ->
        try
            (get({This, '$class'})):addDomNodeInterfaces(This),
            'HttpStoreComponentView':view(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            erlang:error(E)
        end.

