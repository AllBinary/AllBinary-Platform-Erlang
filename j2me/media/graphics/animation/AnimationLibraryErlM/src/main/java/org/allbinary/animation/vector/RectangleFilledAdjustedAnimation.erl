%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% 
% Created By: Travis Berthelot
%  
% Generated Code Do Not Modify
% package org.allbinary.animation.vector
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.ColorCompositeInterface

-module('RectangleFilledAdjustedAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ColorCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('RectangleFilledAnimation', Function, Arguments).

init_fields(This) ->
    put({This, offsetX}, 0),
    put({This, offsetY}, 0),
    ok.


new(Width, Height, OffsetX, OffsetY, BasicColor) when is_integer(Width), is_integer(Height), is_integer(OffsetX), is_integer(OffsetY) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Width, Height, OffsetX, OffsetY, BasicColor),
    This.

'$init'(This, Width, Height, OffsetX, OffsetY, BasicColor) when is_integer(Width), is_integer(Height), is_integer(OffsetX), is_integer(OffsetY) ->
        'RectangleFilledAnimation':'$init'(This, Width, Height, BasicColor),
        init_fields(This),
        put({This, offsetX}, OffsetX),
        put({This, offsetY}, OffsetY),
        (get({This, '$class'})):setBasicColorP(This, BasicColor).

nextFrame(This) ->
        ok.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This), (get({This, '$class'})):getColor(This)),
        'RectangleFilledAnimation':paintXY(This, Graphics, (X + get({This, offsetX})), (Y + get({This, offsetY}))).

setOffsetX(This, OffsetX) when is_integer(OffsetX) ->
        put({This, offsetX}, OffsetX).

setOffsetY(This, OffsetY) when is_integer(OffsetY) ->
        put({This, offsetY}, OffsetY).

