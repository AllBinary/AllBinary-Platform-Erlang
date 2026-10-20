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
% import org.allbinary.game.input.mapping.InputToGameKeyMapping
% import org.allbinary.input.motion.gesture.MotionGestureInput

-module('GameKeyCompleteMotionGestureInputEvent').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GameKeyEventSourceInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CompleteMotionGestureInputEvent', Function, Arguments).

init_fields(This) ->
    put({This, gameKey}, get({'GameKey', 'NULL_GAME_KEY'})),
    put({This, gameKeyEvent}, get({'GameKeyEvent', 'NONE'})),
    ok.


new(Name, MotionGestureInput, InputToGameKeyMapping) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, MotionGestureInput, InputToGameKeyMapping),
    This.

'$init'(This, Name, MotionGestureInput, InputToGameKeyMapping) when (is_list(Name) orelse Name =:= undefined) ->
        'CompleteMotionGestureInputEvent':'$init'(This, Name, MotionGestureInput),
        init_fields(This).

getSourceId(This) ->
        0.

update(This) ->
        ok.

setGameKeyEvent(This, GameKeyEvent) ->
        put({This, gameKeyEvent}, GameKeyEvent).

getGameKeyEvent(This) ->
        get({This, gameKeyEvent}).

setGameKey(This, GameKey) ->
        put({This, gameKey}, GameKey).

getGameKey(This) ->
        get({This, gameKey}).

