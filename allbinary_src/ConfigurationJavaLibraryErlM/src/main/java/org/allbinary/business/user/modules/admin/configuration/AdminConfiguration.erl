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
% package org.allbinary.business.user.modules.admin.configuration
% import java.util.HashMap
% import javax.servlet.http.HttpServletRequest
% import org.allbinary.business.context.configuration.ContextConfiguration
% import org.allbinary.business.context.configuration.ContextConfigurationData
% import org.allbinary.business.context.configuration.ContextConfigurationDomDocumentMapping
% import org.allbinary.business.context.configuration.ContextConfigurationInterface
% import org.allbinary.business.context.configuration.ContextConfigurationInterfaceFactory
% import org.allbinary.business.context.configuration.ContextConfigurationPathUtil
% import org.allbinary.logic.communication.http.request.RequestParams
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.control.crypt.file.CryptFileWriter
% import org.allbinary.string.CommonStrings

-module('AdminConfiguration').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdminConfigurationInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, contextConfigurationInterface}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, contextConfigurationInterface}, (fun(Target_N66227) -> (get({Target_N66227, '$class'})):getInstance(Target_N66227, get({'AdminConfigurationData', 'CONTEXTNAME'})) end)('ContextConfigurationInterfaceFactory':getInstance())).

new(Request) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Request),
    This;
new(StoreHashMap) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, StoreHashMap),
    This.

'$init'(This, Request) ->
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):getFormData(This, (fun(Target_N66387) -> (get({Target_N66387, '$class'})):toHashMap(Target_N66387) end)('RequestParams':new(Request)));
'$init'(This, StoreHashMap) ->
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):getFormData(This, StoreHashMap).


% throws Exception
getFormData(This, StoreHashMap) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "getFormData"),
        (get({This, '$class'})):setContextConfigurationInterface(This, 'ContextConfiguration':new(StoreHashMap)).

% throws Exception
write(This) ->
        ContextConfigurationDomDocumentMapping = 'ContextConfigurationDomDocumentMapping':new((get({This, '$class'})):getContextConfigurationInterface(This)),
        CryptFileWriter = 'CryptFileWriter':new(get({'ContextConfigurationData':getInstance(), 'UNCRYPTED_EXTENSION'}), get({'ContextConfigurationData':getInstance(), 'ENCRYPTED_EXTENSION'})),
        (get({CryptFileWriter, '$class'})):write(CryptFileWriter, 'ContextConfigurationPathUtil':getAbPath(get({'AdminConfigurationData', 'CONTEXTNAME'})), (get({ContextConfigurationDomDocumentMapping, '$class'})):toXmlDoc(ContextConfigurationDomDocumentMapping)).

getContextConfigurationInterface(This) ->
        get({This, contextConfigurationInterface}).

setContextConfigurationInterface(This, ContextConfigurationInterface) ->
        put({This, contextConfigurationInterface}, ContextConfigurationInterface).

