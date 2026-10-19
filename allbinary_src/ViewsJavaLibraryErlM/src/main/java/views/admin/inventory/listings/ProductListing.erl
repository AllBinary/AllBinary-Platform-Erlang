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
% package views.admin.inventory.listings
% import java.util.HashMap
% import java.util.HashSet
% import java.util.Set
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.business.user.commerce.inventory.item.BasicItemData
% import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntity
% import org.allbinary.data.tables.staticpages.StaticPagesEntity
% import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity
% import org.allbinary.globals.GLOBALS2
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.search.SearchParams
% import org.allbinary.logic.control.search.SearchRequest
% import org.allbinary.logic.io.AbDataOutputStream
% import org.allbinary.logic.io.DataOutputStreamFactory
% import org.allbinary.logic.io.InputOutputTypeData
% import org.allbinary.logic.io.StreamUtil
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.file.directory.Directory
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.SpecialCharacterUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.regex.replace.Replace
% import org.allbinary.logic.string.tokens.UniqueTokens
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.util.BasicArrayList
% import views.generic.inventory.InventoryColumnUtil
% import views.generic.inventory.InventorySearchUtil

-module('ProductListing').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ProductListingInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, directory}, 'Directory':getInstance()),
    put({This, basicItemData}, 'BasicItemData':getInstance()),
    put({This, storeFronts}, undefined),
    put({This, staticPages}, undefined),
    put({This, inventory}, undefined),
    put({This, searchRequest}, undefined),
    put({This, 'INVENTORY'}, ".InventoryView"),
    ok.


new(SearchRequest) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, SearchRequest),
    This.

init(This, SearchRequest) ->
    init_fields(This),
        put({This, searchRequest}, SearchRequest),
        put({This, storeFronts}, 'StoreFrontsEntity':new()),
        put({This, staticPages}, 'StaticPagesEntity':new()),
        put({This, inventory}, 'InventoryEntity':new()).

% throws Exception
getHashSet(This, StoreFront) ->
        InventoryColumnUtil = 'InventoryColumnUtil':getInstance(),
        Keywords = (get({InventoryColumnUtil, '$class'})):getColumnWhereLike(InventoryColumnUtil, get({This, inventory}), (get({StoreFront, '$class'})):getCategoryPath(StoreFront), get({get({This, basicItemData}), 'KEYWORDS'})),
        SubStoreVector = (get({StoreFront, '$class'})):getSubStores(StoreFront),
        Size = (get({SubStoreVector, '$class'})):size(SubStoreVector),
        lists:foreach(fun(Index) ->
            SubStore = (get({SubStoreVector, '$class'})):get(SubStoreVector, Index),
            SubstoreKeywords = (get({InventoryColumnUtil, '$class'})):getColumnWhereLike(InventoryColumnUtil, get({This, inventory}), lists:concat([get({'AbPathData':getInstance(), 'SEPARATOR'}), SubStore]), get({get({This, basicItemData}), 'CATEGORY'})),
            (get({Keywords, '$class'})):addAllList(Keywords, SubstoreKeywords)
        end, lists:seq(0, Size - 1)),
        UniqueTokens = 'UniqueTokens':new(),
        KeywordHashSet = (get({UniqueTokens, '$class'})):getWhithoutDashesAndSkipNumberOnlyTokens(UniqueTokens, Keywords),
        KeywordHashSet.

% throws Exception
savePage(This, File, Data) when (is_list(File) orelse File =:= undefined), (is_list(Data) orelse Data =:= undefined) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'STATICPAGEGENERATIONLOGGING'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Creating File: ", File]), This, "generateAll()");
            false -> ok
        end,
        NewFile = 'AbFile':createAbFile(File),
        case (get({NewFile, '$class'})):exists(NewFile) of
            true ->
            (get({NewFile, '$class'})):delete(NewFile);
            false -> ok
        end,
        (get({NewFile, '$class'})):createNewFile(NewFile),
        case (get({NewFile, '$class'})):exists(NewFile) of
            true ->
            IdOutData = (fun(Target_N68332) -> (get({Target_N68332, '$class'})):getInstanceForAbFile(Target_N68332, NewFile) end)('DataOutputStreamFactory':getInstance()),
            (get({IdOutData, '$class'})):writeBytes(IdOutData, Data),
            (get({IdOutData, '$class'})):flush(IdOutData),
            (fun(Target_N68437) -> (get({Target_N68437, '$class'})):close(Target_N68437, IdOutData) end)('StreamUtil':getInstance()),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'STATICPAGEGENERATIONLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Wrote Total Bytes: ", (get({NewFile, '$class'})):length(NewFile)]), This, "generateAll()");
                false -> ok
            end;
            false ->
            erlang:error({'Exception', lists:concat(["Could Not Create: ", File])})
        end.

