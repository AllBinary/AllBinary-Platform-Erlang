% Generated Code Do Not Modify
% package org.allbinary.game.input
% import javax.microedition.lcdui.Canvas
% import android.view.KeyEvent

-module('AndroidNumberKeyToJ2MECanvasNumberKey').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, androidtoJavaMicroEditionKeyMap}, array:new(17, {default, 0})),
    ok.

init_fields(This) ->
    ok.


init() ->
        put({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}, array:set(get({'KeyEvent', 'KEYCODE_0'}), get({'Canvas', 'KEY_NUM0'}), get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}))),
        put({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}, array:set(get({'KeyEvent', 'KEYCODE_1'}), get({'Canvas', 'KEY_NUM1'}), get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}))),
        put({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}, array:set(get({'KeyEvent', 'KEYCODE_2'}), get({'Canvas', 'KEY_NUM2'}), get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}))),
        put({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}, array:set(get({'KeyEvent', 'KEYCODE_3'}), get({'Canvas', 'KEY_NUM3'}), get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}))),
        put({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}, array:set(get({'KeyEvent', 'KEYCODE_4'}), get({'Canvas', 'KEY_NUM4'}), get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}))),
        put({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}, array:set(get({'KeyEvent', 'KEYCODE_5'}), get({'Canvas', 'KEY_NUM5'}), get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}))),
        put({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}, array:set(get({'KeyEvent', 'KEYCODE_6'}), get({'Canvas', 'KEY_NUM6'}), get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}))),
        put({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}, array:set(get({'KeyEvent', 'KEYCODE_7'}), get({'Canvas', 'KEY_NUM7'}), get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}))),
        put({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}, array:set(get({'KeyEvent', 'KEYCODE_8'}), get({'Canvas', 'KEY_NUM8'}), get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}))),
        put({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}, array:set(get({'KeyEvent', 'KEYCODE_9'}), get({'Canvas', 'KEY_NUM9'}), get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}))).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getKey(Key) when is_integer(Key) ->
        try
        case (Key < array:size(get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap}))) of
            true ->
            Value = array:get(Key, get({'AndroidNumberKeyToJ2MECanvasNumberKey', androidtoJavaMicroEditionKeyMap})),
            case (Value =/= 0) of
                true ->
                throw({'$return', Value});
                false -> ok
            end;
            false -> ok
        end,
        Key
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

