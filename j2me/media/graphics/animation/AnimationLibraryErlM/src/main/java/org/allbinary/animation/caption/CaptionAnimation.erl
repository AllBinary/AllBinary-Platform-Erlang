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
% package org.allbinary.animation.caption
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation

-module('CaptionAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Animation', Function, Arguments).

init_fields(This) ->
    put({This, animationInterface}, undefined),
    put({This, overlayAnimationInterface}, undefined),
    put({This, captionDx}, 0),
    put({This, captionDy}, 0),
    put({This, dx}, 0),
    put({This, dy}, 0),
    ok.


new(AnimationInterface, OverlayAnimationInterface, CaptionDx, CaptionDy, Dx, Dy) when is_integer(CaptionDx), is_integer(CaptionDy), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnimationInterface, OverlayAnimationInterface, CaptionDx, CaptionDy, Dx, Dy),
    This.

'$init'(This, AnimationInterface, OverlayAnimationInterface, CaptionDx, CaptionDy, Dx, Dy) when is_integer(CaptionDx), is_integer(CaptionDy), is_integer(Dx), is_integer(Dy) ->
    'Animation':'$init'(This),
    init_fields(This),
        put({This, animationInterface}, AnimationInterface),
        put({This, overlayAnimationInterface}, OverlayAnimationInterface),
        put({This, captionDx}, CaptionDx),
        put({This, captionDy}, CaptionDy),
        put({This, dx}, Dx),
        put({This, dy}, Dy).

% throws Exception
nextFrame(This) ->
        ok.

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, (X + get({This, captionDx})), (Y + get({This, captionDy}))),
        (get({get({This, overlayAnimationInterface}), '$class'})):paintXY(get({This, overlayAnimationInterface}), Graphics, ((X + get({This, captionDx})) + get({This, dx})), ((Y + get({This, captionDy})) + get({This, dy}))).

paintThreedXYZ(This, Graphics, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        (get({get({This, animationInterface}), '$class'})):paintThreedXYZ(get({This, animationInterface}), Graphics, (X + get({This, captionDx})), (Y + get({This, captionDy})), Z),
        (get({get({This, overlayAnimationInterface}), '$class'})):paintThreedXYZ(get({This, overlayAnimationInterface}), Graphics, ((X + get({This, captionDx})) + get({This, dx})), ((Y + get({This, captionDy})) + get({This, dy})), Z).

