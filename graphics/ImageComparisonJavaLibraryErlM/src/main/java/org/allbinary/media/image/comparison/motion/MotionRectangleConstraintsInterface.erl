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
% package org.allbinary.media.image.comparison.motion
% import java.awt
% import java.awt.image.BufferedImage

-module('MotionRectangleConstraintsInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getMaxMotionRectangles(This) ->
    erlang:error({abstract_method, getMaxMotionRectangles}).

getMinDimension(This) ->
    erlang:error({abstract_method, getMinDimension}).

getMinArea(This) ->
    erlang:error({abstract_method, getMinArea}).

getMaxDimension(This) ->
    erlang:error({abstract_method, getMaxDimension}).

isTooSmall(This, Rectangle) ->
    erlang:error({abstract_method, isTooSmall}).

isAreaTooSmall(This, Rectangle) ->
    erlang:error({abstract_method, isAreaTooSmall}).

isTooBig(This, Rectangle) ->
    erlang:error({abstract_method, isTooBig}).

% throws Exception
isValid(This, Frame, BufferedImage, Rectangle) ->
    erlang:error({abstract_method, isValid}).

