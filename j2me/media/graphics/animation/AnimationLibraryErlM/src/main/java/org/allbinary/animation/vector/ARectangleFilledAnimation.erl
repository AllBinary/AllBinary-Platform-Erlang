% Generated Code Do Not Modify
% package org.allbinary.animation.vector
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColorFactory

-module('ARectangleFilledAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RectangleFilledAnimation', Function, Arguments).

init_fields(This) ->
    put({This, x}, 0),
    put({This, y}, 0),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'RectangleFilledAnimation':'$init'(This, 0, 0, get({'BasicColorFactory':getInstance(), 'BLACK'})),
        init_fields(This).

nextFrame(This) ->
        ok.

paintXY(This, Graphics, UnusedX, UnusedY) when is_integer(UnusedX), is_integer(UnusedY) ->
        'RectangleFilledAnimation':paintXY(This, Graphics, get({This, x}), get({This, y})).

