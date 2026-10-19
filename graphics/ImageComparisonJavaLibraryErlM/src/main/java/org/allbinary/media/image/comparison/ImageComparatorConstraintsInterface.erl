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
% package org.allbinary.media.image.comparison
% import java.awt
% import java.awt.image.BufferedImage
% import org.allbinary.graphics.GPoint

-module('ImageComparatorConstraintsInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getMaxNonMatchingPixelDeltas(This) ->
    erlang:error({abstract_method, getMaxNonMatchingPixelDeltas}).

isCollisionWithAvoidRectangles(This, Rectangle) ->
    erlang:error({abstract_method, isCollisionWithAvoidRectangles});
isCollisionWithAvoidRectangles(This, Point) ->
    erlang:error({abstract_method, isCollisionWithAvoidRectangles}).


isColorAllowed(This, Frame, Point, Color) when is_integer(Frame) ->
    erlang:error({abstract_method, isColorAllowed}).

% throws Exception
isImageValid(This, BufferedImage) ->
    erlang:error({abstract_method, isImageValid}).

isFrameAllowed(This, Frame) when is_integer(Frame) ->
    erlang:error({abstract_method, isFrameAllowed}).

