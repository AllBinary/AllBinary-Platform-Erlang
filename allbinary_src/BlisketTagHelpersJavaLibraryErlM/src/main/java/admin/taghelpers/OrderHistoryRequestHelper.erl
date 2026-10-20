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
% import org.allbinary.business.user.commerce.inventory.order.OrderData
% import org.allbinary.business.user.commerce.inventory.order.OrderHistory
% import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData
% import org.allbinary.business.user.commerce.inventory.order.status.OrderStatusEmail
% import org.allbinary.business.user.commerce.shipping.ShippingMethodData
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory
% import org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntityFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory
% import org.allbinary.string.CommonPhoneStrings

-module('OrderHistoryRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TagHelper', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, abeClientInformation}, 'ServiceClientInformationInterfaceFactory':getInstance()),
    put({This, request}, undefined),
    put({This, id}, undefined),
    put({This, groupId}, undefined),
    put({This, status}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, PageContext),
    This.

'$init'(This, HashMap, PageContext) ->
    'TagHelper':'$init'(This),
    init_fields(This),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
        (get({This, '$class'})):getFormData(This).

getFormData(This) ->
        put({This, id}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderData', 'ID'}))),
        put({This, groupId}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'ShippingMethodData', 'GROUP'}))),
        put({This, status}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'OrderHistoryData', 'STATUS'}))).

setOrderStatus(This) ->
        try
            case ((get({get({This, groupId}), '$class'})):compareTo(get({This, groupId}), get({'CommonPhoneStrings':getInstance(), 'ZERO'})) =/= 0) of
                true ->
                case (fun(Target_N66754) -> (get({Target_N66754, '$class'})):isEverythingShipped(Target_N66754, get({This, id})) end)('OrderItemsEntityFactory':getInstance()) of
                    true ->
                    put({This, status}, get({'OrderHistoryData', 'SHIPPED'}));
                    false ->
                    put({This, status}, get({'OrderHistoryData', 'PARTIALLYSHIPPED'}))
                end;
                false -> ok
            end,
            Success = lists:concat(["Status successfully set to: ", get({This, status})]),
            (fun(Target_N66936) -> (get({Target_N66936, '$class'})):setStatus(Target_N66936, get({This, id}), get({This, status})) end)('OrderHistoryEntityFactory':getInstance()),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Success", This, "setOrderStatus()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to set order status",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "setOrderStatus()", E);
                false -> ok
            end,
            Error
        end.

setOrderStatus(This, NewStatus) when (is_list(NewStatus) orelse NewStatus =:= undefined) ->
        put({local, newStatus}, NewStatus),
        try
            case (get({local, newStatus}) =:= undefined) of
                true ->
                put({local, newStatus}, get({This, status}));
                false -> ok
            end,
            Success = lists:concat(["Status successfully set to: ", get({local, newStatus})]),
            (fun(Target_N67653) -> (get({Target_N67653, '$class'})):setStatus(Target_N67653, get({This, id}), get({local, newStatus})) end)('OrderHistoryEntityFactory':getInstance()),
            OrderHistory = (fun(Target_N67718) -> (get({Target_N67718, '$class'})):getOrder(Target_N67718, get({This, id})) end)('OrderHistoryEntityFactory':getInstance()),
            (fun(Target_N67775) -> (get({Target_N67775, '$class'})):process(Target_N67775) end)('OrderStatusEmail':new(get({This, abeClientInformation}), OrderHistory)),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Success", This, "setOrderStatus()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to view order table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "setOrderStatus(newStatus)", E);
                false -> ok
            end,
            Error
        end.

