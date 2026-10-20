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
% package org.allbinary.input.automation.configuration
% import java.io.File
% import java.util.List
% import javax.xml.bind.JAXBContext
% import javax.xml.bind.Marshaller
% import javax.xml.bind.annotation.XmlAccessType
% import javax.xml.bind.annotation.XmlAccessorType
% import javax.xml.bind.annotation.XmlElement
% import javax.xml.bind.annotation.XmlRootElement
% import javax.xml.bind.annotation.XmlType
% import org.allbinary.data.tree.dom.document.DomDocumentFileHelper
% import org.allbinary.data.tree.dom.document.DomDocumentHelper
% import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.io.file.FileUtil
% import org.allbinary.logic.io.file.FileWrapperUtil
% import org.allbinary.logic.io.path.AbPath
% import org.allbinary.logic.string.StringUtil
% import org.w3c.dom.Document

-module('InputAutomationConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'FILENAME'}, "InputAutomationConfig.xml"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, installed}, false),
    put({This, inputAutomationModuleConfigurationList}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getFile() ->
        'File':new(get({'InputAutomationConfiguration', 'FILENAME'})).

isInstalled(This) ->
        get({This, installed}).

setInstalled(This, Installed) when is_boolean(Installed) ->
        put({This, installed}, Installed),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Installed: ", Installed]), This, "setIntalled").

getInputAutomationModuleConfigurationList(This) ->
        get({This, inputAutomationModuleConfigurationList}).

% throws Exception
save(This) ->
        Document = 'DomDocumentHelper':create(),
        File = 'File':new(get({'InputAutomationConfiguration', 'FILENAME'})),
        (fun(Target_N66779) -> (get({Target_N66779, '$class'})):copy(Target_N66779, 'AbPath':new((get({File, '$class'})):getAbsolutePath(File), get({'StringUtil':getInstance(), 'EMPTY_STRING'})), 'AbPath':new(lists:concat([(get({File, '$class'})):getAbsolutePath(File), ".bak.xml"]), get({'StringUtil':getInstance(), 'EMPTY_STRING'}))) end)('FileUtil':getInstance()),
        JaxbContext = 'JAXBContext':newInstance('InputAutomationConfiguration'),
        Marshaller = (get({JaxbContext, '$class'})):createMarshaller(JaxbContext),
        (get({Marshaller, '$class'})):setProperty(Marshaller, get({'Marshaller', 'JAXB_FORMATTED_OUTPUT'}), true),
        (get({Marshaller, '$class'})):marshal(Marshaller, This, Document),
        'DomDocumentFileHelper':save('FileWrapperUtil':wrapFile(File), Document).

