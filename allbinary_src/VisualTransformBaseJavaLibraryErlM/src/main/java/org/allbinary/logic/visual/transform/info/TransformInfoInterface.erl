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
% package org.allbinary.logic.visual.transform.info
% import java.util.HashMap
% import org.allbinary.data.tables.TableMappingInterface
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface
% import org.w3c.dom.Document

-module('TransformInfoInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('TableMappingInterface', Function, Arguments).


log(This) ->
    erlang:error({abstract_method, log}).

% throws Exception
override(This, HashMap) ->
    erlang:error({abstract_method, override}).

getName(This) ->
    erlang:error({abstract_method, getName}).

setStoreName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setStoreName}).

getStoreName(This) ->
    erlang:error({abstract_method, getStoreName}).

getObjectFile(This) ->
    erlang:error({abstract_method, getObjectFile}).

getObject(This) ->
    erlang:error({abstract_method, getObject}).

% throws Exception
getTemplateFilePath(This) ->
    erlang:error({abstract_method, getTemplateFilePath}).

getTemplateFile(This) ->
    erlang:error({abstract_method, getTemplateFile}).

getTemplate(This) ->
    erlang:error({abstract_method, getTemplate}).

% throws Exception
getDataFilePath(This) ->
    erlang:error({abstract_method, getDataFilePath}).

getDataFile(This) ->
    erlang:error({abstract_method, getDataFile}).

% throws Exception
getDataDocument(This) ->
    erlang:error({abstract_method, getDataDocument}).

setName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setName}).

setObjectFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setObjectFile}).

setObject(This, AnyType) ->
    erlang:error({abstract_method, setObject}).

% throws Exception
setObjectConfigInterface(This, TransformInfoObjectConfigInterface) ->
    erlang:error({abstract_method, setObjectConfigInterface}).

% throws Exception
getObjectConfigInterface(This) ->
    erlang:error({abstract_method, getObjectConfigInterface}).

setTemplateFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTemplateFile}).

setTemplate(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setTemplate}).

setDataFile(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setDataFile}).

setData(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setData}).

setChild(This) ->
    erlang:error({abstract_method, setChild}).

isChild(This) ->
    erlang:error({abstract_method, isChild}).

