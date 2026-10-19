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
% import javax.microedition.lcdui.Item
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.string.CommonStrings

-module('GameConfigurationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GameConfigurationUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, 'GAUGE_UPDATE'}, "Gauge Update: "),
    put({This, 'FROM'}, " from: "),
    put({This, 'TO'}, " to: "),
    put({This, 'COMPETITION_VALUE'}, 1),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'GameConfigurationUtil', instance}).

% throws Exception
change(This, GameOptionsForm, Gauge) ->
        (get({This, '$class'})):update(This, Gauge),
        GameConfigurationSingleton = 'GameConfigurationSingleton':getInstance(),
        GameConfiguration = (get({GameConfigurationSingleton, '$class'})):getInstanceByName(GameConfigurationSingleton, (get({Gauge, '$class'})):getLabel(Gauge)),
        (get({This, '$class'})):updateChallange(This, GameOptionsForm, GameConfiguration).

% throws Exception
update(This, Gauge) ->
        GameConfigurationSingleton = 'GameConfigurationSingleton':getInstance(),
        GameConfiguration = (get({GameConfigurationSingleton, '$class'})):getInstanceByName(GameConfigurationSingleton, (get({Gauge, '$class'})):getLabel(Gauge)),
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        Value = (get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, ((get({Gauge, '$class'})):getValue(Gauge) + (fun(Target_N66495) -> (get({Target_N66495, '$class'})):intValue(Target_N66495) end)((get({GameConfiguration, '$class'})):getMinValue(GameConfiguration)))),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'GAUGE_UPDATE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({GameConfiguration, '$class'})):getName(GameConfiguration)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'FROM'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N66704) -> (get({Target_N66704, '$class'})):intValue(Target_N66704) end)((get({GameConfiguration, '$class'})):getValue(GameConfiguration)))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'TO'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((get({Value, '$class'})):intValue(Value))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({get({This, commonStrings}), 'UPDATE'})),
        (get({GameConfiguration, '$class'})):setValue(GameConfiguration, Value).

% throws Exception
setDefault(This, Gauge) ->
        GameConfigurationSingleton = 'GameConfigurationSingleton':getInstance(),
        GameConfiguration = (get({GameConfigurationSingleton, '$class'})):getInstanceByName(GameConfigurationSingleton, (get({Gauge, '$class'})):getLabel(Gauge)),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, "Gauge Default: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({GameConfiguration, '$class'})):getName(GameConfiguration)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'TO'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, trunc((fun(Target_N67219) -> (get({Target_N67219, '$class'})):intValue(Target_N67219) end)((get({GameConfiguration, '$class'})):getDefaultValue(GameConfiguration)))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "setDefault"),
        (get({Gauge, '$class'})):setValue(Gauge, ((fun(Target_N67319) -> (get({Target_N67319, '$class'})):intValue(Target_N67319) end)((get({GameConfiguration, '$class'})):getDefaultValue(GameConfiguration)) - (fun(Target_N67343) -> (get({Target_N67343, '$class'})):intValue(Target_N67343) end)((get({GameConfiguration, '$class'})):getMinValue(GameConfiguration)))),
        (get({GameConfiguration, '$class'})):setValue(GameConfiguration, (get({GameConfiguration, '$class'})):getDefaultValue(GameConfiguration)).

