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
% import org.allbinary.AndroidUtil
% import org.allbinary.graphics.color.BasicColor

-module('AdjustedCircleAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CircleAnimation', Function, Arguments).

init_fields(This) ->
    put({This, xAdjustment}, 0),
    put({This, yAdjustment}, 0),
    ok.


createAnimation(Width, Height, XAdjustment, YAdjustment, BasicColor) when is_integer(Width), is_integer(Height), is_integer(XAdjustment), is_integer(YAdjustment) ->
        AdjustedCircleAnimation = 'AdjustedCircleAnimation':new(Width, Height, BasicColor),
        (get({AdjustedCircleAnimation, '$class'})):initXY(AdjustedCircleAnimation, XAdjustment, YAdjustment),
        AdjustedCircleAnimation.

createW(Width, Height, InnerWidth, BasicColor) when is_integer(Width), is_integer(Height), is_integer(InnerWidth) ->
        AdjustedCircleAnimation = 'AdjustedCircleAnimation':new(Width, Height, BasicColor),
        (get({AdjustedCircleAnimation, '$class'})):init(AdjustedCircleAnimation, InnerWidth),
        AdjustedCircleAnimation.

new(Width, Height, BasicColor) when is_integer(Width), is_integer(Height) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Width, Height, BasicColor),
    This.

'$init'(This, Width, Height, BasicColor) when is_integer(Width), is_integer(Height) ->
        'CircleAnimation':'$init'(This, Width, Height, BasicColor),
        init_fields(This).

initXY(This, XAdjustment, YAdjustment) when is_integer(XAdjustment), is_integer(YAdjustment) ->
        put({This, xAdjustment}, XAdjustment),
        put({This, yAdjustment}, YAdjustment).

init(This, InnerWidth) when is_integer(InnerWidth) ->
        case 'AndroidUtil':isAndroid() of
            true ->
            WidthPortion = ((((((InnerWidth div 3)) * 10)) div 7)),
            put({This, xAdjustment}, (-((((get({This, width}) bsr 1)) - WidthPortion)))),
            put({This, yAdjustment}, get({This, xAdjustment}));
            false ->
            put({This, xAdjustment}, (-((((get({This, width}) bsr 1)) - InnerWidth)))),
            put({This, yAdjustment}, get({This, xAdjustment}))
        end.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This), (get({This, '$class'})):getColor(This)),
        (get({Graphics, '$class'})):drawArc(Graphics, (X + get({This, xAdjustment})), (Y + get({This, yAdjustment})), get({This, width}), get({This, height}), 0, get({This, 'TOTAL_ANGLE'})).

