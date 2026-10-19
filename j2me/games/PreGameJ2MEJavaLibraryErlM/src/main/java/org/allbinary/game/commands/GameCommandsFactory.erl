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
% package org.allbinary.game.commands
% import javax.microedition.lcdui.Command
% import org.allbinary.graphics.displayable.CanvasStrings
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonStrings

-module('GameCommandsFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    put({This, 'TOGGLE_FULLSCREEN'}, 'Command':new("Toggle FullScreen", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'TOGGLE_KEYBOARD'}, 'Command':new("Keyboard", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'SET_MENU_DISPLAYABLE'}, 'Command':new("Set Menu Displayable", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'APPLICATION_UPDATE'}, 'Command':new(get({'CommonStrings':getInstance(), 'UPDATE'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'DISPLAY_ABOUT'}, 'Command':new(get({'CanvasStrings':getInstance(), 'ABOUT'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 2)),
    put({This, 'OPEN_WEB_URL'}, 'Command':new("Open Web URL", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 2)),
    put({This, 'CLOSE_OPTIONS'}, 'Command':new("Back", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'DISPLAY_OPTIONS'}, 'Command':new(get({'CanvasStrings':getInstance(), 'OPTIONS'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 2)),
    put({This, 'START_TRACE'}, 'Command':new("Start Trace", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'STOP_TRACE'}, 'Command':new("Stop Trace", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'DEFAULT_OPTIONS'}, 'Command':new("Default", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'SHOW_GAME_CANVAS'}, 'Command':new("Back to Game", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'CLOSE_AND_SHOW_GAME_CANVAS'}, 'Command':new("Back", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'QUIT_COMMAND'}, 'Command':new("Quit", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'STOP'}), 1)),
    put({This, 'RESTART_COMMAND'}, 'Command':new("Restart", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 0)),
    put({This, 'DISPLAY_SAVE_FORM'}, 'Command':new("Save To", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 3)),
    put({This, 'SAVE'}, 'Command':new("Save", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 3)),
    put({This, 'DISPLAY_LOAD_FORM'}, 'Command':new("Load", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 3)),
    put({This, 'LOAD_FILE'}, 'Command':new("Load File", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 3)),
    put({This, 'DELETE_FILE'}, 'Command':new("Delete File", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'EXIT_COMMAND'}, 'Command':new("Exit", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'EXIT'}), 2)),
    put({This, 'EXIT_WITHOUT_PROGRESS_COMMAND'}, 'Command':new("Exit Without Progress", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'EXIT'}), 2)),
    put({This, 'START_COMMAND'}, 'Command':new(get({'CommonStrings':getInstance(), 'START'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'CONTINUE_COMMAND'}, 'Command':new("Continue", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'SELECT_COMMAND'}, 'Command':new("Select", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'FEATURE_UPDATE'}, 'Command':new("Feature Update", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    put({This, 'BUY_COMMAND'}, 'Command':new("BUY", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 1)),
    ok.


getInstance() ->
        case (get({'GameCommandsFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'GameCommandsFactory', instance}, 'GameCommandsFactory':new());
            false -> ok
        end,
        get({'GameCommandsFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

