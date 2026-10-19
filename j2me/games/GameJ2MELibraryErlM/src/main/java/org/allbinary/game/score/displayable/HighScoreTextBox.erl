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
% package org.allbinary.game.score.displayable
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.TextField
% import org.allbinary.PostGameCommandFactory
% import org.allbinary.game.GameInfo
% import org.allbinary.game.score.HighScore
% import org.allbinary.game.score.HighScoresHelperBaseInterface
% import org.allbinary.game.score.HighScoresFactoryInterface
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.graphics.form.item.CustomTextBox
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.graphics.paint.SimpleTextPaintable
% import org.allbinary.input.event.VirtualKeyboardEventHandler
% import org.allbinary.logic.system.os.GenericOperatingSystem
% import org.allbinary.logic.system.os.OperatingSystemFactory
% import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
% import org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory

-module('HighScoreTextBox').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomTextBox', Function, Arguments).

init_fields(This) ->
    put({This, virtualKeyboardEventHandler}, 'VirtualKeyboardEventHandler':getInstance()),
    put({This, highScoreUtil}, undefined),
    put({This, pleaseWait}, 'SimpleTextPaintable':new(get({get({This, commonStrings}), 'PLEASE_WAIT'}), get({'BasicColorFactory':getInstance(), 'WHITE'}))),
    put({This, paintable}, 'NullPaintable':getInstance()),
    put({This, submitted}, false),
    ok.


new(HighScoresFactoryInterface, HighScoresHelper, AbeClientInformation, GameInfo, CmdListener, Name, HighScore, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, HighScoresFactoryInterface, HighScoresHelper, AbeClientInformation, GameInfo, CmdListener, Name, HighScore, BackgrounBasicColor, ForegroundBasicColor),
    This.

init(This, HighScoresFactoryInterface, HighScoresHelper, AbeClientInformation, GameInfo, CmdListener, Name, HighScore, BackgrounBasicColor, ForegroundBasicColor) when (is_list(Name) orelse Name =:= undefined) ->
        'CustomTextBox':init(This, CmdListener, "New High Score Enter Name:", Name, 12, get({'TextField', 'ANY'}), 'Font':getDefaultFont(), BackgrounBasicColor, ForegroundBasicColor),
        init_fields(This),
        put({This, highScoreUtil}, 'HighScoreUtil':new(HighScoresFactoryInterface, HighScoresHelper, AbeClientInformation, GameInfo, CmdListener, Name, HighScore)),
        OperatingSystemInterface = (fun(Target_N66660) -> (get({Target_N66660, '$class'})):getOperatingSystemInstance(Target_N66660) end)('OperatingSystemFactory':getInstance()),
        case (get({OperatingSystemInterface, '$class'})):isOverScan(OperatingSystemInterface) of
            true ->
            Username = (fun(Target_N66739) -> (get({Target_N66739, '$class'})):getUserName(Target_N66739) end)('InApplicationPurchaseFactory':getInstance()),
            case (Username =/= undefined) of
                true ->
                (fun(Target_N66843) -> (get({Target_N66843, '$class'})):setString(Target_N66843, Username) end)((get({This, '$class'})):getTextFieldItem(This));
                false ->
                (fun(Target_N66806) -> (get({Target_N66806, '$class'})):setString(Target_N66806, "NoGamerInfo") end)((get({This, '$class'})):getTextFieldItem(This))
            end;
            false -> ok
        end.

initCommands(This, CmdListener) ->
        (get({This, '$class'})):removeAllCommands(This),
        (fun(Target_N67150) -> (get({Target_N67150, '$class'})):addCommands(Target_N67150, This) end)('PostGameCommandFactory':getInstance()),
        (get({This, '$class'})):addCommand(This, get({'HighScoreUtil', 'SUBMIT_TEXTBOX_COMMAND'})),
        (get({This, '$class'})):setCommandListener(This, CmdListener).

open(This) ->
        (get({get({This, virtualKeyboardEventHandler}), '$class'})):open(get({This, virtualKeyboardEventHandler})),
        put({This, paintable}, 'NullPaintable':getInstance()),
        'CustomTextBox':open(This).

% throws Exception
close(This) ->
        (get({get({This, virtualKeyboardEventHandler}), '$class'})):close(get({This, virtualKeyboardEventHandler})),
        put({This, paintable}, get({This, pleaseWait})),
        (get({get({This, repaintBehavior}), '$class'})):onChangeRepaint(get({This, repaintBehavior}), This),
        'CustomTextBox':close(This),
        (get({This, '$class'})):removeCommand(This, get({'HighScoreUtil', 'SUBMIT_TEXTBOX_COMMAND'})),
        (get({This, '$class'})):update(This),
        case get({This, submitted}) of
            true ->
            (get({get({This, highScoreUtil}), '$class'})):saveHighScore(get({This, highScoreUtil}));
            false ->
            ok
        end,
        put({This, paintable}, 'NullPaintable':getInstance()),
        (get({get({This, repaintBehavior}), '$class'})):onChangeRepaint(get({This, repaintBehavior}), This).

% throws Exception
update(This) ->
        Name = (fun(Target_N67736) -> (get({Target_N67736, '$class'})):getString(Target_N67736) end)((get({This, '$class'})):getTextFieldItem(This)),
        (get({get({This, highScoreUtil}), '$class'})):update(get({This, highScoreUtil}), Name),
        'CustomTextBox':update(This).

paint(This, Graphics) ->
        'CustomTextBox':paint(This, Graphics),
        (get({get({This, paintable}), '$class'})):paint(get({This, paintable}), Graphics).

saveHighScore(This) ->
        (get({get({This, highScoreUtil}), '$class'})):saveHighScore(get({This, highScoreUtil})).

submit(This) ->
        (get({get({This, highScoreUtil}), '$class'})):submit(get({This, highScoreUtil}), This).

