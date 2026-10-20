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
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.input.event.GameKeyEventListenerInterface
% import org.allbinary.logic.communication.log.ForcedLogUtil
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.util.event.AllBinaryEventObject
% import org.allbinary.logic.util.event.EventStrings
% import org.allbinary.string.CommonLabels
% import org.allbinary.util.BasicArrayList

-module('PlayerGameInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GameKeyEventListenerInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameInput', Function, Arguments).

init_fields(This) ->
    put({This, gameInputStrings}, 'GameInputStrings':getInstance()),
    put({This, playerInputId}, 0),
    ok.


new(GameKeyEventList, RemovalGameKeyEventList, PlayerInputId) when is_integer(PlayerInputId) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GameKeyEventList, RemovalGameKeyEventList, PlayerInputId),
    This.

'$init'(This, GameKeyEventList, RemovalGameKeyEventList, PlayerInputId) when is_integer(PlayerInputId) ->
        'GameInput':'$init'(This, GameKeyEventList, RemovalGameKeyEventList),
        init_fields(This),
        put({This, playerInputId}, PlayerInputId).

onPressGameKeyEvent(This, GameKeyEvent) ->
        (get({This, '$class'})):add(This, GameKeyEvent),
        (get({This, '$class'})):addForRemoval(This, GameKeyEvent).

onDownGameKeyEvent(This, GameKeyEvent) ->
        (get({This, '$class'})):add(This, GameKeyEvent).

onDownKeyEvent(This, GameKeyEvent) ->
        (get({This, '$class'})):add(This, GameKeyEvent),
        (get({This, '$class'})):addForRemoval(This, GameKeyEvent).

onDownKey(This, GameKeyEvent) ->
        'PreLogUtil':put((fun(Target_N66484) -> (get({Target_N66484, '$class'})):toString(Target_N66484) end)((fun(Target_N66491) -> (get({Target_N66491, '$class'})):append(Target_N66491, (get({GameKeyEvent, '$class'})):toString(GameKeyEvent)) end)((fun(Target_N66498) -> (get({Target_N66498, '$class'})):append(Target_N66498, get({'CommonLabels':getInstance(), 'START_LABEL'})) end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'ON_DOWN_GAME_KEY'})).

onUpGameKeyEvent(This, GameKeyEvent) ->
        (get({This, '$class'})):addForRemoval(This, GameKeyEvent).

onUpKeyEvent(This, GameKeyEvent) ->
        ok.

onEvent(This, EventObject) ->
        'ForcedLogUtil':log(get({'EventStrings':getInstance(), 'PERFORMANCE_MESSAGE'}), This).

getPlayerInputId(This) ->
        get({This, playerInputId}).

