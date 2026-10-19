% Generated Code Do Not Modify
% package org.allbinary.graphics.font
% import javax.microedition.lcdui.Font
% import org.allbinary.logic.string.StringMaker

-module('FontDebugBase').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instanceBase}, 'FontDebugBase':new()),
    ok.

init_fields(This) ->
    put({This, 'SET_FONT'}, "setFont"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'FontDebugBase', instanceBase}).

debugMetrics(This, CurrentFont, ConvertedTextSize, DisplayMetrics, StringBuffer) when is_number(ConvertedTextSize) ->
        ok.

debugDpi(This, DensityDpi, StringBuffer) when is_integer(DensityDpi) ->
        ok.

debugDimension(This, CurrentFont, ConvertedTextSize, LongestDimensionTotalPixels, StringBuffer) when is_number(ConvertedTextSize), is_integer(LongestDimensionTotalPixels) ->
        ok.

