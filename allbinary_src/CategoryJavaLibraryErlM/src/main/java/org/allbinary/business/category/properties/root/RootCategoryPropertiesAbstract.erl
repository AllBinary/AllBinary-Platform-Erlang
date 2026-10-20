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
% package org.allbinary.business.category.properties.root
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.category.CategoryData
% import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('RootCategoryPropertiesAbstract').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RootCategoryPropertiesInterface

init_fields(This) ->
    put({This, category}, get({'CategoryData':getInstance(), 'ROOTCATEGORY'})),
    put({This, fileName}, lists:concat([lists:concat([get({This, category}), get({'AbPathData':getInstance(), 'EXTENSION_SEP'})]), get({'CategoryData':getInstance(), 'UNCRYPTED_EXTENSION'})])),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getKey(This) ->
        (get({This, '$class'})):getValue(This).

getValue(This) ->
        get({This, category}).

% throws Exception
setValue(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        erlang:error({'Exception', "No Value Allowed"}).

% throws Exception
setRootFilePath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        erlang:error({'Exception', "No Value Allowed"});
% throws Exception
setRootFilePath(This, Value) ->
        erlang:error({'RuntimeException'}).


% throws Exception
getRootFilePath(This) ->
        erlang:error({'Exception', "No Value Allowed"}).

% throws Exception
isRealRoot(This) ->
        erlang:error({'Exception', "No A Real Root"}).

% throws Exception
isRoot(This) ->
        erlang:error({'Exception', "Root but not implemented"}).

% throws Exception
getWebAppPath(This, CategoryHierarchyInterface) ->
        erlang:error({'Exception', "Not Root"}).

getPath(This, CategoryHierarchyInterface) ->
        'AbPath':createAbPath().

getFileName(This) ->
        get({This, fileName}).

isValid(This) ->
        true.

toHashMap(This) ->
        CategoryHashMap = (fun(Target_N66859) -> (get({Target_N66859, '$class'})):createHashMap(Target_N66859) end)('StdUtil':getInstance()),
        (get({CategoryHashMap, '$class'})):put(CategoryHashMap, get({'CategoryData':getInstance(), 'NAME'}), get({This, category})),
        CategoryHashMap.

toVector(This) ->
        CategoryVector = 'BasicArrayListD':new(),
        (get({CategoryVector, '$class'})):add(CategoryVector, get({This, category})),
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

