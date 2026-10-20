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
% package views.generic.basket
% import java.util.HashMap
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.user.commerce.inventory.basket.BasketData
% import org.allbinary.business.user.commerce.inventory.basket.BasketInterface
% import org.allbinary.business.user.commerce.inventory.item.BasicItemView
% import org.allbinary.business.user.commerce.inventory.item.ItemInterface
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.search.SearchData
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('BasketView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, request}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
        'HttpStoreComponentView':'$init'(This, TransformInfoInterface),
        init_fields(This),
        put({This, request}, (fun(Target_N66433) -> (get({Target_N66433, '$class'})):getRequest(Target_N66433) end)((get({This, '$class'})):getPageContext(This))).

% throws Exception
toXmlNode(This, Document) ->
        try
            InventoryEntity = (fun(Target_N66539) -> (get({Target_N66539, '$class'})):getInventoryEntityInstance(Target_N66539) end)('InventoryEntityFactory':getInstance()),
            BasketInterface = (fun(Target_N66590) -> (get({Target_N66590, '$class'})):getBasket(Target_N66590) end)((fun(Target_N66597) -> (get({Target_N66597, '$class'})):getOrder(Target_N66597) end)((get({This, '$class'})):getWeblisketSession(This))),
            BasketNode = (get({Document, '$class'})):createElement(Document, get({'BasketData', 'BASKET'})),
            ItemsAndNumberInBasket = (get({BasketInterface, '$class'})):getItems(BasketInterface),
            put({local, numberOfResults}, 1),
            Items = (get({ItemsAndNumberInBasket, '$class'})):keySet(ItemsAndNumberInBasket),
            ProductArray = (get({Items, '$class'})):toArray(Items),
            Size = array:size(ProductArray),
            lists:foreach(fun(Index) ->
                Product = allbinary_java:to_string(array:get(Index, ProductArray)),
                ItemInterface = (get({InventoryEntity, '$class'})):getItem(InventoryEntity, Product),
                case (ItemInterface =/= undefined) of
                    true ->
                    BasicItemView = 'BasicItemView':new(ItemInterface, 'BasicArrayListD':new()),
                    Node = (get({BasicItemView, '$class'})):toXmlNode(BasicItemView, Document),
                    NumberInBasket = (fun(Target_N67253) -> (get({Target_N67253, '$class'})):toString(Target_N67253) end)((get({BasketInterface, '$class'})):getNumberOf(BasketInterface, Product)),
                    (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'BasketData', 'ITEMTOTALINBASKET'}), NumberInBasket)),
                    ItemPrice = (get({ItemInterface, '$class'})):getPrice(ItemInterface),
                    ItemTotal = 'Money':new(ItemPrice),
                    (get({ItemTotal, '$class'})):multiply(ItemTotal, (fun(Target_N67495) -> (get({Target_N67495, '$class'})):intValue(Target_N67495) end)((get({BasketInterface, '$class'})):getNumberOf(BasketInterface, Product))),
                    (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'BasketData', 'ITEMTOTAL'}), (get({ItemTotal, '$class'})):toString(ItemTotal))),
                    (get({BasketNode, '$class'})):appendChild(BasketNode, Node);
                    false ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Product Failed: ", Product]), This, "toXmlNode")
                end,
                put({local, numberOfResults}, get({local, numberOfResults}) + 1)
            end, lists:seq(0, Size - 1)),
            TotalNumberNode = (get({Document, '$class'})):createElement(Document, get({'SearchData', 'TOTAL_NUMBER_ITEMS'})),
            TotalNumberTextNode = (get({Document, '$class'})):createTextNode(Document, (fun(Target_N67822) -> (get({Target_N67822, '$class'})):toString(Target_N67822) end)((get({BasketInterface, '$class'})):getNumberOfItems(BasketInterface))),
            (get({TotalNumberNode, '$class'})):appendChild(TotalNumberNode, TotalNumberTextNode),
            TotalWeightNode = (get({Document, '$class'})):createElement(Document, get({'BasketData', 'TOTALWEIGHT'})),
            TotalWeightTextNode = (get({Document, '$class'})):createTextNode(Document, (fun(Target_N67985) -> (get({Target_N67985, '$class'})):toString(Target_N67985) end)((get({BasketInterface, '$class'})):getTotalWeight(BasketInterface))),
            (get({TotalWeightNode, '$class'})):appendChild(TotalWeightNode, TotalWeightTextNode),
            SubTotalNode = (get({Document, '$class'})):createElement(Document, get({'BasketData', 'SUBTOTAL'})),
            SubTotalTextNode = (get({Document, '$class'})):createTextNode(Document, (fun(Target_N68148) -> (get({Target_N68148, '$class'})):toString(Target_N68148) end)((get({BasketInterface, '$class'})):getSubTotal(BasketInterface))),
            (get({SubTotalNode, '$class'})):appendChild(SubTotalNode, SubTotalTextNode),
            (get({BasketNode, '$class'})):appendChild(BasketNode, TotalNumberNode),
            (get({BasketNode, '$class'})):appendChild(BasketNode, TotalWeightNode),
            (get({BasketNode, '$class'})):appendChild(BasketNode, SubTotalNode),
            BasketNode
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

