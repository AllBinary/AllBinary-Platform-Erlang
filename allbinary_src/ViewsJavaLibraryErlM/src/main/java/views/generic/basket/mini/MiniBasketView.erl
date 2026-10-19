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
% package views.generic.basket.mini
% import org.allbinary.business.user.commerce.inventory.basket.BasketData
% import org.allbinary.business.user.commerce.inventory.basket.BasketInterface
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.search.SearchData
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('MiniBasketView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'HttpStoreComponentView':init(This, TransformInfoInterface),
        init_fields(This).

% throws Exception
toXmlNode(This, Document) ->
        try
            BasketInterface = (fun(Target_N66075) -> (get({Target_N66075, '$class'})):getBasket(Target_N66075) end)((fun(Target_N66082) -> (get({Target_N66082, '$class'})):getOrder(Target_N66082) end)((get({This, '$class'})):getWeblisketSession(This))),
            BasketNode = (get({Document, '$class'})):createElement(Document, get({'BasketData', 'BASKET'})),
            TotalNumberNode = (get({Document, '$class'})):createElement(Document, get({'SearchData', 'TOTAL_NUMBER_ITEMS'})),
            TotalNumberTextNode = (get({Document, '$class'})):createTextNode(Document, (fun(Target_N66274) -> (get({Target_N66274, '$class'})):toString(Target_N66274) end)((get({BasketInterface, '$class'})):getNumberOfItems(BasketInterface))),
            (get({TotalNumberNode, '$class'})):appendChild(TotalNumberNode, TotalNumberTextNode),
            TotalWeightNode = (get({Document, '$class'})):createElement(Document, get({'BasketData', 'TOTALWEIGHT'})),
            TotalWeightTextNode = (get({Document, '$class'})):createTextNode(Document, (fun(Target_N66437) -> (get({Target_N66437, '$class'})):toString(Target_N66437) end)((get({BasketInterface, '$class'})):getTotalWeight(BasketInterface))),
            (get({TotalWeightNode, '$class'})):appendChild(TotalWeightNode, TotalWeightTextNode),
            SubTotalNode = (get({Document, '$class'})):createElement(Document, get({'BasketData', 'SUBTOTAL'})),
            SubTotalTextNode = (get({Document, '$class'})):createTextNode(Document, (fun(Target_N66600) -> (get({Target_N66600, '$class'})):toString(Target_N66600) end)((get({BasketInterface, '$class'})):getSubTotal(BasketInterface))),
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

