% 
% AllBinary Open License Version 1 
% Copyright (c) 2019 AllBinary 
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
% package org.allbinary.android
% import java.util.List
% import android.app.ActivityManager
% import android.app.ActivityManager.RunningServiceInfo
% import android.content.ComponentName
% import android.content.Context
% import org.allbinary.data.resource.ResourceUtil
% import org.allbinary.logic.communication.log.LogUtil

-module('AndroidServicesUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AndroidServicesUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, resourceUtil}, 'ResourceUtil':getInstance()),
    put({This, 'SERVICE_LIMIT_MAX'}, 1000),
    put({This, 'IS_SERVICE_RUNNING'}, "isServiceRunning"),
    put({This, 'SERVICE_NOT_FOUND_RUNNING'}, "Service not found Running: "),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'AndroidServicesUtil', instance}).

isServiceRunning(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        try
        ActivityManager = (fun(Target_N66107) -> (get({Target_N66107, '$class'})):getSystemService(Target_N66107, get({'Context', 'ACTIVITY_SERVICE'})) end)((get({get({This, resourceUtil}), '$class'})):getContext(get({This, resourceUtil}))),
        RunningServicesList = (get({ActivityManager, '$class'})):getRunningServices(ActivityManager, get({This, 'SERVICE_LIMIT_MAX'})),
        put({local, runningServiceInfo}, undefined),
        put({local, serviceComponent}, undefined),
        put({local, serviceName}, undefined),
        Size = (get({RunningServicesList, '$class'})):size(RunningServicesList),
        lists:foreach(fun(Index) ->
            put({local, runningServiceInfo}, (get({RunningServicesList, '$class'})):get(RunningServicesList, Index)),
            put({local, serviceComponent}, get({get({local, runningServiceInfo}), service})),
            put({local, serviceName}, (get({get({local, serviceComponent}), '$class'})):toString(get({local, serviceComponent}))),
            case (allbinary_java:index_of(get({local, serviceName}), Name) >= 0) of
                true ->
                throw({'$return', true});
                false -> ok
            end
        end, lists:seq(0, Size - 1)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([get({This, 'SERVICE_NOT_FOUND_RUNNING'}), Name]), This, get({This, 'IS_SERVICE_RUNNING'})),
        false
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

