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
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.util.CircularIndexUtil

-module('CompoundIndexedAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CompoundAnimationInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    put({This, circularIndexUtil}, undefined),
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
        put({This, animationInterfaceArray}, AnimationInterfaceArray),
        put({This, circularIndexUtil}, 'CircularIndexUtil':createInstance(array:size(get({This, animationInterfaceArray})))).

setFrame(This, Index) when is_integer(Index) ->
        IndexedAnimation = array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray})),
        (get({IndexedAnimation, '$class'})):setFrame(IndexedAnimation, Index).

getFrame(This) ->
        IndexedAnimation = array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray})),
        (get({IndexedAnimation, '$class'})):getFrame(IndexedAnimation).

getSize(This) ->
        IndexedAnimation = array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray})),
        (get({IndexedAnimation, '$class'})):getSize(IndexedAnimation).

previousFrame(This) ->
        IndexedAnimation = array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray})),
        (get({IndexedAnimation, '$class'})):previousFrame(IndexedAnimation).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

% throws Exception
nextFrame(This) ->
        (fun(Target_N66745) -> (get({Target_N66745, '$class'})):nextFrame(Target_N66745) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (fun(Target_N66838) -> (get({Target_N66838, '$class'})):paintXY(Target_N66838, Graphics, X, Y) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

paintThreedXYZ(This, Graphics, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        (fun(Target_N67014) -> (get({Target_N67014, '$class'})):paintThreedXYZ(Target_N67014, Graphics, X, Y, Z) end)(array:get((get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})), get({This, animationInterfaceArray}))).

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

getAnimationInterfaceArray(This) ->
        get({This, animationInterfaceArray}).

setAnimationInterfaceArray(This, AnimationInterfaceArray) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined) ->
        put({This, animationInterfaceArray}, AnimationInterfaceArray).

% throws Exception
set(This, Gl) ->
        put({local, index}, array:size(get({This, animationInterfaceArray}))),
        (fun Loop() -> case (begin put({local, index}, get({local, index}) - 1), get({local, index}) end >= 0) of true ->
            (fun(Target_N67851) -> (get({Target_N67851, '$class'})):set(Target_N67851, Gl) end)(array:get(get({local, index}), get({This, animationInterfaceArray}))),
            Loop();
        false -> ok end end)().

