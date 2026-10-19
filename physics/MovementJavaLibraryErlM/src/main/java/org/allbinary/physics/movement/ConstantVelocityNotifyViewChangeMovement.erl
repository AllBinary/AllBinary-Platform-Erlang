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
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.math.BasicDecimal
% import org.allbinary.logic.math.vector.AxisMathVectorUtil
% import org.allbinary.math.AngleFactory

-module('ConstantVelocityNotifyViewChangeMovement').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Movement', Function, Arguments).

init_fields(This) ->
    put({This, basicVelocityProperties}, undefined),
    put({This, speedBasicDecimal}, undefined),
    put({This, axisMathVectorUtil}, 'AxisMathVectorUtil':getInstance()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'Movement':init(This),
    init_fields(This),
        put({This, speedBasicDecimal}, get({'BasicDecimal', 'ZERO_BIGDECIMAL'})),
        put({This, basicVelocityProperties}, 'BasicVelocityProperties':new()).

init(This, SpeedBasicDecimal, Angle, OtherAngle) when is_integer(Angle), is_integer(OtherAngle) ->
        put({This, speedBasicDecimal}, SpeedBasicDecimal),
        AngleFactory = 'AngleFactory':getInstance(),
        (get({get({This, basicVelocityProperties}), '$class'})):setVelocityWithBigDecimal(get({This, basicVelocityProperties}), SpeedBasicDecimal, (get({AngleFactory, '$class'})):getAt(AngleFactory, Angle), (get({AngleFactory, '$class'})):getAt(AngleFactory, OtherAngle)).

moveOutsideRadius(This, Layer, Radius, Angle, OtherAngle) when is_integer(Radius), is_integer(Angle), is_integer(OtherAngle) ->
        ScaleFactorValue = (get({get({This, speedBasicDecimal}), '$class'})):getScaledFactorValue(get({This, speedBasicDecimal})),
        XVector = trunc((((get({get({This, axisMathVectorUtil}), '$class'})):calculateX(get({This, axisMathVectorUtil}), Radius, Angle) / ScaleFactorValue))),
        YVector = trunc((((get({get({This, axisMathVectorUtil}), '$class'})):calculateY(get({This, axisMathVectorUtil}), Radius, Angle) / ScaleFactorValue))),
        ZVector = trunc((((get({get({This, axisMathVectorUtil}), '$class'})):calculateZ(get({This, axisMathVectorUtil}), Radius, OtherAngle) / ScaleFactorValue))),
        (get({Layer, '$class'})):moveDXYZ(Layer, XVector, YVector, ZVector).

% throws Exception
process(This, Layer) ->
        X = (fun(Target_N66690) -> (get({Target_N66690, '$class'})):getScaled(Target_N66690) end)((get({get({This, basicVelocityProperties}), '$class'})):getVelocityXBasicDecimalP(get({This, basicVelocityProperties}))),
        Y = (fun(Target_N66740) -> (get({Target_N66740, '$class'})):getScaled(Target_N66740) end)((get({get({This, basicVelocityProperties}), '$class'})):getVelocityYBasicDecimalP(get({This, basicVelocityProperties}))),
        Z = (fun(Target_N66790) -> (get({Target_N66790, '$class'})):getScaled(Target_N66790) end)((get({get({This, basicVelocityProperties}), '$class'})):getVelocityZBasicDecimalP(get({This, basicVelocityProperties}))),
        (get({Layer, '$class'})):moveDXYZ(Layer, X, Y, Z),
        case (((X =/= 0) orelse (Y =/= 0)) orelse (Z =/= 0)) of
            true ->
            (get({Layer, '$class'})):onViewPositionChangeEvent(Layer);
            false -> ok
        end.

stop(This) ->
        (get({get({This, basicVelocityProperties}), '$class'})):zero(get({This, basicVelocityProperties})).

