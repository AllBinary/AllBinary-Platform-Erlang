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
% import org.allbinary.logic.StdUtil
% import org.osgi.framework.BundleContext
% import org.osgi.framework.ServiceReference
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.osgi.OSGIServiceInterface

-module('OSGIServiceUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OSGIServiceUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.


getInstance() ->
        get({'OSGIServiceUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
getServicesObjectVector(This, BundleContext, ServiceReferences) when (is_tuple(ServiceReferences) orelse ServiceReferences =:= undefined) ->
        Vector = 'BasicArrayListD':new(),
        case (ServiceReferences =/= undefined) of
            true ->
            Size = array:size(ServiceReferences),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat(["Service References: ", Size]), This, "getServicesObjectVector"),
            lists:foreach(fun(Index) ->
                ServiceReference = array:get(Index, ServiceReferences),
                case (ServiceReference =/= undefined) of
                    true ->
                    OsgiServiceInterface = (get({BundleContext, '$class'})):getService(BundleContext, ServiceReference),
                    case (OsgiServiceInterface =:= undefined) of
                        true ->
                        erlang:error({'Exception', "No Service For Reference"});
                        false -> ok
                    end,
                    (get({Vector, '$class'})):add(Vector, OsgiServiceInterface);
                    false -> ok
                end
            end, lists:seq(0, Size - 1));
            false -> ok
        end,
        Vector.

