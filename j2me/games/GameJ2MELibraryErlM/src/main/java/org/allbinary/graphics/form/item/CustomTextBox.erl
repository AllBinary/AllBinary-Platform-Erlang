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
% package org.allbinary.graphics.form.item
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.J2MEUtil
% import org.allbinary.game.displayable.canvas.GameCommandCanvas
% import org.allbinary.game.input.Input
% import org.allbinary.game.input.InputFactory
% import org.allbinary.game.input.PlatformKeyFactory
% import org.allbinary.game.input.event.RawKeyEventListener
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.form.item.validation.TextItemVisitor
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.string.CommonSeps

-module('CustomTextBox').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RawKeyEventListener

'$handle_undefined_function'(Function, Arguments) ->
    apply('GameCommandCanvas', Function, Arguments).

init_fields(This) ->
    put({This, textFieldItem}, undefined),
    put({This, inputFactory}, 'InputFactory':getInstance()),
    ok.


new(CmdListener, Label, Text, MaxSize, Constraints, Font, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), (is_list(Text) orelse Text =:= undefined), is_integer(MaxSize), is_integer(Constraints) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CmdListener, Label, Text, MaxSize, Constraints, Font, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, CmdListener, Label, Text, MaxSize, Constraints, Font, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), (is_list(Text) orelse Text =:= undefined), is_integer(MaxSize), is_integer(Constraints) ->
        'GameCommandCanvas':'$init'(This, CmdListener, Label, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This),
        StringUtil = 'StringUtil':getInstance(),
        TextFieldItem = 'ABTextFieldItem':new(This, 'TextItemVisitor':new(), get({StringUtil, 'EMPTY_STRING'}), get({StringUtil, 'EMPTY_STRING'}), MaxSize, 0, get({StringUtil, 'EMPTY_STRING'}), Font, BackgroundBasicColor, ForegroundBasicColor),
        (get({TextFieldItem, '$class'})):setString(TextFieldItem, Text),
        put({This, textFieldItem}, TextFieldItem),
        (get({This, '$class'})):setTitle(This, Label).

submit(This) ->
        ok.

onEventRaw(This, KeyCode, DeviceId, Repeated) when is_integer(KeyCode), is_integer(DeviceId), is_boolean(Repeated) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N66703) -> (get({Target_N66703, '$class'})):toString(Target_N66703) end)((fun(Target_N66710) -> (get({Target_N66710, '$class'})):appendint(Target_N66710, KeyCode) end)((fun(Target_N66717) -> (get({Target_N66717, '$class'})):append(Target_N66717, get({get({This, commonStrings}), 'START'})) end)('StringMaker':new()))), This, "onEvent"),
        (get({This, '$class'})):keyPressedByDevice(This, KeyCode, DeviceId).

keyPressed(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyPressedByDevice(This, KeyCode, 0).

keyReleased(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyReleasedByDevice(This, KeyCode, 0).

keyRepeated(This, KeyCode) when is_integer(KeyCode) ->
        (get({This, '$class'})):keyRepeatedByDevice(This, KeyCode, 0).

keyPressedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        try
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N67213) -> (get({Target_N67213, '$class'})):toString(Target_N67213) end)((fun(Target_N67220) -> (get({Target_N67220, '$class'})):appendint(Target_N67220, KeyCode) end)((fun(Target_N67227) -> (get({Target_N67227, '$class'})):append(Target_N67227, get({'CommonSeps':getInstance(), 'SPACE'})) end)('StringMaker':new()))), This, get({get({This, gameInputStrings}), 'KEY_PRESSED'})),
            PlatformKeyFactory = 'PlatformKeyFactory':getInstance(),
            Input = (get({get({This, inputFactory}), '$class'})):getInstanceById(get({This, inputFactory}), KeyCode),
            case (get({PlatformKeyFactory, '$class'})):isSubmission(PlatformKeyFactory, Input) of
                true ->
                (get({This, '$class'})):submit(This);
                false ->
                (get({get({This, textFieldItem}), '$class'})):keyPressed(get({This, textFieldItem}), KeyCode)
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, gameInputStrings}), 'KEY_PRESSED'}), E)
        end.

keyReleasedByDevice(This, KeyCode, DeviceId) when is_integer(KeyCode), is_integer(DeviceId) ->
        ok.

paint(This, Graphics) ->
        (get({Graphics, '$class'})):setColor(Graphics, get({This, backgroundColor})),
        (get({Graphics, '$class'})):fillRect(Graphics, 0, 0, (get({get({This, displayInfo}), '$class'})):getLastWidth(get({This, displayInfo})), (get({get({This, displayInfo}), '$class'})):getLastHeight(get({This, displayInfo}))),
        (get({Graphics, '$class'})):setColor(Graphics, get({This, foregroundColor})),
        case (not 'J2MEUtil':isJ2ME()) of
            true ->
            (get({Graphics, '$class'})):drawString(Graphics, (get({This, '$class'})):getTitle(This), 8, 1, 0);
            false -> ok
        end,
        (get({This, '$class'})):paintXY(This, Graphics, 8, ((fun(Target_N68037) -> (get({Target_N68037, '$class'})):getHeight(Target_N68037) end)((get({Graphics, '$class'})):getFont(Graphics)) + 2)),
        'GameCommandCanvas':paint(This, Graphics).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, textFieldItem}), '$class'})):paintXY(get({This, textFieldItem}), Graphics, X, Y).

getTextFieldItem(This) ->
        get({This, textFieldItem}).

