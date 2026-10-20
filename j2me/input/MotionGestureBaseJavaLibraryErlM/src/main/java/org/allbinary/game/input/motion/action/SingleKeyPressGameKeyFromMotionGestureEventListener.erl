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
% package org.allbinary.game.input.motion.action
% import org.allbinary.game.input.CompleteMotionGestureInputEvent
% import org.allbinary.game.input.CompleteMotionGestureInputEventListener
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.PressGameKeyEventHandler
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.string.CommonStrings

-module('SingleKeyPressGameKeyFromMotionGestureEventListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CompleteMotionGestureInputEventListener', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'CompleteMotionGestureInputEventListener':'$init'(This),
    init_fields(This).


onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

onCompleteMotionGestureInputEvent(This, CompleteMotionGestureInputEvent) ->
        try
            GameKeyCompleteMotionGestureInputEvent = CompleteMotionGestureInputEvent,
            GameKeyEvent = (get({GameKeyCompleteMotionGestureInputEvent, '$class'})):getGameKeyEvent(GameKeyCompleteMotionGestureInputEvent),
            (fun(Target_N66189) -> (get({Target_N66189, '$class'})):fireEvent(Target_N66189, GameKeyEvent) end)('PressGameKeyEventHandler':getInstance())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "onCompleteMotionGestureInputEvent", E)
        end.

