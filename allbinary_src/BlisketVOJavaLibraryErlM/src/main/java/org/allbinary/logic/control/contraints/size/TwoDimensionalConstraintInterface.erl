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
% package org.allbinary.logic.control.contraints.size

-module('TwoDimensionalConstraintInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getHeight(This) ->
    erlang:error({abstract_method, getHeight}).

getWidth(This) ->
    erlang:error({abstract_method, getWidth}).

setHeight(This, HeightSizeConstraintInterface) ->
    erlang:error({abstract_method, setHeight}).

setWidth(This, WidthSizeConstraintInterface) ->
    erlang:error({abstract_method, setWidth}).

