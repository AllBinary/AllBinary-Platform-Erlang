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
% import org.allbinary.direction.DirectionUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.BasicDecimal
% import org.allbinary.logic.math.vector.AxisMathVectorUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.math.Angle
% import org.allbinary.math.PositionStrings
% import org.allbinary.string.CommonSeps

-module('BasicVelocityProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements BasicVelocityInterface

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, velocityXBasicDecimal}, undefined),
    put({This, velocityYBasicDecimal}, undefined),
    put({This, velocityZBasicDecimal}, undefined),
    put({This, axisMathVectorUtil}, 'AxisMathVectorUtil':getInstance()),
    put({This, directionUtil}, 'DirectionUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        put({This, velocityXBasicDecimal}, 'BasicDecimal':new(0)),
        put({This, velocityYBasicDecimal}, 'BasicDecimal':new(0)),
        put({This, velocityZBasicDecimal}, 'BasicDecimal':new(0)).

zero(This) ->
        (get({get({This, velocityXBasicDecimal}), '$class'})):setint(get({This, velocityXBasicDecimal}), 0),
        (get({get({This, velocityYBasicDecimal}), '$class'})):setint(get({This, velocityYBasicDecimal}), 0),
        (get({get({This, velocityZBasicDecimal}), '$class'})):setint(get({This, velocityZBasicDecimal}), 0).

getVelocityXBasicDecimalP(This) ->
        get({This, velocityXBasicDecimal}).

getVelocityYBasicDecimalP(This) ->
        get({This, velocityYBasicDecimal}).

getVelocityZBasicDecimalP(This) ->
        get({This, velocityZBasicDecimal}).

setVelocityWithBigDecimalAndDirection(This, MagnitudeBasicDecimal, Direction, OtherDirection) ->
        Angle = (get({get({This, directionUtil}), '$class'})):getAngle(get({This, directionUtil}), Direction),
        OtherAngle = (get({get({This, directionUtil}), '$class'})):getAngle(get({This, directionUtil}), OtherDirection),
        (get({This, '$class'})):setVelocityWithBigDecimal(This, MagnitudeBasicDecimal, Angle, OtherAngle).

setVelocityWithDirection(This, Magnitude, Direction, OtherDirection) when is_integer(Magnitude) ->
        Angle = (get({get({This, directionUtil}), '$class'})):getAngle(get({This, directionUtil}), Direction),
        OtherAngle = (get({get({This, directionUtil}), '$class'})):getAngle(get({This, directionUtil}), OtherDirection),
        (get({This, '$class'})):setVelocity(This, Magnitude, Angle, OtherAngle).

addVelocityWithBigDecimalAndDirection(This, MagnitudeBasicDecimal, Direction, OtherDirection) ->
        Angle = (get({get({This, directionUtil}), '$class'})):getAngle(get({This, directionUtil}), Direction),
        OtherAngle = (get({get({This, directionUtil}), '$class'})):getAngle(get({This, directionUtil}), OtherDirection),
        (get({This, '$class'})):addVelocityWithBigDecimal(This, MagnitudeBasicDecimal, Angle, OtherAngle).

addVelocityWithDirection(This, Magnitude, Direction, OtherDirection) when is_integer(Magnitude) ->
        Angle = (get({get({This, directionUtil}), '$class'})):getAngle(get({This, directionUtil}), Direction),
        OtherAngle = (get({get({This, directionUtil}), '$class'})):getAngle(get({This, directionUtil}), OtherDirection),
        (get({This, '$class'})):addVelocity(This, Magnitude, Angle, OtherAngle).

setVelocityWithBigDecimal(This, MagnitudeBasicDecimal, Angle, OtherAngle) ->
        Magnitude = (get({MagnitudeBasicDecimal, '$class'})):getUnscaled(MagnitudeBasicDecimal),
        (get({This, '$class'})):setVelocity(This, Magnitude, Angle, OtherAngle).

addVelocityWithBigDecimal(This, MagnitudeBasicDecimal, Angle, OtherAngle) ->
        Magnitude = (get({MagnitudeBasicDecimal, '$class'})):getUnscaled(MagnitudeBasicDecimal),
        (get({This, '$class'})):addVelocity(This, Magnitude, Angle, OtherAngle).

setVelocity(This, Magnitude, Angle, OtherAngle) when is_integer(Magnitude) ->
        (get({This, '$class'})):setVelocityi(This, Magnitude, trunc((get({Angle, '$class'})):getValue(Angle)), trunc((get({OtherAngle, '$class'})):getValue(OtherAngle))).

addVelocity(This, Magnitude, Angle, OtherAngle) when is_integer(Magnitude) ->
        (get({This, '$class'})):addVelocityi(This, Magnitude, trunc((get({Angle, '$class'})):getValue(Angle)), trunc((get({OtherAngle, '$class'})):getValue(OtherAngle))).

setVelocityi(This, Magnitude, Angle, OtherAngle) when is_integer(Magnitude), is_integer(Angle), is_integer(OtherAngle) ->
        XVector = (((get({get({This, axisMathVectorUtil}), '$class'})):calculateX(get({This, axisMathVectorUtil}), Magnitude, Angle) / (get({get({This, velocityXBasicDecimal}), '$class'})):getScaledFactorValue(get({This, velocityXBasicDecimal})))),
        YVector = (((get({get({This, axisMathVectorUtil}), '$class'})):calculateY(get({This, axisMathVectorUtil}), Magnitude, Angle) / (get({get({This, velocityYBasicDecimal}), '$class'})):getScaledFactorValue(get({This, velocityYBasicDecimal})))),
        ZVector = (((get({get({This, axisMathVectorUtil}), '$class'})):calculateZ(get({This, axisMathVectorUtil}), Magnitude, OtherAngle) / (get({get({This, velocityZBasicDecimal}), '$class'})):getScaledFactorValue(get({This, velocityZBasicDecimal})))),
        (get({get({This, velocityXBasicDecimal}), '$class'})):setlong(get({This, velocityXBasicDecimal}), XVector),
        (get({get({This, velocityYBasicDecimal}), '$class'})):setlong(get({This, velocityYBasicDecimal}), YVector),
        (get({get({This, velocityZBasicDecimal}), '$class'})):setlong(get({This, velocityZBasicDecimal}), ZVector).

addVelocityi(This, Magnitude, Angle, OtherAngle) when is_integer(Magnitude), is_integer(Angle), is_integer(OtherAngle) ->
        XVector = (((get({get({This, axisMathVectorUtil}), '$class'})):calculateX(get({This, axisMathVectorUtil}), Magnitude, Angle) / (get({get({This, velocityXBasicDecimal}), '$class'})):getScaledFactorValue(get({This, velocityXBasicDecimal})))),
        YVector = (((get({get({This, axisMathVectorUtil}), '$class'})):calculateY(get({This, axisMathVectorUtil}), Magnitude, Angle) / (get({get({This, velocityYBasicDecimal}), '$class'})):getScaledFactorValue(get({This, velocityYBasicDecimal})))),
        ZVector = (((get({get({This, axisMathVectorUtil}), '$class'})):calculateZ(get({This, axisMathVectorUtil}), Magnitude, OtherAngle) / (get({get({This, velocityZBasicDecimal}), '$class'})):getScaledFactorValue(get({This, velocityZBasicDecimal})))),
        (get({get({This, velocityXBasicDecimal}), '$class'})):addlong(get({This, velocityXBasicDecimal}), XVector),
        (get({get({This, velocityYBasicDecimal}), '$class'})):addlong(get({This, velocityYBasicDecimal}), YVector),
        (get({get({This, velocityZBasicDecimal}), '$class'})):addlong(get({This, velocityZBasicDecimal}), ZVector).

toString(This) ->
        CommonSeps = 'CommonSeps':getInstance(),
        PositionStrings = 'PositionStrings':getInstance(),
        StringBuffer = 'StringMaker':new(),
        StringUtil = 'StringUtil':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Velocity "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'X_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, get({This, velocityXBasicDecimal}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Y_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, get({This, velocityYBasicDecimal}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Z_LABEL'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({StringUtil, '$class'})):toString(StringUtil, get({This, velocityZBasicDecimal}))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

