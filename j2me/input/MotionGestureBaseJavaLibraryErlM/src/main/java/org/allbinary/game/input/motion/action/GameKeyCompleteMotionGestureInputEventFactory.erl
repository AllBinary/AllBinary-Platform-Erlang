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
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonLabels
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('GameKeyCompleteMotionGestureInputEventFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, 'GameKeyCompleteMotionGestureInputEventFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, eventList}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'GameKeyCompleteMotionGestureInputEventFactory', 'SINGLETON'}).

add(This, GameKeyCompleteMotionGestureInputEvent) ->
        (get({get({This, eventList}), '$class'})):add(get({This, eventList}), GameKeyCompleteMotionGestureInputEvent).

updateAll(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66043) -> (get({Target_N66043, '$class'})):toString(Target_N66043) end)((fun(Target_N66050) -> (get({Target_N66050, '$class'})):appendint(Target_N66050, (get({get({This, eventList}), '$class'})):size(get({This, eventList}))) end)((fun(Target_N66057) -> (get({Target_N66057, '$class'})):append(Target_N66057, get({'CommonLabels':getInstance(), 'START_LABEL'})) end)('StringMaker':new()))), This, "updateAll"),
        lists:foreach(fun(Index) ->
            GameKeyCompleteMotionGestureInputEvent = array:get(Index, get({get({This, eventList}), objectArray})),
            (get({GameKeyCompleteMotionGestureInputEvent, '$class'})):update(GameKeyCompleteMotionGestureInputEvent)
        end, lists:seq(((get({get({This, eventList}), '$class'})):size(get({This, eventList})) - 1), 0, -1)).

