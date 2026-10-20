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
% import javax.microedition.lcdui.Choice
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Item
% import javax.microedition.lcdui.TextField
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.configuration.feature.GameFeatureChoiceGroups
% import org.allbinary.game.configuration.feature.GameFeatureFormUtil
% import org.allbinary.game.configuration.feature.GameFeatureItemCommandListener
% import org.allbinary.game.configuration.feature.GameFeatureItemStateListener
% import org.allbinary.game.configuration.feature.SensorFeatureFactory
% import org.allbinary.game.configuration.persistance.GameConfigurationPersistanceSingleton
% import org.allbinary.game.configuration.persistance.KeyValuePersistance
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.command.MyCommandsFactory
% import org.allbinary.graphics.displayable.screen.CommandForm
% import org.allbinary.input.gyro.OrientationData
% import org.allbinary.logic.MEUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.HashtableUtil
% import org.allbinary.logic.StdUtil
% import org.allbinary.util.ABHashtable

-module('GameOptionsForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CommandForm', Function, Arguments).

init_fields(This) ->
    put({This, meUtil}, 'MEUtil':getInstance()),
    ok.


new(CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor),
    This.

'$init'(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
        'CommandForm':'$init'(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):addConfiguration(This),
        GameFeatureFormUtil = 'GameFeatureFormUtil':getInstance(),
        (get({GameFeatureFormUtil, '$class'})):addChoiceGroup(GameFeatureFormUtil, This, (fun(Target_N66576) -> (get({Target_N66576, '$class'})):get(Target_N66576) end)('GameFeatureChoiceGroups':getExclusiveInstance()), get({'Choice', 'EXCLUSIVE'})),
        (get({GameFeatureFormUtil, '$class'})):addChoiceGroup(GameFeatureFormUtil, This, (fun(Target_N66642) -> (get({Target_N66642, '$class'})):get(Target_N66642) end)('GameFeatureChoiceGroups':getMultipleInstance()), get({'Choice', 'MULTIPLE'})),
        (get({This, '$class'})):initCommands(This, CommandListener),
        (get({This, '$class'})):setItemStateListener(This, 'GameFeatureItemStateListener':new(This)),
        (get({This, '$class'})):addTextFieldsIfSimulated(This).

% throws Exception
closeClientInformation(This, AbeClientInformation) ->
        'CommandForm':close(This),
        (get({This, '$class'})):save(This, AbeClientInformation).

addTextFieldsIfSimulated(This) ->
        Key = get({'OrientationData':getInstance(), 'ORIENTATION_SENSOR_INPUT'}),
        Hashtable = (fun(Target_N67071) -> (get({Target_N67071, '$class'})):get(Target_N67071) end)('GameFeatureChoiceGroups':getExclusiveInstance()),
        case (Hashtable =/= undefined) of
            true ->
            ListCanBeNull = (get({Hashtable, '$class'})):get(Hashtable, Key),
            case (ListCanBeNull =/= undefined) of
                true ->
                List = ListCanBeNull,
                case (get({List, '$class'})):contains(List, get({'SensorFeatureFactory':getInstance(), 'SIMULATED_ORIENTATION_SENSORS'})) of
                    true ->
                    (get({This, '$class'})):addTextFields(This);
                    false -> ok
                end;
                false -> ok
            end;
            false -> ok
        end.

addTextFields(This) ->
        Hashtable = 'GameConfigurationTextInput':getHashtable(),
        Size = (get({Hashtable, '$class'})):size(Hashtable),
        ObjectArray = (fun(Target_N67519) -> (get({Target_N67519, '$class'})):getKeysAsArray(Target_N67519, Hashtable) end)('HashtableUtil':getInstance()),
        put({local, gameConfigurationTextInput}, undefined),
        put({local, textField}, undefined),
        lists:foreach(fun(Index) ->
            put({local, gameConfigurationTextInput}, (get({Hashtable, '$class'})):get(Hashtable, array:get(Index, ObjectArray))),
            put({local, textField}, 'TextField':new((get({get({local, gameConfigurationTextInput}), '$class'})):getLabel(get({local, gameConfigurationTextInput})), (get({get({local, gameConfigurationTextInput}), '$class'})):getText(get({local, gameConfigurationTextInput})), 30, get({'TextField', 'ANY'}))),
            (get({get({This, meUtil}), '$class'})):appendItem(get({This, meUtil}), This, get({local, textField}))
        end, lists:seq(0, Size - 1)).

addConfiguration(This) ->
        METHOD_NAME = "addConfiguration",
        NAME = "Name: ",
        List = (fun(Target_N68023) -> (get({Target_N68023, '$class'})):getOptionsBasicArrayList(Target_N68023) end)('GameConfigurationSingleton':getInstance()),
        GAUGE_CHANGE = get({'MyCommandsFactory':getInstance(), 'GAUGE_CHANGE'}),
        StringMaker = 'StringMaker':new(),
        Size = (get({List, '$class'})):size(List),
        put({local, gameConfiguration}, undefined),
        put({local, gauge}, undefined),
        lists:foreach(fun(Index) ->
            put({local, gameConfiguration}, array:get(Index, get({List, objectArray}))),
            (get({StringMaker, '$class'})):delete(StringMaker, 0, (get({StringMaker, '$class'})):length(StringMaker)),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68398) -> (get({Target_N68398, '$class'})):toString(Target_N68398) end)((fun(Target_N68405) -> (get({Target_N68405, '$class'})):append(Target_N68405, (get({get({local, gameConfiguration}), '$class'})):toString(get({local, gameConfiguration}))) end)((get({StringMaker, '$class'})):append(StringMaker, NAME))), This, METHOD_NAME),
            put({local, gauge}, 'GameConfigurationGauge':new(get({local, gameConfiguration}))),
            (get({get({local, gauge}), '$class'})):setDefaultCommand(get({local, gauge}), GAUGE_CHANGE),
            (get({get({local, gauge}), '$class'})):setItemCommandListener(get({local, gauge}), 'GameFeatureItemCommandListener':new(This)),
            (get({get({This, meUtil}), '$class'})):appendItem(get({This, meUtil}), This, get({local, gauge}))
        end, lists:seq(0, Size - 1)).

