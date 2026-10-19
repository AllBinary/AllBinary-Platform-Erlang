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
% package org.allbinary.animation
% import javax.microedition.lcdui.Graphics
% import org.allbinary.graphics.color.BasicColorFactory

-module('ColorLessVectorAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('VectorAnimation', Function, Arguments).

init_fields(This) ->
    ok.


new(CurrentPoints, AnimationBehavior) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, CurrentPoints, AnimationBehavior),
    This.

init(This, CurrentPoints, AnimationBehavior) when (is_tuple(CurrentPoints) orelse CurrentPoints =:= undefined) ->
        'VectorAnimation':init(This, CurrentPoints, get({'BasicColorFactory':getInstance(), 'WHITE'}), AnimationBehavior).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({This, '$class'})):paintVectors(This, Graphics, X, Y).

