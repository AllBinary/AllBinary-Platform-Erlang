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
% package org.allbinary.animation.caption
% import javax.microedition.lcdui.Graphics
% import javax.microedition.media.Player
% import org.allbinary.animation.Animation
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.AnimationEventHandler
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper

-module('CaptionIndexedAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    put({This, animationInterface}, undefined),
    put({This, movieIndexedAnimationInterface}, undefined),
    put({This, captionDx}, 0),
    put({This, captionDy}, 0),
    put({This, dx}, 0),
    put({This, dy}, 0),
    put({This, time}, 0),
    put({This, 'END_EVENT'}, undefined),
    put({This, timeDelayHelper}, undefined),
    put({This, player}, undefined),
    ok.


new(AnimationInterface, MovieIndexedAnimationInterface, Player, CaptionDx, CaptionDy, Dx, Dy, Time, AnimationBehavior) when is_integer(CaptionDx), is_integer(CaptionDy), is_integer(Dx), is_integer(Dy), is_integer(Time) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnimationInterface, MovieIndexedAnimationInterface, Player, CaptionDx, CaptionDy, Dx, Dy, Time, AnimationBehavior),
    This.

init(This, AnimationInterface, MovieIndexedAnimationInterface, Player, CaptionDx, CaptionDy, Dx, Dy, Time, AnimationBehavior) when is_integer(CaptionDx), is_integer(CaptionDy), is_integer(Dx), is_integer(Dy), is_integer(Time) ->
        'IndexedAnimation':init(This, AnimationBehavior),
        init_fields(This),
        put({This, animationInterface}, AnimationInterface),
        put({This, movieIndexedAnimationInterface}, MovieIndexedAnimationInterface),
        put({This, captionDx}, CaptionDx),
        put({This, captionDy}, CaptionDy),
        put({This, dx}, Dx),
        put({This, dy}, Dy),
        put({This, time}, Time),
        put({This, 'END_EVENT'}, 'AllBinaryEventObject':new(This)),
        TimePerFrame = (get({This, time}) div (get({This, '$class'})):getSize(This)),
        put({This, timeDelayHelper}, 'TimeDelayHelper':new(TimePerFrame)),
        put({This, player}, Player),
        (get({get({This, player}), '$class'})):start(get({This, player})).

% throws Exception
nextFrame(This) ->
        case (get({get({This, timeDelayHelper}), '$class'})):isTime(get({This, timeDelayHelper}), get({'GameTickTimeDelayHelperFactory':getInstance(), startTime})) of
            true ->
            (get({get({This, movieIndexedAnimationInterface}), '$class'})):nextFrame(get({This, movieIndexedAnimationInterface}));
            false -> ok
        end,
        case (get({This, '$class'})):isLastFrame(This) of
            true ->
            (fun(Target_N66887) -> (get({Target_N66887, '$class'})):fireEvent(Target_N66887, get({This, 'END_EVENT'})) end)('AnimationEventHandler':getInstance());
            false -> ok
        end.

isLastFrame(This) ->
        try
        case ((get({get({This, movieIndexedAnimationInterface}), '$class'})):getFrame(get({This, movieIndexedAnimationInterface})) =:= ((get({This, '$class'})):getSize(This) - 1)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

previousFrame(This) ->
        (get({get({This, movieIndexedAnimationInterface}), '$class'})):previousFrame(get({This, movieIndexedAnimationInterface})).

setFrame(This, Index) when is_integer(Index) ->
        (get({get({This, movieIndexedAnimationInterface}), '$class'})):setFrame(get({This, movieIndexedAnimationInterface}), Index).

getFrame(This) ->
        (get({get({This, movieIndexedAnimationInterface}), '$class'})):getFrame(get({This, movieIndexedAnimationInterface})).

getSize(This) ->
        (get({get({This, movieIndexedAnimationInterface}), '$class'})):getSize(get({This, movieIndexedAnimationInterface})).

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, (X + get({This, captionDx})), (Y + get({This, captionDy}))),
        (get({get({This, movieIndexedAnimationInterface}), '$class'})):paintXY(get({This, movieIndexedAnimationInterface}), Graphics, ((X + get({This, captionDx})) + get({This, dx})), ((Y + get({This, captionDy})) + get({This, dy}))).

paintThreedXYZ(This, Graphics, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        (get({get({This, animationInterface}), '$class'})):paintThreedXYZ(get({This, animationInterface}), Graphics, (X + get({This, captionDx})), (Y + get({This, captionDy})), Z),
        (get({get({This, movieIndexedAnimationInterface}), '$class'})):paintThreedXYZ(get({This, movieIndexedAnimationInterface}), Graphics, ((X + get({This, captionDx})) + get({This, dx})), ((Y + get({This, captionDy})) + get({This, dy})), Z).

