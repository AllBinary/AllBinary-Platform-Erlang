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
% package org.allbinary.logic.control.contraints

-module('MinMaxDoubleConstraintInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getMax(This) ->
    erlang:error({abstract_method, getMax}).

getMin(This) ->
    erlang:error({abstract_method, getMin}).

setMax(This, Max) when is_number(Max) ->
    erlang:error({abstract_method, setMax}).

setMin(This, Min) when is_number(Min) ->
    erlang:error({abstract_method, setMin}).

