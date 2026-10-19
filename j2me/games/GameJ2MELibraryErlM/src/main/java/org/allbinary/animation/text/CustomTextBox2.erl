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
% import javax.microedition.lcdui.CommandListener
% import javax.microedition.lcdui.Font
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.form.item.CustomTextBox

-module('CustomTextBox2').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomTextBox', Function, Arguments).

init_fields(This) ->
    ok.


new(CmdListener, Label, Text, MaxSize, Constraints, Font, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), (is_list(Text) orelse Text =:= undefined), is_integer(MaxSize), is_integer(Constraints) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CmdListener, Label, Text, MaxSize, Constraints, Font, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, CmdListener, Label, Text, MaxSize, Constraints, Font, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), (is_list(Text) orelse Text =:= undefined), is_integer(MaxSize), is_integer(Constraints) ->
        'CustomTextBox':init(This, CmdListener, Label, Text, MaxSize, Constraints, Font, BackgroundBasicColor, ForegroundBasicColor),
        (fun(Target_N65796) -> (get({Target_N65796, '$class'})):setFocus(Target_N65796, true) end)((get({This, '$class'})):getTextFieldItem(This)).

