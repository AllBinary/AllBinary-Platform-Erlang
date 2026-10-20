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
% import java.util.Map
% import java.util.Set
% import javax.servlet.http.HttpServletRequest
% import javax.servlet.jsp.PageContext
% import org.allbinary.business.category.CategoryComponent
% import org.allbinary.business.category.CategoryData
% import org.allbinary.business.category.CategoryInterface
% import org.allbinary.business.category.store.StoreCategoryFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontData
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.data.tree.category.CategoryLoaderFactory
% import org.allbinary.data.tree.category.CategoryLoaderInterface
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoBasic
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('CategoryRequestHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ModifyTable', Function, Arguments).

static_init() ->
    put({?MODULE, categoryRequest}, (fun(Target_N67129) -> (get({Target_N67129, '$class'})):toString(Target_N67129) end)((fun(Target_N67136) -> (get({Target_N67136, '$class'})):append(Target_N67136, ">") end)((fun(Target_N67143) -> (get({Target_N67143, '$class'})):append(Target_N67143, get({'CategoryData':getInstance(), 'REQUEST'})) end)((fun(Target_N67150) -> (get({Target_N67150, '$class'})):append(Target_N67150, "<") end)('StringMaker':new()))))),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, pageContext}, undefined),
    put({This, hashMap}, undefined),
    put({This, request}, undefined),
    put({This, categoryLoaderInterface}, undefined),
    put({This, categoryInterface}, undefined),
    put({This, childCategoryInterface}, undefined),
    put({This, transformInfoInterface}, undefined),
    ok.


new(HashMap, PageContext) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, HashMap, PageContext),
    This.

'$init'(This, HashMap, PageContext) ->
    'ModifyTable':'$init'(This),
    init_fields(This),
        try
            put({This, request}, (get({PageContext, '$class'})):getRequest(PageContext)),
            put({This, pageContext}, PageContext),
            put({This, hashMap}, HashMap),
            (get({This, '$class'})):getXmlData(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "CategoryRequestHelper()", E);
                false -> ok
            end
        end.

getXmlData(This) ->
        try
            Map = (get({get({This, request}), '$class'})):getParameterMap(get({This, request})),
            CategoryData = 'CategoryData':getInstance(),
            Keys = (get({Map, '$class'})):keySet(Map),
            KeyArray = (get({Keys, '$class'})):toArray(Keys),
            Size = array:size(KeyArray),
            case (Size > 0) of
                true ->
                put({local, xmlRequest}, array:get(0, KeyArray)),
                Index = 1,
                (fun Loop() -> case ((Index < Size) andalso (not lists:prefix(get({'CategoryRequestHelper', categoryRequest}), get({local, xmlRequest})))) of true ->
                    put({local, xmlRequest}, array:get(Index, KeyArray)),
                    case lists:prefix(get({'CategoryRequestHelper', categoryRequest}), get({local, xmlRequest})) of
                        true ->
                        throw('$break');
                        false -> ok
                    end,
                    Loop();
                false -> ok end end)(),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({local, xmlRequest}), This, "getXmlData()");
                    false -> ok
                end,
                Document = 'DomDocumentHelper':create(get({local, xmlRequest})),
                RequestNode = 'DomSearchHelper':getNode(get({CategoryData, 'REQUEST'}), (get({Document, '$class'})):getChildNodes(Document)),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), 'XmlDocumentHelper':toString(Document), This, "getXmlData()");
                    false -> ok
                end,
                (get({This, '$class'})):setCategoryLoader(This, RequestNode),
                ParentCategoryNode = 'DomSearchHelper':getNode(get({CategoryData, 'PARENT'}), (get({RequestNode, '$class'})):getChildNodes(RequestNode)),
                CategoryNode = 'DomSearchHelper':getNode(get({CategoryData, 'NAME'}), (get({ParentCategoryNode, '$class'})):getChildNodes(ParentCategoryNode)),
                put({This, categoryInterface}, (fun(Target_N68551) -> (get({Target_N68551, '$class'})):getRootInstanceFromNode(Target_N68551, CategoryNode) end)('StoreCategoryFactory':new(get({This, transformInfoInterface})))),
                put({This, categoryInterface}, (get({get({This, categoryLoaderInterface}), '$class'})):get(get({This, categoryLoaderInterface}), get({This, categoryInterface}))),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                    true ->
                    (get({get({This, categoryInterface}), '$class'})):log(get({This, categoryInterface})),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Loaded Parent Category", This, "getXmlData()");
                    false -> ok
                end,
                ChildCategoryNode = 'DomSearchHelper':getNodeNoThrow(get({CategoryData, 'NAME'}), (get({RequestNode, '$class'})):getChildNodes(RequestNode)),
                case (ChildCategoryNode =/= undefined) of
                    true ->
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                        true ->
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Loading Child Category", This, "getXmlData()");
                        false -> ok
                    end,
                    put({This, childCategoryInterface}, (fun(Target_N69274) -> (get({Target_N69274, '$class'})):getInstance(Target_N69274, ChildCategoryNode) end)('StoreCategoryFactory':new(get({This, transformInfoInterface})))),
                    case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPER'})) of
                        true ->
                        (get({get({This, childCategoryInterface}), '$class'})):log(get({This, childCategoryInterface})),
                        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Loaded Child Category", This, "getXmlData()");
                        false -> ok
                    end;
                    false ->
                    put({This, childCategoryInterface}, get({This, categoryInterface}))
                end;
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'TAGHELPERERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getXmlData()", E);
                false -> ok
            end
        end.

