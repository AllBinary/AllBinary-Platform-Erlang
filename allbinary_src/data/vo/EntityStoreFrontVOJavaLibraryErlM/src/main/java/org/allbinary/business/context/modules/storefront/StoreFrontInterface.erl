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
% package org.allbinary.business.context.modules.storefront
% import org.allbinary.business.context.configuration.ContextConfigurationInterface
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.util.BasicArrayList

-module('StoreFrontInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableMappingInterface', Function, Arguments).


isNameValid(This) ->
    erlang:error({abstract_method, isNameValid}).

isValid(This) ->
    erlang:error({abstract_method, isValid}).

nameValidationInfo(This) ->
    erlang:error({abstract_method, nameValidationInfo}).

validationInfo(This) ->
    erlang:error({abstract_method, validationInfo}).

getTestHtmlPath(This) ->
    erlang:error({abstract_method, getTestHtmlPath}).

getCurrentHostName(This) ->
    erlang:error({abstract_method, getCurrentHostName}).

getCurrentHostNamePath(This) ->
    erlang:error({abstract_method, getCurrentHostNamePath}).

getCurrentHomeHostName(This) ->
    erlang:error({abstract_method, getCurrentHomeHostName}).

getCurrentHomeHostNamePath(This) ->
    erlang:error({abstract_method, getCurrentHomeHostNamePath}).

getName(This) ->
    erlang:error({abstract_method, getName}).

getBasketName(This) ->
    erlang:error({abstract_method, getBasketName}).

getHomeHostName(This) ->
    erlang:error({abstract_method, getHomeHostName}).

getHomeHostNamePath(This) ->
    erlang:error({abstract_method, getHomeHostNamePath}).

getHostName(This) ->
    erlang:error({abstract_method, getHostName}).

getHostNamePath(This) ->
    erlang:error({abstract_method, getHostNamePath}).

getTestHomeHostName(This) ->
    erlang:error({abstract_method, getTestHomeHostName}).

getTestHomeHostNamePath(This) ->
    erlang:error({abstract_method, getTestHomeHostNamePath}).

getTestHostName(This) ->
    erlang:error({abstract_method, getTestHostName}).

getTestHostNamePath(This) ->
    erlang:error({abstract_method, getTestHostNamePath}).

getStaticPath(This) ->
    erlang:error({abstract_method, getStaticPath}).

getCategoryPath(This) ->
    erlang:error({abstract_method, getCategoryPath}).

% throws Exception
getSubStores(This) ->
    erlang:error({abstract_method, getSubStores}).

getTagLocation(This) ->
    erlang:error({abstract_method, getTagLocation}).

getPackageLocation(This) ->
    erlang:error({abstract_method, getPackageLocation}).

getInventoryControl(This) ->
    erlang:error({abstract_method, getInventoryControl}).

getContextConfigurationInterface(This) ->
    erlang:error({abstract_method, getContextConfigurationInterface}).

setContextConfigurationInterface(This, ContextConfigurationInterface) ->
    erlang:error({abstract_method, setContextConfigurationInterface}).

getFtp(This) ->
    erlang:error({abstract_method, getFtp}).

getFtpPath(This) ->
    erlang:error({abstract_method, getFtpPath}).

getFtpUserName(This) ->
    erlang:error({abstract_method, getFtpUserName}).

getFtpPassword(This) ->
    erlang:error({abstract_method, getFtpPassword}).

getTestFtp(This) ->
    erlang:error({abstract_method, getTestFtp}).

getTestFtpPath(This) ->
    erlang:error({abstract_method, getTestFtpPath}).

getTestFtpUserName(This) ->
    erlang:error({abstract_method, getTestFtpUserName}).

getTestFtpPassword(This) ->
    erlang:error({abstract_method, getTestFtpPassword}).

getTimeCreated(This) ->
    erlang:error({abstract_method, getTimeCreated}).

getLastModified(This) ->
    erlang:error({abstract_method, getLastModified}).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setName}).

setBasketName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setBasketName}).

setHomeHostName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setHomeHostName}).

% throws Exception
setHomeHostNamePath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setHomeHostNamePath}).

setHostName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setHostName}).

% throws Exception
setHostNamePath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setHostNamePath}).

setTestHomeHostName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTestHomeHostName}).

% throws Exception
setTestHomeHostNamePath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTestHomeHostNamePath}).

setTestHostName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTestHostName}).

% throws Exception
setTestHostNamePath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTestHostNamePath}).

% throws Exception
setImagePath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setImagePath}).

% throws Exception
setStaticPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setStaticPath}).

% throws Exception
setCategoryPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setCategoryPath}).

setPackageLocation(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setPackageLocation}).

setInventoryControl(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setInventoryControl}).

setFtp(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setFtp}).

% throws Exception
setFtpPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setFtpPath}).

setFtpUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setFtpUserName}).

setFtpPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setFtpPassword}).

setTestFtp(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTestFtp}).

% throws Exception
setTestFtpPath(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTestFtpPath}).

setTestFtpUserName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTestFtpUserName}).

setTestFtpPassword(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTestFtpPassword}).

setTimeCreated(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTimeCreated}).

setLastModified(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setLastModified}).

% throws Exception
install(This, Current, Total) when is_integer(Current), is_integer(Total) ->
    erlang:error({abstract_method, install}).

