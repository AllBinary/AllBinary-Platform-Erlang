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
% import java.io.InputStream
% import javax.xml.transform.URIResolver
% import javax.xml.transform.stream.StreamSource
% import org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface

-module('BasicTransformerInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CompositeTransformInfoInterface', Function, Arguments).


setInputStream(This, InputStream) ->
    erlang:error({abstract_method, setInputStream}).

setURIResolver(This, UriResolver) ->
    erlang:error({abstract_method, setURIResolver}).

getStreamSource(This) ->
    erlang:error({abstract_method, getStreamSource}).

getInputStream(This) ->
    erlang:error({abstract_method, getInputStream}).

getURIResolver(This) ->
    erlang:error({abstract_method, getURIResolver}).

% throws Exception
translate(This, XmlDocumentStr) when (is_list(XmlDocumentStr) orelse XmlDocumentStr =:= undefined) ->
    erlang:error({abstract_method, translate}).

