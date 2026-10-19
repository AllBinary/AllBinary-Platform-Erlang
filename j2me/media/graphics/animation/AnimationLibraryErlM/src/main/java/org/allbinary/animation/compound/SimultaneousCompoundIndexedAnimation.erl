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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.logic.math.PrimitiveIntUtil

-module('SimultaneousCompoundIndexedAnimation').
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
        put({local, indexedAnimation}, undefined),
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, indexedAnimation}, array:get(get({local, index}), get({This, animationInterfaceArray}))),
            (get({get({local, indexedAnimation}), '$class'})):setFrame(get({local, indexedAnimation}), FrameIndex),
            Loop();
        false -> ok end end)().

getFrame(This) ->
        IndexedAnimation = array:get(0, get({This, animationInterfaceArray})),
        (get({IndexedAnimation, '$class'})):getFrame(IndexedAnimation).

getSize(This) ->
        IndexedAnimation = array:get(0, get({This, animationInterfaceArray})),
        (get({IndexedAnimation, '$class'})):getSize(IndexedAnimation).

previousFrame(This) ->
        put({local, indexedAnimation}, undefined),
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            put({local, indexedAnimation}, array:get(get({local, index}), get({This, animationInterfaceArray}))),
            (get({get({local, indexedAnimation}), '$class'})):previousFrame(get({local, indexedAnimation})),
            Loop();
        false -> ok end end)().

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

% throws Exception
nextFrame(This) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N66726) -> (get({Target_N66726, '$class'})):nextFrame(Target_N66726) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        Size = array:size(get({This, animationInterfaceArray})),
        lists:foreach(fun(Index) ->
            (fun(Target_N66924) -> (get({Target_N66924, '$class'})):paintXY(Target_N66924, Graphics, X, Y) end)(array:get(Index, get({This, animationInterfaceArray})))
        end, lists:seq(0, Size - 1)).

paintThreedXYZ(This, Graphics, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        Size = array:size(get({This, animationInterfaceArray})),
        lists:foreach(fun(Index) ->
            (fun(Target_N67205) -> (get({Target_N67205, '$class'})):paintThreedXYZ(Target_N67205, Graphics, X, Y, Z) end)(array:get(Index, get({This, animationInterfaceArray})))
        end, lists:seq(0, Size - 1)).

getAnimationInterfaceArray(This) ->
        get({This, animationInterfaceArray}).

setAnimationInterfaceArray(This, AnimationInterfaceArray) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
        put({This, animationInterfaceArray}, AnimationInterfaceArray).

