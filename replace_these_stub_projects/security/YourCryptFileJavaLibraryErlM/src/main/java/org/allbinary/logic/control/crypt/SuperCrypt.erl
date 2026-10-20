% Generated Code Do Not Modify
% package org.allbinary.logic.control.crypt

-module('SuperCrypt').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'KEYMAX'}, 0),
    ok.

init_fields(This) ->
    ok.


new(Key) when is_integer(Key) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Key),
    This.

'$init'(This, Key) when is_integer(Key) ->
    init_fields(This),
        ok.

encrypt(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        undefined.

decrypt(This, Value) when (is_list(Value) orelse Value =:= undefined) ->
        undefined.

