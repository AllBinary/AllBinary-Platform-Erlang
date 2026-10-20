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
% package org.allbinary.input.motion.gesture
% import org.allbinary.game.input.CompleteMotionGestureInputEvent
% import org.allbinary.util.BasicArrayList

-module('MotionGestureToMotionGestureActionAssociation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, list}, undefined),
    put({This, motionGestureAction}, undefined),
    ok.


new(List, CommandAction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, List, CommandAction),
    This.

'$init'(This, List, CommandAction) ->
    init_fields(This),
        put({This, list}, List),
        put({This, motionGestureAction}, CommandAction).

getMotionGesture(This) ->
        get({This, list}).

setMotionGestures(This, List) ->
        put({This, list}, List).

getCommandAction(This) ->
        get({This, motionGestureAction}).

setMotionGestureAction(This, CommandAction) ->
        put({This, motionGestureAction}, CommandAction).

isMotionGestureArrayEquals(This, AList) ->
        try
        Size = (get({AList, '$class'})):size(AList),
        case ((get({get({This, list}), '$class'})):size(get({This, list})) =/= Size) of
            true ->
            throw({'$return', false});
            false -> ok
        end,
        lists:foreach(fun(I) ->
            case (array:get(I, get({AList, objectArray})) =/= array:get(I, get({get({This, list}), objectArray}))) of
                true ->
                throw({'$return', false});
                false -> ok
            end
        end, lists:seq((Size - 1), 0, -1)),
        true
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

