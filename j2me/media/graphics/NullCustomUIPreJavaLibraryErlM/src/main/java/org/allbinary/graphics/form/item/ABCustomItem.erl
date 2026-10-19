% Generated Code Do Not Modify
% package org.allbinary.graphics.form.item
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Screen
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringUtil

-module('ABCustomItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_CUSTOM_ITEM'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    ok.

init_fields(This) ->
    ok.


getNullInstance() ->
        case (get({'ABCustomItem', 'NULL_CUSTOM_ITEM'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'ABCustomItem', 'NULL_CUSTOM_ITEM'}, 'ABCustomItem':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'BasicColorFactory':getInstance(), 'BLACK'}), get({'BasicColorFactory':getInstance(), 'WHITE'})));
            false -> ok
        end,
        get({'ABCustomItem', 'NULL_CUSTOM_ITEM'}).

new(Label, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Label, BackgroundBasicColor, ForegroundBasicColor),
    This.

init(This, Label, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined) ->
    init_fields(This),
        ok.

setOwner(This, Owner) ->
        ok.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        ok.

paintUnselected(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        ok.

isFocusable(This) ->
        false.

getLabel(This) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

setLabel(This, Label) when (is_list(Label) orelse Label =:= undefined) ->
        ok.

getHeight(This) ->
        0.

setHeight(This, Height) when is_integer(Height) ->
        ok.

getValue(This) ->
        0.0.

setValue(This, Value) when is_number(Value) ->
        ok.

getMinimumWidth(This) ->
        0.

getMinimumHeight(This) ->
        0.

preMeasurement(This, Graphics) ->
        ok.

