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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.data.tables.staticpages.StaticPagesEntity
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.search.SearchParams
% import org.allbinary.logic.control.search.SearchRequest
% import org.allbinary.logic.io.InputOutputTypeData
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import views.admin.inventory.listings.InventoryViewSearchInterface

-module('InventorySearch').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements InventoryViewSearchInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, searchRequest}, undefined),
    ok.


new(SearchRequest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, SearchRequest),
    This.

'$init'(This, SearchRequest) ->
        ok,
        init_fields(This),
        put({This, searchRequest}, SearchRequest).

% throws Exception
searchSingleStaticPage(This) ->
        try
        try
            StoreFront = (get({get({This, searchRequest}), '$class'})):getStoreFront(get({This, searchRequest})),
            SearchParams = (get({get({This, searchRequest}), '$class'})):getParams(get({This, searchRequest})),
            ColumnValueHashMap = (get({SearchParams, '$class'})):get(SearchParams),
            File = (fun(Target_N66633) -> (get({Target_N66633, '$class'})):getFile(Target_N66633, (get({StoreFront, '$class'})):getName(StoreFront), (fun(Target_N66670) -> (get({Target_N66670, '$class'})):all(Target_N66670, (get({ColumnValueHashMap, '$class'})):get(ColumnValueHashMap, get({get({This, basicItemData}), 'KEYWORDS'}))) end)('Replace':new("-", get({'CommonSeps':getInstance(), 'SPACE'})))) end)('StaticPagesEntity':new()),
            case (fun(Target_N66792) -> (get({Target_N66792, '$class'})):isEmpty(Target_N66792, File) end)('StringValidationUtil':getInstance()) of
                true ->
                throw({'$return', undefined});
                false ->
                StringBuffer = 'StringMaker':new(),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFront, '$class'})):getCurrentHostName(StoreFront)),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFront, '$class'})):getCurrentHostNamePath(StoreFront)),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFront, '$class'})):getStaticPath(StoreFront)),
                (get({StringBuffer, '$class'})):append(StringBuffer, File),
                (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N67039) -> (get({Target_N67039, '$class'})):getEndPage(Target_N67039) end)((get({get({This, searchRequest}), '$class'})):getParams(get({This, searchRequest})))),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'EXTENSION_SEP'})),
                (get({StringBuffer, '$class'})):append(StringBuffer, get({'InputOutputTypeData':getInstance(), 'DEFAULT'})),
                FilePath = (fun(Target_N67174) -> (get({Target_N67174, '$class'})):all(Target_N67174, (get({StringBuffer, '$class'})):toString(StringBuffer)) end)('Replace':new(get({'CommonSeps':getInstance(), 'SPACE'}), "%20")),
                throw({'$return', FilePath})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "searchSingleStaticPage", E);
                false -> ok
            end,
            erlang:error({'Exception', "Failed retrieve Single Product Page Static"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
searchSingleDynamicPage(This) ->
        try
            Str = (get({This, '$class'})):search(This),
            array:get((fun(Target_N67682) -> (get({Target_N67682, '$class'})):intValue(Target_N67682) end)((fun(Target_N67689) -> (get({Target_N67689, '$class'})):getStartPageInt(Target_N67689) end)((get({get({This, searchRequest}), '$class'})):getParams(get({This, searchRequest})))), Str)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'PRODUCTSEARCHLOGGINGERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "searchSingleDynamicPage", E);
                false -> ok
            end,
            erlang:error({'Exception', "Failed retrieve Single Product Page Dynamically"})
        end.

% throws Exception
search(This) ->
        AbeClientInformation = 'ServiceClientInformationInterfaceFactory':getInstance(),
        InventorySearchUtil = 'InventorySearchUtil':getInstance(),
        Vector = (get({InventorySearchUtil, '$class'})):getBasicItemIdColumn(InventorySearchUtil, get({This, searchRequest})),
        (get({InventorySearchUtil, '$class'})):search(InventorySearchUtil, AbeClientInformation, get({This, searchRequest}), Vector).

% throws Exception
getProduct(This, Product) when (is_list(Product) orelse Product =:= undefined) ->
        AbeClientInformation = 'ServiceClientInformationInterfaceFactory':getInstance(),
        (fun(Target_N68373) -> (get({Target_N68373, '$class'})):getProduct(Target_N68373, AbeClientInformation, get({This, searchRequest}), Product) end)('InventorySearchProductUtil':getInstance()).