initCommands(This, CmdListener) ->
        GameCommandsFactory = 'GameCommandsFactory':getInstance(),
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'CLOSE_OPTIONS'})),
        (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'DEFAULT_OPTIONS'})),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

% throws Exception
save(This, AbeClientInformation) ->
        Size = (get({This, '$class'})):size(This),
        put({local, item}, undefined),
        lists:foreach(fun(Index) ->
            put({local, item}, (get({This, '$class'})):get(This, Index)),
            case allbinary_java:instance_of(get({local, item}), 'GameConfigurationGauge') of
                true ->
                (fun(Target_N69160) -> (get({Target_N69160, '$class'})):update(Target_N69160, get({local, item})) end)('GameConfigurationUtil':getInstance());
                false ->
                case allbinary_java:instance_of(get({local, item}), 'TextField') of
                true ->
                'GameConfigurationTextInput':update(get({local, item}));
                false -> ok
            end
            end
        end, lists:seq(0, Size - 1)),
        (fun(Target_N69280) -> (get({Target_N69280, '$class'})):updateCompetitionValue(Target_N69280) end)('GameConfigurationUtil':getInstance()),
        Hashtable = (fun(Target_N69323) -> (get({Target_N69323, '$class'})):createHashtable(Target_N69323) end)('StdUtil':getInstance()),
        SCALE = get({'GameConfigurationCentral':getInstance(), 'SCALE'}),
        (get({Hashtable, '$class'})):put(Hashtable, (get({SCALE, '$class'})):getName(SCALE), (fun(Target_N69476) -> (get({Target_N69476, '$class'})):toString(Target_N69476) end)((get({SCALE, '$class'})):getValue(SCALE))),
        KeyValuePersistance = 'GameConfigurationPersistanceSingleton':getInstance(),
        (get({KeyValuePersistance, '$class'})):clear(KeyValuePersistance),
        (get({KeyValuePersistance, '$class'})):loadAll(KeyValuePersistance, AbeClientInformation),
        List = (get({KeyValuePersistance, '$class'})):getIds(KeyValuePersistance),
        (get({KeyValuePersistance, '$class'})):save(KeyValuePersistance, AbeClientInformation, Hashtable),
        Size2 = (get({List, '$class'})):size(List),
        put({local, integer}, undefined),
        lists:foreach(fun(Index) ->
            put({local, integer}, array:get(Index, get({List, objectArray}))),
            (get({KeyValuePersistance, '$class'})):delete(KeyValuePersistance, AbeClientInformation, (get({get({local, integer}), '$class'})):intValue(get({local, integer})))
        end, lists:seq(0, Size2 - 1)).

