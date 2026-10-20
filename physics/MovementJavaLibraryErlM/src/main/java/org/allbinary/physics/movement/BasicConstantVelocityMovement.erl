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
% package org.allbinary.physics.movement
% import org.allbinary.game.layer.AllBinaryGameLayer
% import org.allbinary.game.physics.velocity.BasicVelocityProperties
% import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.math.BasicDecimal
% import org.allbinary.logic.math.vector.AxisMathVectorUtil
% import org.allbinary.math.AngleFactory

-module('BasicConstantVelocityMovement').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements VelocityInterfaceCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Movement', Function, Arguments).

init_fields(This) ->
    put({This, velocityProperties}, undefined),
    put({This, speedBasicDecimal}, get({'BasicDecimal', 'ZERO_BIGDECIMAL'})),
    put({This, axisMathVectorUtil}, 'AxisMathVectorUtil':getInstance()),
    ok.


new(BasicDecimal, VelocityProperties) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicDecimal, VelocityProperties),
    This.

'$init'(This, BasicDecimal, VelocityProperties) ->
    'Movement':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):setSpeedBasicDecimal(This, BasicDecimal),
        put({This, velocityProperties}, VelocityProperties).

init(This, SpeedBasicDecimal, Angle, OtherAngle) when is_integer(Angle), is_integer(OtherAngle) ->
        put({This, speedBasicDecimal}, SpeedBasicDecimal),
        AngleFactory = 'AngleFactory':getInstance(),
        (get({get({This, velocityProperties}), '$class'})):setVelocityWithBigDecimal(get({This, velocityProperties}), SpeedBasicDecimal, (get({AngleFactory, '$class'})):getAt(AngleFactory, Angle), (get({AngleFactory, '$class'})):getAt(AngleFactory, OtherAngle)).

moveOutsideRadius(This, Layer, Radius, Angle, OtherAngle) when is_integer(Radius), is_integer(Angle), is_integer(OtherAngle) ->
        ScaleFactorValue = (get({get({This, speedBasicDecimal}), '$class'})):getScaledFactorValue(get({This, speedBasicDecimal})),
        XVector = trunc((((get({get({This, axisMathVectorUtil}), '$class'})):calculateX(get({This, axisMathVectorUtil}), Radius, Angle) / ScaleFactorValue))),
        YVector = trunc((((get({get({This, axisMathVectorUtil}), '$class'})):calculateY(get({This, axisMathVectorUtil}), Radius, Angle) / ScaleFactorValue))),
        ZVector = trunc((((get({get({This, axisMathVectorUtil}), '$class'})):calculateZ(get({This, axisMathVectorUtil}), Radius, OtherAngle) / ScaleFactorValue))),
        (get({Layer, '$class'})):moveDXYZ(Layer, XVector, YVector, ZVector).

% throws Exception
process(This, Layer) ->
        (get({Layer, '$class'})):moveDXYZ(Layer, (fun(Target_N66763) -> (get({Target_N66763, '$class'})):getScaled(Target_N66763) end)((get({get({This, velocityProperties}), '$class'})):getVelocityXBasicDecimalP(get({This, velocityProperties}))), (fun(Target_N66790) -> (get({Target_N66790, '$class'})):getScaled(Target_N66790) end)((get({get({This, velocityProperties}), '$class'})):getVelocityYBasicDecimalP(get({This, velocityProperties}))), (fun(Target_N66817) -> (get({Target_N66817, '$class'})):getScaled(Target_N66817) end)((get({get({This, velocityProperties}), '$class'})):getVelocityZBasicDecimalP(get({This, velocityProperties})))).

toString(This) ->
        (get({get({This, velocityProperties}), '$class'})):toString(get({This, velocityProperties})).

stop(This) ->
        (get({get({This, velocityProperties}), '$class'})):zero(get({This, velocityProperties})).

getVelocityProperties(This) ->
        get({This, velocityProperties}).

setVelocityProperties(This, VelocityProperties) ->
        put({This, velocityProperties}, VelocityProperties).

setSpeedBasicDecimal(This, SpeedBasicDecimal) ->
        put({This, speedBasicDecimal}, SpeedBasicDecimal).

getSpeedBasicDecimal(This) ->
        get({This, speedBasicDecimal}).

