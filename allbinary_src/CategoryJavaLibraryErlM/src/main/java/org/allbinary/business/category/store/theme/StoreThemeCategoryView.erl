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
% import java.util.Arrays
% import org.allbinary.business.category.CategoryView
% import org.allbinary.data.tree.dom.DomNodeInterface
% import org.allbinary.logic.visual.theme.ThemeValidation
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('StoreThemeCategoryView').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomNodeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CategoryView', Function, Arguments).

init_fields(This) ->
    ok.


new(CategoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CategoryInterface),
    This.

init(This, CategoryInterface) ->
        'CategoryView':init(This, CategoryInterface).

% throws Exception
toXmlNode(This, Document) ->
        Node = 'CategoryView':toXmlNode(This, Document),
        StoreThemeCategoryInterface = (get({This, '$class'})):getCategoryInterface(This),
        ThemeValidationArray = (fun(Target_N66004) -> (get({Target_N66004, '$class'})):toArray(Target_N66004) end)((get({StoreThemeCategoryInterface, '$class'})):getThemes(StoreThemeCategoryInterface)),
        'Arrays':sort(ThemeValidationArray, 'ThemeComparator':new()),
        Size = array:size(ThemeValidationArray),
        lists:foreach(fun(Index) ->
            ThemeValidation = array:get(Index, ThemeValidationArray),
            (get({Node, '$class'})):appendChild(Node, (get({ThemeValidation, '$class'})):toXmlNode(ThemeValidation, Document))
        end, lists:seq(0, Size - 1)),
        Node.

