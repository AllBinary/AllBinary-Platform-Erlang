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
% import org.allbinary.animation.RotationAnimation
% import org.allbinary.direction.Direction
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.math.Angle
% import org.allbinary.math.AngleFactory
% import org.allbinary.math.AngleInfo
% import org.allbinary.util.CircularIndexUtil

-module('SimultaneousCompoundRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, animationInterfaceArray}, undefined),
    ok.


new(AnimationInterfaceArray, AnimationBehavior) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnimationInterfaceArray, AnimationBehavior),
    This.

init(This, AnimationInterfaceArray, AnimationBehavior) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
        'RotationAnimation':init(This, 'AngleInfo':getInstance(get({'AngleFactory':getInstance(), 'QUARTER_TOTAL_ANGLE'})), 'CircularIndexUtil':createInstance(4), AnimationBehavior),
        init_fields(This),
        put({This, animationInterfaceArray}, AnimationInterfaceArray).

setFrame(This, FrameIndex) when is_integer(FrameIndex) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N66100) -> (get({Target_N66100, '$class'})):setFrame(Target_N66100, FrameIndex) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

getFrame(This) ->
        (fun(Target_N66271) -> (get({Target_N66271, '$class'})):getFrame(Target_N66271) end)(array:get(0, get({This, animationInterfaceArray}))).

% throws Exception
getAnimationSize(This) ->
        (fun(Target_N66339) -> (get({Target_N66339, '$class'})):getAnimationSize(Target_N66339) end)(array:get(0, get({This, animationInterfaceArray}))).

getSize(This) ->
        (fun(Target_N66418) -> (get({Target_N66418, '$class'})):getSize(Target_N66418) end)(array:get(0, get({This, animationInterfaceArray}))).

previousFrame(This) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N66494) -> (get({Target_N66494, '$class'})):previousFrame(Target_N66494) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

% throws Exception
nextFrame(This) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N66639) -> (get({Target_N66639, '$class'})):nextFrame(Target_N66639) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

previousRotation(This) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N66795) -> (get({Target_N66795, '$class'})):previousRotation(Target_N66795) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

nextRotation(This) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N66940) -> (get({Target_N66940, '$class'})):nextRotation(Target_N66940) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N67207) -> (get({Target_N67207, '$class'})):paintXY(Target_N67207, Graphics, X, Y) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

paintThreedXYZ(This, Graphics, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N67446) -> (get({Target_N67446, '$class'})):paintThreedXYZ(Target_N67446, Graphics, X, Y, Z) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

setFrameByDirection(This, Direction) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N67713) -> (get({Target_N67713, '$class'})):setFrameByDirection(Target_N67713, Direction) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

setFrameToAngle(This, Angle) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N67896) -> (get({Target_N67896, '$class'})):setFrameToAngle(Target_N67896, Angle) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

adjustFrameToAngle(This, NewAngle) ->
        (get({This, '$class'})):adjustFrame(This, (get({NewAngle, '$class'})):getValue(NewAngle)).

adjustFrame(This, Angle) when is_integer(Angle) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N68176) -> (get({Target_N68176, '$class'})):adjustFrame(Target_N68176, Angle) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

getAngleInfoP(This) ->
        (fun(Target_N68347) -> (get({Target_N68347, '$class'})):getAngleInfoP(Target_N68347) end)(array:get(0, get({This, animationInterfaceArray}))).

getAnimationInterfaceArray(This) ->
        get({This, animationInterfaceArray}).

setAnimationInterfaceArray(This, AnimationInterfaceArray) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
        put({This, animationInterfaceArray}, AnimationInterfaceArray).

% throws Exception
set(This, Gl) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N68570) -> (get({Target_N68570, '$class'})):set(Target_N68570, Gl) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

