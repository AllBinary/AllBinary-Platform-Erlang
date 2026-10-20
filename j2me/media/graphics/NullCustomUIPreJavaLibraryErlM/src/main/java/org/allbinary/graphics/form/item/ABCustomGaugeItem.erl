% Generated Code Do Not Modify
% package org.allbinary.graphics.form.item
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.string.StringUtil

-module('ABCustomGaugeItem').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ABCustomItem', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_GAUGE_ITEM'}, 'ABCustomGaugeItem':new(get({'StringUtil':getInstance(), 'EMPTY_STRING'}), 1, 0, get({'BasicColorFactory':getInstance(), 'BLACK'}), get({'BasicColorFactory':getInstance(), 'WHITE'}))),
    ok.

init_fields(This) ->
    ok.


new(Label, MaxValue, InitialValue, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), is_integer(MaxValue), is_integer(InitialValue) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Label, MaxValue, InitialValue, BackgroundBasicColor, ForegroundBasicColor),
    This.

'$init'(This, Label, MaxValue, InitialValue, BackgroundBasicColor, ForegroundBasicColor) when (is_list(Label) orelse Label =:= undefined), is_integer(MaxValue), is_integer(InitialValue) ->
        'ABCustomItem':'$init'(This, Label, BackgroundBasicColor, ForegroundBasicColor).

