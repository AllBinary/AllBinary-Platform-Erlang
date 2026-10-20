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
% import org.allbinary.game.input.analog.AnalogLocationInputFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker

-module('LocalPlayerInputIdFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LocalPlayerInputIdFactory':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'MAX_NUMBER_OF_PLAYERS'}, 6),
    put({This, 'MAX_FAST_DEVICEID'}, 65),
    put({This, deviceIdToplayerId}, array:new(get({This, 'MAX_FAST_DEVICEID'}), {default, 0})),
    put({This, playerIdToDeviceId}, array:new(get({This, 'MAX_NUMBER_OF_PLAYERS'}), {default, 0})),
    put({This, playersInPlay}, array:new(get({This, 'MAX_NUMBER_OF_PLAYERS'}), {default, false})),
    put({This, totalDevicesMapped}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        lists:foreach(fun(Index) ->
            put({This, deviceIdToplayerId}, array:set(Index, (-1), get({This, deviceIdToplayerId})))
        end, lists:seq((array:size(get({This, deviceIdToplayerId})) - 1), 0, -1)).

getInstance() ->
        get({'LocalPlayerInputIdFactory', instance}).

getDeviceId(This, PlayerInputId) when is_integer(PlayerInputId) ->
        array:get(PlayerInputId, get({This, playerIdToDeviceId})).

getPlayerForDevice(This, DeviceId) when is_integer(DeviceId) ->
        try
        put({local, index}, 0),
        case (DeviceId < get({This, 'MAX_FAST_DEVICEID'})) of
            true ->
            PlayerInputId = array:get(DeviceId, get({This, deviceIdToplayerId})),
            case (PlayerInputId =/= (-1)) of
                true ->
                throw({'$return', PlayerInputId});
                false -> ok
            end;
            false ->
            lists:foreach(fun(Index) ->
                case (array:get(get({local, index}), get({This, playerIdToDeviceId})) =:= DeviceId) of
                    true ->
                    throw({'$return', get({local, index})});
                    false -> ok
                end
            end, lists:seq((get({This, totalDevicesMapped}) - 1), 0, -1))
        end,
        put({local, index}, get({This, totalDevicesMapped})),
        case (DeviceId < get({This, 'MAX_FAST_DEVICEID'})) of
            true ->
            put({This, deviceIdToplayerId}, array:set(DeviceId, get({local, index}), get({This, deviceIdToplayerId})));
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66738) -> (get({Target_N66738, '$class'})):toString(Target_N66738) end)((fun(Target_N66745) -> (get({Target_N66745, '$class'})):append(Target_N66745, " beyond fast Id list") end)((fun(Target_N66752) -> (get({Target_N66752, '$class'})):appendint(Target_N66752, DeviceId) end)((fun(Target_N66759) -> (get({Target_N66759, '$class'})):append(Target_N66759, "Added DeviceId: ") end)('StringMaker':new())))), This, "getPlayerForDevice")
        end,
        put({This, playerIdToDeviceId}, array:set(get({local, index}), DeviceId, get({This, playerIdToDeviceId}))),
        (fun(Target_N66914) -> (get({Target_N66914, '$class'})):addPlayer(Target_N66914, get({This, totalDevicesMapped})) end)('AnalogLocationInputFactory':getInstance()),
        put({This, totalDevicesMapped}, get({This, totalDevicesMapped}) + 1),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66996) -> (get({Target_N66996, '$class'})):toString(Target_N66996) end)((fun(Target_N67003) -> (get({Target_N67003, '$class'})):appendint(Target_N67003, get({This, totalDevicesMapped})) end)((fun(Target_N67010) -> (get({Target_N67010, '$class'})):append(Target_N67010, " Total: ") end)((fun(Target_N67017) -> (get({Target_N67017, '$class'})):appendint(Target_N67017, get({local, index})) end)((fun(Target_N67024) -> (get({Target_N67024, '$class'})):append(Target_N67024, " at: ") end)((fun(Target_N67031) -> (get({Target_N67031, '$class'})):appendint(Target_N67031, DeviceId) end)((fun(Target_N67038) -> (get({Target_N67038, '$class'})):append(Target_N67038, "Added DeviceId: ") end)('StringMaker':new()))))))), This, "getPlayerForDevice"),
        get({local, index})
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getTotalDevicesInPlay(This) ->
        put({local, total}, 0),
        lists:foreach(fun(Index) ->
            case (array:get(Index, get({This, playersInPlay})) =:= true) of
                true ->
                put({local, total}, get({local, total}) + 1);
                false -> ok
            end
        end, lists:seq((get({This, totalDevicesMapped}) - 1), 0, -1)),
        get({local, total}).

isPlayerInPlay(This, PlayerInputId) when is_integer(PlayerInputId) ->
        array:get(PlayerInputId, get({This, playersInPlay})).

setPlayerInPlay(This, PlayerInputId) when is_integer(PlayerInputId) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67500) -> (get({Target_N67500, '$class'})):toString(Target_N67500) end)((fun(Target_N67507) -> (get({Target_N67507, '$class'})):appendint(Target_N67507, PlayerInputId) end)((fun(Target_N67514) -> (get({Target_N67514, '$class'})):append(Target_N67514, "Setting PlayerInPlay with playerInputId: ") end)('StringMaker':new()))), This, "setPlayerInPlay"),
        put({This, playersInPlay}, array:set(PlayerInputId, true, get({This, playersInPlay}))).

setPlayerOutOfPlay(This, PlayerInputId) when is_integer(PlayerInputId) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67664) -> (get({Target_N67664, '$class'})):toString(Target_N67664) end)((fun(Target_N67671) -> (get({Target_N67671, '$class'})):appendint(Target_N67671, PlayerInputId) end)((fun(Target_N67678) -> (get({Target_N67678, '$class'})):append(Target_N67678, "Setting PlayerOutOfPlay with playerInputId: ") end)('StringMaker':new()))), This, "setPlayerOutOfPlay"),
        put({This, playersInPlay}, array:set(PlayerInputId, false, get({This, playersInPlay}))).

getPlayersInPlay(This) ->
        get({This, playersInPlay}).

