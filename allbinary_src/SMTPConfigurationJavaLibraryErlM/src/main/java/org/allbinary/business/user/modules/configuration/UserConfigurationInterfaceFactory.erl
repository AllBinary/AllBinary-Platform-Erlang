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
% import org.allbinary.business.user.role.UserRole
% import org.allbinary.data.tree.dom.DomSearchHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS
% import org.allbinary.globals.URLGLOBALS
% import org.allbinary.logic.control.crypt.file.CryptFileReader
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.io.path.AbPathData
% import org.w3c.dom.Document
% import org.w3c.dom.Node

-module('UserConfigurationInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, configurationName}, "DefaultUserConfiguration"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getInstance(Document) ->
        ConfigurationNode = 'DomSearchHelper':getNode(get({'UserConfigurationData', 'NAME'}), (get({Document, '$class'})):getChildNodes(Document)),
        (fun(Target_N66069) -> (get({Target_N66069, '$class'})):getUserConfigurationInterface(Target_N66069) end)('UserConfigurationView':new(ConfigurationNode));
% throws Exception
getInstance(UserRole) ->
        AbPath = 'AbPath':new(((get({get({'UserConfigurationInterfaceFactory', 'URLGLOBALS'}), '$class'})):getMainPath(get({'UserConfigurationInterfaceFactory', 'URLGLOBALS'})) + get({(get({get({'UserConfigurationInterfaceFactory', 'FREEBLISKET_PATH_GLOBALS'}), '$class'})):getInstance(get({'UserConfigurationInterfaceFactory', 'FREEBLISKET_PATH_GLOBALS'})), 'USERCONFIGURATIONPATH'})), lists:concat([lists:concat([lists:concat([get({'UserConfigurationInterfaceFactory', configurationName}), (get({UserRole, '$class'})):toString(UserRole)]), get({'AbPathData':getInstance(), 'EXTENSION_SEP'})]), get({'UserConfigurationData', 'UNCRYPTED_EXTENSION'})])),
        DocumentString = (fun(Target_N66364) -> (get({Target_N66364, '$class'})):get(Target_N66364, AbPath) end)('CryptFileReader':new(get({'UserConfigurationData', 'UNCRYPTED_EXTENSION'}), get({'UserConfigurationData', 'ENCRYPTED_EXTENSION'}))),
        Document = 'DomDocumentHelper':create(DocumentString),
        'UserConfigurationInterfaceFactory':getInstance(Document).


% throws Exception
getInstance() ->
        'UserConfiguration':new().

