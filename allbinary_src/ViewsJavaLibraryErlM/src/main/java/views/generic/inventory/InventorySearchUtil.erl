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
% package views.generic.inventory
% import java.util.HashMap
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.InventoryData
% import org.allbinary.business.user.commerce.inventory.basket.BasketData
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.business.user.commerce.inventory.item.BasicItemView
% import org.allbinary.business.user.commerce.inventory.item.ItemInterface
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.search.SearchData
% import org.allbinary.logic.control.search.SearchParams
% import org.allbinary.logic.control.search.SearchRequest
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.StoreTransformer
% import org.allbinary.logic.visual.transform.data.TransformDocumentInterface
% import org.allbinary.logic.visual.transform.data.TransformStoreDocumentFactory
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpSearch
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('InventorySearchUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InventorySearchUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, commonPhoneStrings}, 'CommonPhoneStrings':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'InventorySearchUtil', instance}).

% throws Exception
getBasicItemIdColumn(This, SearchRequest) ->
        InventoryEntityInterface = (fun(Target_N67014) -> (get({Target_N67014, '$class'})):getInventoryEntityInstance(Target_N67014) end)('InventoryEntityFactory':getInstance()),
        StoreFrontInterface = (get({SearchRequest, '$class'})):getStoreFront(SearchRequest),
        InventorySearchUtil = 'InventoryColumnUtil':getInstance(),
        Column = (get({InventorySearchUtil, '$class'})):getColumnWhereLike(InventorySearchUtil, InventoryEntityInterface, (get({StoreFrontInterface, '$class'})):getCategoryPath(StoreFrontInterface), get({get({This, basicItemData}), 'ID'})),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Items Found: ", (get({Column, '$class'})):size(Column)]), This, "search");
            false -> ok
        end,
        SubStoreVector = (get({StoreFrontInterface, '$class'})):getSubStores(StoreFrontInterface),
        Size = (get({SubStoreVector, '$class'})):size(SubStoreVector),
        lists:foreach(fun(Index) ->
            SubStore = (get({SubStoreVector, '$class'})):get(SubStoreVector, Index),
            SubstoreIdColumn = (get({InventorySearchUtil, '$class'})):getColumnWhereLike(InventorySearchUtil, InventoryEntityInterface, SubStore, get({get({This, basicItemData}), 'ID'})),
            (get({Column, '$class'})):addAllList(Column, SubstoreIdColumn)
        end, lists:seq(0, Size - 1)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Number Of Items Found Including SubStores: ", (get({Column, '$class'})):size(Column)]), This, "search");
            false -> ok
        end,
        Column.

% throws Exception
getNoResults(This, ViewDocumentInterface, InventoryNode) ->
        (get({InventoryNode, '$class'})):appendChild(InventoryNode, 'ModDomHelper':createNameValueNodes((get({ViewDocumentInterface, '$class'})):getDoc(ViewDocumentInterface), get({'SearchData', 'TOTAL_NUMBER_PAGES'}), get({get({This, commonPhoneStrings}), 'ZERO'}))),
        (get({InventoryNode, '$class'})):appendChild(InventoryNode, 'ModDomHelper':createNameValueNodes((get({ViewDocumentInterface, '$class'})):getDoc(ViewDocumentInterface), get({'SearchData', 'TOTAL_NUMBER_ITEMS'}), get({get({This, commonPhoneStrings}), 'ZERO'}))),
        Success = 'XmlDocumentHelper':toString((get({ViewDocumentInterface, '$class'})):getDoc(ViewDocumentInterface)),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["No Results Xml: ", Success]), This, "search");
            false -> ok
        end,
        Success.

