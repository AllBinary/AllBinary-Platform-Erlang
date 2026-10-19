% Generated Code Do Not Modify
% package org.allbinary.logic.control.crypt

-module('Encoder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

encode(Value) when (is_tuple(Value) orelse Value =:= undefined) ->
        undefined.

decode(Value) when (is_list(Value) orelse Value =:= undefined) ->
        undefined.

