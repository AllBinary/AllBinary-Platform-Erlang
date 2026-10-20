% Generated Code Do Not Modify
% import org.junit.jupiter.api.Assertions
% import org.junit.jupiter.api.DisplayName
% import org.junit.jupiter.api.Test

-module('AppTest').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


testAddition(This) ->
        'Assertions':assertEquals(2, (1 + 1)).

testStringEquality(This) ->
        Expected = "Hello World!",
        Actual = "Hello World!",
        'Assertions':assertEquals(Expected, Actual).

testBooleanAssertions(This) ->
        'Assertions':assertTrue(true),
        'Assertions':assertFalse(false).

