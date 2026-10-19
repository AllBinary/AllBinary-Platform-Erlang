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
% package org.allbinary.logic.visual.transform
% import org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface
% import org.allbinary.logic.visual.transform.data.TransformDocumentInterface
% import org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface

-module('TransformInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('DomDocumentMappingInterface', Function, Arguments).


getTypeId(This) ->
    erlang:error({abstract_method, getTypeId}).

setTransformDocumentInterface(This, ViewDocumentInterface) ->
    erlang:error({abstract_method, setTransformDocumentInterface}).

getTransformDocumentInterface(This) ->
    erlang:error({abstract_method, getTransformDocumentInterface}).

% throws Exception
view(This) ->
    erlang:error({abstract_method, view}).

