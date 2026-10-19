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

-module('UpGameKeyEventHandler').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('UpGameKeyEventHandlerBase', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'UpGameKeyEventHandler':new()),
    put({?MODULE, instanceArray}, array:from_list(['UpGameKeyEventHandlerBase':new(), 'UpGameKeyEventHandlerBase':new(), 'UpGameKeyEventHandlerBase':new(), 'UpGameKeyEventHandlerBase':new(), 'UpGameKeyEventHandlerBase':new(), 'UpGameKeyEventHandlerBase':new()])),
    ok.

init_fields(This) ->
    put({This, playerInputIdFactory}, 'LocalPlayerInputIdFactory':getInstance()),
    ok.


getInstance() ->
        get({'UpGameKeyEventHandler', instance}).

getInstanceForDevice(This, DeviceId) when is_integer(DeviceId) ->
        PlayerInputId = (get({get({This, playerInputIdFactory}), '$class'})):getPlayerForDevice(get({This, playerInputIdFactory}), DeviceId),
        array:get(PlayerInputId, get({'UpGameKeyEventHandler', instanceArray})).

getInstanceForPlayer(This, PlayerInputId) when is_integer(PlayerInputId) ->
        array:get(PlayerInputId, get({'UpGameKeyEventHandler', instanceArray})).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    'UpGameKeyEventHandlerBase':init(This),
    init_fields(This),
        ok.

removeAllListeners(This) ->
        'UpGameKeyEventHandlerBase':removeAllListeners(This),
        lists:foreach(fun(Index) ->
            (fun(Target_N66208) -> (get({Target_N66208, '$class'})):removeAllListeners(Target_N66208) end)(array:get(Index, get({'UpGameKeyEventHandler', instanceArray})))
        end, lists:seq((array:size(get({'UpGameKeyEventHandler', instanceArray})) - 1), 0, -1)).

removeListenerSingleThreaded(This, EventListenerInterface) ->
        'UpGameKeyEventHandlerBase':removeListenerSingleThreaded(This, EventListenerInterface),
        lists:foreach(fun(Index) ->
            (fun(Target_N66409) -> (get({Target_N66409, '$class'})):removeListenerSingleThreaded(Target_N66409, EventListenerInterface) end)(array:get(Index, get({'UpGameKeyEventHandler', instanceArray})))
        end, lists:seq((array:size(get({'UpGameKeyEventHandler', instanceArray})) - 1), 0, -1)).

removeListener(This, EventListenerInterface) ->
        'UpGameKeyEventHandlerBase':removeListener(This, EventListenerInterface),
        lists:foreach(fun(Index) ->
            (fun(Target_N66641) -> (get({Target_N66641, '$class'})):removeListener(Target_N66641, EventListenerInterface) end)(array:get(Index, get({'UpGameKeyEventHandler', instanceArray})))
        end, lists:seq((array:size(get({'UpGameKeyEventHandler', instanceArray})) - 1), 0, -1)).

