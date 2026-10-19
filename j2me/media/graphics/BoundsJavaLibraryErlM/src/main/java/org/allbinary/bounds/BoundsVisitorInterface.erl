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
% package org.allbinary.bounds

-module('BoundsVisitorInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getX(This) ->
    erlang:error({abstract_method, getX}).

getY(This) ->
    erlang:error({abstract_method, getY}).

maxX(This) ->
    erlang:error({abstract_method, maxX}).

maxY(This) ->
    erlang:error({abstract_method, maxY}).

minX(This) ->
    erlang:error({abstract_method, minX}).

minY(This) ->
    erlang:error({abstract_method, minY}).

