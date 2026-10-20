% Generated Code Do Not Modify
% package org.allbinary.graphics.form.item
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullImage
% import org.allbinary.graphics.color.BasicColor

-module('ABCustomImageItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ABCustomItem', Function, Arguments).

init_fields(This) ->
    put({This, yOffset}, 0),
    ok.


new(Label, Image, Layout, AltText, BasicColor, YOffset) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined), is_integer(YOffset) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Label, Image, Layout, AltText, BasicColor, YOffset),
    This.

'$init'(This, Label, Image, Layout, AltText, BasicColor, YOffset) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined), is_integer(YOffset) ->
        'ABCustomItem':'$init'(This, Label, BasicColor, BasicColor),
        init_fields(This).

getImage(This) ->
        get({'NullImage', 'NULL_IMAGE'}).

