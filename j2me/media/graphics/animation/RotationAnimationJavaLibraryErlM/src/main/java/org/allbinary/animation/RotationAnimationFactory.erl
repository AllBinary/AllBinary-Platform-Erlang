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
% package org.allbinary.animation
% import org.allbinary.game.configuration.GameConfigurationCentral
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.media.ScaleProperties

-module('RotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AnimationInterfaceFactoryInterface
% implements ProceduralAnimationInterfaceFactoryInterface

init_fields(This) ->
    put({This, totalAngle}, 0),
    put({This, angleIncrement}, 0),
    ok.


createFactory() ->
        TotalAngle = get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}),
        'RotationAnimationFactory':new(TotalAngle, trunc(((TotalAngle / (fun(Target_N65806) -> (get({Target_N65806, '$class'})):getGameControlFidelity(Target_N65806) end)('GameConfigurationCentral':getInstance()))))).

new(TotalAngle, AngleIncrement) when is_integer(TotalAngle), is_integer(AngleIncrement) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TotalAngle, AngleIncrement),
    This.

init(This, TotalAngle, AngleIncrement) when is_integer(TotalAngle), is_integer(AngleIncrement) ->
    init_fields(This),
        put({This, totalAngle}, TotalAngle),
        put({This, angleIncrement}, AngleIncrement).

% throws Exception
getInstance(This, InstanceId) when is_integer(InstanceId) ->
        'NullRotationAnimation':createTotalAngle('AngleInfo':getInstance(get({This, angleIncrement})), get({This, totalAngle}), 'AnimationBehavior':getInstance()).

% throws Exception
getInstanceAnimation(This, AnimationInterface) ->
        'NullRotationAnimation':createTotalAngle('AngleInfo':getInstance(get({This, angleIncrement})), get({This, totalAngle}), 'AnimationBehavior':getInstance()).

setInitialScale(This, ScaleProperties) ->
        ok.

