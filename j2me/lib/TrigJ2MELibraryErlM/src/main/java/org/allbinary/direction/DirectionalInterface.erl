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
% package org.allbinary.direction
% import org.allbinary.math.Angle

-module('DirectionalInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


setFrameByDirection(This, Direction) ->
    erlang:error({abstract_method, setFrameByDirection}).

setFrameToAngle(This, Angle) ->
    erlang:error({abstract_method, setFrameToAngle}).

adjustFrameToAngle(This, NewAngle) ->
    erlang:error({abstract_method, adjustFrameToAngle}).

adjustFrame(This, Angle) when is_integer(Angle) ->
    erlang:error({abstract_method, adjustFrame}).

