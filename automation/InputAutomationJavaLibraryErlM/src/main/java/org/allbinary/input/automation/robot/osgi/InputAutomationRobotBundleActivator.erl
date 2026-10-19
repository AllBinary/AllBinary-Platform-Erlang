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
% package org.allbinary.input.automation.robot.osgi
% import org.osgi.framework.BundleActivator
% import org.osgi.framework.BundleContext
% import org.osgi.framework.ServiceFactory
% import org.osgi.framework.ServiceReference
% import bundle.input.automation.robot.InputAutomationRobotChangeListener
% import bundle.input.automation.robot.InputAutomationRobotServiceInterface
% import org.allbinary.input.automation.robot.InputRobotInterface
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.osgi.OSGIActivatorUtil
% import org.allbinary.string.CommonStrings

-module('InputAutomationRobotBundleActivator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BundleActivator

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, inputRobotInterface}, undefined),
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
registerAsService(This, BundleContext) ->
        'OSGIActivatorUtil':registerAsService(BundleContext, (get({This, '$class'})):getServiceFactory(This), (get({'InputAutomationRobotServiceInterface', '$class'})):getName('InputAutomationRobotServiceInterface')).

% throws Exception
getInputAutomationRobotChangeListener(This, Context) ->
        try
        ServiceReference = (get({Context, '$class'})):getServiceReference(Context, (get({'InputAutomationRobotChangeListener', '$class'})):getName('InputAutomationRobotChangeListener')),
        case (ServiceReference =/= undefined) of
            true ->
            InputAutomationRobotChangeListener = (get({Context, '$class'})):getService(Context, ServiceReference),
            case (InputAutomationRobotChangeListener =:= undefined) of
                true ->
                erlang:error({'Exception', "No Service For ServiceReference"});
                false -> ok
            end,
            throw({'$return', InputAutomationRobotChangeListener});
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["No ServiceReference: ", (get({'InputAutomationRobotChangeListener', '$class'})):getName('InputAutomationRobotChangeListener')]), This, "getInputAutomationRobotChangeListener"),
            throw({'$return', undefined})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

addRobots(This, Context) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "addRobots"),
            InputAutomationRobotChangeListener = (get({This, '$class'})):getInputAutomationRobotChangeListener(This, Context),
            case (InputAutomationRobotChangeListener =/= undefined) of
                true ->
                lists:foreach(fun(Index) ->
                    InputAutomationRobotChangeEvent = 'InputAutomationRobotUtil':getChangeEvent(array:get(Index, (get({This, '$class'})):getInputRobotInterface(This))),
                    (get({InputAutomationRobotChangeListener, '$class'})):onAdd(InputAutomationRobotChangeListener, InputAutomationRobotChangeEvent)
                end, lists:seq(0, array:size((get({This, '$class'})):getInputRobotInterface(This)) - 1));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "addModules")
        end.

removeRobots(This, Context) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "removeRobots"),
            InputAutomationRobotChangeListener = (get({This, '$class'})):getInputAutomationRobotChangeListener(This, Context),
            case (InputAutomationRobotChangeListener =/= undefined) of
                true ->
                lists:foreach(fun(Index) ->
                    InputAutomationRobotChangeEvent = 'InputAutomationRobotUtil':getChangeEvent(array:get(Index, (get({This, '$class'})):getInputRobotInterface(This))),
                    (get({InputAutomationRobotChangeListener, '$class'})):onRemove(InputAutomationRobotChangeListener, InputAutomationRobotChangeEvent)
                end, lists:seq(0, array:size((get({This, '$class'})):getInputRobotInterface(This)) - 1));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "removeRobots")
        end.

% throws Exception
start(This, Context) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'START'})),
        (get({This, '$class'})):addRobots(This, Context),
        (get({This, '$class'})):registerAsService(This, Context).

% throws Exception
stop(This, Context) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Stop", This, get({get({This, commonStrings}), 'START'})),
        (get({This, '$class'})):removeRobots(This, Context).

getServiceFactory(This) ->
        get({This, serviceFactory}).

setServiceFactory(This, ServiceObject) ->
        put({This, serviceFactory}, ServiceObject).

getInputRobotInterface(This) ->
        get({This, inputRobotInterface}).

setInputRobotInterface(This, InputRobotInterface) when (is_tuple(InputRobotInterface) orelse InputRobotInterface =:= undefined) ->
        put({This, inputRobotInterface}, InputRobotInterface).

