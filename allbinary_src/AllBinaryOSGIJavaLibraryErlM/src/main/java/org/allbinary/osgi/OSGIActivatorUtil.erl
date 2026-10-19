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
% package org.allbinary.osgi
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable
% import org.osgi.framework.BundleContext
% import org.osgi.framework.NullServiceReferenceFactory
% import org.osgi.framework.ServiceReference
% import org.osgi.framework.ServiceRegistration

-module('OSGIActivatorUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

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
registerAsService(BundleContext, AnyType, ServiceName) when (is_list(ServiceName) orelse ServiceName =:= undefined) ->
        'OSGIActivatorUtil':registerAsService(BundleContext, AnyType, ServiceName, (fun(Target_N65798) -> (get({Target_N65798, '$class'})):createHashtable(Target_N65798) end)('StdUtil':getInstance())).

% throws Exception
registerAsService(BundleContext, AnyType, ServiceName, Properties) when (is_list(ServiceName) orelse ServiceName =:= undefined) ->
        ServiceRegistration = (get({BundleContext, '$class'})):registerService(BundleContext, ServiceName, AnyType, Properties),
        put({local, serviceReference}, (get({ServiceRegistration, '$class'})):getReference(ServiceRegistration)),
        put({local, serviceReference}, (get({BundleContext, '$class'})):getServiceReference(BundleContext, ServiceName)),
        case (get({local, serviceReference}) =:= get({'NullServiceReferenceFactory':getInstance(), 'NULL_SERVICE_REFERENCE'})) of
            true ->
            erlang:error({'Exception', "No Such Service Reference"});
            false -> ok
        end.

