% Generated Code Do Not Modify
% package org.apache.xmlrpc

-module('XmlRpcException').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Exception', Function, Arguments).

init_fields(This) ->
    ok.


new(Code, Message) when is_integer(Code), (is_list(Message) orelse Message =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Code, Message),
    This.

'$init'(This, Code, Message) when is_integer(Code), (is_list(Message) orelse Message =:= undefined) ->
        'Exception':'$init'(This, Message).

