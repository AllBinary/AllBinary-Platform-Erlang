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
% package org.allbinary.logic.system.security.licensing
% import org.allbinary.game.layer.hud.event.GameNotificationEvent
% import org.allbinary.game.layer.hud.event.GameNotificationEventHandler
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.media.audio.ErrorSound
% import org.allbinary.media.audio.PrimaryPlayerQueueFactory

-module('LockedFeatureNotificationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LockedFeatureNotificationUtil':new()),
    ok.

init_fields(This) ->
    put({This, gameNotificationEvent}, 'GameNotificationEvent':new(This, get({'LicenseStrings':getInstance(), 'LOCKED'}), (fun(Target_N66021) -> (get({Target_N66021, '$class'})):getAt(Target_N66021, 3) end)('SmallIntegerSingletonFactory':getInstance()), get({'BasicColorFactory':getInstance(), 'RED'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'LockedFeatureNotificationUtil', instance}).

% throws Exception
fire(This) ->
        (fun(Target_N66128) -> (get({Target_N66128, '$class'})):add(Target_N66128, 'ErrorSound':getInstance()) end)('PrimaryPlayerQueueFactory':getInstance()),
        (fun(Target_N66175) -> (get({Target_N66175, '$class'})):fireEvent(Target_N66175, get({This, gameNotificationEvent})) end)('GameNotificationEventHandler':getInstance()).

% throws Exception
fireWithColor(This, BasicColor) ->
        (fun(Target_N66253) -> (get({Target_N66253, '$class'})):add(Target_N66253, 'ErrorSound':getInstance()) end)('PrimaryPlayerQueueFactory':getInstance()),
        (get({get({This, gameNotificationEvent}), '$class'})):setBasicColorP(get({This, gameNotificationEvent}), BasicColor),
        (fun(Target_N66334) -> (get({Target_N66334, '$class'})):fireEvent(Target_N66334, get({This, gameNotificationEvent})) end)('GameNotificationEventHandler':getInstance()).

