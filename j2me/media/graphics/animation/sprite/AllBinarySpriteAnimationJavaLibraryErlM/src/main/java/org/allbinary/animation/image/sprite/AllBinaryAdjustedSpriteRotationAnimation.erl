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
% package org.allbinary.animation.image.sprite
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.game.Sprite
% import org.allbinary.animation.AnimationBehavior

-module('AllBinaryAdjustedSpriteRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinarySpriteRotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, dx}, 0),
    put({This, dy}, 0),
    ok.


new(Sprite, Image, Dx, Dy, AnimationBehavior) when is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Sprite, Image, Dx, Dy, AnimationBehavior),
    This.

'$init'(This, Sprite, Image, Dx, Dy, AnimationBehavior) when is_integer(Dx), is_integer(Dy) ->
        'AllBinarySpriteRotationAnimation':'$init'(This, Sprite, Image, AnimationBehavior),
        init_fields(This),
        put({This, dx}, Dx),
        put({This, dy}, Dy).

paintXY(This, G, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, sprite}), '$class'})):setPosition(get({This, sprite}), (X + get({This, dx})), (Y + get({This, dy}))),
        (get({This, '$class'})):paint(This, G).

