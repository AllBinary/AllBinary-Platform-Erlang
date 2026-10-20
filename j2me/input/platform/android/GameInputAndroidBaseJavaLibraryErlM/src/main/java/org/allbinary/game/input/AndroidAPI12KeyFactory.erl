% Generated Code Do Not Modify
% package org.allbinary.game.input
% import android.view.KeyEvent
% import org.allbinary.logic.NullUtil

-module('AndroidAPI12KeyFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AndroidAPI9KeyFactory', Function, Arguments).

static_init() ->
    put({?MODULE, instance12}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    ok.


getAPI12Instance() ->
        case (get({'AndroidAPI12KeyFactory', instance12}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'AndroidAPI12KeyFactory', instance12}, 'AndroidAPI12KeyFactory':new());
            false -> ok
        end,
        get({'AndroidAPI12KeyFactory', instance12}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'AndroidAPI9KeyFactory':'$init'(This),
    init_fields(This),
        put({This, 'KEYCODE_BUTTON_1'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_1'}), "BUTTON 1")),
        put({This, 'KEYCODE_BUTTON_10'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_10'}), "BUTTON 10")),
        put({This, 'KEYCODE_BUTTON_11'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_11'}), "BUTTON 11")),
        put({This, 'KEYCODE_BUTTON_12'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_12'}), "BUTTON 12")),
        put({This, 'KEYCODE_BUTTON_13'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_13'}), "BUTTON 13")),
        put({This, 'KEYCODE_BUTTON_14'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_14'}), "BUTTON 14")),
        put({This, 'KEYCODE_BUTTON_15'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_15'}), "BUTTON 15")),
        put({This, 'KEYCODE_BUTTON_16'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_16'}), "BUTTON 16")),
        put({This, 'KEYCODE_BUTTON_2'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_2'}), "BUTTON 2")),
        put({This, 'KEYCODE_BUTTON_3'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_3'}), "BUTTON 3")),
        put({This, 'KEYCODE_BUTTON_4'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_4'}), "BUTTON 4")),
        put({This, 'KEYCODE_BUTTON_5'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_5'}), "BUTTON 5")),
        put({This, 'KEYCODE_BUTTON_6'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_6'}), "BUTTON 6")),
        put({This, 'KEYCODE_BUTTON_7'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_7'}), "BUTTON 7")),
        put({This, 'KEYCODE_BUTTON_8'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_8'}), "BUTTON 8")),
        put({This, 'KEYCODE_BUTTON_9'}, 'AndroidGameKey':new(get({'KeyEvent', 'KEYCODE_BUTTON_9'}), "BUTTON 9")).

