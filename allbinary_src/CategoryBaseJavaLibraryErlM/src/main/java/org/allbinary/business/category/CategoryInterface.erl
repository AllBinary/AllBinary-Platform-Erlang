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
% package org.allbinary.business.category
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface
% import org.allbinary.business.category.properties.CategoryPropertiesInterface
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.control.validate.ValidationInterface
% import org.allbinary.logic.io.path.AbPath

-module('CategoryInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableMappingInterface', Function, Arguments).


getChildNodes(This) ->
    erlang:error({abstract_method, getChildNodes}).

addChildProperty(This, CategoryPropertiesInterface) ->
    erlang:error({abstract_method, addChildProperty}).

addChild(This, CategoryInterface) ->
    erlang:error({abstract_method, addChild}).

removeChild(This, CategoryInterface) ->
    erlang:error({abstract_method, removeChild}).

% throws Exception
isLeaf(This) ->
    erlang:error({abstract_method, isLeaf}).

getProperties(This) ->
    erlang:error({abstract_method, getProperties}).

setProperties(This, CategoryPropertiesInterface) ->
    erlang:error({abstract_method, setProperties}).

getHierarchy(This) ->
    erlang:error({abstract_method, getHierarchy}).

setHierarchy(This, CategoryHierarchyInterface) ->
    erlang:error({abstract_method, setHierarchy}).

% throws Exception
getPath(This) ->
    erlang:error({abstract_method, getPath}).

% throws Exception
getFilePath(This) ->
    erlang:error({abstract_method, getFilePath}).

% throws Exception
getWebAppPath(This) ->
    erlang:error({abstract_method, getWebAppPath}).

% throws Exception
getRootFilePath(This) ->
    erlang:error({abstract_method, getRootFilePath}).

% throws Exception
log(This) ->
    erlang:error({abstract_method, log}).

