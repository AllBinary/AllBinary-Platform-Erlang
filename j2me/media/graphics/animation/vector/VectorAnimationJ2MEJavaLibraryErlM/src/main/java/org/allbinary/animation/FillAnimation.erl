% Generated Code Do Not Modify
% package org.allbinary.animation
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColor

-module('FillAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('IndexedAnimation', Function, Arguments).

init_fields(This) ->
    put({This, pixelBuffer}, undefined),
    put({This, width}, 0),
    put({This, height}, 0),
    ok.


new(PixelBuffer, Width, Height, AnimationBehavior) when (is_tuple(PixelBuffer) orelse PixelBuffer =:= undefined), is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, PixelBuffer, Width, Height, AnimationBehavior),
    This.

'$init'(This, PixelBuffer, Width, Height, AnimationBehavior) when (is_tuple(PixelBuffer) orelse PixelBuffer =:= undefined), is_integer(Width), is_integer(Height) ->
        'IndexedAnimation':'$init'(This, AnimationBehavior),
        init_fields(This),
        put({This, width}, 100),
        put({This, height}, 100),
        put({This, pixelBuffer}, PixelBuffer).

setBasicColorP(This, BasicColor) ->
        put({local, changed}, false),
        case (((get({This, '$class'})):getBasicColorP(This) =:= undefined) orelse ((fun(Target_N66010) -> (get({Target_N66010, '$class'})):intValue(Target_N66010) end)((get({This, '$class'})):getBasicColorP(This)) =/= (get({BasicColor, '$class'})):intValue(BasicColor))) of
            true ->
            put({local, changed}, true);
            false -> ok
        end,
        'IndexedAnimation':setBasicColorP(This, BasicColor),
        case get({local, changed}) of
            true ->
            (get({This, '$class'})):updateModifiers(This);
            false -> ok
        end.

changeBasicColor(This, BasicColor) ->
        put({local, changed}, false),
        case (((get({This, '$class'})):getChangeBasicColor(This) =:= undefined) orelse ((fun(Target_N66260) -> (get({Target_N66260, '$class'})):intValue(Target_N66260) end)((get({This, '$class'})):getChangeBasicColor(This)) =/= (get({BasicColor, '$class'})):intValue(BasicColor))) of
            true ->
            put({local, changed}, true);
            false -> ok
        end,
        'IndexedAnimation':changeBasicColor(This, BasicColor),
        case get({local, changed}) of
            true ->
            (get({This, '$class'})):updateModifiers(This);
            false -> ok
        end.

setAlpha(This, Alpha) when is_integer(Alpha) ->
        put({local, changed}, false),
        case (get({This, alphaP}) =/= Alpha) of
            true ->
            put({local, changed}, true);
            false -> ok
        end,
        'IndexedAnimation':setAlpha(This, Alpha),
        case get({local, changed}) of
            true ->
            (get({This, '$class'})):updateModifiers(This);
            false -> ok
        end.

setScale(This, ScaleX, ScaleY) when is_number(ScaleX), is_number(ScaleY) ->
        ok.

setMaxScale(This, MaxScaleX, MaxScaleY) when is_number(MaxScaleX), is_number(MaxScaleY) ->
        ok.

updateModifiers(This) ->
        ok.

paint(This, G) ->
        (get({G, '$class'})):drawRGB(G, get({This, pixelBuffer}), 0, get({This, width}), 0, 0, get({This, width}), get({This, height}), true).

