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
% package org.allbinary.business.category.store
% import org.allbinary.business.category.Category
% import org.allbinary.business.category.CategoryAbstractFactory
% import org.allbinary.business.category.CategoryFactoryInterface
% import org.allbinary.business.category.CategoryInterface
% import org.allbinary.business.category.CategoryUtil
% import org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface
% import org.allbinary.business.category.properties.root.store.RootStoreCategoryPropertiesFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Node

-module('StoreCategoryFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CategoryFactoryInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CategoryAbstractFactory', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, transformInfoInterface}, undefined),
    ok.


new(TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, TransformInfoInterface),
    This.

'$init'(This, TransformInfoInterface) ->
    'CategoryAbstractFactory':'$init'(This),
    init_fields(This),
        case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'CATEGORY'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "StoreCategoryFactory(TransformInfoInterface transformInfoInterface)");
            false -> ok
        end,
        put({This, transformInfoInterface}, TransformInfoInterface).

getRootInstance(This) ->
        try
            CategoryPropertiesFactoryInterface = 'RootStoreCategoryPropertiesFactory':new(get({This, transformInfoInterface})),
            'Category':new(CategoryPropertiesFactoryInterface)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getInstance(String, int)", E);
                false -> ok
            end,
            undefined
        end.

getRootInstance(This, CategoryPath) ->
        try
            Level = 'CategoryUtil':getPathLevel(CategoryPath),
            CategoryPropertiesFactoryInterface = 'RootStoreCategoryPropertiesFactory':new(get({This, transformInfoInterface}), CategoryPath),
            'Category':new(CategoryPropertiesFactoryInterface, Level)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getInstance(String, int)", E);
                false -> ok
            end,
            undefined
        end.

getRootInstanceFromNode(This, Node) ->
        try
            CategoryPropertiesFactoryInterface = 'RootStoreCategoryPropertiesFactory':new(get({This, transformInfoInterface}), Node),
            CategoryPath = 'AbPath':new('CategoryUtil':getNameFromNode(Node), get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
            Level = 'CategoryUtil':getPathLevel(CategoryPath),
            'Category':new(CategoryPropertiesFactoryInterface, Level)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            case (get({get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), '$class'})):contains(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypes'}), 'LOGGING'}), get({(get({get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'}), '$class'})):getInstance(get({get({get({get({get({get({get({'org', allbinary}), logic}), communication}), log}), config}), type}), 'LogConfigTypeFactory'})), 'ENTITYFACTORYERROR'})) of
                true ->
                (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "getInstance(String, int)", E);
                false -> ok
            end,
            undefined
        end.

