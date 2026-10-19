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
% package org.allbinary.animation.image.sprite
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.game.Sprite
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.color.ColorCompositeInterface
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels

-module('SpriteIndexedAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ColorCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    put({This, sprite}, undefined),
    put({This, image}, undefined),
    put({This, basicColorArray}, undefined),
    ok.


new(Sprite, Image, BasicColorArray, AnimationBehavior) when (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Sprite, Image, BasicColorArray, AnimationBehavior),
    This.

init(This, Sprite, Image, BasicColorArray, AnimationBehavior) when (is_tuple(BasicColorArray) orelse BasicColorArray =:= undefined) ->
        'IndexedAnimation':init(This, AnimationBehavior),
        init_fields(This),
        put({This, sprite}, Sprite),
        put({This, image}, Image),
        put({This, basicColorArray}, BasicColorArray),
        case ((array:size(get({This, basicColorArray})) =/= 0) andalso ((get({This, '$class'})):getSize(This) =/= array:size(get({This, basicColorArray})))) of
            true ->
            erlang:error({'Exception', (fun(Target_N66230) -> (get({Target_N66230, '$class'})):toString(Target_N66230) end)((fun(Target_N66237) -> (get({Target_N66237, '$class'})):appendint(Target_N66237, array:size(get({This, basicColorArray}))) end)((fun(Target_N66244) -> (get({Target_N66244, '$class'})):append(Target_N66244, "!=") end)((fun(Target_N66251) -> (get({Target_N66251, '$class'})):appendint(Target_N66251, (get({This, '$class'})):getSize(This)) end)((fun(Target_N66258) -> (get({Target_N66258, '$class'})):append(Target_N66258, get({'CommonLabels':getInstance(), 'TOTAL_LABEL'})) end)('StringMaker':new())))))});
            false -> ok
        end.

% throws Exception
getAnimationSize(This) ->
        (get({This, '$class'})):getSize(This).

setBasicColorP(This, BasicColor) ->
        lists:foreach(fun(Index) ->
            case (BasicColor =:= array:get(Index, get({This, basicColorArray}))) of
                true ->
                (get({This, '$class'})):setFrame(This, Index),
                throw('$break');
                false -> ok
            end
        end, lists:seq(0, array:size(get({This, basicColorArray})) - 1)).

getBasicColorP(This) ->
        try
        case (array:size(get({This, basicColorArray})) < (get({This, '$class'})):getFrame(This)) of
            true ->
            throw({'$return', array:get((get({This, '$class'})):getFrame(This), get({This, basicColorArray}))});
            false ->
            throw({'$return', get({'BasicColorFactory':getInstance(), 'WHITE'})})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

paintFrame(This, Graphics, Frame, X, Y) when is_integer(Frame), is_integer(X), is_integer(Y) ->
        (get({This, '$class'})):setFrame(This, Frame),
        (get({get({This, sprite}), '$class'})):setPosition(get({This, sprite}), X, Y),
        (get({get({This, sprite}), '$class'})):paint(get({This, sprite}), Graphics).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, sprite}), '$class'})):setPosition(get({This, sprite}), X, Y),
        (get({get({This, sprite}), '$class'})):paint(get({This, sprite}), Graphics).

paint(This, Graphics) ->
        (get({get({This, sprite}), '$class'})):paint(get({This, sprite}), Graphics).

nextFrame(This) ->
        (get({get({This, sprite}), '$class'})):nextFrame(get({This, sprite})).

previousFrame(This) ->
        (get({get({This, sprite}), '$class'})):prevFrame(get({This, sprite})).

getSize(This) ->
        (get({get({This, sprite}), '$class'})):getRawFrameCount(get({This, sprite})).

setFrame(This, Frame) when is_integer(Frame) ->
        (get({get({This, sprite}), '$class'})):setFrame(get({This, sprite}), Frame).

getFrame(This) ->
        (get({get({This, sprite}), '$class'})):getFrame(get({This, sprite})).

isLastFrame(This) ->
        try
        case ((get({get({This, sprite}), '$class'})):getFrame(get({This, sprite})) =:= ((get({This, '$class'})):getSize(This) - 1)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getLastFrame(This) ->
        (get({This, '$class'})):getSize(This).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

% throws Exception
close(This) ->
        ok.

% throws Throwable
finalize(This) ->
        ok.