% throws Exception
create(This, KeywordData, KeywordFilenameHashMap, Vector, StaticPath) when (is_list(KeywordData) orelse KeywordData =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        HashMap = 'SpecialCharacterUtil':getHashMap(),
        (get({HashMap, '$class'})):put(HashMap, get({'CommonSeps':getInstance(), 'SPACE'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        PageName = (fun(Target_N68945) -> (get({Target_N68945, '$class'})):all(Target_N68945, KeywordData) end)('Replace':new(HashMap)),
        SearchParams = (get({get({This, searchRequest}), '$class'})):getParams(get({This, searchRequest})),
        (get({SearchParams, '$class'})):add(SearchParams, get({get({This, basicItemData}), 'KEYWORDS'}), KeywordData),
        (get({SearchParams, '$class'})):setStartPage(SearchParams, get({'CommonPhoneStrings':getInstance(), 'ZERO'})),
        (get({get({This, searchRequest}), '$class'})):setParams(get({This, searchRequest}), SearchParams),
        (get({get({This, searchRequest}), '$class'})):setFileBaseName(get({This, searchRequest}), PageName),
        AbeClientInformation = 'ServiceClientInformationInterfaceFactory':getInstance(),
        InventorySearchUtil = 'InventorySearchUtil':getInstance(),
        ProductListingPages = (get({InventorySearchUtil, '$class'})):search(InventorySearchUtil, AbeClientInformation, get({This, searchRequest}), Vector),
        lists:foreach(fun(Index) ->
            case (array:get(Index, ProductListingPages) =:= undefined) of
                true ->
                throw('$break');
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'STATICPAGEGENERATIONLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Saving Listing: ", Index]), This, "generateAll()");
                false -> ok
            end,
            put({local, indexStr}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            case (Index > 0) of
                true ->
                put({local, indexStr}, (get({Index, '$class'})):toString(Index));
                false -> ok
            end,
            (get({KeywordFilenameHashMap, '$class'})):put(KeywordFilenameHashMap, KeywordData, lists:concat([PageName, get({local, indexStr})])),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({StaticPath, '$class'})):toString(StaticPath)),
            (get({StringBuffer, '$class'})):append(StringBuffer, PageName),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({local, indexStr})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'EXTENSION_SEP'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'InputOutputTypeData':getInstance(), 'DEFAULT'})),
            File = (get({StringBuffer, '$class'})):toString(StringBuffer),
            case (not (get({get({This, directory}), '$class'})):create(get({This, directory}), StaticPath)) of
                true ->
                erlang:error({'Exception', lists:concat(["Could Not Create Directory: ", StaticPath])});
                false -> ok
            end,
            (get({This, '$class'})):savePage(This, File, array:get(Index, ProductListingPages))
        end, lists:seq(0, array:size(ProductListingPages) - 1)).

addStaticPageInfoToDatabase(This, StoreFront, KeywordFilenameHashMap) ->
        KeywordHashSet = (get({KeywordFilenameHashMap, '$class'})):keySet(KeywordFilenameHashMap),
        KeywordArray = (get({KeywordHashSet, '$class'})):toArray(KeywordHashSet),
        Size = array:size(KeywordArray),
        lists:foreach(fun(Index) ->
            InsertVector = 'BasicArrayListD':new(),
            KeywordData = array:get(Index, KeywordArray),
            FileName = (get({KeywordFilenameHashMap, '$class'})):get(KeywordFilenameHashMap, KeywordData),
            (get({InsertVector, '$class'})):add(InsertVector, (get({StoreFront, '$class'})):getName(StoreFront)),
            (get({InsertVector, '$class'})):add(InsertVector, KeywordData),
            (get({InsertVector, '$class'})):add(InsertVector, FileName),
            (get({get({This, staticPages}), '$class'})):insert(get({This, staticPages}), InsertVector)
        end, lists:seq(0, Size - 1)).

