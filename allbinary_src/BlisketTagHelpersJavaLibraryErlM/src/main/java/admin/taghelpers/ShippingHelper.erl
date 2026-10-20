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
% package admin.taghelpers
% import java.util.HashMap
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.order.OrderInterface
% import org.allbinary.business.user.commerce.shipping.ShippingMethodData
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil

-module('ShippingHelper').
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
    put({This, shippingType}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, PageContext),
    This.

'$init'(This, HashMap, PageContext) ->
    'TagHelper':'$init'(This),
    init_fields(This),
        put({This, pageContext}, PageContext),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
        StoreName = (get({HashMap, '$class'})):get(HashMap, get({'StoreFrontData':getInstance(), 'NAME'})),
        case (StoreName =/= undefined) of
            true ->
            put({This, storeFrontInterface}, 'StoreFrontFactory':getInstance(StoreName));
            false -> ok
        end,
        put({This, weblisketSession}, 'WeblisketSession':new(HashMap, PageContext)),
        (get({This, '$class'})):getFormData(This).

getFormData(This) ->
        put({This, shippingType}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'ShippingMethodData', 'NAME'}))).

setShippingType(This) ->
        try
            Success = "Successfully Set Shipping Type",
            Order = (get({get({This, weblisketSession}), '$class'})):getOrder(get({This, weblisketSession})),
            (get({Order, '$class'})):setShippingMethod(Order, get({This, shippingType})),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "setShippingType()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to view Shipping Type",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "setShippingType()", E);
                false -> ok
            end,
            Error
        end.

