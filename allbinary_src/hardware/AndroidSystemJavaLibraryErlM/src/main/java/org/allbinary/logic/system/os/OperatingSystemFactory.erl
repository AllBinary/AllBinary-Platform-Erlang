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
% package org.allbinary.logic.system.os
% import org.allbinary.logic.system.os.android.AndroidOperatingSystemFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('OperatingSystemFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'OperatingSystemFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, genericOperatingSystem}, get({'NoOperatingSystem', 'NO_OPERATING_SYSTEM'})),
    put({This, hasDetected}, false),
    ok.


getInstance() ->
        get({'OperatingSystemFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getOperatingSystemInstance(This) ->
        CommonStrings = 'CommonStrings':getInstance(),
        try
            SystemProperties = 'SystemProperties':getInstance(),
            OsName = (get({SystemProperties, '$class'})):getName(SystemProperties),
            case (not get({This, hasDetected})) of
                true ->
                put({This, hasDetected}, true),
                case (allbinary_java:index_of(OsName, get({'OperatingSystems':getInstance(), 'ANDROID'})) >= 0) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Found a Android OS", This, get({CommonStrings, 'GET_INSTANCE'})),
                    put({This, genericOperatingSystem}, (fun(Target_N66650) -> (get({Target_N66650, '$class'})):getOperatingSystemInstance(Target_N66650) end)('AndroidOperatingSystemFactory':getInstance())),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66699) -> (get({Target_N66699, '$class'})):toString(Target_N66699) end)((fun(Target_N66706) -> (get({Target_N66706, '$class'})):append(Target_N66706, (get({get({This, genericOperatingSystem}), '$class'})):toString(get({This, genericOperatingSystem}))) end)((fun(Target_N66713) -> (get({Target_N66713, '$class'})):append(Target_N66713, "Operating System Info: ") end)('StringMaker':new()))), This, get({CommonStrings, 'GET_INSTANCE'}));
                    false ->
                    case (allbinary_java:index_of(OsName, get({'OperatingSystems':getInstance(), 'HARMONY'})) >= 0) of
                    true ->
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Found a Harmony OS", This, get({CommonStrings, 'GET_INSTANCE'})),
                    put({This, genericOperatingSystem}, (fun(Target_N66435) -> (get({Target_N66435, '$class'})):getOperatingSystemInstance(Target_N66435) end)('AndroidOperatingSystemFactory':getInstance())),
                    (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66484) -> (get({Target_N66484, '$class'})):toString(Target_N66484) end)((fun(Target_N66491) -> (get({Target_N66491, '$class'})):append(Target_N66491, (get({get({This, genericOperatingSystem}), '$class'})):toString(get({This, genericOperatingSystem}))) end)((fun(Target_N66498) -> (get({Target_N66498, '$class'})):append(Target_N66498, "Operating System Info: ") end)('StringMaker':new()))), This, get({CommonStrings, 'GET_INSTANCE'}));
                    false ->
                    erlang:error({'Exception', (fun(Target_N66304) -> (get({Target_N66304, '$class'})):toString(Target_N66304) end)((fun(Target_N66311) -> (get({Target_N66311, '$class'})):append(Target_N66311, OsName) end)((fun(Target_N66318) -> (get({Target_N66318, '$class'})):append(Target_N66318, "OS Not Supported: ") end)('StringMaker':new())))})
                end
                end;
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            put({This, genericOperatingSystem}, get({'NoOperatingSystem', 'NO_OPERATING_SYSTEM'})),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'GET_INSTANCE'}), E)
        end,
        get({This, genericOperatingSystem}).

