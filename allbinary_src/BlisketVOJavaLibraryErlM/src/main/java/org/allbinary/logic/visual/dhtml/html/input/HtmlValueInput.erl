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
% import org.allbinary.logic.string.StringUtil

-module('HtmlValueInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HtmlInput', Function, Arguments).

init_fields(This) ->
    put({This, value}, undefined),
    put({This, 'VALUE'}, "VALUE"),
    ok.


new(Before, Type, Name, Value, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Type) orelse Type =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(Value) orelse Value =:= undefined), (is_list(After) orelse After =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Before, Type, Name, Value, After),
    This.

'$init'(This, Before, Type, Name, Value, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Type) orelse Type =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(Value) orelse Value =:= undefined), (is_list(After) orelse After =:= undefined) ->
        'HtmlInput':'$init'(This, Before, Type, Name, After),
        init_fields(This),
        StringUtil = 'StringUtil':getInstance(),
        put({This, value}, get({StringUtil, 'EMPTY_STRING'})),
        (get({This, '$class'})):addAttribute(This, get({This, 'VALUE'}), Value).

