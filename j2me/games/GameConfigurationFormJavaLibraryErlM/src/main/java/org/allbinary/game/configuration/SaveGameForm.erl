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
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.TextField
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.displayable.screen.CommandForm
% import org.allbinary.logic.ABSystemWrapper
% import org.allbinary.logic.MEUtil

-module('SaveGameForm').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CommandForm', Function, Arguments).

static_init() ->
    put({?MODULE, 'FORM'}, 'CommandForm':getNullCommandForm()),
    ok.

init_fields(This) ->
    put({This, meUtil}, 'MEUtil':getInstance()),
    ok.


% throws Exception
createForm(CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
        put({'SaveGameForm', 'FORM'}, 'SaveGameForm':new(CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor)),
        get({'SaveGameForm', 'FORM'}).

getInstance() ->
        get({'SaveGameForm', 'FORM'}).

new(CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor),
    This.

'$init'(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Title) orelse Title =:= undefined) ->
        'CommandForm':'$init'(This, CommandListener, Title, BackgrounBasicColor, ForegroundBasicColor),
        init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        TimeString = allbinary_java:to_string((fun(Target_N66294) -> (get({Target_N66294, '$class'})):currentTimeMillis(Target_N66294) end)('ABSystemWrapper':getInstance())),
        (get({get({This, meUtil}), '$class'})):appendItem(get({This, meUtil}), This, 'TextField':new("Name: ", TimeString, 30, get({'TextField', 'ANY'}))),
        (get({This, '$class'})):initCommands(This, CommandListener).

initCommands(This, CmdListener) ->
        GameCommandsFactory = 'GameCommandsFactory':getInstance(),
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'SAVE'})),
        (get({This, '$class'})):addCommand(This, get({GameCommandsFactory, 'CLOSE_AND_SHOW_GAME_CANVAS'})),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

