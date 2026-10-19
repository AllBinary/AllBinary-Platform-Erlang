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
% package org.allbinary.game.input
% import org.allbinary.input.motion.gesture.MotionGestureInput
% import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.string.CommonStrings

-module('CompleteMotionGestureInputEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements CompleteMotionGestureInputInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryEventObject', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, name}, get({'StringUtil':getInstance(), 'EMPTY_STRING'})),
    put({This, motionGestureInput}, get({'TouchMotionGestureFactory':getInstance(), 'NO_MOTION'})),
    ok.


new(Name, MotionGestureInput) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, MotionGestureInput),
    This.

init(This, Name, MotionGestureInput) when (is_list(Name) orelse Name =:= undefined) ->
        'AllBinaryEventObject':init(This, MotionGestureInput),
        init_fields(This),
        (get({This, '$class'})):setName(This, Name),
        try
            (get({This, '$class'})):setMotionGestureInput(This, MotionGestureInput)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "InputToGameKeyEventAction", E)
        end.

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

getName(This) ->
        get({This, name}).

setMotionGestureInput(This, MotionGestureInput) ->
        put({This, motionGestureInput}, MotionGestureInput).

getMotionGestureInput(This) ->
        get({This, motionGestureInput}).

