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
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.visual.transform.info.TransformInfoInterface
% import org.w3c.dom.Document

-module('OverrideStoreTransformInfoObjectConfig').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('GenericStoreTransformInfoObjectConfig', Function, Arguments).

init_fields(This) ->
    ok.


new(AbeClientInformation, TransformInfoInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, TransformInfoInterface),
    This.

'$init'(This, AbeClientInformation, TransformInfoInterface) ->
        'GenericStoreTransformInfoObjectConfig':'$init'(This, AbeClientInformation, TransformInfoInterface).

new(AbeClientInformation, TransformInfoInterface, Document) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, TransformInfoInterface, Document),
    This.

'$init'(This, AbeClientInformation, TransformInfoInterface, Document) ->
        'GenericStoreTransformInfoObjectConfig':'$init'(This, AbeClientInformation, TransformInfoInterface, Document),
        (get({This, '$class'})):setDocument(This, (get({This, '$class'})):generate(This, (get({This, '$class'})):toXmlDoc(This))).

new(AbeClientInformation, TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AbeClientInformation, TransformInfoInterface, Name, Type),
    This.

'$init'(This, AbeClientInformation, TransformInfoInterface, Name, Type) when (is_list(Name) orelse Name =:= undefined), (is_list(Type) orelse Type =:= undefined) ->
        'GenericStoreTransformInfoObjectConfig':'$init'(This, AbeClientInformation, TransformInfoInterface, Name, Type),
        (get({This, '$class'})):setDocument(This, (get({This, '$class'})):generate(This, (get({This, '$class'})):toXmlDoc(This))).

% throws Exception
generate(This, ObjectConfigDocument) ->
        NewObjectConfigDocument = 'GenericStoreTransformInfoObjectConfig':generate(This, ObjectConfigDocument),
        NewObjectConfigDocument.

