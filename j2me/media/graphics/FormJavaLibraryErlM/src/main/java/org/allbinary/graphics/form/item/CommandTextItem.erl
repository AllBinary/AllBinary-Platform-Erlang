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
% import javax.microedition.lcdui.Command
% import org.allbinary.graphics.color.BasicColor

-module('CommandTextItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ABTextItem', Function, Arguments).

init_fields(This) ->
    put({This, command}, undefined),
    ok.


new(Command, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor) when is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Command, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, Command, Layout, AltText, BackgroundBasicColor, ForegroundBasicColor) when is_integer(Layout), (is_list(AltText) orelse AltText =:= undefined) ->
        'ABTextItem':'$init'(This, (get({Command, '$class'})):getLabel(Command), Layout, AltText, BackgroundBasicColor, ForegroundBasicColor),
        init_fields(This),
        put({This, command}, Command).

isFocusable(This) ->
        true.

getCommand(This) ->
        get({This, command}).

