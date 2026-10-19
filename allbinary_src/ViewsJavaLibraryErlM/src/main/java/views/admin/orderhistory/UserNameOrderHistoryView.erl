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
% package views.admin.orderhistory
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.user.UserData
% import org.allbinary.business.user.commerce.inventory.order.OrderData
% import org.allbinary.business.user.commerce.inventory.order.OrderHistory
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData
% import org.allbinary.business.user.username.UserName
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.globals.GLOBALS2
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.validate.ValidationComponentInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import views.business.context.modules.storefront.HttpStoreComponentView

-module('UserNameOrderHistoryView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ValidationComponentInterface
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('HttpStoreComponentView', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, request}, undefined),
    put({This, userName}, undefined),
    put({This, shipped}, undefined),
    put({This, partiallyShipped}, undefined),
    put({This, processing}, undefined),
    put({This, preprocessing}, undefined),
    put({This, cancelled}, undefined),
    put({This, 'ON'}, "on"),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'HttpStoreComponentView':init(This, TransformInfoInterface),
        init_fields(This),
        put({This, request}, (fun(Target_N66566) -> (get({Target_N66566, '$class'})):getRequest(Target_N66566) end)((get({This, '$class'})):getPageContext(This))),
        put({This, userName}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'UserData', 'USERNAME'}))),
        put({This, preprocessing}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'PREPROCESSINGNAME'}))),
        put({This, shipped}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'SHIPPEDNAME'}))),
        put({This, partiallyShipped}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'PARTIALLYSHIPPEDNAME'}))),
        put({This, processing}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'PROCESSINGNAME'}))),
        put({This, cancelled}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'CANCELLEDNAME'}))).

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

toXmlNode(This, Document) ->
        try
            Node = (get({Document, '$class'})):createElement(Document, get({'OrderData', 'ORDERS'})),
            OrderHistoryEntity = 'OrderHistoryEntity':new(),
            OrderReviewVector = (get({OrderHistoryEntity, '$class'})):getOrders(OrderHistoryEntity, get({This, userName})),
            Size = (get({OrderReviewVector, '$class'})):size(OrderReviewVector),
            lists:foreach(fun(Index) ->
                OrderHistory = (get({OrderReviewVector, '$class'})):get(OrderReviewVector, Index),
                OrderHistoryNode = (get({OrderHistory, '$class'})):toXmlNode(OrderHistory, Document),
                OrderNode = (get({Document, '$class'})):createElement(Document, (get({OrderHistory, '$class'})):getPaymentMethod(OrderHistory)),
                (get({Node, '$class'})):appendChild(Node, (get({OrderHistory, '$class'})):toXmlNode(OrderHistory, Document))
            end, lists:seq(0, Size - 1)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Attempt to View a users order history", This, "view");
                false -> ok
            end,
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'OrderHistoryData', 'PREPROCESSINGNAME'}), get({'OrderHistoryData', 'PREPROCESSING'}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'OrderHistoryData', 'PROCESSINGNAME'}), get({'OrderHistoryData', 'PROCESSING'}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'OrderHistoryData', 'CANCELLEDNAME'}), get({'OrderHistoryData', 'CANCELLED'}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'OrderHistoryData', 'PARTIALLYSHIPPEDNAME'}), get({'OrderHistoryData', 'PARTIALLYSHIPPED'}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({'OrderHistoryData', 'SHIPPEDNAME'}), get({'OrderHistoryData', 'SHIPPED'}))),
            (get({Node, '$class'})):appendChild(Node, 'ModDomHelper':createNameValueNodes(Document, get({get({'UserNameOrderHistoryView', 'GLOBALS2'}), 'VIEWNAME'}), get({get({'UserNameOrderHistoryView', 'GLOBALS2'}), 'VIEW'}))),
            Node
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'XSLLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "toXmlNode", E);
                false -> ok
            end,
            undefined
        end.

isValid(This) ->
        try
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Started", This, get({get({This, commonStrings}), 'IS_VALID'}));
            false -> ok
        end,
        case ((fun(Target_N69202) -> (get({Target_N69202, '$class'})):isValid(Target_N69202, get({This, userName})) end)('UserName':getInstance()) =:= true) of
            true ->
            throw({'$return', true});
            false -> ok
        end,
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

validationInfo(This) ->
        try
        case (get({This, userName}) =:= undefined) of
            true ->
            "No User Name Specified<br />";
            false -> ok
        end,
        case ((fun(Target_N69467) -> (get({Target_N69467, '$class'})):isValid(Target_N69467, get({This, userName})) end)('UserName':getInstance()) =:= false) of
            true ->
            throw({'$return', "Invalid User Name<br />"});
            false -> ok
        end,
        "Unknown Error<br />"
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

