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
% package org.allbinary.game.physics.velocity

-module('VelocityInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicVelocityInterface', Function, Arguments).


getMaxForwardVelocity(This) ->
    erlang:error({abstract_method, getMaxForwardVelocity}).

getMaxReverseVelocity(This) ->
    erlang:error({abstract_method, getMaxReverseVelocity}).

limitMaxXYForwardVelocity(This) ->
    erlang:error({abstract_method, limitMaxXYForwardVelocity}).

limitMaxXYReverseVelocity(This) ->
    erlang:error({abstract_method, limitMaxXYReverseVelocity}).

limitXYToForwardAndReverseMaxVelocity(This) ->
    erlang:error({abstract_method, limitXYToForwardAndReverseMaxVelocity}).

limitMaxXYVelocity(This, MaxVelocity) when is_integer(MaxVelocity) ->
    erlang:error({abstract_method, limitMaxXYVelocity}).

setMaxForwardVelocity(This, MaxForwardVelocity) when is_integer(MaxForwardVelocity) ->
    erlang:error({abstract_method, setMaxForwardVelocity}).

setMaxReverseVelocity(This, MaxReverseVelocity) when is_integer(MaxReverseVelocity) ->
    erlang:error({abstract_method, setMaxReverseVelocity}).

