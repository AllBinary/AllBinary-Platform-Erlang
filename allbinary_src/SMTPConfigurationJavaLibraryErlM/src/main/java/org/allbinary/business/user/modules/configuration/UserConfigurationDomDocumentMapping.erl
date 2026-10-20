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
% package org.allbinary.business.user.modules.configuration
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.data.tree.dom.document.XmlDocumentHelper
% import org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('UserConfigurationDomDocumentMapping').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements DomDocumentMappingInterface

init_fields(This) ->
    put({This, userConfigurationInterface}, undefined),
    ok.


new(UserConfigurationInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, UserConfigurationInterface),
    This.

'$init'(This, UserConfigurationInterface) ->
    init_fields(This),
        put({This, userConfigurationInterface}, UserConfigurationInterface).

% throws Exception
toXmlDoc(This) ->
        Document = 'DomDocumentHelper':create(),
        Node = (fun(Target_N65941) -> (get({Target_N65941, '$class'})):toXmlNode(Target_N65941, Document) end)('UserConfigurationView':new(get({This, userConfigurationInterface}))),
        (get({Document, '$class'})):appendChild(Document, Node),
        Document.

% throws Exception
toDomDocumentString(This) ->
        'XmlDocumentHelper':toString((get({This, '$class'})):toXmlDoc(This)).

