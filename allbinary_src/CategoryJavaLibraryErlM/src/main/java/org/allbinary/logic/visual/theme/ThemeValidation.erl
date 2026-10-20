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
% package org.allbinary.logic.visual.theme
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.category.CategoryData
% import org.allbinary.business.category.CategoryFactoryInterface
% import org.allbinary.business.category.store.theme.StoreThemeCategoryFactory
% import org.allbinary.business.category.store.theme.StoreThemeCategoryInterface
% import org.allbinary.data.tree.category.CategoryLoaderFactory
% import org.allbinary.data.tree.category.CategoryLoaderInterface
% import org.allbinary.data.tree.dom.DomData
% import org.allbinary.data.tree.dom.DomNodeHelper
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.ModDomHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.communication.sql.AbSqlData
% import org.allbinary.logic.control.crypt.file.CryptFileReader
% import org.allbinary.logic.control.validate.ValidationInterface
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.io.path.PathUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail.CssStyleValidation
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('ThemeValidation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ThemeInterface
% implements ValidationInterface
% implements DomNodeInterface
% implements CompositeTransformInfoInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, transformInfoInterface}, undefined),
    put({This, styleValidationInterface}, undefined),
    put({This, themeName}, undefined),
    put({This, themePreviewImageName}, undefined),
    put({This, webAppAbPath}, undefined),
    put({This, categoryAbPath}, undefined),
    put({This, fileAbPath}, undefined),
    ok.


new(TransformInfoInterface, CssStyleValidation, CategoryThemePath) when (is_list(CategoryThemePath) orelse CategoryThemePath =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface, CssStyleValidation, CategoryThemePath),
    This.

'$init'(This, TransformInfoInterface, CssStyleValidation, CategoryThemePath) when (is_list(CategoryThemePath) orelse CategoryThemePath =:= undefined) ->
    init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        PathData = 'AbPathData':getInstance(),
        PathUtil = 'PathUtil':getInstance(),
        put({This, categoryAbPath}, (get({PathUtil, '$class'})):removeNameFromPath(PathUtil, CategoryThemePath)),
        put({This, themeName}, (get({PathData, '$class'})):getNameFromPath(PathData, CategoryThemePath)),
        put({This, styleValidationInterface}, CssStyleValidation),
        (get({This, '$class'})):init(This).

new(TransformInfoInterface, HashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface, HashMap),
    This;
new(StoreThemeCategoryInterface, Node) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, StoreThemeCategoryInterface, Node),
    This.

'$init'(This, TransformInfoInterface, HashMap) ->
    init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        CategoryThemeAbPath = 'AbPath':new((get({HashMap, '$class'})):get(HashMap, get({'ThemeData':getInstance(), 'PATH'})), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
        PathData = 'AbPathData':getInstance(),
        PathUtil = 'PathUtil':getInstance(),
        put({This, categoryAbPath}, (get({PathUtil, '$class'})):removeNameFromPath(PathUtil, (get({CategoryThemeAbPath, '$class'})):toString(CategoryThemeAbPath))),
        put({This, themeName}, (get({PathData, '$class'})):getNameFromPath(PathData, (get({CategoryThemeAbPath, '$class'})):toString(CategoryThemeAbPath))),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "CategoryThemePath: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({CategoryThemeAbPath, '$class'})):toString(CategoryThemeAbPath)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " & CategoryPath: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, categoryAbPath}), '$class'})):toString(get({This, categoryAbPath}))),
            (get({StringBuffer, '$class'})):append(StringBuffer, " & ThemeName: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, themeName})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Http Request Constructor", This, (get({StringBuffer, '$class'})):toString(StringBuffer));
            false -> ok
        end,
        (get({This, '$class'})):init(This);
