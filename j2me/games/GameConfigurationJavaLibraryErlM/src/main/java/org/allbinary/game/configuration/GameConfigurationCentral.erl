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
% package org.allbinary.game.configuration
% import org.allbinary.game.configuration.persistance.GameConfigurationPersistanceSingleton
% import org.allbinary.game.configuration.persistance.KeyValuePersistance
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.string.CommonSeps
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.ABHashtable
% import org.allbinary.util.BasicArrayList

-module('GameConfigurationCentral').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'SINGLETON'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'SCALE'}, undefined),
    put({This, 'ORIENTATION'}, undefined),
    put({This, 'SENSOR_UPDATE_RATE'}, undefined),
    put({This, 'VIBRATION'}, undefined),
    put({This, 'CHALLENGE_LEVEL'}, undefined),
    put({This, 'COLLIDE_DAMAGE'}, undefined),
    put({This, 'DURABILITY_CHALLENGE_LEVEL'}, undefined),
    put({This, 'SPEED_CHALLENGE_LEVEL'}, undefined),
    put({This, 'ATTACK_CHALLENGE_LEVEL'}, undefined),
    put({This, 'CONTROL_LEVEL'}, undefined),
    put({This, 'PLAYER_INPUT_WAIT'}, undefined),
    put({This, 'SPEED'}, undefined),
    put({This, 'SOUND_VOLUME'}, undefined),
    put({This, 'MAX_GAME_OBJECTS'}, undefined),
    put({This, 'MAX_LAYERS'}, undefined),
    put({This, gameControlFidelity}, 36),
    ok.


getInstance() ->
        case (get({'GameConfigurationCentral', 'SINGLETON'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'GameConfigurationCentral', 'SINGLETON'}, 'GameConfigurationCentral':new());
            false -> ok
        end,
        get({'GameConfigurationCentral', 'SINGLETON'}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        put({This, 'SCALE'}, 'GameConfiguration':new("Scale", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 2), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 3))),
        put({This, 'ORIENTATION'}, 'GameConfiguration':new("Orientation", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 8))),
        put({This, 'SENSOR_UPDATE_RATE'}, 'GameConfiguration':new("Sensor Update Rate", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 3))),
        put({This, 'VIBRATION'}, 'GameConfiguration':new("Vibration", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 3))),
        put({This, 'CHALLENGE_LEVEL'}, 'GameConfiguration':new("Global Challenge Level", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 3), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 1), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10))),
        put({This, 'COLLIDE_DAMAGE'}, 'GameConfiguration':new("Collide Damage Challenge Level", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 3), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 1), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10))),
        put({This, 'DURABILITY_CHALLENGE_LEVEL'}, 'GameConfiguration':new("Enemy Durability Challenge Level", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 3), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 1), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10))),
        put({This, 'SPEED_CHALLENGE_LEVEL'}, 'GameConfiguration':new("Enemy Speed Challenge Level", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 3), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 1), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10))),
        put({This, 'ATTACK_CHALLENGE_LEVEL'}, 'GameConfiguration':new("Enemy Attack Challenge Level", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 3), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 1), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10))),
        put({This, 'CONTROL_LEVEL'}, 'GameConfiguration':new("Control Fidelity", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 5), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 1), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10))),
        put({This, 'PLAYER_INPUT_WAIT'}, 'GameConfiguration':new("Input Wait", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 5), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 1), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10))),
        put({This, 'SPEED'}, 'GameConfiguration':new("Game Speed (Device Specific)", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 5), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 1), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10))),
        put({This, 'SOUND_VOLUME'}, 'GameConfiguration':new("Sound Volume", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 6), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 0), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 10))),
        put({This, 'MAX_GAME_OBJECTS'}, 'GameConfiguration':new("Max Game Objects", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 20), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 1), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 50))),
        put({This, 'MAX_LAYERS'}, 'GameConfiguration':new("Max Layers", (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 20), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 1), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, 50))).

load(This, AbeClientInformation) ->
        CommonStrings = 'CommonStrings':getInstance(),
        try
            SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
            KeyValuePersistance = 'GameConfigurationPersistanceSingleton':getInstance(),
            (get({KeyValuePersistance, '$class'})):clear(KeyValuePersistance),
            (get({KeyValuePersistance, '$class'})):loadAll(KeyValuePersistance, AbeClientInformation),
            List = (get({KeyValuePersistance, '$class'})):getIds(KeyValuePersistance),
            case ((get({List, '$class'})):size(List) > 0) of
                true ->
                Hashtable = (get({KeyValuePersistance, '$class'})):get(KeyValuePersistance, 0),
                AnyType = (get({get({This, 'SCALE'}), '$class'})):getName(get({This, 'SCALE'})),
                Value = (get({Hashtable, '$class'})):get(Hashtable, AnyType),
                (get({get({This, 'SCALE'}), '$class'})):setValue(get({This, 'SCALE'}), (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, (fun(Target_N69046) -> (get({Target_N69046, '$class'})):intValue(Target_N69046) end)(allbinary_java:to_string(Value))));
                false ->
                (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "No Game Configuration To Load", This, get({CommonStrings, 'LOAD'}))
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, get({CommonStrings, 'LOAD'}), E)
        end.

