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
% package org.allbinary.business.category.properties
% import org.allbinary.business.category.hierarchy.CategoryHierarchyInterface
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.control.validate.ValidationInterface
% import org.allbinary.logic.io.path.AbPath

-module('CategoryPropertiesInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableMappingInterface', Function, Arguments).


setValue(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setValue}).

getValue(This) ->
    erlang:error({abstract_method, getValue}).

% throws Exception
getWebAppPath(This) ->
    erlang:error({abstract_method, getWebAppPath}).

% throws Exception
getPath(This, CategoryHierarchyInterface) ->
    erlang:error({abstract_method, getPath}).

% throws Exception
getFileName(This) ->
    erlang:error({abstract_method, getFileName}).

% throws Exception
isRoot(This) ->
    erlang:error({abstract_method, isRoot}).

% throws Exception
isRealRoot(This) ->
    erlang:error({abstract_method, isRealRoot}).

