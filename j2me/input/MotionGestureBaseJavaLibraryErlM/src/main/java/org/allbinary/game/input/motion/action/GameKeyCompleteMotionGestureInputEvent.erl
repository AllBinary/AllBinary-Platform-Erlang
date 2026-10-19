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
% import org.allbinary.game.input.GameKey
% import org.allbinary.game.input.GameKeyEventSourceInterface
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.GameKeyEventFactory
% import org.allbinary.game.input.mapping.InputToGameKeyMapping
% import org.allbinary.input.motion.gesture.MotionGestureInput
% import org.allbinary.string.CommonStrings

-module('GameKeyCompleteMotionGestureInputEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GameKeyEventSourceInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CompleteMotionGestureInputEvent', Function, Arguments).

init_fields(This) ->
    put({This, gameKeyEventFactory}, 'GameKeyEventFactory':getInstance()),
    put({This, 'SOURCE_ID'}, get({get({This, gameKeyEventFactory}), 'MOTION_GESTURE_SOURCE_ID'})),
    put({This, gameKey}, get({'GameKey', 'NULL_GAME_KEY'})),
    put({This, gameKeyEvent}, get({'GameKeyEvent', 'NONE'})),
    put({This, inputToGameKeyMapping}, undefined),
    ok.


new(Name, MotionGestureInput, InputToGameKeyMapping) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Name, MotionGestureInput, InputToGameKeyMapping),
    This.

init(This, Name, MotionGestureInput, InputToGameKeyMapping) when (is_list(Name) orelse Name =:= undefined) ->
        'CompleteMotionGestureInputEvent':init(This, Name, MotionGestureInput),
        init_fields(This),
        put({This, inputToGameKeyMapping}, InputToGameKeyMapping),
        (fun(Target_N66154) -> (get({Target_N66154, '$class'})):add(Target_N66154, This) end)('GameKeyCompleteMotionGestureInputEventFactory':getInstance()),
        (get({This, '$class'})):update(This).

getSourceId(This) ->
        get({This, 'SOURCE_ID'}).

update(This) ->
        try
            (get({This, '$class'})):setGameKey(This, (get({get({This, inputToGameKeyMapping}), '$class'})):getInstance(get({This, inputToGameKeyMapping}), (fun(Target_N66371) -> (get({Target_N66371, '$class'})):getId(Target_N66371) end)((get({This, '$class'})):getMotionGestureInput(This)))),
            (get({This, '$class'})):setGameKeyEvent(This, (get({get({This, gameKeyEventFactory}), '$class'})):getInstanceForInput(get({This, gameKeyEventFactory}), This, (get({This, '$class'})):getGameKey(This)))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'UPDATE'}), E)
        end.

setGameKeyEvent(This, GameKeyEvent) ->
        put({This, gameKeyEvent}, GameKeyEvent).

getGameKeyEvent(This) ->
        get({This, gameKeyEvent}).

setGameKey(This, GameKey) ->
        put({This, gameKey}, GameKey).

getGameKey(This) ->
        get({This, gameKey}).

