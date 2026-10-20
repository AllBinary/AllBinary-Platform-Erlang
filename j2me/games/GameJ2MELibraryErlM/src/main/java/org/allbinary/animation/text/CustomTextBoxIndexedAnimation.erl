% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.animation.text
% import javax.microedition.lcdui.Font
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.AnimationBehavior
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.game.input.event.RawKeyEventListener
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.form.item.CustomTextBox
% import org.allbinary.logic.string.StringUtil

-module('CustomTextBoxIndexedAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RawKeyEventListener
% implements UpdateMyFontInterface
% implements TextInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    put({This, customTextBox}, undefined),
    put({This, lastText}, get({'StringUtil':getInstance(), 'INIT_STRING'})),
    put({This, hasChanged}, true),
    put({This, textChangeListener}, 'TextChangeListener':getInstance()),
    ok.


new(CustomTextBox) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, CustomTextBox),
    This.

'$init'(This, CustomTextBox) ->
        'IndexedAnimation':'$init'(This, 'AnimationBehavior':getInstance()),
        init_fields(This),
        put({This, customTextBox}, CustomTextBox).

setBasicColorP(This, BasicColor) ->
        (fun(Target_N66169) -> (get({Target_N66169, '$class'})):setForegroundBasicColorP(Target_N66169, BasicColor) end)((get({get({This, customTextBox}), '$class'})):getTextFieldItem(get({This, customTextBox}))).

setBackgroundBasicColorP(This, BasicColor) ->
        (fun(Target_N66274) -> (get({Target_N66274, '$class'})):setBackgroundBasicColorP(Target_N66274, BasicColor) end)((get({get({This, customTextBox}), '$class'})):getTextFieldItem(get({This, customTextBox}))).

setTextWithOnMeasure(This, Text, TextChangeListener) when (is_list(Text) orelse Text =:= undefined) ->
        (get({This, '$class'})):setText(This, Text),
        put({This, textChangeListener}, TextChangeListener).

updateMeasurement(This, Graphics) ->
        Font = (get({Graphics, '$class'})):getFont(Graphics),
        (get({get({This, textChangeListener}), '$class'})):onMeasure(get({This, textChangeListener})),
        put({This, textChangeListener}, 'TextChangeListener':getInstance()).

setText(This, Text) when (is_list(Text) orelse Text =:= undefined) ->
        case (get({This, lastText}) =/= Text) of
            true ->
            put({This, hasChanged}, true),
            put({This, lastText}, Text),
            (fun(Target_N66780) -> (get({Target_N66780, '$class'})):setString(Target_N66780, Text) end)((get({get({This, customTextBox}), '$class'})):getTextFieldItem(get({This, customTextBox})));
            false -> ok
        end.

getText(This) ->
        (fun(Target_N66892) -> (get({Target_N66892, '$class'})):getString(Target_N66892) end)((get({get({This, customTextBox}), '$class'})):getTextFieldItem(get({This, customTextBox}))).

onEventRaw(This, KeyCode, DeviceId, Repeated) when is_integer(KeyCode), is_integer(DeviceId), is_boolean(Repeated) ->
        (get({get({This, customTextBox}), '$class'})):onEventRaw(get({This, customTextBox}), KeyCode, DeviceId, Repeated).

getFontHeight(This) ->
        (fun(Target_N67113) -> (get({Target_N67113, '$class'})):getFontHeight(Target_N67113) end)((get({get({This, customTextBox}), '$class'})):getTextFieldItem(get({This, customTextBox}))).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, customTextBox}), '$class'})):paintXY(get({This, customTextBox}), Graphics, X, Y).

paintThreedXYZ(This, Graphics, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        ok.