search(This, AbeClientInformation, SearchRequest, Column) ->
        try
        try
            InventoryEntityInterface = (fun(Target_N68679) -> (get({Target_N68679, '$class'})):getInventoryEntityInstance(Target_N68679) end)('InventoryEntityFactory':getInstance()),
            SearchParams = (get({SearchRequest, '$class'})):getParams(SearchRequest),
            StartPage = (fun(Target_N68773) -> (get({Target_N68773, '$class'})):intValue(Target_N68773) end)((get({SearchParams, '$class'})):getStartPageInt(SearchParams)),
            put({local, endPage}, (fun(Target_N68820) -> (get({Target_N68820, '$class'})):intValue(Target_N68820) end)((get({SearchParams, '$class'})):getEndPageInt(SearchParams))),
            put({local, pageLength}, (fun(Target_N68867) -> (get({Target_N68867, '$class'})):intValue(Target_N68867) end)((get({SearchParams, '$class'})):getLengthInt(SearchParams))),
            put({local, savedPagesInRange}, 0),
            ColumnValueHashMap = (get({SearchParams, '$class'})):get(SearchParams),
            put({local, keyword}, (fun(Target_N68988) -> (get({Target_N68988, '$class'})):all(Target_N68988, (get({ColumnValueHashMap, '$class'})):get(ColumnValueHashMap, get({get({This, basicItemData}), 'KEYWORDS'}))) end)('Replace':new("-", get({'CommonSeps':getInstance(), 'SPACE'})))),
            case (fun(Target_N69108) -> (get({Target_N69108, '$class'})):isEmpty(Target_N69108, get({local, keyword})) end)('StringValidationUtil':getInstance()) of
                true ->
                throw({'$return', undefined});
                false -> ok
            end,
            StringBuffer = 'StringMaker':new(),
            case (StartPage >= 0) of
                true ->
                case (get({local, pageLength}) =:= 0) of
                    true ->
                    put({local, pageLength}, get({'SearchData', 'DEFAULT_PAGE_LENGTH'}));
                    false -> ok
                end,
                MAXPAGES = 100,
                ProductListingPages = array:new(MAXPAGES, {default, undefined}),
                Documents = array:new(MAXPAGES, {default, undefined}),
                InventoryNodes = array:new(MAXPAGES, {default, undefined}),
                put({local, keyword}, string:uppercase(get({local, keyword}))),
                put({local, lastPage}, (-1)),
                put({local, numberOfResultsOnCurrentPage}, 0),
                put({local, numberOfResults}, 0),
                put({local, viewDocumentInterface}, 'TransformStoreDocumentFactory':getInstance(SearchRequest)),
                put({local, inventoryNode}, (fun(Target_N69717) -> (get({Target_N69717, '$class'})):createElement(Target_N69717, get({'InventoryData', 'INVENTORY'})) end)((get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface})))),
                (fun(Target_N69779) -> (get({Target_N69779, '$class'})):appendChild(Target_N69779, get({local, inventoryNode})) end)((get({get({local, viewDocumentInterface}), '$class'})):getBaseNode(get({local, viewDocumentInterface}))),
                (get({get({local, inventoryNode}), '$class'})):appendChild(get({local, inventoryNode}), 'ModDomHelper':createNameValueNodes((get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface})), get({'SearchData', 'PAGE'}), (get({StartPage, '$class'})):toString(StartPage))),
                case ((get({SearchRequest, '$class'})):getFileBaseName(SearchRequest) =/= undefined) of
                    true ->
                    (get({get({local, inventoryNode}), '$class'})):appendChild(get({local, inventoryNode}), (get({SearchRequest, '$class'})):getFileBaseNameNode(SearchRequest, (get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface}))));
                    false -> ok
                end,
                put({local, currentPage}, (-1)),
                Size = (get({Column, '$class'})):size(Column),
                lists:foreach(fun(Index) ->
                    Product = allbinary_java:to_string((get({Column, '$class'})):get(Column, Index)),
                    ItemInterface = (get({InventoryEntityInterface, '$class'})):getItem(InventoryEntityInterface, Product),
                    put({local, keywords}, (get({ItemInterface, '$class'})):getKeywords(ItemInterface)),
                    put({local, keywords}, string:uppercase(get({local, keywords}))),
                    case (allbinary_java:index_of(get({local, keywords}), get({local, keyword})) =/= (-1)) of
                        true ->
                        case (((get({local, currentPage}) + 1) >= StartPage) andalso ((get({local, currentPage}) + 1) =< get({local, endPage}))) of
                            true ->
                            ItemNode = (fun(Target_N70447) -> (get({Target_N70447, '$class'})):toXmlNode(Target_N70447, (get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface}))) end)('BasicItemView':new(ItemInterface, 'BasicArrayListD':new())),
                            (get({ItemNode, '$class'})):appendChild(ItemNode, 'ModDomHelper':createNameValueNodes((get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface})), get({'BasketData', 'ITEMTOTALINBASKET'}), get({get({This, commonPhoneStrings}), 'ONE'}))),
                            (get({get({local, inventoryNode}), '$class'})):appendChild(get({local, inventoryNode}), (get({ItemNode, '$class'})):cloneNode(ItemNode, true));
                            false -> ok
                        end,
                        put({local, currentPage}, (((((get({local, numberOfResults}) + 1)) div get({local, pageLength}))) - 1)),
                        put({local, numberOfResultsOnCurrentPage}, get({local, numberOfResultsOnCurrentPage}) + 1),
                        case (get({local, lastPage}) < get({local, currentPage})) of
                            true ->
                            case ((get({local, currentPage}) >= StartPage) andalso (get({local, currentPage}) =< get({local, endPage}))) of
                                true ->
                                (get({get({local, inventoryNode}), '$class'})):appendChild(get({local, inventoryNode}), 'ModDomHelper':createNameValueNodes((get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface})), get({'SearchData', 'TOTAL_NUMBER_ITEMS_ON_THIS_PAGE'}), (get({get({local, numberOfResultsOnCurrentPage}), '$class'})):toString(get({local, numberOfResultsOnCurrentPage})))),
                                array:set(get({local, currentPage}), (get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface})), Documents),
                                array:set(get({local, currentPage}), get({local, inventoryNode}), InventoryNodes),
                                put({local, savedPagesInRange}, get({local, savedPagesInRange}) + 1),
                                put({local, viewDocumentInterface}, 'TransformStoreDocumentFactory':getInstance(SearchRequest)),
                                put({local, inventoryNode}, (fun(Target_N71111) -> (get({Target_N71111, '$class'})):createElement(Target_N71111, get({'InventoryData', 'INVENTORY'})) end)((get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface})))),
                                (fun(Target_N71159) -> (get({Target_N71159, '$class'})):appendChild(Target_N71159, get({local, inventoryNode})) end)((get({get({local, viewDocumentInterface}), '$class'})):getBaseNode(get({local, viewDocumentInterface}))),
                                (get({get({local, inventoryNode}), '$class'})):appendChild(get({local, inventoryNode}), 'ModDomHelper':createNameValueNodes((get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface})), get({'SearchData', 'PAGE'}), (get({(get({local, currentPage}) + 1), '$class'})):toString((get({local, currentPage}) + 1)))),
                                case ((get({SearchRequest, '$class'})):getFileBaseName(SearchRequest) =/= undefined) of
                                    true ->
                                    (get({get({local, inventoryNode}), '$class'})):appendChild(get({local, inventoryNode}), (get({SearchRequest, '$class'})):getFileBaseNameNode(SearchRequest, (get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface}))));
                                    false -> ok
                                end;
                                false -> ok
                            end,
                            put({local, lastPage}, get({local, currentPage})),
                            put({local, numberOfResultsOnCurrentPage}, 0);
                            false -> ok
                        end,
                        put({local, numberOfResults}, get({local, numberOfResults}) + 1),
                        case (get({local, lastPage}) >= (MAXPAGES - 1)) of
                            true ->
                            throw('$break');
                            false -> ok
                        end;
                        false -> ok
                    end
                end, lists:seq(0, Size - 1)),
                case ((get({local, numberOfResultsOnCurrentPage}) > 0) andalso ((((get({local, currentPage}) + 1) >= StartPage) andalso ((get({local, currentPage}) + 1) =< get({local, endPage}))))) of
                    true ->
                    (get({get({local, inventoryNode}), '$class'})):appendChild(get({local, inventoryNode}), 'ModDomHelper':createNameValueNodes((get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface})), get({'SearchData', 'TOTAL_NUMBER_ITEMS_ON_THIS_PAGE'}), (get({(get({local, numberOfResultsOnCurrentPage}) - 1), '$class'})):toString((get({local, numberOfResultsOnCurrentPage}) - 1)))),
                    array:set((get({local, lastPage}) + 1), (get({get({local, viewDocumentInterface}), '$class'})):getDoc(get({local, viewDocumentInterface})), Documents),
                    array:set((get({local, lastPage}) + 1), get({local, inventoryNode}), InventoryNodes),
                    put({local, savedPagesInRange}, get({local, savedPagesInRange}) + 1);
                    false -> ok
                end,
                case (get({local, numberOfResultsOnCurrentPage}) > 0) of
                    true ->
                    put({local, lastPage}, get({local, lastPage}) + 1);
                    false -> ok
                end,
                case (get({local, endPage}) > (MAXPAGES - 1)) of
                    true ->
                    put({local, endPage}, (MAXPAGES - 1));
                    false -> ok
                end,
                lists:foreach(fun(Index) ->
                    case (Index =< get({local, lastPage})) of
                        true ->
                        TempDocument = array:get(Index, Documents),
                        (fun(Target_N72144) -> (get({Target_N72144, '$class'})):appendChild(Target_N72144, 'ModDomHelper':createNameValueNodes(TempDocument, get({'SearchData', 'TOTAL_NUMBER_PAGES'}), (get({(get({local, lastPage}) + 1), '$class'})):toString((get({local, lastPage}) + 1)))) end)(array:get(Index, InventoryNodes)),
                        (fun(Target_N72266) -> (get({Target_N72266, '$class'})):appendChild(Target_N72266, 'ModDomHelper':createNameValueNodes(TempDocument, get({'SearchData', 'TOTAL_NUMBER_ITEMS'}), (get({get({local, numberOfResults}), '$class'})):toString(get({local, numberOfResults})))) end)(array:get(Index, InventoryNodes)),
                        lists:foreach(fun(PageIndex) ->
                            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                            (get({StringBuffer, '$class'})):append(StringBuffer, (get({SearchRequest, '$class'})):getFileBaseName(SearchRequest)),
                            case ((get({StringBuffer, '$class'})):length(StringBuffer) > 0) of
                                true ->
                                case (PageIndex =/= 0) of
                                    true ->
                                    (get({StringBuffer, '$class'})):append(StringBuffer, allbinary_java:to_string(PageIndex));
                                    false -> ok
                                end,
                                (fun(Target_N72708) -> (get({Target_N72708, '$class'})):appendChild(Target_N72708, 'ModDomHelper':createNameValueNodes(TempDocument, get({'SearchData', 'PAGE_INFO'}), allbinary_java:to_string(PageIndex), (get({StringBuffer, '$class'})):toString(StringBuffer))) end)(array:get(Index, InventoryNodes));
                                false ->
                                (fun(Target_N72502) -> (get({Target_N72502, '$class'})):appendChild(Target_N72502, 'ModDomHelper':createNameValueNodes(TempDocument, get({'SearchData', 'PAGE_INFO'}), allbinary_java:to_string(PageIndex), get({'SearchData', 'SEARCH'}))) end)(array:get(Index, InventoryNodes))
                            end
                        end, lists:seq(0, get({local, lastPage}))),
                        Success = 'XmlDocumentHelper':toString(TempDocument),
                        array:set(Index, (fun(Target_N72980) -> (get({Target_N72980, '$class'})):translate(Target_N72980, Success) end)('StoreTransformer':new(AbeClientInformation, 'TransformInfoHttpSearch':new(SearchRequest))), ProductListingPages);
                        false -> ok
                    end
                end, lists:seq(StartPage, get({local, endPage}))),
                case (get({local, savedPagesInRange}) =:= 0) of
                    true ->
                    Result = (get({This, '$class'})):getNoResults(This, get({local, viewDocumentInterface}), get({local, inventoryNode})),
                    array:set(0, (fun(Target_N73241) -> (get({Target_N73241, '$class'})):translate(Target_N73241, Result) end)('StoreTransformer':new(AbeClientInformation, 'TransformInfoHttpSearch':new(SearchRequest))), ProductListingPages);
                    false -> ok
                end,
                throw({'$return', ProductListingPages});
                false ->
                throw({'$return', undefined})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "search", E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