'$init'(This, StoreThemeCategoryInterface, Node) ->
    init_fields(This),
        put({This, transformInfoInterface}, (get({StoreThemeCategoryInterface, '$class'})):getTransformInfoInterface(StoreThemeCategoryInterface)),
        put({This, categoryAbPath}, (get({StoreThemeCategoryInterface, '$class'})):getPath(StoreThemeCategoryInterface)),
        ThemeNameNode = 'DomSearchHelper':getNode(get({'ThemeData':getInstance(), 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        ValueNode = 'DomSearchHelper':getNode(get({'DomData', 'VALUE'}), (get({ThemeNameNode, '$class'})):getChildNodes(ThemeNameNode)),
        put({This, themeName}, 'DomNodeHelper':getTextNodeValue(ValueNode)),
        PreviewImageNameNode = 'DomSearchHelper':getNode(get({'ThemeData':getInstance(), 'PREVIEW_IMAGE_NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        PreviewImageNameValueNode = 'DomSearchHelper':getNode(get({'DomData', 'VALUE'}), (get({PreviewImageNameNode, '$class'})):getChildNodes(PreviewImageNameNode)),
        put({This, themePreviewImageName}, 'DomNodeHelper':getTextNodeValue(PreviewImageNameValueNode)),
        put({This, webAppAbPath}, (get({StoreThemeCategoryInterface, '$class'})):getWebAppPath(StoreThemeCategoryInterface)),
        (get({This, '$class'})):init(This, StoreThemeCategoryInterface).


% throws Exception
init(This) ->
        CategoryFactoryInterface = 'StoreThemeCategoryFactory':new((get({This, '$class'})):getTransformInfoInterface(This)),
        CategoryLoaderInterface = 'CategoryLoaderFactory':getInstance(CategoryFactoryInterface),
        RootStoreThemeCategoryInterface = (get({CategoryFactoryInterface, '$class'})):getRootInstance(CategoryFactoryInterface),
        (get({This, '$class'})):init(This, RootStoreThemeCategoryInterface).

% throws Exception
init(This, StoreThemeCategoryInterface) ->
        put({This, fileAbPath}, 'AbPath':new(lists:concat([(fun(Target_N69173) -> (get({Target_N69173, '$class'})):toString(Target_N69173) end)((get({StoreThemeCategoryInterface, '$class'})):getRootFilePath(StoreThemeCategoryInterface)), (get({get({This, categoryAbPath}), '$class'})):toString(get({This, categoryAbPath}))]), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))),
        put({This, webAppAbPath}, (get({StoreThemeCategoryInterface, '$class'})):getWebAppPath(StoreThemeCategoryInterface)).

% throws Exception
getTransformInfoInterface(This) ->
        get({This, transformInfoInterface}).

getName(This) ->
        get({This, themeName}).

getPreviewImageName(This) ->
        get({This, themePreviewImageName}).

getPreviewImagePath(This) ->
        lists:concat([(get({get({This, webAppAbPath}), '$class'})):toString(get({This, webAppAbPath})), (get({get({This, categoryAbPath}), '$class'})):toString(get({This, categoryAbPath}))]).

getPath(This) ->
        (get({get({This, categoryAbPath}), '$class'})):toString(get({This, categoryAbPath})).

% throws Exception
getCssStyleValidation(This) ->
        case (get({This, styleValidationInterface}) =:= undefined) of
            true ->
            CssStyleFileAbPath = 'AbPath':new((get({get({This, fileAbPath}), '$class'})):toString(get({This, fileAbPath})), lists:concat([lists:concat([get({This, themeName}), get({'AbPathData':getInstance(), 'EXTENSION_SEP'})]), get({'CategoryData':getInstance(), 'UNCRYPTED_EXTENSION'})])),
            CryptFileReader = 'CryptFileReader':new(get({'CategoryData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'CategoryData':getInstance(), 'ENCRYPTED_EXTENSION'})),
            Document = 'DomDocumentHelper':create((get({CryptFileReader, '$class'})):get(CryptFileReader, CssStyleFileAbPath)),
            put({This, styleValidationInterface}, 'CssStyleValidation':new(Document));
            false -> ok
        end,
        get({This, styleValidationInterface}).

isValid(This) ->
        try
            put({local, isValid}, true),
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            case (not (fun(Target_N70350) -> (get({Target_N70350, '$class'})):isValidRequired(Target_N70350, (get({get({This, categoryAbPath}), '$class'})):toString(get({This, categoryAbPath})), get({'AbSqlData', 'MINSTRING'}), get({'AbSqlData', 'MAXSTRING'})) end)('StringValidationUtil':getInstance())) of
                true ->
                put({local, isValid}, false);
                false -> ok
            end,
            case (not (fun(Target_N70477) -> (get({Target_N70477, '$class'})):isValidRequired(Target_N70477, get({This, themeName}), get({'AbSqlData', 'MINSTRING'}), get({'AbSqlData', 'MAXSTRING'})) end)('StringValidationUtil':getInstance())) of
                true ->
                put({local, isValid}, false);
                false -> ok
            end,
            case (not (fun(Target_N70596) -> (get({Target_N70596, '$class'})):booleanValue(Target_N70596) end)((fun(Target_N70603) -> (get({Target_N70603, '$class'})):isValid(Target_N70603) end)((get({This, '$class'})):getCssStyleValidation(This)))) of
                true ->
                put({local, isValid}, false);
                false -> ok
            end,
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEW'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["End: ", get({local, isValid})]), This, get({get({This, commonStrings}), 'IS_VALID'}));
                false -> ok
            end,
            get({local, isValid})
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLTAGSERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to validate form", This, get({get({This, commonStrings}), 'IS_VALID'}), E);
                false -> ok
            end,
            false
        end.

validationInfo(This) ->
        try
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, "Theme Validation Error"),
            (get({StringBuffer, '$class'})):toString(StringBuffer)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'VIEWERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Failed to generate validation error info", This, "validationInfo()", E);
                false -> ok
            end,
            "Error Validating Form"
        end.

toValidationInfoDoc(This) ->
        undefined.

toValidationInfoNode(This, Document) ->
        undefined.

getKey(This) ->
        (get({This, '$class'})):getName(This).

toVector(This) ->
        Vector = 'BasicArrayListD':new(),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getName(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getPath(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getPreviewImageName(This)),
        (get({Vector, '$class'})):add(Vector, (get({This, '$class'})):getPreviewImagePath(This)),
        Vector.

toHashMap(This) ->
        ThemeData = 'ThemeData':getInstance(),
        HashMap = (fun(Target_N72041) -> (get({Target_N72041, '$class'})):createHashMap(Target_N72041) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, get({ThemeData, 'NAME'}), (get({This, '$class'})):getName(This)),
        (get({HashMap, '$class'})):put(HashMap, get({ThemeData, 'PATH'}), (get({This, '$class'})):getPath(This)),
        (get({HashMap, '$class'})):put(HashMap, get({ThemeData, 'PREVIEW_IMAGE_NAME'}), (get({This, '$class'})):getPreviewImageName(This)),
        (get({HashMap, '$class'})):put(HashMap, get({ThemeData, 'PREVIEW_IMAGE_PATH'}), (get({This, '$class'})):getPreviewImagePath(This)),
        HashMap.

% throws Exception
toXmlNode(This, Document) ->
        Node = 'ModDomHelper':createNameValueNodes(Document, get({'ThemeData':getInstance(), 'NAME'}), (get({This, '$class'})):toHashMap(This)),
        DomNodeInterface = (get({This, '$class'})):getCssStyleValidation(This),
        (get({Node, '$class'})):appendChild(Node, (get({DomNodeInterface, '$class'})):toXmlNode(DomNodeInterface, Document)),
        Node.