% throws Exception
setCategoryLoader(This, RequestNode) ->
        StoreNameNode = 'DomSearchHelper':getNode(get({'StoreFrontData':getInstance(), 'NAME'}), (get({RequestNode, '$class'})):getChildNodes(RequestNode)),
        case (StoreNameNode =/= undefined) of
            true ->
            StoreName = 'DomNodeHelper':getTextNodeValue(StoreNameNode),
            case (StoreName =/= undefined) of
                true ->
                StoreFrontInterface = 'StoreFrontFactory':getInstance(StoreName),
                put({This, transformInfoInterface}, 'TransformInfoBasic':new(StoreFrontInterface, get({This, hashMap}), get({This, pageContext}))),
                case (get({This, transformInfoInterface}) =:= undefined) of
                    true ->
                    erlang:error({'Exception', "TransformInfo null"});
                    false -> ok
                end,
                StoreCategoryFactory = 'StoreCategoryFactory':new(get({This, transformInfoInterface})),
                put({This, categoryLoaderInterface}, 'CategoryLoaderFactory':getInstance(StoreCategoryFactory));
                false ->
                erlang:error({'Exception', lists:concat(["Store Name Error: ", StoreName])})
            end;
            false -> ok
        end.

insert(This) ->
        try
            Success = "Successfully Added the following to the Category table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "inserting", This, "insert()");
                false -> ok
            end,
            (get({get({This, categoryLoaderInterface}), '$class'})):insert(get({This, categoryLoaderInterface}), get({This, categoryInterface}), get({This, childCategoryInterface})),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "insert()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to add item to Category",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "insert()", E);
                false -> ok
            end,
            Error
        end.

delete(This) ->
        try
            Success = lists:concat([lists:concat([lists:concat(["Successfully Removed ", get({'CategoryData':getInstance(), 'NAME'})]), "="]), (get({get({This, childCategoryInterface}), '$class'})):getPath(get({This, childCategoryInterface}))]),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Deleting", This, "delete()");
                false -> ok
            end,
            (get({get({This, categoryLoaderInterface}), '$class'})):delete(get({This, categoryLoaderInterface}), get({This, categoryInterface}), get({This, childCategoryInterface})),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "delete()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            try
                put({local, error}, lists:concat(["Failed to remove category: ", (get({get({This, childCategoryInterface}), '$class'})):getPath(get({This, childCategoryInterface}))])),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "delete()", E);
                    false -> ok
                end,
                get({local, error})
            catch _:E2 when E2 =/= '$break', E2 =/= '$continue', (not is_tuple(E2) orelse element(1, E2) =/= '$return') ->
                put({local, error}, "Failed to remove category and show the path of the failed category"),
                case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "delete()", E2);
                    false -> ok
                end,
                get({local, error})
            end
        end.

viewCategory(This) ->
        try
            Document = (fun(Target_N72605) -> (get({Target_N72605, '$class'})):toXmlDoc(Target_N72605) end)('CategoryComponent':new(get({This, childCategoryInterface}))),
            XmlString = 'XmlDocumentHelper':toString(Document),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), XmlString, This, "viewCategory()");
                false -> ok
            end,
            XmlString
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to get Category",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "viewCategory()", E);
                false -> ok
            end,
            Error
        end.

viewCategories(This) ->
        try
            Success = get({'StringUtil':getInstance(), 'EMPTY_STRING'}),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "viewCategories()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to view Categories table",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "viewCategories()", E);
                false -> ok
            end,
            Error
        end.

update(This) ->
        try
            Success = "New Item Successfully added",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGS'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), Success, This, "update()");
                false -> ok
            end,
            Success
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            Error = "Failed to add Item",
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "update()", E);
                false -> ok
            end,
            Error
        end.

