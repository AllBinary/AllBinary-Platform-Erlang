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
% package org.allbinary.business.category.properties.root.store
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.category.CategoryData
% import org.allbinary.business.category.CategoryUtil
% import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface
% import org.allbinary.business.category.properties.CategoryPropertiesInterface
% import org.allbinary.business.category.properties.root.RootCategoryPropertiesInterface
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('RootStoreCategoryProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RootCategoryPropertiesInterface
% implements CategoryPropertiesInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, pathData}, 'AbPathData':getInstance()),
    put({This, fileAbPath}, undefined),
    put({This, abPath}, undefined),
    put({This, category}, undefined),
    put({This, isRealRoot}, false),
    put({This, webAppAbPath}, undefined),
    put({This, transformInfoInterface}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
    init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        put({This, abPath}, 'AbPath':createAbPath()),
        put({This, category}, get({'CategoryData':getInstance(), 'ROOTCATEGORY'})),
        put({This, isRealRoot}, true),
        (get({This, '$class'})):initPath(This),
        (get({This, '$class'})):log(This).

new(TransformInfoInterface, CategoryAbPath) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, CategoryAbPath),
    This;
new(TransformInfoInterface, Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, Node),
    This;
new(TransformInfoInterface, CategoryPropertiesHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, CategoryPropertiesHashMap),
    This.

init(This, TransformInfoInterface, CategoryAbPath) ->
    init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        put({This, abPath}, CategoryAbPath),
        put({This, category}, (get({get({This, pathData}), '$class'})):getNameFromPath(get({This, pathData}), (get({CategoryAbPath, '$class'})):toString(CategoryAbPath))),
        case (fun(Target_N66968) -> (get({Target_N66968, '$class'})):isEmpty(Target_N66968, get({This, category})) end)('StringValidationUtil':getInstance()) of
            true ->
            put({This, isRealRoot}, true),
            put({This, category}, get({'CategoryData':getInstance(), 'ROOTCATEGORY'}));
            false -> ok
        end,
        (get({This, '$class'})):initPath(This),
        (get({This, '$class'})):log(This);
