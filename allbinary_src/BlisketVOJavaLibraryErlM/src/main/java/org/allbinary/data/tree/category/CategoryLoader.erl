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
% package org.allbinary.data.tree.category
% import org.allbinary.business.category.CategoryData
% import org.allbinary.business.category.CategoryFactoryInterface
% import org.allbinary.business.category.CategoryInterface
% import org.allbinary.business.category.properties.CategoryProperties
% import org.allbinary.business.category.properties.CategoryPropertiesInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.crypt.file.CryptFileReader
% import org.allbinary.logic.io.file.AbFile
% import org.allbinary.logic.io.path.AbPath
% import org.w3c.dom.Document
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('CategoryLoader').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CategoryLoaderInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CategoryModifierTree', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


new(CategoryFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CategoryFactoryInterface),
    This.

'$init'(This, CategoryFactoryInterface) ->
        'CategoryModifierTree':'$init'(This, CategoryFactoryInterface),
        init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "CategoryLoader(CategoryFactoryInterface categoryFactoryInterface)");
            false -> ok
        end.

getDoc(This, CategoryInterface) ->
        try
        try
            case ((fun(Target_N66422) -> (get({Target_N66422, '$class'})):getPath(Target_N66422, (get({CategoryInterface, '$class'})):getHierarchy(CategoryInterface)) end)((get({CategoryInterface, '$class'})):getProperties(CategoryInterface)) =/= undefined) of
                true ->
                case ((fun(Target_N66511) -> (get({Target_N66511, '$class'})):getLevel(Target_N66511) end)((get({CategoryInterface, '$class'})):getHierarchy(CategoryInterface)) =:= 1) of
                    true ->
                    RootAbFile = 'AbFile':createAbFileFromAbPath((get({CategoryInterface, '$class'})):getRootFilePath(CategoryInterface)),
                    case (not (get({RootAbFile, '$class'})):isDirectory(RootAbFile)) of
                        true ->
                        (get({RootAbFile, '$class'})):mkdirs(RootAbFile),
                        case (not (get({RootAbFile, '$class'})):isDirectory(RootAbFile)) of
                            true ->
                            erlang:error({'Exception', "Could Not Create Directory"});
                            false -> ok
                        end,
                        (get({This, '$class'})):save(This, CategoryInterface);
                        false -> ok
                    end;
                    false -> ok
                end,
                FileAbPath = (get({CategoryInterface, '$class'})):getFilePath(CategoryInterface),
                CryptFileReader = 'CryptFileReader':new(get({'CategoryData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'CategoryData':getInstance(), 'ENCRYPTED_EXTENSION'})),
                Document = 'DomDocumentHelper':create((get({CryptFileReader, '$class'})):get(CryptFileReader, FileAbPath)),
                throw({'$return', Document});
                false ->
                erlang:error({'Exception', "Null Category"})
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                try
                    (get({CategoryInterface, '$class'})):log(CategoryInterface)
                catch _:E2 when E2 =/= '$break', E2 =/= '$continue', (not is_tuple(E2) orelse element(1, E2) =/= '$return') ->
                    (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), "Could Not Log Category", This, "getDoc", E)
                end,
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, "getDoc", E);
                false -> ok
            end,
            undefined
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

get(This, CategoryInterface) ->
        try
            Document = (get({This, '$class'})):getDoc(This, CategoryInterface),
            CategoryNode = 'DomSearchHelper':getNode(get({'CategoryData':getInstance(), 'NAME'}), (get({Document, '$class'})):getChildNodes(Document)),
            (get({This, '$class'})):addProperties(This, CategoryInterface, (get({CategoryNode, '$class'})):getChildNodes(CategoryNode))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), 'GET'}), E);
                false -> ok
            end,
            undefined
        end;
