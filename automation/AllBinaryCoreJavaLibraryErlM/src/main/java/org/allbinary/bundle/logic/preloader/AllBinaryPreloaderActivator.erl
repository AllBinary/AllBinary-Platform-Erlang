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
% package org.allbinary.bundle.logic.preloader
% import org.osgi.framework.BundleActivator
% import org.osgi.framework.BundleContext
% import org.osgi.framework.ServiceReference
% import org.osgi.framework.ServiceRegistration
% import org.allbinary.bundle.logic.system.loader.CryptServiceFactory
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable

-module('AllBinaryPreloaderActivator').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements BundleActivator

static_init() ->
    put({?MODULE, context}, undefined),
    put({?MODULE, 'CRYPT_REGISTRY_NAME'}, "bundle.abcs.logic.system.loader.CryptService"),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getBundleContext() ->
        get({'AllBinaryPreloaderActivator', context}).

% throws Exception
start(This, Context) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "start"),
            put({'AllBinaryPreloaderActivator', context}, Context),
            (get({This, '$class'})):registerAsService(This)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "start", E),
            erlang:error(E)
        end.

% throws Exception
registerAsService(This) ->
        Properties = (fun(Target_N66393) -> (get({Target_N66393, '$class'})):createHashtable(Target_N66393) end)('StdUtil':getInstance()),
        ServiceRegistration = (get({get({'AllBinaryPreloaderActivator', context}), '$class'})):registerService(get({'AllBinaryPreloaderActivator', context}), get({'AllBinaryPreloaderActivator', 'CRYPT_REGISTRY_NAME'}), 'CryptServiceFactory':new(), Properties),
        put({local, serviceReference}, (get({ServiceRegistration, '$class'})):getReference(ServiceRegistration)),
        put({local, serviceReference}, (get({get({'AllBinaryPreloaderActivator', context}), '$class'})):getServiceReference(get({'AllBinaryPreloaderActivator', context}), get({'AllBinaryPreloaderActivator', 'CRYPT_REGISTRY_NAME'}))),
        case (get({local, serviceReference}) =:= undefined) of
            true ->
            erlang:error({'Exception', "No Such Service Reference"});
            false -> ok
        end.

% throws Exception
stop(This, Context) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "stop").

