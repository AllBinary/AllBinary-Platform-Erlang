%
% AllBinary Open License Version 1
% Copyright (c) 2009 AllBinary
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
% package org.allbinary.android.input.motion
% import org.allbinary.android.ActivityFractureUtil
% import org.allbinary.android.AndroidInfoFactory
% import org.allbinary.android.api1.ActivityFractureUtilAPI1
% import org.allbinary.android.api16.ActivityFractureUtilAPI16
% import org.allbinary.android.api19.ActivityFractureUtilAPI19
% import org.allbinary.android.api5.ActivityFractureUtilAPI5

-module('ActivityFractureInputUtilFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        try
        SDK_VERSION = (fun(Target_N65784) -> (get({Target_N65784, '$class'})):getVersion(Target_N65784) end)('AndroidInfoFactory':getInstance()),
        case (SDK_VERSION =< 4) of
            true ->
            throw({'$return', 'ActivityFractureUtilAPI1':getInstance()});
            false ->
            case (SDK_VERSION =< 15) of
            true ->
            throw({'$return', 'ActivityFractureUtilAPI5':getInstance()});
            false ->
            case (SDK_VERSION =< 16) of
            true ->
            throw({'$return', 'ActivityFractureUtilAPI16':getInstance()});
            false ->
            throw({'$return', 'ActivityFractureUtilAPI19':getInstance()})
        end
        end
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

