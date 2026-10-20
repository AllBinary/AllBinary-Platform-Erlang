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
% import org.allbinary.business.context.modules.storefront.StoreFront
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.basket.BasketData
% import org.allbinary.business.user.commerce.inventory.basket.BasketInterface
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil

-module('BasketRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TagHelper', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, weblisketSession}, undefined),
    put({This, storeFrontInterface}, undefined),
    put({This, propertiesHashMap}, undefined),
    put({This, pageContext}, undefined),
    put({This, request}, undefined),
    put({This, id}, undefined),
    put({This, num}, undefined),
    put({This, 'MAX'}, 200),
    ok.


new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PropertiesHashMap, PageContext),
    This.

'$init'(This, PropertiesHashMap, PageContext) ->
    'TagHelper':'$init'(This),
    init_fields(This),
        put({This, propertiesHashMap}, PropertiesHashMap),
        put({This, pageContext}, PageContext),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
        StoreName = (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'StoreFrontData':getInstance(), 'NAME'})),
        case (StoreName =/= undefined) of
            true ->
            put({This, storeFrontInterface}, 'StoreFrontFactory':getInstance(StoreName));
            false ->
            put({This, storeFrontInterface}, 'StoreFront':new())
        end,
        put({This, weblisketSession}, 'WeblisketSession':new(PropertiesHashMap, PageContext)),
        (get({This, '$class'})):getFormData(This).

getFormData(This) ->
        put({This, id}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({get({This, basicItemData}), 'ID'}))),
        put({This, num}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({'BasketData', 'ITEMTOTALINBASKET'}))).

addItemToBasket(This) ->
        try
        try
            case ((get({This, id}) =/= undefined) andalso (get({This, num}) =/= undefined)) of
                true ->
                Basket = (fun(Target_N67086) -> (get({Target_N67086, '$class'})):getBasket(Target_N67086) end)((get({get({This, weblisketSession}), '$class'})):getOrder(get({This, weblisketSession}))),
                case ((fun(Target_N67136) -> (get({Target_N67136, '$class'})):getItem(Target_N67136, get({This, id})) end)((fun(Target_N67143) -> (get({Target_N67143, '$class'})):getInventoryEntityInstance(Target_N67143) end)('InventoryEntityFactory':getInstance())) =:= undefined) of
                    true ->
                    throw({'$return', false});
                    false -> ok
                end,
                (get({Basket, '$class'})):addItem(Basket, get({This, id}), get({This, num}));
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Successfully added item to Basket", This, "addItemToBasket()");
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "addItemToBasket()", E);
                false -> ok
            end,
            false
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

removeItemFromBasket(This) ->
        try
            case (get({This, id}) =/= undefined) of
                true ->
                Basket = (fun(Target_N67854) -> (get({Target_N67854, '$class'})):getBasket(Target_N67854) end)((get({get({This, weblisketSession}), '$class'})):getOrder(get({This, weblisketSession}))),
                (get({Basket, '$class'})):removeItem(Basket, get({This, id}));
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Successfully removed item from Basket", This, "removeItemFromBasket()");
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "removeItemFromBasket()", E);
                false -> ok
            end,
            false
        end.

adjustBasket(This) ->
        try
            Basket = (fun(Target_N68502) -> (get({Target_N68502, '$class'})):getBasket(Target_N68502) end)((get({get({This, weblisketSession}), '$class'})):getOrder(get({This, weblisketSession}))),
            case ((get({This, id}) =/= undefined) andalso (get({This, num}) =/= undefined)) of
                true ->
                (get({Basket, '$class'})):adjustItem(Basket, get({This, id}), get({This, num}));
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Successfull Adjusted Basket", This, "adjustBasket()");
                false -> ok
            end,
            true
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "adjustBasket()", E);
                false -> ok
            end,
            false
        end.

