% Generated Code Do Not Modify
% package org.allbinary.animation

-module('FixedPoint').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'FixedPoint':new()),
    ok.

init_fields(This) ->
    put({This, 'ONE'}, (1 bsl 16)),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'FixedPoint', instance}).

toFixed(This, Val) when is_number(Val) ->
        trunc(((Val * 65536.0)));
toFixed(This, Val) when is_number(Val) ->
        trunc(((Val * 65536.0))).


mul(This, A, B) when is_integer(A), is_integer(B) ->
        ((((A * B)) bsr 16)).

'div'(This, A, B) when is_integer(A), is_integer(B) ->
        (((((A) bsl 16)) div B)).

toInt(This, Fixed) when is_integer(Fixed) ->
        (Fixed bsr 16).

