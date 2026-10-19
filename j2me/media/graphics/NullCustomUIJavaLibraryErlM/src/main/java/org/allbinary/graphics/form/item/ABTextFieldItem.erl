% Generated Code Do Not Modify
% package org.allbinary.graphics.form.item
% import javax.microedition.lcdui.Canvas
% import javax.microedition.lcdui.Font
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.logic.util.visitor.Visitor

-module('ABTextFieldItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ABTextItem', Function, Arguments).

init_fields(This) ->
    put({This, font}, undefined),
    ok.


new(Canvas, Visitor, Label, Value, MaxSize, Layout, AltText, Font, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), (is_list(Value) orelse Value =:= undefined), is_integer(MaxSize), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Canvas, Visitor, Label, Value, MaxSize, Layout, AltText, Font, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, Canvas, Visitor, Label, Value, MaxSize, Layout, AltText, Font, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), (is_list(Value) orelse Value =:= undefined), is_integer(MaxSize), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
        'ABTextItem':init(This, Label, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This),
        put({This, font}, Font).

getLabel(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

setLabel(This, Label) when (is_list(Label) orelse Label =:= undefined) ->
        ok.

getString(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

setString(This, String) when (is_list(String) orelse String =:= undefined) ->
        ok.

setFocus(This, State) when is_boolean(State) ->
        ok.

getFontHeight(This) ->
        (get({get({This, font}), '$class'})):getHeight(get({This, font})).

setBackgroundBasicColorP(This, BasicColor) ->
        ok.

setForegroundBasicColorP(This, BasicColor) ->
        ok.

