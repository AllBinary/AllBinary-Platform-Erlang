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
% package org.allbinary.game.physics.velocity
% import org.allbinary.direction.Direction
% import org.allbinary.logic.math.BasicDecimal
% import org.allbinary.math.Angle

-module('BasicVelocityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getVelocityXBasicDecimalP(This) ->
    erlang:error({abstract_method, getVelocityXBasicDecimalP}).

getVelocityYBasicDecimalP(This) ->
    erlang:error({abstract_method, getVelocityYBasicDecimalP}).

zero(This) ->
    erlang:error({abstract_method, zero}).

setVelocityWithBigDecimalAndDirection(This, MagnitudeBasicDecimal, Direction, OtherDirection) ->
    erlang:error({abstract_method, setVelocityWithBigDecimalAndDirection}).

addVelocityWithBigDecimalAndDirection(This, MagnitudeBasicDecimal, Direction, OtherDirection) ->
    erlang:error({abstract_method, addVelocityWithBigDecimalAndDirection}).

setVelocityWithDirection(This, Magnitude, Direction, OtherDirection) when is_integer(Magnitude) ->
    erlang:error({abstract_method, setVelocityWithDirection}).

addVelocityWithDirection(This, Magnitude, Direction, OtherDirection) when is_integer(Magnitude) ->
    erlang:error({abstract_method, addVelocityWithDirection}).

setVelocityWithBigDecimal(This, MagnitudeBasicDecimal, Angle, OtherAngle) ->
    erlang:error({abstract_method, setVelocityWithBigDecimal}).

addVelocityWithBigDecimal(This, MagnitudeBasicDecimal, Angle, OtherAngle) ->
    erlang:error({abstract_method, addVelocityWithBigDecimal}).

setVelocity(This, Magnitude, Angle, OtherAngle) when is_integer(Magnitude) ->
    erlang:error({abstract_method, setVelocity}).

addVelocity(This, Magnitude, Angle, OtherAngle) when is_integer(Magnitude) ->
    erlang:error({abstract_method, addVelocity}).

addVelocityi(This, Magnitude, Angle, OtherAngle) when is_integer(Magnitude), is_integer(Angle), is_integer(OtherAngle) ->
    erlang:error({abstract_method, addVelocityi}).

