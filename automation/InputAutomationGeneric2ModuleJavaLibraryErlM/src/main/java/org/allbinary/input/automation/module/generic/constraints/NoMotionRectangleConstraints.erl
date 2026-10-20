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
% import org.allbinary.input.automation.module.MotionRectangleConstraints

-module('NoMotionRectangleConstraints').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('MotionRectangleConstraints', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'MotionRectangleConstraints':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):setMinDimension(This, 'Dimension':new(0, 0)),
        (get({This, '$class'})):setMinArea(This, 0),
        (get({This, '$class'})):setMaxDimension(This, 'Dimension':new(get({'Integer', 'MAX_VALUE'}), get({'Integer', 'MAX_VALUE'}))),
        (get({This, '$class'})):setMaxMotionRectangles(This, get({'Integer', 'MAX_VALUE'})).

isValid(This, Frame, BufferedImage, Rectangle) ->
        true.

