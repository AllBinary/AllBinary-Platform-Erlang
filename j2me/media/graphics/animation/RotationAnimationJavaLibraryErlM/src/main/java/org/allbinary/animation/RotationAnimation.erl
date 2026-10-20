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
% import org.allbinary.direction.DirectionUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.math.Angle
% import org.allbinary.math.AngleInfo
% import org.allbinary.math.FrameUtil
% import org.allbinary.util.CircularIndexUtil

-module('RotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RotationAnimationInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    put({This, frameUtil}, 'FrameUtil':getInstance()),
    put({This, directionUtil}, 'DirectionUtil':getInstance()),
    put({This, angleInfo}, undefined),
    put({This, circularIndexUtil}, undefined),
    ok.


new(AngleInfo, CircularIndexUtil, AnimationBehavior) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AngleInfo, CircularIndexUtil, AnimationBehavior),
    This.

'$init'(This, AngleInfo, CircularIndexUtil, AnimationBehavior) ->
        'IndexedAnimation':'$init'(This, AnimationBehavior),
        init_fields(This),
        put({This, angleInfo}, AngleInfo),
        put({This, circularIndexUtil}, CircularIndexUtil).

nextRotationX(This) ->
        ok.

previousRotationX(This) ->
        ok.

nextRotation(This) ->
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil}))).

previousRotation(This) ->
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), (get({get({This, circularIndexUtil}), '$class'})):previous(get({This, circularIndexUtil}))).

nextRotationZ(This) ->
        ok.

previousRotationZ(This) ->
        ok.

setFrame(This, Index) when is_integer(Index) ->
        (get({get({This, circularIndexUtil}), '$class'})):setIndex(get({This, circularIndexUtil}), Index),
        NewFrame = (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})),
        (get({get({This, angleInfo}), '$class'})):adjustAngle(get({This, angleInfo}), NewFrame).

setFrameByDirection(This, Direction) ->
        Angle = (get({get({This, directionUtil}), '$class'})):getFrameAngle(get({This, directionUtil}), Direction),
        (get({This, '$class'})):adjustFrameToAngle(This, Angle).

setFrameToAngle(This, Angle) ->
        (get({This, '$class'})):adjustFrameToAngle(This, Angle).

adjustFrameToAngle(This, Angle) ->
        (get({This, '$class'})):adjustFrame(This, (get({Angle, '$class'})):getValue(Angle)).

adjustFrame(This, Angle) when is_integer(Angle) ->
        (get({This, '$class'})):setFrame(This, (get({get({This, frameUtil}), '$class'})):getFrameForAngle(get({This, frameUtil}), Angle, trunc((fun(Target_N66952) -> (get({Target_N66952, '$class'})):getAngleIncrement(Target_N66952) end)((get({get({This, angleInfo}), '$class'})):getAngleIncrementInfo(get({This, angleInfo})))))).

getFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})).

getSize(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):getSize(get({This, circularIndexUtil})).

getAngleInfoP(This) ->
        get({This, angleInfo}).

toString(This) ->
        (fun(Target_N67227) -> (get({Target_N67227, '$class'})):toString(Target_N67227) end)((fun(Target_N67234) -> (get({Target_N67234, '$class'})):append(Target_N67234, (get({get({This, angleInfo}), '$class'})):toString(get({This, angleInfo}))) end)((fun(Target_N67241) -> (get({Target_N67241, '$class'})):append(Target_N67241, "angleInfo: ") end)((fun(Target_N67248) -> (get({Target_N67248, '$class'})):append(Target_N67248, (get({get({This, circularIndexUtil}), '$class'})):toString(get({This, circularIndexUtil}))) end)((fun(Target_N67255) -> (get({Target_N67255, '$class'})):append(Target_N67255, "circularIndexUtil: ") end)((fun(Target_N67262) -> (get({Target_N67262, '$class'})):append(Target_N67262, 'IndexedAnimation':toString(This)) end)('StringMaker':new())))))).

