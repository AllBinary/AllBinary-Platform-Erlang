% Generated Code Do Not Modify
% package org.allbinary.graphics.form.item
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.font.MyFontProcessor
% import org.allbinary.graphics.font.UpdateMyFontInterface
% import org.allbinary.graphics.font.UpdateMyFontProcessor

-module('CustomCustomItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements UpdateMyFontInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('ABCustomItem', Function, Arguments).

init_fields(This) ->
    put({This, updateMyFontProcessor}, 'UpdateMyFontProcessor':new(This)),
    put({This, myFontProcessor}, get({This, updateMyFontProcessor})),
    ok.


new(Label, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, Label, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined) ->
        'ABCustomItem':init(This, Label, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This).

updateMeasurement(This, Graphics) ->
        ok.

