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
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.game.configuration.feature.GameFeatureFormUtil
% import org.allbinary.game.configuration.feature.InGameFeatureChoiceGroups
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.screen.CommandForm
% import org.allbinary.logic.string.StringUtil

-module('InGameOptionsForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CommandForm', Function, Arguments).

static_init() ->
    put({?MODULE, 'DISPLAY'}, 'Command':new("Options In Game", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({?MODULE, 'SAVE'}, 'Command':new("Save", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({?MODULE, 'DEFAULT'}, 'Command':new("Default", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    ok.

init_fields(This) ->
    ok.


new(CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor),
    This.

'$init'(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
        'CommandForm':'$init'(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        GameFeatureFormUtil = 'GameFeatureFormUtil':getInstance(),
        (get({GameFeatureFormUtil, '$class'})):addChoiceGroup(GameFeatureFormUtil, This, (fun(Target_N66355) -> (get({Target_N66355, '$class'})):get(Target_N66355) end)('InGameFeatureChoiceGroups':getExclusiveInstance()), get({'Choice', 'EXCLUSIVE'})),
        (get({GameFeatureFormUtil, '$class'})):addChoiceGroup(GameFeatureFormUtil, This, (fun(Target_N66421) -> (get({Target_N66421, '$class'})):get(Target_N66421) end)('InGameFeatureChoiceGroups':getMultipleInstance()), get({'Choice', 'MULTIPLE'})),
        (get({This, '$class'})):initCommands(This, CommandListener).

initCommands(This, CmdListener) ->
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):addCommand(This, get({'GameCommandsFactory':getInstance(), 'CLOSE_AND_SHOW_GAME_CANVAS'})),
        (get({This, '$class'})):addCommand(This, get({'InGameOptionsForm', 'DEFAULT'})),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