% throws Exception
generateAll(This) ->
        try
        try
            StoreFront = (get({get({This, searchRequest}), '$class'})):getStoreFront(get({This, searchRequest})),
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({'ProductListing', 'URLGLOBALS'}), '$class'})):getWebappPath(get({'ProductListing', 'URLGLOBALS'}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFront, '$class'})):getName(StoreFront)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFront, '$class'})):getStaticPath(StoreFront)),
            StaticPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'STATICPAGEGENERATIONLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Store Static Pages Path: ", StaticPath]), This, "generateAll()");
                false -> ok
            end,
            KeywordHashSet = (get({This, '$class'})):getHashSet(This, StoreFront),
            KeywordArray = (get({KeywordHashSet, '$class'})):toArray(KeywordHashSet),
            Size = array:size(KeywordArray),
            KeywordFilenameHashMap = (fun(Target_N71788) -> (get({Target_N71788, '$class'})):createHashMap(Target_N71788) end)('StdUtil':getInstance()),
            case (Size =:= 0) of
                true ->
                (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
                (get({StringBuffer, '$class'})):append(StringBuffer, "Products For "),
                (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFront, '$class'})):getName(StoreFront)),
                (get({StringBuffer, '$class'})):append(StringBuffer, " Store Not Found"),
                throw({'$return', (get({StringBuffer, '$class'})):toString(StringBuffer)});
                false -> ok
            end,
            InventorySearchUtil = 'InventorySearchUtil':getInstance(),
            Vector = (get({InventorySearchUtil, '$class'})):getBasicItemIdColumn(InventorySearchUtil, get({This, searchRequest})),
            lists:foreach(fun(Index) ->
                KeywordData = array:get(Index, KeywordArray),
                case (string:length(KeywordData) > 1) of
                    true ->
                    (get({This, '$class'})):create(This, KeywordData, KeywordFilenameHashMap, Vector, StaticPath);
                    false -> ok
                end
            end, lists:seq(0, Size - 1)),
            (get({This, '$class'})):addStaticPageInfoToDatabase(This, StoreFront, KeywordFilenameHashMap),
            (get({StringBuffer, '$class'})):delete(StringBuffer, 0, (get({StringBuffer, '$class'})):length(StringBuffer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Static Files Generated Successfully For "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFront, '$class'})):getName(StoreFront)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " it used packages "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFront, '$class'})):getPackageLocation(StoreFront)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'INVENTORY'})),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
generateAll(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
        put({local, storeName}, StoreName),
        try
        try
            StringBuffer = 'StringMaker':new(),
            case (get({local, storeName}) =/= undefined) of
                true ->
                case ((get({get({local, storeName}), '$class'})):compareTo(get({local, storeName}), get({get({'ProductListing', 'GLOBALS2'}), 'GENERATEALLSTORES'})) =/= 0) of
                    true ->
                    (get({get({This, searchRequest}), '$class'})):setStoreFront(get({This, searchRequest}), (get({get({This, storeFronts}), '$class'})):getStoreFrontInterface(get({This, storeFronts}), get({local, storeName}))),
                    (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):generateAll(This)),
                    (get({StringBuffer, '$class'})):append(StringBuffer, "<br />");
                    false ->
                    StoreFrontVector = (get({get({This, storeFronts}), '$class'})):getStoreFrontNames(get({This, storeFronts})),
                    Size = (get({StoreFrontVector, '$class'})):size(StoreFrontVector),
                    lists:foreach(fun(Index) ->
                        put({local, storeName}, (get({StoreFrontVector, '$class'})):get(StoreFrontVector, Index)),
                        (get({get({This, searchRequest}), '$class'})):setStoreFront(get({This, searchRequest}), (get({get({This, storeFronts}), '$class'})):getStoreFrontInterface(get({This, storeFronts}), get({local, storeName}))),
                        (get({StringBuffer, '$class'})):append(StringBuffer, (get({This, '$class'})):generateAll(This)),
                        (get({StringBuffer, '$class'})):append(StringBuffer, "<br />")
                    end, lists:seq(0, Size - 1))
                end;
                false ->
                throw({'$return', "Generation Failed No Store Specified<br/>"})
            end,
            (get({StringBuffer, '$class'})):append(StringBuffer, "All Static Pages Generated<br/>"),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            erlang:error(E)
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

