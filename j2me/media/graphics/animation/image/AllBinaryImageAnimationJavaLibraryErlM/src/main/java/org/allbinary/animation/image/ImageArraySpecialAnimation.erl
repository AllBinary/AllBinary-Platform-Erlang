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
% package org.allbinary.animation.image
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.special.SpecialAnimationInterface
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper

-module('ImageArraySpecialAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements SpecialAnimationInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageArrayAnimation', Function, Arguments).

init_fields(This) ->
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(270)),
    put({This, loopCount}, 0),
    put({This, loopCountTotal}, 1),
    ok.


new(ImageArray, AnimationBehavior) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ImageArray, AnimationBehavior),
    This.

'$init'(This, ImageArray, AnimationBehavior) when (is_tuple(ImageArray) orelse ImageArray =:= undefined) ->
        'ImageArrayAnimation':'$init'(This, ImageArray, AnimationBehavior),
        init_fields(This),
        (get({This, '$class'})):reset(This).

getLoopCount(This) ->
        get({This, loopCount}).

setLastFrame(This) ->
        (get({get({This, circularIndexUtil}), '$class'})):setIndex(get({This, circularIndexUtil}), ((get({get({This, circularIndexUtil}), '$class'})):getSize(get({This, circularIndexUtil})) - 1)).

reset(This) ->
        (get({This, '$class'})):setFrame(This, ((get({This, '$class'})):getSize(This) - 1)),
        put({This, loopCount}, 0).

nextFrame(This) ->
        case ((get({This, '$class'})):getFrame(This) > 0) of
            true ->
            case (get({get({This, timeDelayHelper}), '$class'})):isTime(get({This, timeDelayHelper}), get({'GameTickTimeDelayHelperFactory':getInstance(), startTime})) of
                true ->
                (get({This, '$class'})):previousFrame(This),
                case ((get({This, '$class'})):getFrame(This) =:= 0) of
                    true ->
                    put({This, loopCount}, get({This, loopCount}) + 1);
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end.

isComplete(This) ->
        try
        case ((get({This, loopCount}) < get({This, loopCountTotal})) orelse ((get({This, '$class'})):getFrame(This) =/= 0)) of
            true ->
            throw({'$return', false});
            false ->
            throw({'$return', true})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        put({local, x}, X),
        put({local, y}, Y),
        put({local, x}, ((fun(Target_N66608) -> (get({Target_N66608, '$class'})):getLastHalfWidth(Target_N66608) end)('DisplayInfoSingleton':getInstance()) - (((fun(Target_N66639) -> (get({Target_N66639, '$class'})):getWidth(Target_N66639) end)((get({This, '$class'})):getImage(This, (get({get({This, circularIndexUtil}), '$class'})):getIndex(get({This, circularIndexUtil})))) bsr 1)))),
        put({local, y}, 5),
        'ImageArrayAnimation':paintXY(This, Graphics, get({local, x}), get({local, y})).

