% Generated Code Do Not Modify
% package org.allbinary.physics.movement
% import org.allbinary.game.layer.AllBinaryGameLayer
% import org.allbinary.game.physics.velocity.BasicVelocityProperties
% import org.allbinary.logic.math.BasicDecimal
% import org.allbinary.logic.math.MathUtil
% import org.allbinary.logic.math.ScaleFactorFactory

-module('PreciseConstantVelocityMovement').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicConstantVelocityMovement', Function, Arguments).

init_fields(This) ->
    put({This, accumulatedX}, 0),
    put({This, accumulatedY}, 0),
    put({This, accumulatedZ}, 0),
    put({This, factorValue}, get({'ScaleFactorFactory':getInstance(), 'DEFAULT_SCALE_VALUE'})),
    ok.


new(BasicDecimal, VelocityProperties) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicDecimal, VelocityProperties),
    This.

'$init'(This, BasicDecimal, VelocityProperties) ->
        'BasicConstantVelocityMovement':'$init'(This, BasicDecimal, VelocityProperties),
        init_fields(This).

init(This, SpeedBasicDecimal, Angle, OtherAngle) when is_integer(Angle), is_integer(OtherAngle) ->
        ok.

% throws Exception
process(This, Layer) ->
        MathUtil = 'MathUtil':getInstance(),
        VelocityProperties = (get({This, '$class'})):getVelocityProperties(This),
        put({This, accumulatedX}, trunc(((get({This, accumulatedX}) + (fun(Target_N66215) -> (get({Target_N66215, '$class'})):getUnscaled(Target_N66215) end)((get({VelocityProperties, '$class'})):getVelocityXBasicDecimalP(VelocityProperties)))))),
        put({This, accumulatedY}, trunc(((get({This, accumulatedY}) + (fun(Target_N66287) -> (get({Target_N66287, '$class'})):getUnscaled(Target_N66287) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties)))))),
        put({This, accumulatedZ}, trunc(((get({This, accumulatedZ}) + (fun(Target_N66359) -> (get({Target_N66359, '$class'})):getUnscaled(Target_N66359) end)((get({VelocityProperties, '$class'})):getVelocityZBasicDecimalP(VelocityProperties)))))),
        (get({Layer, '$class'})):moveDXYZ(Layer, (get({This, accumulatedX}) div get({This, factorValue})), (get({This, accumulatedY}) div get({This, factorValue})), (get({This, accumulatedZ}) div get({This, factorValue}))),
        case ((get({MathUtil, '$class'})):abs(MathUtil, get({This, accumulatedX})) > get({This, factorValue})) of
            true ->
            put({This, accumulatedX}, 0);
            false -> ok
        end,
        case ((get({MathUtil, '$class'})):abs(MathUtil, get({This, accumulatedY})) > get({This, factorValue})) of
            true ->
            put({This, accumulatedY}, 0);
            false -> ok
        end,
        case ((get({MathUtil, '$class'})):abs(MathUtil, get({This, accumulatedZ})) > get({This, factorValue})) of
            true ->
            put({This, accumulatedZ}, 0);
            false -> ok
        end.

