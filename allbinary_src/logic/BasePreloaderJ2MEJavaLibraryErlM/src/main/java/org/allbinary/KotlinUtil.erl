% Generated Code Do Not Modify
% package org.allbinary
% import org.allbinary.logic.string.StringUtil

-module('KotlinUtil').
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


isKotlin() ->
        false.

getShortName() ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

