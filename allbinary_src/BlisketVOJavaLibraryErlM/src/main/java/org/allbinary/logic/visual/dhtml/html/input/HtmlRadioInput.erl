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
% package org.allbinary.logic.visual.dhtml.html.input
% import org.allbinary.logic.java.bool.BooleanFactory

-module('HtmlRadioInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HtmlValueInput', Function, Arguments).

init_fields(This) ->
    put({This, 'CHECKED'}, "checked"),
    ok.


new(Before, Name, Value, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(Value) orelse Value =:= undefined), (is_list(After) orelse After =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Before, Name, Value, After),
    This.

'$init'(This, Before, Name, Value, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(Value) orelse Value =:= undefined), (is_list(After) orelse After =:= undefined) ->
        'HtmlValueInput':'$init'(This, Before, get({'HtmlInputData':getInstance(), 'RADIO'}), Name, Value, After),
        init_fields(This).

setSelected(This) ->
        'HtmlValueInput':addAttribute(This, get({This, 'CHECKED'}), get({'BooleanFactory':getInstance(), 'TRUE_STRING'})).

