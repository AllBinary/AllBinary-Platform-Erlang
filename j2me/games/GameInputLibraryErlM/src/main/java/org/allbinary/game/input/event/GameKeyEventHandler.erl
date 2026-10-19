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
% package org.allbinary.game.input.event
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.util.event.EventListenerInterface
% import org.allbinary.string.CommonStrings

-module('GameKeyEventHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameKeyEventHandler':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, pressGameKeyEventHandler}, 'PressGameKeyEventHandler':getInstance()),
    put({This, upGameKeyEventHandler}, 'UpGameKeyEventHandler':getInstance()),
    put({This, downGameKeyEventHandler}, 'DownGameKeyEventHandler':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'GameKeyEventHandler', instance}).

removeAllListeners(This) ->
        (get({get({This, pressGameKeyEventHandler}), '$class'})):removeAllListeners(get({This, pressGameKeyEventHandler})),
        (get({get({This, upGameKeyEventHandler}), '$class'})):removeAllListeners(get({This, upGameKeyEventHandler})),
        (get({get({This, downGameKeyEventHandler}), '$class'})):removeAllListeners(get({This, downGameKeyEventHandler})).

addListenerForPlayer(This, EventListenerInterface, PlayerInputId) when is_integer(PlayerInputId) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({EventListenerInterface, '$class'})):toString(EventListenerInterface), This, get({get({This, commonStrings}), 'ADD_LISTENER'})),
        (get({get({This, pressGameKeyEventHandler}), '$class'})):addListenerSingleThreaded(get({This, pressGameKeyEventHandler}), EventListenerInterface),
        (fun(Target_N66248) -> (get({Target_N66248, '$class'})):addListenerSingleThreaded(Target_N66248, EventListenerInterface) end)((get({get({This, upGameKeyEventHandler}), '$class'})):getInstanceForPlayer(get({This, upGameKeyEventHandler}), PlayerInputId)),
        (fun(Target_N66301) -> (get({Target_N66301, '$class'})):addListenerSingleThreaded(Target_N66301, EventListenerInterface) end)((get({get({This, downGameKeyEventHandler}), '$class'})):getInstanceForPlayer(get({This, downGameKeyEventHandler}), PlayerInputId)).

addListener(This, EventListenerInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({EventListenerInterface, '$class'})):toString(EventListenerInterface), This, get({get({This, commonStrings}), 'ADD_LISTENER'})),
        (get({get({This, pressGameKeyEventHandler}), '$class'})):addListenerSingleThreaded(get({This, pressGameKeyEventHandler}), EventListenerInterface),
        (get({get({This, upGameKeyEventHandler}), '$class'})):addListenerSingleThreaded(get({This, upGameKeyEventHandler}), EventListenerInterface),
        (get({get({This, downGameKeyEventHandler}), '$class'})):addListenerSingleThreaded(get({This, downGameKeyEventHandler}), EventListenerInterface).

removeListener(This, EventListenerInterface) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({EventListenerInterface, '$class'})):toString(EventListenerInterface), This, get({get({This, commonStrings}), 'REMOVE_LISTENER'})),
        (get({get({This, pressGameKeyEventHandler}), '$class'})):removeListenerSingleThreaded(get({This, pressGameKeyEventHandler}), EventListenerInterface),
        (get({get({This, upGameKeyEventHandler}), '$class'})):removeListenerSingleThreaded(get({This, upGameKeyEventHandler}), EventListenerInterface),
        (get({get({This, downGameKeyEventHandler}), '$class'})):removeListenerSingleThreaded(get({This, downGameKeyEventHandler}), EventListenerInterface).

