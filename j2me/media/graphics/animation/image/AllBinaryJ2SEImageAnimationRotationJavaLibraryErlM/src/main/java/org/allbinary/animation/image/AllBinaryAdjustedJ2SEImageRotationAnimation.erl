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
% import org.allbinary.math.AngleInfo

-module('AllBinaryAdjustedJ2SEImageRotationAnimation').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryJ2SEImageRotationAnimation', Function, Arguments).

init_fields(This) ->
    put({This, dx}, 0),
    put({This, dy}, 0),
    ok.


new(OriginalImage, Image, AngleInfo, TotalAngle, Dx, Dy, AnimationBehavior) when is_integer(TotalAngle), is_integer(Dx), is_integer(Dy) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, OriginalImage, Image, AngleInfo, TotalAngle, Dx, Dy, AnimationBehavior),
    This.

init(This, OriginalImage, Image, AngleInfo, TotalAngle, Dx, Dy, AnimationBehavior) when is_integer(TotalAngle), is_integer(Dx), is_integer(Dy) ->
        'AllBinaryJ2SEImageRotationAnimation':init(This, OriginalImage, Image, AngleInfo, TotalAngle, AnimationBehavior),
        init_fields(This),
        (get({This, '$class'})):init(This, Dx, Dy).

% throws Exception
init(This, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        put({This, dx}, Dx),
        put({This, dy}, Dy).

setDx(This, Dx) when is_integer(Dx) ->
        put({This, dx}, Dx).

getDx(This) ->
        get({This, dx}).

setDy(This, Dy) when is_integer(Dy) ->
        put({This, dy}, Dy).

getDy(This) ->
        get({This, dy}).

paintXY(This, Graphics, X, Y) when is_integer(X), is_integer(Y) ->
        'AllBinaryJ2SEImageRotationAnimation':paintXY(This, Graphics, (X + get({This, dx})), (Y + get({This, dy}))).

