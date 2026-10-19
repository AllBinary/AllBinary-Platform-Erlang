% Generated Code Do Not Modify
% import org.junit.jupiter.api.Assertions
% import org.junit.jupiter.api.DisplayName
% import org.junit.jupiter.api.Test

-module('BooleanTest').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


