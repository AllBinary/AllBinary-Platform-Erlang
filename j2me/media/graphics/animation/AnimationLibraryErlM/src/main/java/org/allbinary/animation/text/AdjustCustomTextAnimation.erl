% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.animation.text
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.AnimationBehavior

-module('AdjustCustomTextAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('CustomTextAnimation', Function, Arguments).

init_fields(This) ->
    put({This, dx}, 0),
    put({This, dy}, 0),
    ok.


new(Text, FontSize, Dx, Dy, AnimationBehavior) when (is_list(Text) orelse Text =:= undefined), is_integer(FontSize), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Text, FontSize, Dx, Dy, AnimationBehavior),
    This.

'$init'(This, Text, FontSize, Dx, Dy, AnimationBehavior) when (is_list(Text) orelse Text =:= undefined), is_integer(FontSize), is_integer(Dx), is_integer(Dy) ->
        'CustomTextAnimation':'$init'(This, Text, FontSize, AnimationBehavior),
        init_fields(This),
        put({This, dx}, Dx),
        put({This, dy}, Dy).

getDx(This) ->
        get({This, dx}).

setDx(This, Dx) when is_integer(Dx) ->
        put({This, dx}, Dx).

getDy(This) ->
        get({This, dy}).

setDy(This, Dy) when is_integer(Dy) ->
        put({This, dy}, Dy).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        'CustomTextAnimation':paintXY(This, Graphics, (X + get({This, dx})), (Y + get({This, dy}))).

