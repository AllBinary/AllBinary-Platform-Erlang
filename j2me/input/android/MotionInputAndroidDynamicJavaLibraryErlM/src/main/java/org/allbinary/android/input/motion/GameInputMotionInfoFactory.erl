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
% import org.allbinary.android.AndroidInfoFactory
% import org.allbinary.android.input.motion.api1.GameInputMotionInfoAPI1
% import org.allbinary.android.input.motion.api5.GameInputMotionInfoAPI5

-module('GameInputMotionInfoFactory').
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
        SDK_VERSION = (fun(Target_N65712) -> (get({Target_N65712, '$class'})):getVersion(Target_N65712) end)('AndroidInfoFactory':getInstance()),
        case (SDK_VERSION =< 4) of
            true ->
            throw({'$return', 'GameInputMotionInfoAPI1':getInstance()});
            false ->
            throw({'$return', 'GameInputMotionInfoAPI5':getInstance()})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

