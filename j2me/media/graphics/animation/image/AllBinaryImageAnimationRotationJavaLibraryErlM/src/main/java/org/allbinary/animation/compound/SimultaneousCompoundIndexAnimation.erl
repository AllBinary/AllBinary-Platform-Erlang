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
% import org.allbinary.logic.math.PrimitiveIntUtil

-module('SimultaneousCompoundIndexAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    put({This, animationInterfaceArray}, undefined),
    ok.


new(AnimationInterfaceArray, AnimationBehavior) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnimationInterfaceArray, AnimationBehavior),
    This.

init(This, AnimationInterfaceArray, AnimationBehavior) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
        'IndexedAnimation':init(This, AnimationBehavior),
        init_fields(This),
        put({This, animationInterfaceArray}, AnimationInterfaceArray).

setFrame(This, FrameIndex) when is_integer(FrameIndex) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N65909) -> (get({Target_N65909, '$class'})):setFrame(Target_N65909, FrameIndex) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

getFrame(This) ->
        (fun(Target_N66080) -> (get({Target_N66080, '$class'})):getFrame(Target_N66080) end)(array:get(0, get({This, animationInterfaceArray}))).

% throws Exception
getAnimationSize(This) ->
        (fun(Target_N66148) -> (get({Target_N66148, '$class'})):getAnimationSize(Target_N66148) end)(array:get(0, get({This, animationInterfaceArray}))).

getSize(This) ->
        (fun(Target_N66227) -> (get({Target_N66227, '$class'})):getSize(Target_N66227) end)(array:get(0, get({This, animationInterfaceArray}))).

previousFrame(This) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N66303) -> (get({Target_N66303, '$class'})):previousFrame(Target_N66303) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

% throws Exception
nextFrame(This) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N66448) -> (get({Target_N66448, '$class'})):nextFrame(Target_N66448) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N66726) -> (get({Target_N66726, '$class'})):paintXY(Target_N66726, Graphics, X, Y) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

paintThreedXYZ(This, Graphics, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N66965) -> (get({Target_N66965, '$class'})):paintThreedXYZ(Target_N66965, Graphics, X, Y, Z) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

% throws Exception
set(This, Gl) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N67232) -> (get({Target_N67232, '$class'})):set(Target_N67232, Gl) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

getAnimationInterfaceArray(This) ->
        get({This, animationInterfaceArray}).

setAnimationInterfaceArray(This, AnimationInterfaceArray) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
        put({This, animationInterfaceArray}, AnimationInterfaceArray).