setGameControlFidelity(This, GameControlFidelity) when is_integer(GameControlFidelity) ->
        put({This, gameControlFidelity}, GameControlFidelity).

getGameControlFidelity(This) ->
        get({This, gameControlFidelity}).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        CommonStrings = 'CommonSeps':getInstance(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'SCALE'}), '$class'})):getName(get({This, 'SCALE'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N69605) -> (get({Target_N69605, '$class'})):intValue(Target_N69605) end)((get({get({This, 'SCALE'}), '$class'})):getValue(get({This, 'SCALE'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'ORIENTATION'}), '$class'})):getName(get({This, 'ORIENTATION'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N69775) -> (get({Target_N69775, '$class'})):intValue(Target_N69775) end)((get({get({This, 'ORIENTATION'}), '$class'})):getValue(get({This, 'ORIENTATION'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'SENSOR_UPDATE_RATE'}), '$class'})):getName(get({This, 'SENSOR_UPDATE_RATE'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N69945) -> (get({Target_N69945, '$class'})):intValue(Target_N69945) end)((get({get({This, 'SENSOR_UPDATE_RATE'}), '$class'})):getValue(get({This, 'SENSOR_UPDATE_RATE'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'VIBRATION'}), '$class'})):getName(get({This, 'VIBRATION'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N70115) -> (get({Target_N70115, '$class'})):intValue(Target_N70115) end)((get({get({This, 'VIBRATION'}), '$class'})):getValue(get({This, 'VIBRATION'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'CHALLENGE_LEVEL'}), '$class'})):getName(get({This, 'CHALLENGE_LEVEL'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N70285) -> (get({Target_N70285, '$class'})):intValue(Target_N70285) end)((get({get({This, 'CHALLENGE_LEVEL'}), '$class'})):getValue(get({This, 'CHALLENGE_LEVEL'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'COLLIDE_DAMAGE'}), '$class'})):getName(get({This, 'COLLIDE_DAMAGE'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N70455) -> (get({Target_N70455, '$class'})):intValue(Target_N70455) end)((get({get({This, 'COLLIDE_DAMAGE'}), '$class'})):getValue(get({This, 'COLLIDE_DAMAGE'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'DURABILITY_CHALLENGE_LEVEL'}), '$class'})):getName(get({This, 'DURABILITY_CHALLENGE_LEVEL'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N70625) -> (get({Target_N70625, '$class'})):intValue(Target_N70625) end)((get({get({This, 'DURABILITY_CHALLENGE_LEVEL'}), '$class'})):getValue(get({This, 'DURABILITY_CHALLENGE_LEVEL'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'SPEED_CHALLENGE_LEVEL'}), '$class'})):getName(get({This, 'SPEED_CHALLENGE_LEVEL'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N70795) -> (get({Target_N70795, '$class'})):intValue(Target_N70795) end)((get({get({This, 'SPEED_CHALLENGE_LEVEL'}), '$class'})):getValue(get({This, 'SPEED_CHALLENGE_LEVEL'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'ATTACK_CHALLENGE_LEVEL'}), '$class'})):getName(get({This, 'ATTACK_CHALLENGE_LEVEL'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N70965) -> (get({Target_N70965, '$class'})):intValue(Target_N70965) end)((get({get({This, 'ATTACK_CHALLENGE_LEVEL'}), '$class'})):getValue(get({This, 'ATTACK_CHALLENGE_LEVEL'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'CONTROL_LEVEL'}), '$class'})):getName(get({This, 'CONTROL_LEVEL'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N71135) -> (get({Target_N71135, '$class'})):intValue(Target_N71135) end)((get({get({This, 'CONTROL_LEVEL'}), '$class'})):getValue(get({This, 'CONTROL_LEVEL'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'SPEED'}), '$class'})):getName(get({This, 'SPEED'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N71305) -> (get({Target_N71305, '$class'})):intValue(Target_N71305) end)((get({get({This, 'SPEED'}), '$class'})):getValue(get({This, 'SPEED'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'MAX_GAME_OBJECTS'}), '$class'})):getName(get({This, 'MAX_GAME_OBJECTS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N71475) -> (get({Target_N71475, '$class'})):intValue(Target_N71475) end)((get({get({This, 'MAX_GAME_OBJECTS'}), '$class'})):getValue(get({This, 'MAX_GAME_OBJECTS'}))))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'COMMA_SEP'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, 'MAX_LAYERS'}), '$class'})):getName(get({This, 'MAX_LAYERS'}))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonStrings, 'EQUALS'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N71645) -> (get({Target_N71645, '$class'})):intValue(Target_N71645) end)((get({get({This, 'MAX_LAYERS'}), '$class'})):getValue(get({This, 'MAX_LAYERS'}))))),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

