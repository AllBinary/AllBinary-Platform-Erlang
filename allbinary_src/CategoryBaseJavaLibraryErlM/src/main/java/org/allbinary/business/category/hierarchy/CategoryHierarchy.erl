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
% package org.allbinary.business.category.hierarchy
% import java.util.HashMap
% import org.allbinary.business.category.CategoryData
% import org.allbinary.business.category.CategoryInterface
% import org.allbinary.logic.string.StringUtil

-module('CategoryHierarchy').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CategoryHierarchyInterface

init_fields(This) ->
    put({This, rootCategoryInterface}, undefined),
    put({This, parentCategoryInterface}, undefined),
    put({This, level}, 0),
    ok.


new(RootCategoryInterface, ParentCategoryInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RootCategoryInterface, ParentCategoryInterface),
    This.

'$init'(This, RootCategoryInterface, ParentCategoryInterface) ->
    init_fields(This),
        put({This, level}, 0),
        (get({This, '$class'})):setRoot(This, RootCategoryInterface),
        (get({This, '$class'})):setParent(This, ParentCategoryInterface).

new(RootCategoryInterface, ParentCategoryInterface, Level) when is_integer(Level) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RootCategoryInterface, ParentCategoryInterface, Level),
    This;
new(RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesHashMap),
    This.

'$init'(This, RootCategoryInterface, ParentCategoryInterface, Level) when is_integer(Level) ->
    init_fields(This),
        put({This, level}, Level),
        (get({This, '$class'})):setRoot(This, RootCategoryInterface),
        (get({This, '$class'})):setParent(This, ParentCategoryInterface);
'$init'(This, RootCategoryInterface, ParentCategoryInterface, CategoryPropertiesHashMap) ->
    init_fields(This),
        LevelString = (fun(Target_N66105) -> (get({Target_N66105, '$class'})):getNonNull(Target_N66105, (get({CategoryPropertiesHashMap, '$class'})):get(CategoryPropertiesHashMap, get({'CategoryData':getInstance(), 'LEVEL'}))) end)('StringUtil':getInstance()),
        put({This, level}, (fun(Target_N66221) -> (get({Target_N66221, '$class'})):intValue(Target_N66221) end)(allbinary_java:to_string(LevelString))),
        (get({This, '$class'})):setRoot(This, RootCategoryInterface),
        (get({This, '$class'})):setParent(This, ParentCategoryInterface).


getLevel(This) ->
        get({This, level}).

getLevelString(This) ->
        allbinary_java:to_string(get({This, level})).

setLevel(This, Level) when is_integer(Level) ->
        put({This, level}, Level).

setParent(This, CategoryInterface) ->
        put({This, parentCategoryInterface}, CategoryInterface).

setRoot(This, CategoryInterface) ->
        put({This, rootCategoryInterface}, CategoryInterface).

getRoot(This) ->
        get({This, rootCategoryInterface}).

getParent(This) ->
        get({This, parentCategoryInterface}).

