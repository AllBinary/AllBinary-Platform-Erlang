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
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.category.Category
% import org.allbinary.business.category.CategoryInterface
% import org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.visual.theme.ThemeData
% import org.allbinary.logic.visual.theme.ThemeValidation
% import org.allbinary.logic.visual.theme.ThemesData
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Node
% import org.w3c.dom.NodeList

-module('StoreThemeCategory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements StoreThemeCategoryInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Category', Function, Arguments).

init_fields(This) ->
    put({This, transformInfoInterface}, undefined),
    put({This, themeVector}, undefined),
    ok.


new(TransformInfoInterface, CategoryPropertiesFactoryInterface, Level) when is_integer(Level) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, CategoryPropertiesFactoryInterface, Level),
    This.

init(This, TransformInfoInterface, CategoryPropertiesFactoryInterface, Level) when is_integer(Level) ->
        'Category':init(This, CategoryPropertiesFactoryInterface, Level),
        init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        put({This, themeVector}, 'BasicArrayListD':new()).

new(TransformInfoInterface, Node, CategoryPropertiesFactoryInterface, Level) when is_integer(Level) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, Node, CategoryPropertiesFactoryInterface, Level),
    This;
new(TransformInfoInterface, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface),
    This.

init(This, TransformInfoInterface, Node, CategoryPropertiesFactoryInterface, Level) when is_integer(Level) ->
        'Category':init(This, CategoryPropertiesFactoryInterface, Level),
        init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        put({This, themeVector}, 'BasicArrayListD':new()),
        (get({This, '$class'})):addThemes(This, Node);
init(This, TransformInfoInterface, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface) ->
        'Category':init(This, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface),
        init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        put({This, themeVector}, 'BasicArrayListD':new()).


new(TransformInfoInterface, Node, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TransformInfoInterface, Node, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface),
    This.

init(This, TransformInfoInterface, Node, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface) ->
        'Category':init(This, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesFactoryInterface),
        init_fields(This),
        put({This, transformInfoInterface}, TransformInfoInterface),
        put({This, themeVector}, 'BasicArrayListD':new()),
        (get({This, '$class'})):addThemes(This, Node).

getTransformInfoInterface(This) ->
        get({This, transformInfoInterface}).

% throws Exception
addThemes(This, Node) ->
        ThemesNode = 'DomSearchHelper':getNode(get({'ThemesData':getInstance(), 'NAME'}), (get({Node, '$class'})):getChildNodes(Node)),
        NodeList = (get({ThemesNode, '$class'})):getChildNodes(ThemesNode),
        lists:foreach(fun(Index) ->
            ThemeNode = (get({NodeList, '$class'})):item(NodeList, Index),
            case ((fun(Target_N67174) -> (get({Target_N67174, '$class'})):compareTo(Target_N67174, get({'ThemeData':getInstance(), 'NAME'})) end)((get({ThemeNode, '$class'})):getNodeName(ThemeNode)) =:= 0) of
                true ->
                (get({get({This, themeVector}), '$class'})):add(get({This, themeVector}), 'ThemeValidation':new(This, ThemeNode));
                false -> ok
            end
        end, lists:seq(0, (get({NodeList, '$class'})):getLength(NodeList) - 1)).

addTheme(This, ThemeValidation) ->
        (get({get({This, themeVector}), '$class'})):add(get({This, themeVector}), ThemeValidation).

getThemes(This) ->
        get({This, themeVector}).

% throws Exception
isValid(This) ->
        try
        case (not (fun(Target_N67559) -> (get({Target_N67559, '$class'})):booleanValue(Target_N67559) end)('Category':isValid(This))) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
toHashMap(This) ->
        CategoryHashMap = 'Category':toHashMap(This),
        (get({CategoryHashMap, '$class'})):put(CategoryHashMap, get({'ThemesData':getInstance(), 'NAME'}), get({This, themeVector})),
        CategoryHashMap.

% throws Exception
toVector(This) ->
        CategoryVector = 'Category':toVector(This),
        CategoryVector.

