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
% package org.allbinary.game.input
% import org.allbinary.graphics.paint.PaintableInterface

-module('TestInputInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('PaintableInterface', Function, Arguments).


up(This) ->
    erlang:error({abstract_method, up}).

down(This) ->
    erlang:error({abstract_method, down}).

left(This) ->
    erlang:error({abstract_method, left}).

right(This) ->
    erlang:error({abstract_method, right}).

strafeLeft(This) ->
    erlang:error({abstract_method, strafeLeft}).

strafeRight(This) ->
    erlang:error({abstract_method, strafeRight}).

