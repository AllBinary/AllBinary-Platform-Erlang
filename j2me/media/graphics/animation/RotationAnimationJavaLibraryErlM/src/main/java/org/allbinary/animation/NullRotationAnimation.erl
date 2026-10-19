% Generated Code Do Not Modify
% package org.allbinary.animation
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.util.CircularIndexUtil

-module('NullRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RotationAnimation', Function, Arguments).

init_fields(This) ->
    ok.


createTotalAngle(AngleInfo, TotalAngle, AnimationBehavior) when is_integer(TotalAngle) ->
        'NullRotationAnimation':new(AngleInfo, 'CircularIndexUtil':createInstance((TotalAngle / (fun(Target_N65721) -> (get({Target_N65721, '$class'})):getAngleIncrement(Target_N65721) end)((get({AngleInfo, '$class'})):getAngleIncrementInfo(AngleInfo)))), AnimationBehavior).

createQuarter(AnimationBehavior) ->
        'NullRotationAnimation':new('AngleInfo':getInstance(get({'AngleFactory':getInstance(), 'QUARTER_TOTAL_ANGLE'})), 'CircularIndexUtil':createInstance(4), AnimationBehavior).

new(AngleInfo, CircularIndexUtil, AnimationBehavior) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AngleInfo, CircularIndexUtil, AnimationBehavior),
    This.

init(This, AngleInfo, CircularIndexUtil, AnimationBehavior) ->
        'RotationAnimation':init(This, AngleInfo, CircularIndexUtil, AnimationBehavior).

% throws Exception
getAnimationSize(This) ->
        0.

