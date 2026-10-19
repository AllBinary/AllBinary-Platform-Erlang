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
% package org.allbinary.logic.visual.transform.info.objectConfig
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface

-module('TransformInfoObjectConfigInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('DomDocumentMappingInterface', Function, Arguments).


containsView(This, TransformInfoInterface) ->
    erlang:error({abstract_method, containsView}).

% throws Exception
getName(This) ->
    erlang:error({abstract_method, getName}).

% throws Exception
getTransformsGroup(This, Group) when (is_list(Group) orelse Group =:= undefined) ->
    erlang:error({abstract_method, getTransformsGroup}).

% throws Exception
getTransforms(This) ->
    erlang:error({abstract_method, getTransforms}).

% throws Exception
getParentTransforms(This) ->
    erlang:error({abstract_method, getParentTransforms}).

% throws Exception
getGroupTransforms(This) ->
    erlang:error({abstract_method, getGroupTransforms}).

% throws Exception
getOutputTypeName(This) ->
    erlang:error({abstract_method, getOutputTypeName}).

setOutputTypeName(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
    erlang:error({abstract_method, setOutputTypeName}).

% throws Exception
getInputOutputTypeName(This) ->
    erlang:error({abstract_method, getInputOutputTypeName}).

% throws Exception
getInputOutputTypeFile(This) ->
    erlang:error({abstract_method, getInputOutputTypeFile}).

% throws Exception
getImportUriPath(This) ->
    erlang:error({abstract_method, getImportUriPath}).

toString(This) ->
    erlang:error({abstract_method, toString}).

