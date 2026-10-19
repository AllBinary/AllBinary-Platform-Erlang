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
% package org.allbinary.game.resource
% import org.allbinary.graphics.Rectangle

-module('RectangleResourceFactoryInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


% throws Exception
getRectangle(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
    erlang:error({abstract_method, getRectangle}).

% throws Exception
getRectangleArrayOfArrays(This, Resource) when (is_list(Resource) orelse Resource =:= undefined) ->
    erlang:error({abstract_method, getRectangleArrayOfArrays}).

