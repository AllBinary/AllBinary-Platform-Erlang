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
% import org.allbinary.game.graphics.hud.BasicHudFactory
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings

-module('NoGameNotificationHudSingleton').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'NoGameNotificationHudSingleton':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, gameNotificationHud}, get({'GameNotificationHud', 'NULL_GAME_NOTIFICATION'})),
    ok.


getInstance() ->
        get({'NoGameNotificationHudSingleton', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        try
            BasicHudFactory = 'BasicHudFactory':getInstance(),
            ok % Java nested type NoGameGameNotificationHud: move it to its own module
,
            put({This, gameNotificationHud}, 'NoGameGameNotificationHud':new())
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'CONSTRUCTOR'}), E)
        end.

getGameNotificationHud(This) ->
        get({This, gameNotificationHud}).

