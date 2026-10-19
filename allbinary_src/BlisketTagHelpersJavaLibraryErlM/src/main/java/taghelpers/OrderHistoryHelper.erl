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
% package taghelpers
% import java.util.HashMap
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import admin.taghelpers.TagHelper
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.business.user.commerce.inventory.order.OrderData
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryFactory
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryInterface
% import org.allbinary.business.user.commerce.shipping.ShippingMethodData
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil

-module('OrderHistoryHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TagHelper', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, weblisketSession}, undefined),
    put({This, storeFrontInterface}, undefined),
    put({This, propertiesHashMap}, undefined),
    put({This, pageContext}, undefined),
    put({This, request}, undefined),
    put({This, streetAddress}, undefined),
    put({This, id}, undefined),
    put({This, groupId}, undefined),
    put({This, status}, undefined),
    put({This, newStatus}, undefined),
    ok.


new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, PropertiesHashMap, PageContext),
    This.

init(This, PropertiesHashMap, PageContext) ->
    'TagHelper':init(This),
    init_fields(This),
        put({This, propertiesHashMap}, PropertiesHashMap),
        put({This, pageContext}, PageContext),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
        StoreName = (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'StoreFrontData':getInstance(), 'NAME'})),
        put({This, newStatus}, (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'OrderHistoryData', 'STATUS'}))),
        case (StoreName =/= undefined) of
            true ->
            put({This, storeFrontInterface}, 'StoreFrontFactory':getInstance(StoreName));
            false -> ok
        end,
        (get({This, '$class'})):getFormData(This).

getFormData(This) ->
        put({This, id}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderData', 'ID'}))),
        put({This, groupId}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'ShippingMethodData', 'GROUP'}))),
        case (get({This, newStatus}) =:= undefined) of
            true ->
            put({This, newStatus}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'STATUS'})));
            false -> ok
        end.

setOrderStatus(This) ->
        try
        try
            Success = lists:concat(["Status successfully set to: ", get({This, status})]),
            OrderReviewInterface = 'OrderHistoryFactory':getInstance(get({This, id})),
            Status = (get({OrderReviewInterface, '$class'})):getStatus(OrderReviewInterface),
            case ((get({Status, '$class'})):compareTo(Status, get({'OrderHistoryData', 'CANCELLED'})) =:= 0) of
                true ->
                throw({'$return', lists:concat([lists:concat(["Order ", get({This, id})]), " Already Cancelled<br/>"])});
                false ->
                case ((get({Status, '$class'})):compareTo(Status, get({'OrderHistoryData', 'SHIPPED'})) =:= 0) of
                true ->
                throw({'$return', lists:concat([lists:concat(["Order ", get({This, id})]), " Already Shipped. You can't cancel a shipped order.<br/>"])});
                false ->
                case ((get({Status, '$class'})):compareTo(Status, get({'OrderHistoryData', 'PREPROCESSING'})) =:= 0) of
                true ->
                throw({'$return', lists:concat([lists:concat(["Order ", get({This, id})]), " has been cancelled.<br/>"])});
                false ->
                case ((get({Status, '$class'})):compareTo(Status, get({'OrderHistoryData', 'PARTIALLYSHIPPED'})) =:= 0) of
                true ->
                throw({'$return', lists:concat([lists:concat(["Order ", get({This, id})]), " Partially Shipped. You can cancel unshipped items, but not the whole order.<br/>"])});
                false ->
                case ((get({Status, '$class'})):compareTo(Status, get({'OrderHistoryData', 'PROCESSING'})) =:= 0) of
                true ->
                OrderHistoryEntityInterface = 'OrderHistoryEntityFactory':getInstance(),
                (get({OrderHistoryEntityInterface, '$class'})):setStatus(OrderHistoryEntityInterface, get({This, id}), get({This, newStatus})),
                throw({'$return', lists:concat([lists:concat(["Order ", get({This, id})]), " has been cancelled.<br/>"])});
                false -> ok
            end
            end
            end
            end
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "setOrderStatus()");
                false -> ok
            end,
            "Error Setting Order Status"
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to set order status",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "setOrderStatus()", E);
                false -> ok
            end,
            lists:concat([lists:concat([lists:concat([lists:concat([Error, "<br/>"]), "Exception: "]), E]), "<br/>"])
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

