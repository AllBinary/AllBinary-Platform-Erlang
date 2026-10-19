% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.game.layer
% import org.allbinary.animation.transition.shake.NoShakeAnimationListener
% import org.allbinary.animation.transition.shake.ShakeAnimationListener
% import org.allbinary.animation.transition.shake.ShakeAnimationListenerFactory
% import org.allbinary.game.configuration.GameConfigurationCentral
% import org.allbinary.game.tick.TickableInterface
% import org.allbinary.media.AllBinaryNoVibration
% import org.allbinary.media.AllBinaryVibration
% import org.allbinary.media.AllBinaryVibrationME

-module('AdvancedRTSProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, shakeListener}, undefined),
    put({This, vibration}, undefined),
    put({This, duration}, 0),
    put({This, waypointBehaviorBase}, undefined),
    ok.


createPropertiesSimulated() ->
        'AdvancedRTSProperties':new(get({'NoShakeAnimationListener', 'NO_SHAKE_ANIMATION_LISTENER'}), get({'AllBinaryNoVibration', 'NO_VIBRATION'}), 0, 'WaypointBehaviorBase':new()).

createProperties() ->
        'AdvancedRTSProperties':new('ShakeAnimationListenerFactory':getInstance(), 'AllBinaryVibration':getInstance(), ((fun(Target_N65988) -> (get({Target_N65988, '$class'})):intValue(Target_N65988) end)((fun(Target_N65995) -> (get({Target_N65995, '$class'})):getValue(Target_N65995) end)(get({'GameConfigurationCentral':getInstance(), 'VIBRATION'}))) * 100), 'WaypointBehaviorBase':new()).

new(ShakeListener, Vibration, Duration, WaypointBehaviorBase) when is_integer(Duration) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, ShakeListener, Vibration, Duration, WaypointBehaviorBase),
    This.

init(This, ShakeListener, Vibration, Duration, WaypointBehaviorBase) when is_integer(Duration) ->
    init_fields(This),
        put({This, shakeListener}, ShakeListener),
        put({This, vibration}, Vibration),
        put({This, duration}, Duration),
        put({This, waypointBehaviorBase}, WaypointBehaviorBase).

