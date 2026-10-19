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
% import org.allbinary.graphics.opengles.OpenGLFeatureUtil
% import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
% import org.allbinary.layer.AllBinaryLayer

-module('HealthBarFactory').
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


% throws Exception
getInstance(This, LayerInterface, HealthInterface, Location, Direction) when is_integer(Location), is_integer(Direction) ->
        try
        case (fun(Target_N65674) -> (get({Target_N65674, '$class'})):isAnyThreed(Target_N65674) end)('OpenGLFeatureUtil':getInstance()) of
            true ->
            FeaturedAnimationInterfaceFactoryInterfaceFactory = 'FeaturedAnimationInterfaceFactoryInterfaceFactory':getInstance(),
            HealthBarAnimationInterfaceFactory = (get({FeaturedAnimationInterfaceFactoryInterfaceFactory, '$class'})):get(FeaturedAnimationInterfaceFactoryInterfaceFactory, get({'Health', 'NAME'})),
            throw({'$return', 'HealthBar':new(LayerInterface, HealthInterface, (get({HealthBarAnimationInterfaceFactory, '$class'})):getInstanceByLocation(HealthBarAnimationInterfaceFactory, LayerInterface, Location), Direction)});
            false ->
            throw({'$return', 'HealthBar':new(LayerInterface, HealthInterface, 'HealthBarTwodAnimation':new(LayerInterface, Location), Direction)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

