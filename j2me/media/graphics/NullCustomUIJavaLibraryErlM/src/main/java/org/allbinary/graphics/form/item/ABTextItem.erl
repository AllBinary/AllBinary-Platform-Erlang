% Generated Code Do Not Modify
% package org.allbinary.graphics.form.item
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColor

-module('ABTextItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ABCustomItemInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomCustomItem', Function, Arguments).

init_fields(This) ->
    ok.


new(Label, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Label, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, Label, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
        'CustomCustomItem':'$init'(This, Label, BackgroundBasicColor, ForegroundBasicColor).

keyPressed(This, KeyCode) when is_integer(KeyCode) ->
        ok.

paintUnselected(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        ok.

getLabelStringComponent(This) ->
        get({'ABStringComponent', 'NULL_STRING_COMPONENT'}).

