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
% package org.allbinary.data.tables.transform.info
% import java.util.HashMap
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import javax.servlet.jsp.PageContext
% import org.allbinary.data.tables.BasicDataTableInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface

-module('TransformInfoEntityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicDataTableInterface', Function, Arguments).


% throws Exception
get(This, Name, PropertiesHashMap, PageContext) when (is_list(Name) orelse Name =:= undefined) ->
    erlang:error({abstract_method, get}).

% throws Exception
getObjectConfigs(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
    erlang:error({abstract_method, getObjectConfigs}).

% throws Exception
getNames(This, StoreName) when (is_list(StoreName) orelse StoreName =:= undefined) ->
    erlang:error({abstract_method, getNames}).

delete(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
    erlang:error({abstract_method, delete}).

insert(This, Values) ->
    erlang:error({abstract_method, insert}).

update(This, UpdatedValues) ->
    erlang:error({abstract_method, update}).

