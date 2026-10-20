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
% package org.allbinary.animation.special
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.animation.IndexedAnimationBehavior
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.logic.ABSystemWrapper
% import org.allbinary.logic.math.PrimitiveIntUtil

-module('TitleAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('SpecialAnimation', Function, Arguments).

init_fields(This) ->
    put({This, systemWrapper}, 'ABSystemWrapper':getInstance()),
    put({This, deltaX}, 0.0),
    put({This, deltaY}, 0.0),
    put({This, deltaZ}, 0.0),
    put({This, basicColorArray}, undefined),
    put({This, dxArray}, undefined),
    put({This, dyArray}, undefined),
    put({This, widthP}, 0),
    put({This, animationInterfaceArray}, undefined),
    put({This, sizeP}, 0),
    put({This, y}, 0),
    put({This, lastFrameStartTime}, 0),
    put({This, displayInfoSingleton}, 'DisplayInfoSingleton':getInstance()),
    put({This, 'CLEAR_COLOR'}, get({'BasicColorFactory':getInstance(), 'CLEAR_COLOR'})),
    ok.


createAnimation(AnimationInterfaceArray, BasicColorArray, DxArray, DyArray, Y, Width) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined), (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined), (is_tuple(DxArray) orelse DxArray =:= undefined), (is_tuple(DyArray) orelse DyArray =:= undefined), is_integer(Y), is_integer(Width) ->
        'TitleAnimation':new(AnimationInterfaceArray, BasicColorArray, DxArray, DyArray, Y, Width, 'IndexedAnimationBehavior':new(1, 250)).

new(AnimationInterfaceArray, BasicColorArray, DxArray, DyArray, Y, Width, AnimationBehavior) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined), (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined), (is_tuple(DxArray) orelse DxArray =:= undefined), (is_tuple(DyArray) orelse DyArray =:= undefined), is_integer(Y), is_integer(Width) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnimationInterfaceArray, BasicColorArray, DxArray, DyArray, Y, Width, AnimationBehavior),
    This.

'$init'(This, AnimationInterfaceArray, BasicColorArray, DxArray, DyArray, Y, Width, AnimationBehavior) when (is_tuple(AnimationInterfaceArray) orelse AnimationInterfaceArray =:= undefined), (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined), (is_tuple(DxArray) orelse DxArray =:= undefined), (is_tuple(DyArray) orelse DyArray =:= undefined), is_integer(Y), is_integer(Width) ->
        'SpecialAnimation':'$init'(This, AnimationBehavior),
        init_fields(This),
        put({This, lastFrameStartTime}, (get({get({This, systemWrapper}), '$class'})):currentTimeMillis(get({This, systemWrapper}))),
        put({This, animationInterfaceArray}, AnimationInterfaceArray),
        put({This, sizeP}, array:size(get({This, animationInterfaceArray}))),
        put({This, basicColorArray}, BasicColorArray),
        put({This, dxArray}, DxArray),
        put({This, dyArray}, DyArray),
        put({This, y}, Y),
        put({This, widthP}, Width),
        (get({This, '$class'})):reset(This).

nextFrame(This) ->
        CurrentTime = (get({get({This, systemWrapper}), '$class'})):currentTimeMillis(get({This, systemWrapper})),
        TotalTimeElapsed = (CurrentTime - get({This, lastFrameStartTime})),
        IndexedAnimationBehavior = (get({This, '$class'})):getAnimationBehavior(This),
        case (TotalTimeElapsed > get({IndexedAnimationBehavior, frameDelayTime})) of
            true ->
            (get({This, '$class'})):previousFrame(This),
            put({This, lastFrameStartTime}, CurrentTime);
            false -> ok
        end,
        case ((fun(Target_N67300) -> (get({Target_N67300, '$class'})):getFrame(Target_N67300) end)(array:get(0, get({This, animationInterfaceArray}))) =:= 0) of
            true ->
            put({IndexedAnimationBehavior, loopIndex}, get({IndexedAnimationBehavior, loopIndex}) + 1);
            false -> ok
        end.

isComplete(This) ->
        try
        IndexedAnimationBehavior = (get({This, '$class'})):getAnimationBehavior(This),
        case (((get({IndexedAnimationBehavior, loopTotal}) =:= (-1)) orelse (get({IndexedAnimationBehavior, loopIndex}) < get({IndexedAnimationBehavior, loopTotal}))) orelse ((get({This, '$class'})):getFrame(This) =/= 0)) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

getSize(This) ->
        (fun(Target_N67751) -> (get({Target_N67751, '$class'})):getSize(Target_N67751) end)(array:get(0, get({This, animationInterfaceArray}))).

getFrame(This) ->
        (fun(Target_N67819) -> (get({Target_N67819, '$class'})):getFrame(Target_N67819) end)(array:get(0, get({This, animationInterfaceArray}))).

setFrame(This, Frame) when is_integer(Frame) ->
        lists:foreach(fun(Index) ->
            (fun(Target_N67895) -> (get({Target_N67895, '$class'})):setFrame(Target_N67895, Frame) end)(array:get(Index, get({This, animationInterfaceArray})))
        end, lists:seq(0, get({This, sizeP}) - 1)).

setLastFrame(This) ->
        (get({This, '$class'})):setFrame(This, ((get({This, '$class'})):getSize(This) - 1)).

reset(This) ->
        (get({This, '$class'})):setLastFrame(This),
        IndexedAnimationBehavior = ((get({This, '$class'})):getAnimationBehavior(This)),
        (get({IndexedAnimationBehavior, '$class'})):reset(IndexedAnimationBehavior).

previousFrame(This) ->
        lists:foreach(fun(Index) ->
            (fun(Target_N68287) -> (get({Target_N68287, '$class'})):previousFrame(Target_N68287) end)(array:get(Index, get({This, animationInterfaceArray})))
        end, lists:seq(0, get({This, sizeP}) - 1)).

paintFrameXY(This, Graphics, Frame, X, Y) when is_integer(Frame), is_integer(X), is_integer(Y) ->
        (get({This, '$class'})):setFrame(This, Frame),
        (get({This, '$class'})):paintXY(This, Graphics, X, Y).

paintXY(This, Graphics, Ax, Ay) when is_integer(Ax), is_integer(Ay) ->
        put({local, x}, 0),
        case (get({This, widthP}) =/= get({'Integer', 'MIN_VALUE'})) of
            true ->
            put({local, x}, (((((get({get({This, displayInfoSingleton}), '$class'})):getLastWidth(get({This, displayInfoSingleton})) - get({This, widthP}))) / 2)));
            false -> ok
        end,
        put({local, deltaX}, 0),
        put({local, deltaY}, 0),
        lists:foreach(fun(Index) ->
            put({local, deltaX}, (array:get(Index, get({This, dxArray})) + get({local, x}))),
            put({local, deltaY}, (array:get(Index, get({This, dyArray})) + get({This, y}))),
            case (array:get(Index, get({This, basicColorArray})) =/= get({This, 'CLEAR_COLOR'})) of
                true ->
                (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP(get({This, basicSetColorUtil}), Graphics, array:get(Index, get({This, basicColorArray})));
                false -> ok
            end,
            (fun(Target_N69086) -> (get({Target_N69086, '$class'})):paintXY(Target_N69086, Graphics, get({local, deltaX}), get({local, deltaY})) end)(array:get(Index, get({This, animationInterfaceArray})))
        end, lists:seq(0, get({This, sizeP}) - 1)).

