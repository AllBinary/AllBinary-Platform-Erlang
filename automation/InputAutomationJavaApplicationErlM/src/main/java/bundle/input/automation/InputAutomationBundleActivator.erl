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
% package bundle.input.automation
% import org.osgi.framework.BundleActivator
% import org.osgi.framework.BundleContext
% import bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener
% import bundle.input.automation.robot.InputAutomationRobotChangeListener
% import org.allbinary.input.automation.InputAutomationJFrame
% import org.allbinary.input.automation.module.osgi.InputAutomationModuleServiceConsumer
% import org.allbinary.input.automation.module.osgi.InputAutomationNewBundleRunnable
% import org.allbinary.input.automation.osgi.InputAutomationServiceFactory
% import org.allbinary.input.automation.robot.osgi.InputAutomationRobotServiceConsumer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.osgi.OSGIActivatorUtil
% import org.allbinary.string.CommonStrings

-module('InputAutomationBundleActivator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements BundleActivator
% implements InputAutomationBundleActivatorListenerInterface

static_init() ->
    put({?MODULE, moduleManagementThread}, undefined),
    put({?MODULE, bundleContext}, undefined),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getBundleContext() ->
        get({'InputAutomationBundleActivator', bundleContext}).

% throws Exception
start(This, BundleContext) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'START'})),
            put({?MODULE, bundleContext}, BundleContext),
            put({'InputAutomationBundleActivator', moduleManagementThread}, 'Thread':new('InputAutomationNewBundleRunnable':new(This))),
            (get({get({'InputAutomationBundleActivator', moduleManagementThread}), '$class'})):start(get({'InputAutomationBundleActivator', moduleManagementThread})),
            'InputAutomationJFrame':create(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'START'}), E),
            erlang:error(E)
        end.

% throws Exception
registerAsService(This) ->
        'OSGIActivatorUtil':registerAsService((get({This, '$class'})):getBundleContext(This), 'InputAutomationServiceFactory':getInstance(), (get({'InputAutomationConfigurationModuleChangeListener', '$class'})):getName('InputAutomationConfigurationModuleChangeListener')),
        'OSGIActivatorUtil':registerAsService((get({This, '$class'})):getBundleContext(This), 'InputAutomationServiceFactory':getInstance(), (get({'InputAutomationRobotChangeListener', '$class'})):getName('InputAutomationRobotChangeListener')).

% throws Exception
useServices(This) ->
        (fun(Target_N66798) -> (get({Target_N66798, '$class'})):process(Target_N66798) end)('InputAutomationRobotServiceConsumer':new((get({This, '$class'})):getBundleContext(This))),
        (fun(Target_N66836) -> (get({Target_N66836, '$class'})):process(Target_N66836) end)('InputAutomationModuleServiceConsumer':new((get({This, '$class'})):getBundleContext(This))).

% throws Exception
stop(This, Context) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "stop"),
        case ('InputAutomationJFrame':getInstance() =/= undefined) of
            true ->
            'InputAutomationJFrame':destroy();
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Nothing to stop", This, "stop")
        end.