% throws Exception
updateChallange(This, GameOptionsForm, GameConfiguration) ->
        GameConfigurationSingleton = 'GameConfigurationSingleton':getInstance(),
        GameConfigurationCentral = 'GameConfigurationCentral':getInstance(),
        case (GameConfiguration =:= get({GameConfigurationCentral, 'CHALLENGE_LEVEL'})) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "updateChallange"),
            (get({get({GameConfigurationCentral, 'COLLIDE_DAMAGE'}), '$class'})):setValue(get({GameConfigurationCentral, 'COLLIDE_DAMAGE'}), (get({GameConfiguration, '$class'})):getValue(GameConfiguration)),
            (get({get({GameConfigurationCentral, 'ATTACK_CHALLENGE_LEVEL'}), '$class'})):setValue(get({GameConfigurationCentral, 'ATTACK_CHALLENGE_LEVEL'}), (get({GameConfiguration, '$class'})):getValue(GameConfiguration)),
            (get({get({GameConfigurationCentral, 'DURABILITY_CHALLENGE_LEVEL'}), '$class'})):setValue(get({GameConfigurationCentral, 'DURABILITY_CHALLENGE_LEVEL'}), (get({GameConfiguration, '$class'})):getValue(GameConfiguration)),
            (get({get({GameConfigurationCentral, 'SPEED_CHALLENGE_LEVEL'}), '$class'})):setValue(get({GameConfigurationCentral, 'SPEED_CHALLENGE_LEVEL'}), (get({GameConfiguration, '$class'})):getValue(GameConfiguration)),
            Size = (get({GameOptionsForm, '$class'})):size(GameOptionsForm),
            lists:foreach(fun(Index) ->
                Item = (get({GameOptionsForm, '$class'})):get(GameOptionsForm, Index),
                case allbinary_java:instance_of(Item, 'GameConfigurationGauge') of
                    true ->
                    Gauge = Item,
                    Name = (get({Item, '$class'})):getLabel(Item),
                    NextGameConfiguration = (get({GameConfigurationSingleton, '$class'})):getInstanceByName(GameConfigurationSingleton, Name),
                    case (NextGameConfiguration =:= get({GameConfigurationCentral, 'COLLIDE_DAMAGE'})) of
                        true ->
                        (get({Gauge, '$class'})):setValue(Gauge, ((fun(Target_N68542) -> (get({Target_N68542, '$class'})):intValue(Target_N68542) end)((get({get({GameConfigurationCentral, 'COLLIDE_DAMAGE'}), '$class'})):getValue(get({GameConfigurationCentral, 'COLLIDE_DAMAGE'}))) - (fun(Target_N68574) -> (get({Target_N68574, '$class'})):intValue(Target_N68574) end)((get({GameConfiguration, '$class'})):getMinValue(GameConfiguration))));
                        false ->
                        case (NextGameConfiguration =:= get({GameConfigurationCentral, 'DURABILITY_CHALLENGE_LEVEL'})) of
                        true ->
                        (get({Gauge, '$class'})):setValue(Gauge, ((fun(Target_N68450) -> (get({Target_N68450, '$class'})):intValue(Target_N68450) end)((get({get({GameConfigurationCentral, 'DURABILITY_CHALLENGE_LEVEL'}), '$class'})):getValue(get({GameConfigurationCentral, 'DURABILITY_CHALLENGE_LEVEL'}))) - (fun(Target_N68482) -> (get({Target_N68482, '$class'})):intValue(Target_N68482) end)((get({GameConfiguration, '$class'})):getMinValue(GameConfiguration))));
                        false ->
                        case (NextGameConfiguration =:= get({GameConfigurationCentral, 'ATTACK_CHALLENGE_LEVEL'})) of
                        true ->
                        (get({Gauge, '$class'})):setValue(Gauge, ((fun(Target_N68358) -> (get({Target_N68358, '$class'})):intValue(Target_N68358) end)((get({get({GameConfigurationCentral, 'ATTACK_CHALLENGE_LEVEL'}), '$class'})):getValue(get({GameConfigurationCentral, 'ATTACK_CHALLENGE_LEVEL'}))) - (fun(Target_N68390) -> (get({Target_N68390, '$class'})):intValue(Target_N68390) end)((get({GameConfiguration, '$class'})):getMinValue(GameConfiguration))));
                        false ->
                        case (NextGameConfiguration =:= get({GameConfigurationCentral, 'SPEED_CHALLENGE_LEVEL'})) of
                        true ->
                        (get({Gauge, '$class'})):setValue(Gauge, ((fun(Target_N68266) -> (get({Target_N68266, '$class'})):intValue(Target_N68266) end)((get({get({GameConfigurationCentral, 'SPEED_CHALLENGE_LEVEL'}), '$class'})):getValue(get({GameConfigurationCentral, 'SPEED_CHALLENGE_LEVEL'}))) - (fun(Target_N68298) -> (get({Target_N68298, '$class'})):intValue(Target_N68298) end)((get({GameConfiguration, '$class'})):getMinValue(GameConfiguration))));
                        false -> ok
                    end
                    end
                    end
                    end;
                    false -> ok
                end
            end, lists:seq(0, Size - 1));
            false -> ok
        end.

updateCompetitionValue(This) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, "updateCompetitionValue"),
        GameConfigurationCentral = 'GameConfigurationCentral':getInstance(),
        put({This, 'COMPETITION_VALUE'}, ((((fun(Target_N68905) -> (get({Target_N68905, '$class'})):intValue(Target_N68905) end)((get({get({GameConfigurationCentral, 'COLLIDE_DAMAGE'}), '$class'})):getValue(get({GameConfigurationCentral, 'COLLIDE_DAMAGE'}))) + (fun(Target_N68937) -> (get({Target_N68937, '$class'})):intValue(Target_N68937) end)((get({get({GameConfigurationCentral, 'ATTACK_CHALLENGE_LEVEL'}), '$class'})):getValue(get({GameConfigurationCentral, 'ATTACK_CHALLENGE_LEVEL'})))) + (fun(Target_N68970) -> (get({Target_N68970, '$class'})):intValue(Target_N68970) end)((get({get({GameConfigurationCentral, 'DURABILITY_CHALLENGE_LEVEL'}), '$class'})):getValue(get({GameConfigurationCentral, 'DURABILITY_CHALLENGE_LEVEL'})))) + (fun(Target_N69003) -> (get({Target_N69003, '$class'})):intValue(Target_N69003) end)((get({get({GameConfigurationCentral, 'SPEED_CHALLENGE_LEVEL'}), '$class'})):getValue(get({GameConfigurationCentral, 'SPEED_CHALLENGE_LEVEL'}))))),
        put({This, 'COMPETITION_VALUE'}, ((get({This, 'COMPETITION_VALUE'}) bsr 2))).

getCompetitionValue(This) ->
        get({This, 'COMPETITION_VALUE'}).

