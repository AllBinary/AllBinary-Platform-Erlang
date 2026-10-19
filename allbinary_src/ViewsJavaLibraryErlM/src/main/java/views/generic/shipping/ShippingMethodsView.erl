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
% package views.generic.shipping
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.entry.EntryData
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.business.user.commerce.inventory.basket.BasketInterface
% import org.allbinary.business.user.commerce.inventory.order.OrderInterface
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.business.user.commerce.money.tax.TaxFactory
% import org.allbinary.business.user.commerce.shipping.ShippingMethods
% import org.allbinary.business.user.commerce.shipping.ShippingMethodsData
% import org.allbinary.business.user.commerce.shipping.modules.ShippingInterface
% import org.allbinary.data.tables.user.address.StreetAddressesEntityInterface
% import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('ShippingMethodsView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, shippingMethods}, undefined),
    put({This, storeFrontInterface}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'HttpStoreComponentView':init(This, TransformInfoInterface),
        init_fields(This),
        put({This, storeFrontInterface}, 'StoreFrontFactory':getInstance((fun(Target_N66583) -> (get({Target_N66583, '$class'})):getStoreName(Target_N66583) end)((get({This, '$class'})):getTransformInfoInterface(This)))),
        put({This, shippingMethods}, 'ShippingMethods':new(get({This, abeClientInformation}), get({This, storeFrontInterface}))).

% throws Exception
toXmlNode(This, Document) ->
        try
            ShippingMethodsNode = (get({Document, '$class'})):createElement(Document, get({'ShippingMethodsData', 'SHIPPINGMETHODSORDERSUMMARIES'})),
            Order = (fun(Target_N66797) -> (get({Target_N66797, '$class'})):getOrder(Target_N66797) end)((get({This, '$class'})):getWeblisketSession(This)),
            Basket = (fun(Target_N66843) -> (get({Target_N66843, '$class'})):getBasket(Target_N66843) end)((fun(Target_N66850) -> (get({Target_N66850, '$class'})):getOrder(Target_N66850) end)((get({This, '$class'})):getWeblisketSession(This))),
            ShippingAddressesEntityInterface = (fun(Target_N66897) -> (get({Target_N66897, '$class'})):getInstance(Target_N66897, (fun(Target_N66922) -> (get({Target_N66922, '$class'})):getUserName(Target_N66922) end)((get({This, '$class'})):getWeblisketSession(This))) end)('ShippingAddressesEntityFactory':getInstance()),
            StreetAddress = (get({ShippingAddressesEntityInterface, '$class'})):getDefault(ShippingAddressesEntityInterface),
            ShippingVector = (get({get({This, shippingMethods}), '$class'})):get(get({This, shippingMethods})),
            Size = (get({ShippingVector, '$class'})):size(ShippingVector),
            lists:foreach(fun(Index) ->
                ShippingMethodNode = (get({Document, '$class'})):createElement(Document, get({'ShippingMethodsData', 'SHIPPINGMETHODORDERSUMMARY'})),
                Shipping = (get({ShippingVector, '$class'})):get(ShippingVector, Index),
                ShippingView = Shipping,
                (get({ShippingMethodNode, '$class'})):appendChild(ShippingMethodNode, (get({ShippingView, '$class'})):toXmlNode(ShippingView, Document)),
                ShippingCost = (get({Shipping, '$class'})):getCost(Shipping, Order),
                SubTotal = (get({Basket, '$class'})):getSubTotal(Basket),
                TaxRate = (fun(Target_N67435) -> (get({Target_N67435, '$class'})):getTaxRate(Target_N67435, StreetAddress, get({This, storeFrontInterface})) end)((fun(Target_N67442) -> (get({Target_N67442, '$class'})):getInstance(Target_N67442, get({This, abeClientInformation}), get({This, storeFrontInterface})) end)('TaxFactory':getInstance())),
                Tax = 'Money':new(),
                Total = 'Money':new(),
                (get({Total, '$class'})):add(Total, (get({ShippingCost, '$class'})):toString(ShippingCost)),
                (get({Total, '$class'})):add(Total, (get({SubTotal, '$class'})):toString(SubTotal)),
                (get({Tax, '$class'})):add(Tax, (get({Total, '$class'})):toString(Total)),
                (get({Tax, '$class'})):multiply(Tax, TaxRate),
                (get({Total, '$class'})):add(Total, (get({Tax, '$class'})):toString(Tax)),
                (get({ShippingMethodNode, '$class'})):appendChild(ShippingMethodNode, 'ModDomHelper':createNameValueNodes(Document, get({'ShippingMethodsData', 'SHIPPINGCOST'}), (get({ShippingCost, '$class'})):toString(ShippingCost))),
                (get({ShippingMethodNode, '$class'})):appendChild(ShippingMethodNode, 'ModDomHelper':createNameValueNodes(Document, get({'ShippingMethodsData', 'TAXRATE'}), (get({TaxRate, '$class'})):toString(TaxRate))),
                (get({ShippingMethodNode, '$class'})):appendChild(ShippingMethodNode, 'ModDomHelper':createNameValueNodes(Document, get({'ShippingMethodsData', 'SUBTOTAL'}), (get({SubTotal, '$class'})):toString(SubTotal))),
                (get({ShippingMethodNode, '$class'})):appendChild(ShippingMethodNode, 'ModDomHelper':createNameValueNodes(Document, get({'ShippingMethodsData', 'TAX'}), (get({Tax, '$class'})):toString(Tax))),
                (get({ShippingMethodNode, '$class'})):appendChild(ShippingMethodNode, 'ModDomHelper':createNameValueNodes(Document, get({'ShippingMethodsData', 'TOTAL'}), (get({Total, '$class'})):toString(Total))),
                (get({ShippingMethodNode, '$class'})):appendChild(ShippingMethodNode, 'ModDomHelper':createNameValueNodes(Document, get({'EntryData':getInstance(), 'DEFAULT'}), (fun(Target_N68268) -> (get({Target_N68268, '$class'})):getName(Target_N68268) end)((get({get({This, shippingMethods}), '$class'})):getDefault(get({This, shippingMethods}))))),
                (get({ShippingMethodsNode, '$class'})):appendChild(ShippingMethodsNode, ShippingMethodNode)
            end, lists:seq(0, Size - 1)),
            ShippingMethodsNode
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
            Error = "Failed to view ShippingMethods",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "view()", E);
                false -> ok
            end,
            Error
        end.

