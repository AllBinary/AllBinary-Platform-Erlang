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
% import org.allbinary.layer.PositionInterface
% import org.allbinary.logic.NullUtil

-module('LineAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements ColorCompositeInterface
% implements PositionInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('Animation', Function, Arguments).

init_fields(This) ->
    put({This, newLine}, array:new(2, {default, array:new(2, {default, 0})})),
    put({This, tempLine}, get({'NullUtil':getInstance(), 'NULL_INT_ARRAY_ARRAY'})),
    put({This, line}, array:new(2, {default, array:new(2, {default, 0})})),
    ok.


new(BasicColor) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicColor),
    This.

'$init'(This, BasicColor) ->
    'Animation':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):setBasicColorP(This, BasicColor).

init(This, X, Y) when is_integer(X), is_integer(Y) ->
        put({This, newLine}, array:set(0, array:set(0, X, array:get(0, get({This, newLine}))), get({This, newLine}))),
        put({This, newLine}, array:set(0, array:set(1, Y, array:get(0, get({This, newLine}))), get({This, newLine}))),
        put({This, newLine}, array:set(1, array:set(0, X, array:get(1, get({This, newLine}))), get({This, newLine}))),
        put({This, newLine}, array:set(1, array:set(1, Y, array:get(1, get({This, newLine}))), get({This, newLine}))),
        put({This, tempLine}, get({This, line})),
        put({This, line}, get({This, newLine})),
        put({This, newLine}, get({This, tempLine})).

setPosition(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        put({This, newLine}, array:set(0, array:set(0, array:get(0, array:get(1, get({This, line}))), array:get(0, get({This, newLine}))), get({This, newLine}))),
        put({This, newLine}, array:set(0, array:set(1, array:get(1, array:get(1, get({This, line}))), array:get(0, get({This, newLine}))), get({This, newLine}))),
        put({This, newLine}, array:set(1, array:set(0, X, array:get(1, get({This, newLine}))), get({This, newLine}))),
        put({This, newLine}, array:set(1, array:set(1, Y, array:get(1, get({This, newLine}))), get({This, newLine}))),
        put({This, tempLine}, get({This, line})),
        put({This, line}, get({This, newLine})),
        put({This, newLine}, get({This, tempLine})).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        CurrentLine = get({This, line}),
        (get({get({This, basicSetColorUtil}), '$class'})):setBasicColorP3(get({This, basicSetColorUtil}), Graphics, (get({This, '$class'})):getBasicColorP(This), (get({This, '$class'})):getColor(This)),
        (get({Graphics, '$class'})):drawLine(Graphics, array:get(0, array:get(0, CurrentLine)), array:get(1, array:get(0, CurrentLine)), array:get(0, array:get(1, CurrentLine)), array:get(1, array:get(1, CurrentLine))).

nextFrame(This) ->
        ok.

