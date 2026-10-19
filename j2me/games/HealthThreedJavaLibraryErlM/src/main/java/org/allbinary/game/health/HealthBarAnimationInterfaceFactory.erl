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
% package org.allbinary.game.health
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.ScaleProperties

-module('HealthBarAnimationInterfaceFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface
% implements ProceduralAnimationInterfaceFactoryInterface

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
getInstanceByLocation(This, LayerInterface, Location) when is_integer(Location) ->
        'HealthBarThreedAnimation':new(LayerInterface, Location).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        undefined.

% throws Exception
getInstanceAnimation(This, AnimationInterface) ->
        undefined.

setInitialScale(This, ScaleProperties) ->
        ok.

