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
% import org.allbinary.direction.Direction
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.math.Angle
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo

-module('VectorRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('VectorBaseRotationAnimation', Function, Arguments).

init_fields(This) ->
    ok.


new(CurrentPoints, BasicColor, AnimationBehavior) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CurrentPoints, BasicColor, AnimationBehavior),
    This.

init(This, CurrentPoints, BasicColor, AnimationBehavior) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
        'VectorBaseRotationAnimation':init(This, 'AngleInfo':getInstance(trunc(((get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}) / array:size(CurrentPoints))))), CurrentPoints, BasicColor, AnimationBehavior),
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), (get({This, '$class'})):getFrame(This)).

setFrameByDirection(This, Direction) ->
        Angle = (get({get({This, directionUtil}), '$class'})):getFrameAngle(get({This, directionUtil}), Direction),
        (get({This, '$class'})):adjustFrameToAngle(This, Angle).

setFrameToAngle(This, Angle) ->
        (get({This, '$class'})):adjustFrameToAngle(This, Angle).

setFrame(This, Index) when is_integer(Index) ->
        'VectorBaseRotationAnimation':setFrame(This, Index),
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), (get({This, '$class'})):getFrame(This)).

adjustFrame(This, NewAngle) when is_integer(NewAngle) ->
        (get({This, '$class'})):setFrame(This, (get({get({This, frameUtil}), '$class'})):getFrameForAngle(get({This, frameUtil}), NewAngle, trunc((fun(Target_N66402) -> (get({Target_N66402, '$class'})):getAngleIncrement(Target_N66402) end)((get({get({This, angleInfo}), '$class'})):getAngleIncrementInfo(get({This, angleInfo})))))).

adjustFrameToAngle(This, NewAngle) ->
        (get({This, '$class'})):adjustFrame(This, (get({NewAngle, '$class'})):getValue(NewAngle)).

