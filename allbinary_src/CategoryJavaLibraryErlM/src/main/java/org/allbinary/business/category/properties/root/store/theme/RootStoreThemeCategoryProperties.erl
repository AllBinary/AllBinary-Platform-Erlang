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
% package org.allbinary.business.category.properties.root.store.theme
% import java.util.HashMap
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.category.properties.root.store.RootStoreCategoryProperties
% import org.allbinary.business.context.modules.storefront.StoreFrontFactory
% import org.allbinary.business.context.modules.storefront.StoreFrontInterface
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Node

-module('RootStoreThemeCategoryProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RootStoreCategoryProperties', Function, Arguments).

init_fields(This) ->
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface),
    This.

init(This, TransformInfoInterface) ->
        'RootStoreCategoryProperties':init(This, TransformInfoInterface).

new(TransformInfoInterface, AbPath) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, AbPath),
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

init(This, TransformInfoInterface, AbPath) ->
        'RootStoreCategoryProperties':init(This, TransformInfoInterface, AbPath);
init(This, TransformInfoInterface, Node) ->
        'RootStoreCategoryProperties':init(This, TransformInfoInterface, Node);
init(This, TransformInfoInterface, CategoryPropertiesHashMap) ->
        'RootStoreCategoryProperties':init(This, TransformInfoInterface, CategoryPropertiesHashMap).



% throws Exception
initPath(This) ->
        TransformInfoHttpStoreInterface = get({This, transformInfoInterface}),
        StoreFrontInterface = 'StoreFrontFactory':getInstance((get({TransformInfoHttpStoreInterface, '$class'})):getStoreName(TransformInfoHttpStoreInterface)),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'RootStoreThemeCategoryProperties', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'RootStoreThemeCategoryProperties', 'FREEBLISKET_PATH_GLOBALS'})), 'XSLPATH'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StoreFrontInterface, '$class'})):getName(StoreFrontInterface)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'AbPathData':getInstance(), 'SEPARATOR'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({(get({get({'RootStoreThemeCategoryProperties', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'RootStoreThemeCategoryProperties', 'FREEBLISKET_PATH_GLOBALS'})), 'THEMEPATH'})),
        AbPath = 'AbPath':new((get({StringBuffer, '$class'})):toString(StringBuffer), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        HttpServletRequest = (fun(Target_N66906) -> (get({Target_N66906, '$class'})):getRequest(Target_N66906) end)((get({TransformInfoHttpStoreInterface, '$class'})):getPageContext(TransformInfoHttpStoreInterface)),
        put({This, webAppAbPath}, 'AbPath':new(lists:concat([(get({HttpServletRequest, '$class'})):getContextPath(HttpServletRequest), (get({AbPath, '$class'})):toString(AbPath)]), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
        (get({This, '$class'})):setRootFilePath(This, 'AbPath':new(lists:concat([(get({get({'RootStoreThemeCategoryProperties', 'URLGLOBALS'}), '$class'})):getMainPath(get({'RootStoreThemeCategoryProperties', 'URLGLOBALS'})), (get({AbPath, '$class'})):toString(AbPath)]), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))).

