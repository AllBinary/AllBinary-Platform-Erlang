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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColor

-module('SelectableTextItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ABTextItem', Function, Arguments).

init_fields(This) ->
    ok.


new(Label, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Label, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, Label, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
        'ABTextItem':'$init'(This, Label, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor).

isFocusable(This) ->
        true.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, myFontProcessor}), '$class'})):process(get({This, myFontProcessor}), Graphics),
        StringComponent = (get({This, '$class'})):getLabelStringComponent(This),
        case (StringComponent =/= undefined) of
            true ->
            (get({Graphics, '$class'})):setColor(Graphics, (fun(Target_N65977) -> (get({Target_N65977, '$class'})):intValue(Target_N65977) end)((get({StringComponent, '$class'})):getForegroundBasicColor(StringComponent)));
            false -> ok
        end,
        (get({Graphics, '$class'})):drawString(Graphics, (get({This, '$class'})):getLabel(This), (X + 2), Y, 0).

