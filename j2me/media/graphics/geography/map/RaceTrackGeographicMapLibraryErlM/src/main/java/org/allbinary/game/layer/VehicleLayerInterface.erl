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
% package org.allbinary.game.layer
% import org.allbinary.util.BasicArrayList
% import org.allbinary.animation.RotationAnimation
% import org.allbinary.layer.LayerInterface
% import org.allbinary.logic.math.BasicDecimal
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking

-module('VehicleLayerInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('LayerInterface', Function, Arguments).


getGameKeyEventList(This) ->
    erlang:error({abstract_method, getGameKeyEventList}).

getSpeedBasicDecimal(This) ->
    erlang:error({abstract_method, getSpeedBasicDecimal}).

isReadyForExplosion(This) ->
    erlang:error({abstract_method, isReadyForExplosion}).

getRotationAnimationInterface(This) ->
    erlang:error({abstract_method, getRotationAnimationInterface}).

setRotationAnimationInterface(This, AnimationInterface) ->
    erlang:error({abstract_method, setRotationAnimationInterface}).

isDestroyed(This) ->
    erlang:error({abstract_method, isDestroyed}).

isFinish(This) ->
    erlang:error({abstract_method, isFinish}).

getFinalPosition(This) ->
    erlang:error({abstract_method, getFinalPosition}).

% throws Exception
handleFinish(This) ->
    erlang:error({abstract_method, handleFinish}).

getGeographicMapCellPositionTracking(This) ->
    erlang:error({abstract_method, getGeographicMapCellPositionTracking}).

getGeographicMapCellHistoryArray(This) ->
    erlang:error({abstract_method, getGeographicMapCellHistoryArray}).

setGeographicMapCellHistoryArray(This, GeographicMapCellHistory) when (is_tuple(GeographicMapCellHistory) orelse GeographicMapCellHistory =:= undefined) ->
    erlang:error({abstract_method, setGeographicMapCellHistoryArray}).

