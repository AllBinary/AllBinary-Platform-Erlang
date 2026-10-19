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
% import javax.microedition.lcdui.ChoiceGroup
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Item
% import javax.microedition.lcdui.NullImage
% import javax.microedition.lcdui.StringItem
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.configuration.persistance.GamePersistanceSingleton
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.screen.CommandForm
% import org.allbinary.logic.MEUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList

-module('LoadGameForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CommandForm', Function, Arguments).

init_fields(This) ->
    put({This, meUtil}, 'MEUtil':getInstance()),
    put({This, areChoices}, false),
    ok.


new(CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor),
    This.

init(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
        'CommandForm':init(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):update(This),
        (get({This, '$class'})):initCommands(This, CommandListener).

initCommands(This, CmdListener) ->
        GameCommandsFactory = 'GameCommandsFactory':getInstance(),
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'LOAD_FILE'})),
        (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'DELETE_FILE'})),
        (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'CLOSE_AND_SHOW_GAME_CANVAS'})),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

% throws Exception
update(This) ->
        List = (fun(Target_N66622) -> (get({Target_N66622, '$class'})):getIds(Target_N66622) end)('GamePersistanceSingleton':getInstance()),
        (get({This, '$class'})):deleteAll(This),
        case ((get({List, '$class'})):size(List) > 0) of
            true ->
            (get({This, '$class'})):add(This, List, "Select A Saved Game", get({'Choice', 'EXCLUSIVE'})),
            put({This, areChoices}, true);
            false ->
            (get({get({This, meUtil}), '$class'})):appendItem(get({This, meUtil}), This, 'StringItem':new("No Saved Games", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Item', 'PLAIN'}))),
            put({This, areChoices}, false)
        end,
        'CommandForm':update(This).

add(This, List, Name, Option) when (is_list(Name) orelse Name =:= undefined), is_integer(Option) ->
        ChoiceGroup = (get({This, '$class'})):getChoiceGroup(This, List, Name, Option),
        case ((get({List, '$class'})):size(List) > 0) of
            true ->
            (get({ChoiceGroup, '$class'})):setSelectedIndex(ChoiceGroup, 0, true);
            false -> ok
        end,
        (get({get({This, meUtil}), '$class'})):appendItem(get({This, meUtil}), This, ChoiceGroup).

getChoiceGroup(This, List, Name, Option) when (is_list(Name) orelse Name =:= undefined), is_integer(Option) ->
        METHOD_NAME = "getChoiceGroup",
        ADDING_CHOICE = "Adding Choice: ",
        ChoiceGroup = 'ChoiceGroup':new(Name, Option, (fun(Target_N67352) -> (get({Target_N67352, '$class'})):getArrayInstance(Target_N67352) end)('StringUtil':getInstance()), get({'NullImage', 'NULL_IMAGE_ARRAY'})),
        Size = (get({List, '$class'})):size(List),
        lists:foreach(fun(Index) ->
            AnyType = array:get(Index, get({List, objectArray})),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67542) -> (get({Target_N67542, '$class'})):toString(Target_N67542) end)((fun(Target_N67549) -> (get({Target_N67549, '$class'})):append(Target_N67549, (get({AnyType, '$class'})):toString(AnyType)) end)((fun(Target_N67556) -> (get({Target_N67556, '$class'})):append(Target_N67556, ADDING_CHOICE) end)('StringMaker':new()))), This, METHOD_NAME),
            (get({ChoiceGroup, '$class'})):append(ChoiceGroup, (get({AnyType, '$class'})):toString(AnyType), get({'NullImage', 'NULL_IMAGE'}))
        end, lists:seq(0, Size - 1)),
        ChoiceGroup.

getSelectedId(This) ->
        try
        case get({This, areChoices}) of
            true ->
            ChoiceGroup = (get({This, '$class'})):get(This, 0),
            throw({'$return', (get({ChoiceGroup, '$class'})):getSelectedIndex(ChoiceGroup)});
            false ->
            throw({'$return', (-1)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getSelectedText(This) ->
        try
        case get({This, areChoices}) of
            true ->
            ChoiceGroup = (get({This, '$class'})):get(This, 0),
            Value = (fun(Target_N68129) -> (get({Target_N68129, '$class'})):intValue(Target_N68129) end)(allbinary_java:to_string((get({ChoiceGroup, '$class'})):getString(ChoiceGroup, (get({ChoiceGroup, '$class'})):getSelectedIndex(ChoiceGroup)))),
            throw({'$return', Value});
            false ->
            throw({'$return', (-1)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

