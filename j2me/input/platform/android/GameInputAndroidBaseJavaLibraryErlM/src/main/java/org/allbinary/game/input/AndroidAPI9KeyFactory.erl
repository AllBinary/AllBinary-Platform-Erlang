% Generated Code Do Not Modify
% package org.allbinary.game.input
% import android.view.KeyEvent
% import org.allbinary.logic.NullUtil

-module('AndroidAPI9KeyFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AndroidKeyFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        case (get({'AndroidAPI9KeyFactory', instance}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'AndroidAPI9KeyFactory', instance}, 'AndroidAPI9KeyFactory':new());
            false -> ok
        end,
        get({'AndroidAPI9KeyFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'AndroidKeyFactory':'$init'(This),
    init_fields(This),
        put({This, 'KEYCODE_BUTTON_L1'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_L1'}), "BUTTON L1")),
        put({This, 'KEYCODE_BUTTON_R1'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_R1'}), "BUTTON R1")),
        put({This, 'KEYCODE_BUTTON_THUMBR'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_THUMBR'}), "BUTTON THUMBR")),
        put({This, 'KEYCODE_BUTTON_THUMBL'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_THUMBL'}), "BUTTON THUMBL")),
        put({This, 'KEYCODE_BUTTON_START'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_START'}), "BUTTON START")),
        put({This, 'KEYCODE_BUTTON_MODE'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_MODE'}), "BUTTON MODE")),
        put({This, 'KEYCODE_BUTTON_B'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_B'}), "BUTTON B")),
        put({This, 'KEYCODE_BUTTON_A'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_A'}), "BUTTON A")),
        put({This, 'KEYCODE_BUTTON_X'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_X'}), "BUTTON X")),
        put({This, 'KEYCODE_BUTTON_Y'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_Y'}), "BUTTON Y")),
        put({This, 'KEYCODE_BUTTON_L2'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_L2'}), "BUTTON L2")),
        put({This, 'KEYCODE_BUTTON_R2'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_R2'}), "BUTTON R2")),
        put({This, 'KEYCODE_BUTTON_SELECT'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_SELECT'}), "BUTTON SELECT")),
        put({This, 'KEYCODE_BUTTON_C'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_C'}), "BUTTON C")),
        put({This, 'KEYCODE_BUTTON_Z'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_Z'}), "BUTTON Z")).

