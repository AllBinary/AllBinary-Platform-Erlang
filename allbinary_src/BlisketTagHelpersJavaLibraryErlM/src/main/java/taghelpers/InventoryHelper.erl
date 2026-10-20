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
% import javax.servlet.http.HttpServletResponse
% import javax.servlet.jsp.PageContext
% import admin.taghelpers.TagHelper
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.address.StreetAddress
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.logic.communication.http.AcceptableResponseGenerator
% import org.allbinary.logic.communication.http.request.session.WeblisketSession
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.search.SearchParams
% import org.allbinary.logic.control.search.SearchRequest
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoData
% import views.admin.inventory.listings.InventoryViewFactory
% import views.admin.inventory.listings.InventoryViewSearchInterface

-module('InventoryHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TagHelper', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, weblisketSession}, undefined),
    put({This, response}, undefined),
    put({This, request}, undefined),
    put({This, streetAddress}, undefined),
    put({This, id}, undefined),
    put({This, searchRequest}, undefined),
    ok.


new(PropertiesHashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PropertiesHashMap, PageContext),
    This.

'$init'(This, PropertiesHashMap, PageContext) ->
    'TagHelper':'$init'(This),
    init_fields(This),
        put({This, response}, (get({PageContext, '$class'})):getResponse(PageContext)),
        put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
        StoreName = (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'StoreFrontData':getInstance(), 'NAME'})),
        XslFile = (get({PropertiesHashMap, '$class'})):get(PropertiesHashMap, get({'TransformInfoData':getInstance(), 'TEMPLATEFILENAME'})),
        case (StoreName =/= undefined) of
            true ->
            StoreFrontInterface = 'StoreFrontFactory':getInstance(StoreName),
            ContentType = (fun(Target_N66850) -> (get({Target_N66850, '$class'})):get(Target_N66850, get({This, request})) end)('AcceptableResponseGenerator':getInstance()),
            SearchParams = 'SearchParams':new(get({This, request})),
            put({This, searchRequest}, 'SearchRequest':new(StoreFrontInterface, SearchParams, XslFile, ContentType, PropertiesHashMap, PageContext));
            false -> ok
        end,
        (get({This, '$class'})):getFormData(This).

getFormData(This) ->
        put({This, id}, (get({get({This, request}), '$class'})):getParameter(get({This, request}), get({get({This, basicItemData}), 'ID'}))).

viewSummary(This) ->
        try
            InventoryViewSearchInterface = 'InventoryViewFactory':getInstance(get({This, searchRequest})),
            Result = (get({InventoryViewSearchInterface, '$class'})):getProduct(InventoryViewSearchInterface, get({This, id})),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Successfull Inventory View Summary", This, "viewSummary()");
                false -> ok
            end,
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to View Summary",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "viewSummary()", E);
                false -> ok
            end,
            lists:concat([lists:concat([lists:concat([lists:concat([Error, "<br>"]), "Exception: "]), E]), "<br>"])
        end.

search(This) ->
        try
        try
            StringUtil = 'StringUtil':getInstance(),
            Keywords = (fun(Target_N68009) -> (get({Target_N68009, '$class'})):get(Target_N68009, get({get({This, basicItemData}), 'KEYWORDS'})) end)((fun(Target_N68016) -> (get({Target_N68016, '$class'})):get(Target_N68016) end)((get({get({This, searchRequest}), '$class'})):getParams(get({This, searchRequest})))),
            case ((Keywords =:= undefined) orelse ((get({Keywords, '$class'})):compareTo(Keywords, get({StringUtil, 'EMPTY_STRING'})) =:= 0)) of
                true ->
                throw({'$return', "Please enter a keyword in the search field above the Search button."});
                false -> ok
            end,
            InventoryViewSearchInterface = 'InventoryViewFactory':getInstance(get({This, searchRequest})),
            Result = (get({InventoryViewSearchInterface, '$class'})):searchSingleDynamicPage(InventoryViewSearchInterface),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Successful Inventory Dynamic Search", This, "searchSingleDynamicPage()");
                false -> ok
            end,
            Result
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to search Inventory by keyword",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "searchSingleDynamicPage()", E);
                false -> ok
            end,
            lists:concat([lists:concat([lists:concat([lists:concat([Error, "<br>"]), "Exception: "]), E]), "<br>"])
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