init(This, TransformInfoInterface, Node) ->
    init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        CategoryPath = 'CategoryUtil':getNameFromNode(Node),
        put({This, abPath}, 'AbPath':new(CategoryPath, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
        put({This, category}, (get({get({This, pathData}), '$class'})):getNameFromPath(get({This, pathData}), CategoryPath)),
        case (fun(Target_N67409) -> (get({Target_N67409, '$class'})):isEmpty(Target_N67409, get({This, category})) end)('StringValidationUtil':getInstance()) of
            true ->
            put({This, isRealRoot}, true),
            put({This, category}, get({'CategoryData':getInstance(), 'ROOTCATEGORY'}));
            false -> ok
        end,
        (get({This, '$class'})):initPath(This),
        (get({This, '$class'})):log(This);
init(This, TransformInfoInterface, CategoryPropertiesHashMap) ->
    init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        CategoryPath = allbinary_java:to_string((get({CategoryPropertiesHashMap, '$class'})):get(CategoryPropertiesHashMap, get({'CategoryData':getInstance(), 'NAME'}))),
        put({This, abPath}, 'AbPath':new(CategoryPath, get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
        put({This, category}, (get({get({This, pathData}), '$class'})):getNameFromPath(get({This, pathData}), CategoryPath)),
        case (fun(Target_N67889) -> (get({Target_N67889, '$class'})):isEmpty(Target_N67889, get({This, category})) end)('StringValidationUtil':getInstance()) of
            true ->
            put({This, isRealRoot}, true),
            put({This, category}, get({'CategoryData':getInstance(), 'ROOTCATEGORY'}));
            false -> ok
        end,
        (get({This, '$class'})):initPath(This),
        (get({This, '$class'})):log(This).



% throws Exception
initPath(This) ->
        TransformInfoHttpStoreInterface = get({This, transformInfoInterface}),
        StoreFrontInterface = 'StoreFrontFactory':getInstance((get({TransformInfoHttpStoreInterface, '$class'})):getStoreName(TransformInfoHttpStoreInterface)),
        PostPath = ((get({StoreFrontInterface, '$class'})):getCurrentHostNamePath(StoreFrontInterface) + (get({StoreFrontInterface, '$class'})):getCategoryPath(StoreFrontInterface)),
        HttpServletRequest = (fun(Target_N68335) -> (get({Target_N68335, '$class'})):getRequest(Target_N68335) end)((get({TransformInfoHttpStoreInterface, '$class'})):getPageContext(TransformInfoHttpStoreInterface)),
        put({This, webAppAbPath}, 'AbPath':new(lists:concat([(get({HttpServletRequest, '$class'})):getContextPath(HttpServletRequest), PostPath]), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
        (get({This, '$class'})):setRootFilePath(This, 'AbPath':new(lists:concat([(get({get({'RootStoreCategoryProperties', 'URLGLOBALS'}), '$class'})):getMainPath(get({'RootStoreCategoryProperties', 'URLGLOBALS'})), PostPath]), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

isRealRoot(This) ->
        get({This, isRealRoot}).

isRoot(This) ->
        true.

getKey(This) ->
        (get({This, '$class'})):getValue(This).

setPath(This, Path) ->
        put({This, abPath}, Path).

setRootFilePath(This, Value) ->
        put({This, fileAbPath}, Value).

getRootFilePath(This) ->
        get({This, fileAbPath}).

getValue(This) ->
        get({This, category}).

% throws Exception
getWebAppPath(This) ->
        get({This, webAppAbPath}).

getPath(This, CategoryHierarchyInterface) ->
        get({This, abPath}).

getFileName(This) ->
        (((get({This, '$class'})):getValue(This) + get({'AbPathData':getInstance(), 'EXTENSION_SEP'})) + get({'CategoryData':getInstance(), 'UNCRYPTED_EXTENSION'})).

setValue(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        put({This, category}, Value).

isValid(This) ->
        true.

toHashMap(This) ->
        CategoryHashMap = (fun(Target_N69338) -> (get({Target_N69338, '$class'})):createHashMap(Target_N69338) end)('StdUtil':getInstance()),
        (get({CategoryHashMap, '$class'})):put(CategoryHashMap, get({'CategoryData':getInstance(), 'NAME'}), (get({This, '$class'})):getValue(This)),
        CategoryHashMap.

toVector(This) ->
        CategoryVector = 'BasicArrayListD':new(),
        (get({CategoryVector, '$class'})):add(CategoryVector, (get({This, '$class'})):getValue(This)),
        CategoryVector.

% throws Exception
toValidationInfoDoc(This) ->
        undefined.

% throws Exception
toValidationInfoNode(This, Document) ->
        undefined.

% throws Exception
validationInfo(This) ->
        undefined.

log(This) ->
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69959) -> (get({Target_N69959, '$class'})):toString(Target_N69959) end)((fun(Target_N69966) -> (get({Target_N69966, '$class'})):append(Target_N69966, get({This, category})) end)((fun(Target_N69973) -> (get({Target_N69973, '$class'})):append(Target_N69973, "\ncategory = ") end)((fun(Target_N69980) -> (get({Target_N69980, '$class'})):append(Target_N69980, (get({get({This, abPath}), '$class'})):toString(get({This, abPath}))) end)((fun(Target_N69987) -> (get({Target_N69987, '$class'})):append(Target_N69987, "\npath = ") end)((fun(Target_N69994) -> (get({Target_N69994, '$class'})):append(Target_N69994, (get({get({This, fileAbPath}), '$class'})):toString(get({This, fileAbPath}))) end)((fun(Target_N70001) -> (get({Target_N70001, '$class'})):append(Target_N70001, "filePath = ") end)('StringMaker':new()))))))), This, "log()");
            false -> ok
        end.

