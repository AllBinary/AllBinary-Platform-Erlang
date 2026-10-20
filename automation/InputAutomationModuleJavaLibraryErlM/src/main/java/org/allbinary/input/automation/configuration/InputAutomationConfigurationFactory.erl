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
% import java.io.FileInputStream
% import java.util.List
% import javax.xml.bind.JAXBContext
% import javax.xml.bind.JAXBElement
% import javax.xml.bind.Unmarshaller
% import javax.xml.transform.stream.StreamSource
% import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonStrings

-module('InputAutomationConfigurationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InputAutomationConfigurationFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, inputAutomationConfiguration}, undefined),
    ok.


getInstance() ->
        get({'InputAutomationConfigurationFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
init(This, AbeClientInformation) ->
        LogUtil = 'LogUtil':getInstance(),
        CommonStrings = 'CommonStrings':getInstance(),
        INPUT_AUTOMATION_CONFIGURATION = "InputAutomationConfiguration",
        File = 'InputAutomationConfiguration':getFile(),
        case (get({File, '$class'})):isFile(File) of
            true ->
            (get({LogUtil, '$class'})):putF(LogUtil, "LoadingConfiguration", INPUT_AUTOMATION_CONFIGURATION, get({CommonStrings, 'INIT'})),
            JaxbContext = 'JAXBContext':newInstance('InputAutomationConfiguration'),
            Unmarshaller = (get({JaxbContext, '$class'})):createUnmarshaller(JaxbContext),
            Root = (get({Unmarshaller, '$class'})):unmarshal(Unmarshaller, 'StreamSource':new('FileInputStream':new(File)), 'InputAutomationConfiguration'),
            put({This, inputAutomationConfiguration}, (get({Root, '$class'})):getValue(Root)),
            InputAutomationModuleConfigurationList = (get({get({This, inputAutomationConfiguration}), '$class'})):getInputAutomationModuleConfigurationList(get({This, inputAutomationConfiguration})),
            (get({LogUtil, '$class'})):putF(LogUtil, lists:concat([lists:concat([lists:concat(["isInstalled: ", (get({get({This, inputAutomationConfiguration}), '$class'})):isInstalled(get({This, inputAutomationConfiguration}))]), " inputAutomationModuleConfigurationList: "]), InputAutomationModuleConfigurationList]), INPUT_AUTOMATION_CONFIGURATION, get({CommonStrings, 'INIT'})),
            case (InputAutomationModuleConfigurationList =/= undefined) of
                true ->
                Size = (get({InputAutomationModuleConfigurationList, '$class'})):size(InputAutomationModuleConfigurationList),
                put({local, inputAutomationModuleConfiguration}, undefined),
                lists:foreach(fun(Index) ->
                    put({local, inputAutomationModuleConfiguration}, (get({InputAutomationModuleConfigurationList, '$class'})):get(InputAutomationModuleConfigurationList, Index)),
                    (get({get({local, inputAutomationModuleConfiguration}), '$class'})):init(get({local, inputAutomationModuleConfiguration}), AbeClientInformation)
                end, lists:seq(0, Size - 1));
                false -> ok
            end,
            (get({LogUtil, '$class'})):putF(LogUtil, "LoadedConfiguration", INPUT_AUTOMATION_CONFIGURATION, get({CommonStrings, 'INIT'}));
            false ->
            (get({LogUtil, '$class'})):putF(LogUtil, "New Configuration", INPUT_AUTOMATION_CONFIGURATION, get({CommonStrings, 'INIT'})),
            put({This, inputAutomationConfiguration}, 'InputAutomationConfiguration':new())
        end.

