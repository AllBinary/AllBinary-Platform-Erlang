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
% import org.allbinary.game.input.LocalPlayerInputIdFactory
% import org.allbinary.logic.util.event.EventListenerInterface

-module('DownGameKeyEventHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('DownGameKeyEventHandlerBase', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'DownGameKeyEventHandler':new()),
    put({?MODULE, instanceArray}, array:from_list(['DownGameKeyEventHandlerBase':new(), 'DownGameKeyEventHandlerBase':new(), 'DownGameKeyEventHandlerBase':new(), 'DownGameKeyEventHandlerBase':new(), 'DownGameKeyEventHandlerBase':new(), 'DownGameKeyEventHandlerBase':new()])),
    ok.

init_fields(This) ->
    put({This, playerInputIdFactory}, 'LocalPlayerInputIdFactory':getInstance()),
    ok.


getInstance() ->
        get({'DownGameKeyEventHandler', instance}).

getInstanceForDevice(This, DeviceId) when is_integer(DeviceId) ->
        PlayerInputId = (get({get({This, playerInputIdFactory}), '$class'})):getPlayerForDevice(get({This, playerInputIdFactory}), DeviceId),
        array:get(PlayerInputId, get({'DownGameKeyEventHandler', instanceArray})).

getInstanceForPlayer(This, PlayerInputId) when is_integer(PlayerInputId) ->
        array:get(PlayerInputId, get({'DownGameKeyEventHandler', instanceArray})).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'DownGameKeyEventHandlerBase':'$init'(This),
    init_fields(This),
        ok.

removeAllListeners(This) ->
        'DownGameKeyEventHandlerBase':removeAllListeners(This),
        lists:foreach(fun(Index) ->
            (fun(Target_N66208) -> (get({Target_N66208, '$class'})):removeAllListeners(Target_N66208) end)(array:get(Index, get({'DownGameKeyEventHandler', instanceArray})))
        end, lists:seq((array:size(get({'DownGameKeyEventHandler', instanceArray})) - 1), 0, -1)).

removeListenerSingleThreaded(This, EventListenerInterface) ->
        'DownGameKeyEventHandlerBase':removeListenerSingleThreaded(This, EventListenerInterface),
        lists:foreach(fun(Index) ->
            (fun(Target_N66409) -> (get({Target_N66409, '$class'})):removeListenerSingleThreaded(Target_N66409, EventListenerInterface) end)(array:get(Index, get({'DownGameKeyEventHandler', instanceArray})))
        end, lists:seq((array:size(get({'DownGameKeyEventHandler', instanceArray})) - 1), 0, -1)).

removeListener(This, EventListenerInterface) ->
        'DownGameKeyEventHandlerBase':removeListener(This, EventListenerInterface),
        lists:foreach(fun(Index) ->
            (fun(Target_N66641) -> (get({Target_N66641, '$class'})):removeListener(Target_N66641, EventListenerInterface) end)(array:get(Index, get({'DownGameKeyEventHandler', instanceArray})))
        end, lists:seq((array:size(get({'DownGameKeyEventHandler', instanceArray})) - 1), 0, -1)).

