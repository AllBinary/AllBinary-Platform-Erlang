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
% package org.allbinary.business.context.configuration
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.logic.control.crypt.file.CryptFileReader
% import org.allbinary.logic.io.path.AbPath
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('ContextConfigurationInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ContextConfigurationInterfaceFactory':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ContextConfigurationInterfaceFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(This, ContextName) when (is_list(ContextName) orelse ContextName =:= undefined) ->
        AbPath = 'ContextConfigurationPathUtil':getAbPath(ContextName),
        ContextConfigurationData = 'ContextConfigurationData':getInstance(),
        DocumentString = (fun(Target_N66305) -> (get({Target_N66305, '$class'})):get(Target_N66305, AbPath) end)('CryptFileReader':new(get({ContextConfigurationData, 'UNCRYPTED_EXTENSION'}), get({ContextConfigurationData, 'ENCRYPTED_EXTENSION'}))),
        Document = 'DomDocumentHelper':create(DocumentString),
        (get({This, '$class'})):getInstance(This, Document);
% throws Exception
getInstance(This, Document) ->
        ContextConfigurationData = 'ContextConfigurationData':getInstance(),
        ContextConfigurationNode = 'DomSearchHelper':getNode(get({ContextConfigurationData, 'NAME'}), (get({Document, '$class'})):getChildNodes(Document)),
        (fun(Target_N66063) -> (get({Target_N66063, '$class'})):getContextConfigurationInterface(Target_N66063) end)('ContextConfigurationView':new(ContextConfigurationNode)).


