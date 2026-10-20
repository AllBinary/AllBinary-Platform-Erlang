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
% package org.allbinary.input.automation.module
% import java.util.Collection
% import java.util.HashMap
% import java.util.Iterator
% import javax.help.HelpSet
% import javax.help.event.HelpSetEvent
% import javax.help.event.HelpSetListener
% import javax.swing.ListModel
% import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration
% import org.allbinary.input.automation.module.configuration.InputAutomationModuleConfigurations
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.java.help.JavaHelpSetNotifier
% import org.allbinary.string.CommonStrings

-module('InputAutomationModuleFactoryFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, hashMap}, undefined),
    put({This, defaultListModelHelper}, undefined),
    put({This, helpSetListenerInterface}, undefined),
    ok.


new(InputAutomationModuleConfigurations, HelpSetListenerInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, InputAutomationModuleConfigurations, HelpSetListenerInterface),
    This.

'$init'(This, InputAutomationModuleConfigurations, HelpSetListenerInterface) ->
    init_fields(This),
        put({This, helpSetListenerInterface}, HelpSetListenerInterface),
        put({This, defaultListModelHelper}, 'DefaultListModelHelper':new()),
        put({This, hashMap}, (fun(Target_N66164) -> (get({Target_N66164, '$class'})):createHashMap(Target_N66164) end)('StdUtil':getInstance())),
        Collection = (fun(Target_N66208) -> (get({Target_N66208, '$class'})):values(Target_N66208) end)((get({InputAutomationModuleConfigurations, '$class'})):getHashMap(InputAutomationModuleConfigurations)),
        Iterator = (get({Collection, '$class'})):iterator(Collection),
        put({local, inputAutomationModuleConfiguration}, undefined),
        (fun Loop() -> case (get({Iterator, '$class'})):hasNext(Iterator) of true ->
            put({local, inputAutomationModuleConfiguration}, (get({Iterator, '$class'})):next(Iterator)),
            (get({This, '$class'})):add(This, get({local, inputAutomationModuleConfiguration})),
            Loop();
        false -> ok end end)(),
        (get({get({This, defaultListModelHelper}), '$class'})):initDefaultModelList(get({This, defaultListModelHelper})),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat([lists:concat(["Loaded ", (get({get({This, hashMap}), '$class'})):size(get({This, hashMap}))]), "/"]), (fun(Target_N66514) -> (get({Target_N66514, '$class'})):getSize(Target_N66514) end)((get({get({This, defaultListModelHelper}), '$class'})):getListModel(get({This, defaultListModelHelper})))]), " Input Automation Modules"]), This, "Contructor").

add(This, InputAutomationModuleConfiguration) ->
        InputAutomationModuleInterface = (get({InputAutomationModuleConfiguration, '$class'})):getInputAutomationModuleInterface(InputAutomationModuleConfiguration),
        (get({get({This, hashMap}), '$class'})):put(get({This, hashMap}), (get({InputAutomationModuleConfiguration, '$class'})):getName(InputAutomationModuleConfiguration), InputAutomationModuleInterface),
        (get({get({This, defaultListModelHelper}), '$class'})):add(get({This, defaultListModelHelper}), (get({InputAutomationModuleConfiguration, '$class'})):getName(InputAutomationModuleConfiguration)),
        HelpSet = (get({InputAutomationModuleInterface, '$class'})):getHelpSet(InputAutomationModuleInterface),
        case (not 'JavaHelpSetNotifier':isNotified(HelpSet)) of
            true ->
            HelpSetEvent = 'HelpSetEvent':new(This, HelpSet, get({'HelpSetEvent', 'HELPSET_ADDED'})),
            (get({get({This, helpSetListenerInterface}), '$class'})):helpSetAdded(get({This, helpSetListenerInterface}), HelpSetEvent);
            false -> ok
        end.

getListModel(This) ->
        (get({get({This, defaultListModelHelper}), '$class'})):getListModel(get({This, defaultListModelHelper})).

getInstance(This, ModuleName) when (is_list(ModuleName) orelse ModuleName =:= undefined) ->
        CommonStrings = 'CommonStrings':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Getting Module: ", ModuleName]), This, get({CommonStrings, 'GET_INSTANCE'})),
        InputAutomationModuleFactoryInterface = (get({get({This, hashMap}), '$class'})):get(get({This, hashMap}), ModuleName),
        case (InputAutomationModuleFactoryInterface =:= undefined) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat(["Module: ", ModuleName]), " was null"]), This, get({CommonStrings, 'GET_INSTANCE'}));
            false -> ok
        end,
        InputAutomationModuleFactoryInterface.

