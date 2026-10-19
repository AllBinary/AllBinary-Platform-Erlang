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
% package org.allbinary.osgi.service
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.osgi.framework.BundleContext
% import org.osgi.framework.ServiceReference
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.osgi.OSGIServiceInterface
% import org.allbinary.osgi.OSGIServiceVisitorInterface
% import org.allbinary.string.CommonStrings

-module('InputAutomationServiceConsumer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, osgiServiceUtil}, 'OSGIServiceUtil':getInstance()),
    put({This, registryName}, undefined),
    put({This, bundleContext}, undefined),
    put({This, osgiServiceVisitorInterface}, undefined),
    ok.


new(RegistryName, BundleContext, OsgiServiceVisitorInterface) when (is_list(RegistryName) orelse RegistryName =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, RegistryName, BundleContext, OsgiServiceVisitorInterface),
    This.

init(This, RegistryName, BundleContext, OsgiServiceVisitorInterface) when (is_list(RegistryName) orelse RegistryName =:= undefined) ->
    init_fields(This),
        (get({This, '$class'})):setRegistryName(This, RegistryName),
        (get({This, '$class'})):setBundleContext(This, BundleContext),
        (get({This, '$class'})):setOsgiServiceVisitorInterface(This, OsgiServiceVisitorInterface).

% throws Exception
process(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'PROCESS'})),
        Vector = (get({get({This, osgiServiceUtil}), '$class'})):getServicesObjectVector(get({This, osgiServiceUtil}), (get({This, '$class'})):getBundleContext(This), (get({This, '$class'})):getServiceReferences(This)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat(["Processing ", (get({Vector, '$class'})):size(Vector)]), " Services"]), This, get({get({This, commonStrings}), 'PROCESS'})),
        Size = (get({Vector, '$class'})):size(Vector),
        put({local, osgiServiceInterface}, undefined),
        lists:foreach(fun(Index) ->
            put({local, osgiServiceInterface}, (get({Vector, '$class'})):get(Vector, Index)),
            case (not (fun(Target_N66587) -> (get({Target_N66587, '$class'})):visit(Target_N66587, get({local, osgiServiceInterface})) end)((get({This, '$class'})):getOsgiServiceVisitorInterface(This))) of
                true ->
                erlang:error({'Exception', lists:concat(["Unable to process service: ", get({local, osgiServiceInterface})])});
                false -> ok
            end
        end, lists:seq(0, Size - 1)).

% throws Exception
getServiceReferences(This) ->
        (fun(Target_N66764) -> (get({Target_N66764, '$class'})):getServiceReferences(Target_N66764, (get({This, '$class'})):getRegistryName(This), undefined) end)((get({This, '$class'})):getBundleContext(This)).

getBundleContext(This) ->
        get({This, bundleContext}).

setBundleContext(This, ABundleContext) ->
        put({This, bundleContext}, ABundleContext).

getRegistryName(This) ->
        get({This, registryName}).

setRegistryName(This, RegistryName) when (is_list(RegistryName) orelse RegistryName =:= undefined) ->
        put({This, registryName}, RegistryName).

getOsgiServiceVisitorInterface(This) ->
        get({This, osgiServiceVisitorInterface}).

setOsgiServiceVisitorInterface(This, OsgiServiceVisitorInterface) ->
        put({This, osgiServiceVisitorInterface}, OsgiServiceVisitorInterface).

