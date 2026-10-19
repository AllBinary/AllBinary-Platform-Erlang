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
% package org.allbinary.game.displayable.screen
% import javax.microedition.lcdui.Command
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.TextField
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.game.commands.GameCommandsFactory
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.form.item.CustomTextBox
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.graphics.paint.SimpleTextPaintable
% import org.allbinary.input.event.VirtualKeyboardEventHandler

-module('LicenseRegistrationTextBox').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomTextBox', Function, Arguments).

static_init() ->
    put({?MODULE, 'DISPLAY_COMMAND'}, 'Command':new("Register", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 3)),
    put({?MODULE, 'SUBMIT_COMMAND'}, 'Command':new("Submit", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'Command', 'SCREEN'}), 3)),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, pleaseWaitPaintable}, 'SimpleTextPaintable':new(get({get({This, commonStrings}), 'PLEASE_WAIT'}), get({'BasicColorFactory':getInstance(), 'WHITE'}))),
    put({This, paintable}, 'NullPaintable':getInstance()),
    ok.


new(CmdListener, BackgrounBasicColor, ForegroundBasicColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CmdListener, BackgrounBasicColor, ForegroundBasicColor),
    This.

init(This, CmdListener, BackgrounBasicColor, ForegroundBasicColor) ->
        'CustomTextBox':init(This, CmdListener, "Enter Registration Code:", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), 60, get({'TextField', 'ANY'}), 'Font':getDefaultFont(), BackgrounBasicColor, ForegroundBasicColor),
        init_fields(This).

initCommands(This, CmdListener) ->
        (get({This, '$class'})):removeAllCommands(This),
        (get({This, '$class'})):addCommand(This, get({'GameCommandsFactory':getInstance(), 'CLOSE_AND_SHOW_GAME_CANVAS'})),
        (get({This, '$class'})):addCommand(This, get({'GameCommandsFactory':getInstance(), 'TOGGLE_KEYBOARD'})),
        (get({This, '$class'})):addCommand(This, get({'LicenseRegistrationTextBox', 'SUBMIT_COMMAND'})),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

open(This) ->
        try
            VirtualKeyboardEventHandler = 'VirtualKeyboardEventHandler':getInstance(),
            (get({VirtualKeyboardEventHandler, '$class'})):fireEvent(VirtualKeyboardEventHandler, get({VirtualKeyboardEventHandler, 'SHOW_EVENT'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "open", E)
        end,
        'CustomTextBox':open(This),
        put({This, paintable}, 'NullPaintable':getInstance()),
        (get({This, '$class'})):repaint(This).

% throws Exception
close(This) ->
        try
            VirtualKeyboardEventHandler = 'VirtualKeyboardEventHandler':getInstance(),
            (get({VirtualKeyboardEventHandler, '$class'})):fireEvent(VirtualKeyboardEventHandler, get({VirtualKeyboardEventHandler, 'HIDE_EVENT'}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "open", E)
        end,
        put({This, paintable}, get({This, pleaseWaitPaintable})),
        (get({This, '$class'})):repaint(This),
        'CustomTextBox':close(This).

paint(This, Graphics) ->
        'CustomTextBox':paint(This, Graphics),
        (get({get({This, paintable}), '$class'})):paint(get({This, paintable}), Graphics).

submit(This) ->
        CommandListener = (get({This, '$class'})):getCustomCommandListener(This),
        (get({CommandListener, '$class'})):commandAction(CommandListener, get({'LicenseRegistrationTextBox', 'SUBMIT_COMMAND'}), This).

