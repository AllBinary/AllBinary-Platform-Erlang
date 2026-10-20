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
% package org.allbinary.input.automation.module.generic.constraints
% import java.awt
% import java.awt.image.BufferedImage
% import org.allbinary.graphics.GPoint
% import org.allbinary.input.automation.module.ImageComparatorConstraints

-module('NoImageComparatorConstraints').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageComparatorConstraints', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
        'ImageComparatorConstraints':'$init'(This, 1),
        (get({This, '$class'})):setMaxNonMatchingPixelDeltas(This, get({'Integer', 'MAX_VALUE'})).

isColorAllowed(This, Frame, Point, Color) when is_integer(Frame) ->
        true.

isImageValid(This, BufferedImage) ->
        true.

