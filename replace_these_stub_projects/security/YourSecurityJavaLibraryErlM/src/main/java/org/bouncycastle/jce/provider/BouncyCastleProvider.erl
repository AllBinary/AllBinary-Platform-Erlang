% Generated Code Do Not Modify
% package org.bouncycastle.jce.provider
% import java.security.Provider

-module('BouncyCastleProvider').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Provider', Function, Arguments).

static_init() ->
    put({?MODULE, info}, "BouncyCastle Security Provider v1.41"),
    put({?MODULE, 'PROVIDER_NAME'}, "BC"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'Provider':'$init'(This, get({'BouncyCastleProvider', 'PROVIDER_NAME'}), 1.41, get({'BouncyCastleProvider', info})).

setParameter(This, ParameterName, Parameter) when (is_list(ParameterName) orelse ParameterName =:= undefined) ->
        ok.

