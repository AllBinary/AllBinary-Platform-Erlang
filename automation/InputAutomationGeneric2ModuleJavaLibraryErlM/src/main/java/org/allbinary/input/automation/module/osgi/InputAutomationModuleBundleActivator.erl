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
% package org.allbinary.input.automation.module.osgi
% import org.osgi.framework.BundleActivator
% import org.osgi.framework.BundleContext
% import org.osgi.framework.ServiceFactory
% import org.osgi.framework.ServiceReference
% import bundle.input.automation.module.InputAutomationModuleServiceInterface
% import bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener
% import org.allbinary.input.automation.configuration.InputAutomationConfigurationModuleChangeEvent
% import org.allbinary.input.automation.configuration.InputAutomationConfigurationUtil
% import org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.osgi.OSGIActivatorUtil
% import org.allbinary.string.CommonStrings

-module('InputAutomationModuleBundleActivator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BundleActivator

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, inputAutomationModuleInterface}, undefined),
    put({This, serviceFactory}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        (get({This, '$class'})):init(This).

% throws Exception
init(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
getInputAutomationConfigurationModuleChangeListener(This, Context) ->
        try
        ServiceReference = (get({Context, '$class'})):getServiceReference(Context, (get({'InputAutomationConfigurationModuleChangeListener', '$class'})):getName('InputAutomationConfigurationModuleChangeListener')),
        case (ServiceReference =/= undefined) of
            true ->
            InputAutomationConfigurationModuleChangeListener = (get({Context, '$class'})):getService(Context, ServiceReference),
            case (InputAutomationConfigurationModuleChangeListener =:= undefined) of
                true ->
                erlang:error({'Exception', "No Service For ServiceReference"});
                false -> ok
            end,
            throw({'$return', InputAutomationConfigurationModuleChangeListener});
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["No ServiceReference: ", (get({'InputAutomationConfigurationModuleChangeListener', '$class'})):getName('InputAutomationConfigurationModuleChangeListener')]), This, "addModules"),
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

addModules(This, Context) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "addModules"),
            InputAutomationConfigurationModuleChangeListener = (get({This, '$class'})):getInputAutomationConfigurationModuleChangeListener(This, Context),
            case (InputAutomationConfigurationModuleChangeListener =/= undefined) of
                true ->
                lists:foreach(fun(Index) ->
                    InputAutomationConfigurationModuleChangeEvent = 'InputAutomationConfigurationUtil':getChangeEvent(array:get(Index, (get({This, '$class'})):getInputAutomationModuleInterface(This))),
                    (get({InputAutomationConfigurationModuleChangeListener, '$class'})):onAdd(InputAutomationConfigurationModuleChangeListener, InputAutomationConfigurationModuleChangeEvent)
                end, lists:seq(0, array:size((get({This, '$class'})):getInputAutomationModuleInterface(This)) - 1));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "addModules")
        end.

% throws Exception
registerAsService(This, BundleContext) ->
        'OSGIActivatorUtil':registerAsService(BundleContext, (get({This, '$class'})):getServiceFactory(This), (get({'InputAutomationModuleServiceInterface', '$class'})):getName('InputAutomationModuleServiceInterface')).

removeModules(This, Context) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "removeModules"),
            InputAutomationConfigurationModuleChangeListener = (get({This, '$class'})):getInputAutomationConfigurationModuleChangeListener(This, Context),
            case (InputAutomationConfigurationModuleChangeListener =/= undefined) of
                true ->
                lists:foreach(fun(Index) ->
                    InputAutomationConfigurationModuleChangeEvent = 'InputAutomationConfigurationUtil':getChangeEvent(array:get(Index, (get({This, '$class'})):getInputAutomationModuleInterface(This))),
                    (get({InputAutomationConfigurationModuleChangeListener, '$class'})):onRemove(InputAutomationConfigurationModuleChangeListener, InputAutomationConfigurationModuleChangeEvent)
                end, lists:seq(0, array:size((get({This, '$class'})):getInputAutomationModuleInterface(This)) - 1));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "removeModules")
        end.

% throws Exception
start(This, Context) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'START'})),
        (get({This, '$class'})):addModules(This, Context),
        (get({This, '$class'})):registerAsService(This, Context).

% throws Exception
stop(This, Context) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "stop"),
        (get({This, '$class'})):removeModules(This, Context).

getInputAutomationModuleInterface(This) ->
        get({This, inputAutomationModuleInterface}).

setInputAutomationModuleInterface(This, InputAutomationModuleInterface) when (is_tuple(InputAutomationModuleInterface) orelse InputAutomationModuleInterface =:= undefined) ->
        put({This, inputAutomationModuleInterface}, InputAutomationModuleInterface).

getServiceFactory(This) ->
        get({This, serviceFactory}).

setServiceFactory(This, ServiceObject) ->
        put({This, serviceFactory}, ServiceObject).

