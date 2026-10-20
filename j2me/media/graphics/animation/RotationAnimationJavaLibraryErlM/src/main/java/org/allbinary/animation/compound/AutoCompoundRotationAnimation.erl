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
% package org.allbinary.animation.compound
% import javax.microedition.khronos.opengles.GL
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.animation.RotationAnimation
% import org.allbinary.direction.Direction
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.math.Angle
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.util.CircularIndexUtil

-module('AutoCompoundRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CompoundAnimationInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('RotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, animationInterfaceArray}, undefined),
    ok.


new(AnimationInterfaceArray, AnimationBehavior) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnimationInterfaceArray, AnimationBehavior),
    This.

'$init'(This, AnimationInterfaceArray, AnimationBehavior) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
        'RotationAnimation':'$init'(This, 'AngleInfo':getInstance(get({'AngleFactory':getInstance(), 'QUARTER_TOTAL_ANGLE'})), 'CircularIndexUtil':createInstance(4), AnimationBehavior),
        init_fields(This),
        put({This, animationInterfaceArray}, AnimationInterfaceArray),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(array:size(get({This, animationInterfaceArray})))).

setFrame(This, Index) when is_integer(Index) ->
        (fun(Target_N66186) -> (get({Target_N66186, '$class'})):setFrame(Target_N66186, Index) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

getFrame(This) ->
        (fun(Target_N66302) -> (get({Target_N66302, '$class'})):getFrame(Target_N66302) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

% throws Exception
getAnimationSize(This) ->
        (fun(Target_N66385) -> (get({Target_N66385, '$class'})):getAnimationSize(Target_N66385) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

getSize(This) ->
        (fun(Target_N66479) -> (get({Target_N66479, '$class'})):getSize(Target_N66479) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

previousFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):previous(get({This, circularIndexUtil})),
        (fun(Target_N66585) -> (get({Target_N66585, '$class'})):previousFrame(Target_N66585) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

% throws Exception
nextFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})),
        (fun(Target_N66690) -> (get({Target_N66690, '$class'})):nextFrame(Target_N66690) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

previousRotation(This) ->
        (fun(Target_N66783) -> (get({Target_N66783, '$class'})):previousRotation(Target_N66783) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

nextRotation(This) ->
        (fun(Target_N66865) -> (get({Target_N66865, '$class'})):nextRotation(Target_N66865) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (fun(Target_N67062) -> (get({Target_N67062, '$class'})):paintXY(Target_N67062, Graphics, X, Y) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

paintThreedXYZ(This, Graphics, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        (fun(Target_N67238) -> (get({Target_N67238, '$class'})):paintThreedXYZ(Target_N67238, Graphics, X, Y, Z) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

getCurrentAnimation(This) ->
        array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray})).

nextAnimation(This) ->
        Frame = (get({This, '$class'})):getFrame(This),
        (get({get({This, circularIndexUtil}), '$class'})):next(get({This, circularIndexUtil})),
        (get({This, '$class'})):setFrame(This, Frame).

previousAnimation(This) ->
        Frame = (get({This, '$class'})):getFrame(This),
        (get({get({This, circularIndexUtil}), '$class'})):previous(get({This, circularIndexUtil})),
        (get({This, '$class'})):setFrame(This, Frame).

setAnimation(This, Index) when is_integer(Index) ->
        Frame = (get({This, '$class'})):getFrame(This),
        (get({get({This, circularIndexUtil}), '$class'})):setIndex(get({This, circularIndexUtil}), Index),
        (get({This, '$class'})):setFrame(This, Frame).

setFrameByDirection(This, Direction) ->
        (fun(Target_N67919) -> (get({Target_N67919, '$class'})):setFrameByDirection(Target_N67919, Direction) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

setFrameToAngle(This, Angle) ->
        (fun(Target_N68039) -> (get({Target_N68039, '$class'})):setFrameToAngle(Target_N68039, Angle) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

adjustFrameToAngle(This, NewAngle) ->
        (get({This, '$class'})):adjustFrame(This, (get({NewAngle, '$class'})):getValue(NewAngle)).

adjustFrame(This, Angle) when is_integer(Angle) ->
        (fun(Target_N68256) -> (get({Target_N68256, '$class'})):adjustFrame(Target_N68256, Angle) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

getAngleInfoP(This) ->
        (fun(Target_N68372) -> (get({Target_N68372, '$class'})):getAngleInfoP(Target_N68372) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

getAnimationInterfaceArray(This) ->
        get({This, animationInterfaceArray}).

setAnimationInterfaceArray(This, AnimationInterfaceArray) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
        put({This, animationInterfaceArray}, AnimationInterfaceArray).

% throws Exception
set(This, Gl) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N68610) -> (get({Target_N68610, '$class'})):set(Target_N68610, Gl) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

