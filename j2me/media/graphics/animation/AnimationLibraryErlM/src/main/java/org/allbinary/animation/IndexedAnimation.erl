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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.PrimitiveIntUtil
% import org.allbinary.string.CommonStrings

-module('IndexedAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements IndexedAnimationInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Animation', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, animationBehaviorP}, undefined),
    ok.


new(AnimationBehavior) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnimationBehavior),
    This.

init(This, AnimationBehavior) ->
    'Animation':init(This),
    init_fields(This),
        put({This, animationBehaviorP}, AnimationBehavior).

getAnimationBehavior(This) ->
        get({This, animationBehaviorP}).

reset(This) ->
        (get({get({This, animationBehaviorP}), '$class'})):reset(get({This, animationBehaviorP})),
        (get({This, '$class'})):setFrame(This, 0).

setFrame(This, Index) when is_integer(Index) ->
        ok.

getFrame(This) ->
        0.

% throws Exception
getAnimationSize(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

getSize(This) ->
        0.

previousFrame(This) ->
        ok.

isLastFrame(This) ->
        try
        case ((get({This, '$class'})):getFrame(This) =:= ((get({This, '$class'})):getSize(This) - 1)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setSequence(This, Sequence) when (is_tuple(Sequence) orelse Sequence =:= undefined) ->
        ok.

getSequence(This) ->
        'PrimitiveIntUtil':getArrayInstance().

setState(This, IndexedAnimation) ->
        (get({This, '$class'})):setFrame(This, (get({IndexedAnimation, '$class'})):getFrame(IndexedAnimation)),
        (get({This, '$class'})):setDx(This, (get({IndexedAnimation, '$class'})):getDx(IndexedAnimation)),
        (get({This, '$class'})):setDy(This, (get({IndexedAnimation, '$class'})):getDy(IndexedAnimation)).

getWidth(This) ->
        0.

getHeight(This) ->
        0.

