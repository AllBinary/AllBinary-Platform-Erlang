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
% package org.allbinary.business.category.store.theme
% import java.util.HashMap
% import org.allbinary.business.category.CategoryFactoryInterface
% import org.allbinary.business.category.CategoryInterface
% import org.allbinary.business.category.CategoryUtil
% import org.allbinary.business.category.properties.CategoryPropertiesFactory
% import org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface
% import org.allbinary.business.category.properties.root.store.theme.RootStoreThemeCategoryPropertiesFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.allbinary.string.CommonStrings
% import org.w3c.dom.Node

-module('StoreThemeCategoryFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CategoryFactoryInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, transformInfoInterface}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "StoreCategoryFactory(TransformInfoInterface transformInfoInterface)");
            false -> ok
        end,
        put({This, transformInfoInterface}, TransformInfoInterface).

getRootInstance(This) ->
        try
            CategoryPropertiesFactoryInterface = 'RootStoreThemeCategoryPropertiesFactory':new(get({This, transformInfoInterface})),
            'StoreThemeCategory':new(get({This, transformInfoInterface}), CategoryPropertiesFactoryInterface, 0)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getRootInstance()", E);
                false -> ok
            end,
            undefined
        end.

getRootInstance(This, CategoryAbPath) ->
        try
            Level = 'CategoryUtil':getPathLevel(CategoryAbPath),
            CategoryPropertiesFactoryInterface = 'RootStoreThemeCategoryPropertiesFactory':new(get({This, transformInfoInterface}), CategoryAbPath),
            'StoreThemeCategory':new(get({This, transformInfoInterface}), CategoryPropertiesFactoryInterface, Level)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getRootInstance(String)", E);
                false -> ok
            end,
            undefined
        end.

getRootInstanceFromNode(This, Node) ->
        try
            CategoryPropertiesFactoryInterface = 'RootStoreThemeCategoryPropertiesFactory':new(get({This, transformInfoInterface}), Node),
            CategoryPath = 'AbPath':new('CategoryUtil':getNameFromNode(Node), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            Level = 'CategoryUtil':getPathLevel(CategoryPath),
            'StoreThemeCategory':new(get({This, transformInfoInterface}), Node, CategoryPropertiesFactoryInterface, Level)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getRootInstance(node)", E);
                false -> ok
            end,
            undefined
        end.

getInstance(This, CategoryPath, Level) when (is_list(CategoryPath) orelse CategoryPath =:= undefined), is_integer(Level) ->
        try
            CategoryPropertiesFactoryInterface = 'CategoryPropertiesFactory':new(CategoryPath),
            'StoreThemeCategory':new(get({This, transformInfoInterface}), CategoryPropertiesFactoryInterface, Level)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getInstance(String, int)", E);
                false -> ok
            end,
            undefined
        end;
getInstance(This, Node, Level) when is_integer(Level) ->
        try
            CategoryPropertiesFactoryInterface = 'CategoryPropertiesFactory':new(Node),
            'StoreThemeCategory':new(get({This, transformInfoInterface}), CategoryPropertiesFactoryInterface, Level)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getInstance(Node, int)", E);
                false -> ok
            end,
            undefined
        end;
getInstance(This, CategoryPropertiesHashMap, Level) when is_integer(Level) ->
        try
            CategoryPropertiesFactoryInterface = 'CategoryPropertiesFactory':new(CategoryPropertiesHashMap),
            'StoreThemeCategory':new(get({This, transformInfoInterface}), CategoryPropertiesFactoryInterface, Level)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getInstance(HashMap)", E);
                false -> ok
            end,
            undefined
        end.

getInstance(This, RootCategoryInterface, ParentCategoryInterface, CategoryPath) when (is_list(CategoryPath) orelse CategoryPath =:= undefined) ->
        try
            CategoryPropertiesFactoryInterface = 'CategoryPropertiesFactory':new(CategoryPath),
            'StoreThemeCategory':new(get({This, transformInfoInterface}), RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getInstance(CategoryInterface, CategoryInterface , String, int)", E);
                false -> ok
            end,
            undefined
        end;
getInstance(This, RootCategoryInterface, ParentCategoryInterface, Node) ->
        try
            CategoryPropertiesFactoryInterface = 'CategoryPropertiesFactory':new(Node),
            'StoreThemeCategory':new(get({This, transformInfoInterface}), RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getInstance(CategoryInterface, CategoryInterface, Node, int)", E);
                false -> ok
            end,
            undefined
        end;
getInstance(This, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesHashMap) ->
        try
            CategoryPropertiesFactoryInterface = 'CategoryPropertiesFactory':new(CategoryPropertiesHashMap),
            'StoreThemeCategory':new(get({This, transformInfoInterface}), RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getInstance(CategoryInterface, CategoryInterface, HashMap)", E);
                false -> ok
            end,
            undefined
        end.





