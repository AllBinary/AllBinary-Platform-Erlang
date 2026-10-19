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
% import org.allbinary.animation.Animation
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.graphics.color.ColorCompositeInterface

-module('CircleFilledAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ColorCompositeInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Animation', Function, Arguments).

init_fields(This) ->
    put({This, width}, 0),
    put({This, height}, 0),
    ok.


new(Width, Height, BasicColor) when is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Width, Height, BasicColor),
    This.

init(This, Width, Height, BasicColor) when is_integer(Width), is_integer(Height) ->
        'Animation':init(This),
        init_fields(This),
        put({This, width}, Width),
        put({This, height}, Height),
        (get({This, '$class'})):setBasicColorP(This, BasicColor).

nextFrame(This) ->
        ok.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This), (get({This, '$class'})):getColor(This)),
        (get({Graphics, '$class'})):fillRect(Graphics, X, Y, get({This, width}), get({This, height})).

