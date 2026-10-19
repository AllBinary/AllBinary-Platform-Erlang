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
% package org.allbinary.game.input.mapping
% import org.allbinary.game.input.mapping.event.InputMappingEvent
% import org.allbinary.game.input.mapping.event.InputMappingEventListenerInterface
% import org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEventFactory
% import org.allbinary.input.motion.button.BasicTouchInputFactory
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings

-module('MotionInputMappingEventListener').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements InputMappingEventListenerInterface

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

% throws Exception
onInputMappingEvent(This, InputMappingEvent) ->
        (fun(Target_N65980) -> (get({Target_N65980, '$class'})):updateAll(Target_N65980) end)('GameKeyCompleteMotionGestureInputEventFactory':getInstance()),
        (fun(Target_N66008) -> (get({Target_N66008, '$class'})):updateAll(Target_N66008, (get({InputMappingEvent, '$class'})):getInputToGameKeyMapping(InputMappingEvent)) end)('BasicTouchInputFactory':getInstance()).

