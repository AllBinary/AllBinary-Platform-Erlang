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
% package org.allbinary.animation.image
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.AnimationBehavior

-module('AdjustedLeftToRightImageAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('LeftToRightImageAnimation', Function, Arguments).

init_fields(This) ->
    put({This, dx}, 0),
    put({This, dy}, 0),
    ok.


new(Image, SequenceArray, Dx, Dy, AnimationBehavior) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Image, SequenceArray, Dx, Dy, AnimationBehavior),
    This.

'$init'(This, Image, SequenceArray, Dx, Dy, AnimationBehavior) when (is_tuple(SequenceArray) orelse SequenceArray =:= undefined), is_integer(Dx), is_integer(Dy) ->
        'LeftToRightImageAnimation':'$init'(This, Image, SequenceArray, AnimationBehavior),
        init_fields(This),
        (get({This, '$class'})):init(This, Dx, Dy).

% throws Exception
init(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        put({This, dx}, Dx),
        put({This, dy}, Dy).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        'LeftToRightImageAnimation':paintXY(This, Graphics, (X + get({This, dx})), (Y + get({This, dy}))).

