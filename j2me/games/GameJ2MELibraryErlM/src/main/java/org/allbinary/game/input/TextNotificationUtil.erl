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
% import org.allbinary.game.layer.hud.event.GameNotificationEvent
% import org.allbinary.game.layer.hud.event.GameNotificationEventHandler
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.media.audio.ErrorSound
% import org.allbinary.media.audio.PrimaryPlayerQueueFactory
% import org.allbinary.media.audio.SelectSound

-module('TextNotificationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'TextNotificationUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'TWO'}, (fun(Target_N66358) -> (get({Target_N66358, '$class'})):getAt(Target_N66358, 2) end)('SmallIntegerSingletonFactory':getInstance())),
    put({This, 'FALSE'}, get({'BooleanFactory':getInstance(), 'FALSE'})),
    put({This, gameNotificationEventHandler}, 'GameNotificationEventHandler':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'TextNotificationUtil', instance}).

% throws Exception
fireError(This, Message) when (is_list(Message) orelse Message =:= undefined) ->
        (fun(Target_N65963) -> (get({Target_N65963, '$class'})):add(Target_N65963, 'ErrorSound':getInstance()) end)('PrimaryPlayerQueueFactory':getInstance()),
        (get({This, '$class'})):fire(This, Message).

% throws Exception
fireNew(This, Message) when (is_list(Message) orelse Message =:= undefined) ->
        (fun(Target_N66092) -> (get({Target_N66092, '$class'})):add(Target_N66092, 'SelectSound':getInstance()) end)('PrimaryPlayerQueueFactory':getInstance()),
        (get({This, '$class'})):fire(This, Message).

% throws Exception
fireSuccess(This, Message) when (is_list(Message) orelse Message =:= undefined) ->
        (fun(Target_N66221) -> (get({Target_N66221, '$class'})):add(Target_N66221, 'SelectSound':getInstance()) end)('PrimaryPlayerQueueFactory':getInstance()),
        (get({This, '$class'})):fire(This, Message).

% throws Exception
fire(This, Message) when (is_list(Message) orelse Message =:= undefined) ->
        GameNotificationEvent = 'GameNotificationEvent':new(This, Message, get({This, 'TWO'}), get({'BasicColorFactory':getInstance(), 'RED'}), get({This, 'FALSE'})),
        (get({get({This, gameNotificationEventHandler}), '$class'})):fireEvent(get({This, gameNotificationEventHandler}), GameNotificationEvent).

