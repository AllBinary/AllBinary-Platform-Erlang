% Generated Code Do Not Modify
% package org.allbinary.graphics.displayable
% import javax.microedition.lcdui.Image

-module('ScreenRelationalUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ScreenRelationalUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'ScreenRelationalUtil', instance}).

getScaleImage(This, Image) ->
        (get({This, '$class'})):getScaleWH(This, (get({Image, '$class'})):getWidth(Image), (get({Image, '$class'})):getHeight(Image)).

getScaleWH(This, AWidth, AHeight) when is_integer(AWidth), is_integer(AHeight) ->
        (get({This, '$class'})):getScaleWHA(This, AWidth, AHeight, 20).

getScaleWHA(This, AWidth, AHeight, Add) when is_integer(AWidth), is_integer(AHeight), is_integer(Add) ->
        DisplayInfoSingleton = 'DisplayInfoSingleton':getInstance(),
        Last = (get({DisplayInfoSingleton, '$class'})):getLast(DisplayInfoSingleton),
        Width = float(array:get(get({DisplayInfoSingleton, 'WIDTH'}), Last)),
        Height = float(array:get(get({DisplayInfoSingleton, 'HEIGHT'}), Last)),
        put({local, largestSize}, Width),
        case (get({local, largestSize}) < Height) of
            true ->
            put({local, largestSize}, Height);
            false -> ok
        end,
        Scale = ((get({local, largestSize})) / float(AWidth)),
        Scale.

getScaledHeight(This, AWidth, AHeight) when is_integer(AWidth), is_integer(AHeight) ->
        trunc((((get({This, '$class'})):getScaleWH(This, AWidth, AHeight) * float(AHeight)))).

getScaledHeightAdd(This, AWidth, AHeight, Add) when is_integer(AWidth), is_integer(AHeight), is_integer(Add) ->
        trunc((((get({This, '$class'})):getScaleWHA(This, AWidth, AHeight, Add) * float(AHeight)))).

