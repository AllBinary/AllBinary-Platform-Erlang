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

-module('HtmlLengthInput').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('HtmlValueInput', Function, Arguments).

init_fields(This) ->
    put({This, 'MAXLENGTH'}, "MAXLENGTH"),
    put({This, 'SIZE'}, "SIZE"),
    put({This, length}, undefined),
    put({This, size}, undefined),
    ok.


new(Before, Type, Name, Value, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Type) orelse Type =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(Value) orelse Value =:= undefined), (is_list(After) orelse After =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Before, Type, Name, Value, After),
    This.

'$init'(This, Before, Type, Name, Value, After) when (is_list(Before) orelse Before =:= undefined), (is_list(Type) orelse Type =:= undefined), (is_list(Name) orelse Name =:= undefined), (is_list(Value) orelse Value =:= undefined), (is_list(After) orelse After =:= undefined) ->
        'HtmlValueInput':'$init'(This, Before, Type, Name, Value, After),
        init_fields(This).

setMaxLength(This, Length) ->
        array:size(This) = allbinary_java:to_string(Length),
        (get({This, '$class'})):addAttribute(This, get({This, 'MAXLENGTH'}), array:size(This)).

setSize(This, Size) ->
        put({This, size}, allbinary_java:to_string(Size)),
        (get({This, '$class'})):addAttribute(This, get({This, 'MAXLENGTH'}), get({This, size})).

