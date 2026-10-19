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
% import javax.microedition.lcdui.NullImage
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.configuration.persistance.GameDifficultyFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.screen.CommandForm
% import org.allbinary.logic.MEUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.util.BasicArrayList

-module('GameDifficultyOptions').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CommandForm', Function, Arguments).

init_fields(This) ->
    put({This, meUtil}, 'MEUtil':getInstance()),
    put({This, list}, undefined),
    ok.


new(CommandListener, Title, List, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CommandListener, Title, List, BackgrounBasicColor, ForegroundBasicColor),
    This.

init(This, CommandListener, Title, List, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
        'CommandForm':init(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        put({This, list}, List),
        (get({This, '$class'})):update(This),
        (get({This, '$class'})):initCommands(This, CommandListener),
        GameDifficultyFactory = 'GameDifficultyFactory':getInstance(),
        (get({This, '$class'})):setSelectedId(This, (get({GameDifficultyFactory, '$class'})):getLevel(GameDifficultyFactory)).

open(This) ->
        'CommandForm':open(This).

% throws Exception
close(This) ->
        'CommandForm':close(This),
        (get({This, '$class'})):save(This).

% throws Exception
save(This) ->
        GameDifficultyFactory = 'GameDifficultyFactory':getInstance(),
        (get({GameDifficultyFactory, '$class'})):setLevel(GameDifficultyFactory, (get({This, '$class'})):getSelectedId(This)).

initCommands(This, CmdListener) ->
        GameCommandsFactory = 'GameCommandsFactory':getInstance(),
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'CLOSE_AND_SHOW_GAME_CANVAS'})),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

% throws Exception
update(This) ->
        (get({This, '$class'})):deleteAll(This),
        (get({This, '$class'})):add(This, get({This, list}), "Difficulty", get({'Choice', 'EXCLUSIVE'})),
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
        METHOD_NAME = "addChoiceGroup",
        NAME = "Adding Choice: ",
        ChoiceGroup = 'ChoiceGroup':new(Name, Option, (fun(Target_N67399) -> (get({Target_N67399, '$class'})):getArrayInstance(Target_N67399) end)('StringUtil':getInstance()), get({'NullImage', 'NULL_IMAGE_ARRAY'})),
        Size = (get({List, '$class'})):size(List),
        put({local, anyType}, undefined),
        lists:foreach(fun(Index) ->
            put({local, anyType}, array:get(Index, get({List, objectArray}))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67606) -> (get({Target_N67606, '$class'})):toString(Target_N67606) end)((fun(Target_N67613) -> (get({Target_N67613, '$class'})):append(Target_N67613, (get({get({local, anyType}), '$class'})):toString(get({local, anyType}))) end)((fun(Target_N67620) -> (get({Target_N67620, '$class'})):append(Target_N67620, NAME) end)('StringMaker':new()))), This, METHOD_NAME),
            (get({ChoiceGroup, '$class'})):append(ChoiceGroup, (get({get({local, anyType}), '$class'})):toString(get({local, anyType})), get({'NullImage', 'NULL_IMAGE'}))
        end, lists:seq(0, Size - 1)),
        ChoiceGroup.

setSelectedId(This, Id) when is_integer(Id) ->
        ChoiceGroup = (get({This, '$class'})):get(This, 0),
        (get({ChoiceGroup, '$class'})):setSelectedIndex(ChoiceGroup, Id, true).

getSelectedId(This) ->
        ChoiceGroup = (get({This, '$class'})):get(This, 0),
        (get({ChoiceGroup, '$class'})):getSelectedIndex(ChoiceGroup).

getSelectedText(This) ->
        ChoiceGroup = (get({This, '$class'})):get(This, 0),
        Value = (fun(Target_N68259) -> (get({Target_N68259, '$class'})):intValue(Target_N68259) end)(allbinary_java:to_string((get({ChoiceGroup, '$class'})):getString(ChoiceGroup, (get({ChoiceGroup, '$class'})):getSelectedIndex(ChoiceGroup)))),
        Value.

