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
% package org.allbinary.game.ag.layer.hud.basic.notification
% import org.allbinary.game.layer.hud.event.GameNotificationEvent
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.java.bool.BooleanFactory
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD

-module('GameNotification').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_GAME_NOTIFICATION_EVENT'}, 'GameNotificationEvent':new(get({'NullUtil':getInstance(), 'NULL_OBJECT'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), 0, get({'BasicColorFactory':getInstance(), 'RED'}), get({'BooleanFactory':getInstance(), 'FALSE'}))),
    ok.

init_fields(This) ->
    put({This, stringList}, 'BasicArrayListD':new()),
    put({This, timeList}, 'BasicArrayListD':new()),
    put({This, colorList}, 'BasicArrayListD':new()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


add(This, String, Seconds, BasicColor) when (is_list(String) orelse String =:= undefined) ->
        case (not (get({get({This, stringList}), '$class'})):contains(get({This, stringList}), String)) of
            true ->
            (get({get({This, stringList}), '$class'})):add(get({This, stringList}), String),
            (get({get({This, timeList}), '$class'})):add(get({This, timeList}), Seconds),
            (get({get({This, colorList}), '$class'})):add(get({This, colorList}), BasicColor);
            false -> ok
        end.

clear(This) ->
        (get({get({This, stringList}), '$class'})):clear(get({This, stringList})),
        (get({get({This, timeList}), '$class'})):clear(get({This, timeList})),
        (get({get({This, colorList}), '$class'})):clear(get({This, colorList})).

getSize(This) ->
        (get({get({This, stringList}), '$class'})):size(get({This, stringList})).