get(This, Document) ->
        try
            CategoryNode = 'DomSearchHelper':getNode(get({'CategoryData':getInstance(), 'NAME'}), (get({Document, '$class'})):getChildNodes(Document)),
            LoadedCategoryInterface = (get({get({This, categoryFactoryInterface}), '$class'})):getRootInstanceFromNode(get({This, categoryFactoryInterface}), CategoryNode),
            (get({This, '$class'})):addProperties(This, LoadedCategoryInterface, (get({CategoryNode, '$class'})):getChildNodes(CategoryNode))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), 'GET'}), E);
                false -> ok
            end,
            undefined
        end.


getAll(This, CategoryInterface) ->
        try
            Document = (get({This, '$class'})):getDoc(This, CategoryInterface),
            (get({This, '$class'})):getAll(This, Document)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), 'GET'}), E);
                false -> ok
            end,
            undefined
        end;
getAll(This, Document) ->
        try
            CategoryNode = 'DomSearchHelper':getNode(get({'CategoryData':getInstance(), 'NAME'}), (get({Document, '$class'})):getChildNodes(Document)),
            LoadedCategoryInterface = (get({get({This, categoryFactoryInterface}), '$class'})):getRootInstanceFromNode(get({This, categoryFactoryInterface}), CategoryNode),
            (get({This, '$class'})):addProperties(This, LoadedCategoryInterface, (get({CategoryNode, '$class'})):getChildNodes(CategoryNode))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), 'GET'}), E);
                false -> ok
            end,
            undefined
        end.


getAll(This, ParentCategoryInterface, CategoryNodeList) ->
        try
            case (CategoryNodeList =/= undefined) of
                true ->
                lists:foreach(fun(Index) ->
                    CategoryNode = (get({CategoryNodeList, '$class'})):item(CategoryNodeList, Index),
                    case ((CategoryNode =/= undefined) andalso ((fun(Target_N69575) -> (get({Target_N69575, '$class'})):compareTo(Target_N69575, get({'CategoryData':getInstance(), 'NAME'})) end)((get({CategoryNode, '$class'})):getNodeName(CategoryNode)) =:= 0)) of
                        true ->
                        CategoryInterface = (get({get({This, categoryFactoryInterface}), '$class'})):getInstance(get({This, categoryFactoryInterface}), (fun(Target_N69671) -> (get({Target_N69671, '$class'})):getRoot(Target_N69671) end)((get({ParentCategoryInterface, '$class'})):getHierarchy(ParentCategoryInterface)), ParentCategoryInterface, CategoryNode),
                        (get({ParentCategoryInterface, '$class'})):addChild(ParentCategoryInterface, CategoryInterface);
                        false -> ok
                    end
                end, lists:seq(0, (get({CategoryNodeList, '$class'})):getLength(CategoryNodeList) - 1));
                false -> ok
            end,
            ParentCategoryInterface
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), 'GET'}), E);
                false -> ok
            end,
            undefined
        end.

addProperties(This, LoadedCategoryInterface, CategoryNodeList) ->
        try
            case (CategoryNodeList =/= undefined) of
                true ->
                lists:foreach(fun(Index) ->
                    CategoryNode = (get({CategoryNodeList, '$class'})):item(CategoryNodeList, Index),
                    case ((CategoryNode =/= undefined) andalso ((fun(Target_N70343) -> (get({Target_N70343, '$class'})):compareTo(Target_N70343, get({'CategoryData':getInstance(), 'NAME'})) end)((get({CategoryNode, '$class'})):getNodeName(CategoryNode)) =:= 0)) of
                        true ->
                        CategoryPropertiesInterface = 'CategoryProperties':new(CategoryNode),
                        (get({LoadedCategoryInterface, '$class'})):addChildProperty(LoadedCategoryInterface, CategoryPropertiesInterface);
                        false -> ok
                    end
                end, lists:seq(0, (get({CategoryNodeList, '$class'})):getLength(CategoryNodeList) - 1));
                false -> ok
            end,
            LoadedCategoryInterface
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'SQLLOGGING'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'FAILURE'}), This, get({get({This, commonStrings}), 'GET'}), E);
                false -> ok
            end,
            undefined
        end.

