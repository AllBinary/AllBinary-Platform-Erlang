% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.AnimationBehaviorFactory

-module('AllBinaryPlatformImageRotationAnimationFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryJ2SEImageRotationAnimationFactory', Function, Arguments).

init_fields(This) ->
    ok.


new(Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement), is_boolean(ResizeCanvasForRotation) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation),
    This.

init(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation) when is_integer(Width), is_integer(Height), is_integer(AngleIncrement), is_boolean(ResizeCanvasForRotation) ->
        'AllBinaryJ2SEImageRotationAnimationFactory':init(This, Image, Width, Height, AngleIncrement, AnimationBehaviorFactory, ResizeCanvasForRotation).

