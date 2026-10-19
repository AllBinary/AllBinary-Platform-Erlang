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
% package org.allbinary.game.layer.special
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.graphics.paint.PaintableInterface
% import org.allbinary.layer.AllBinaryLayerManager

-module('SpecialGameInputInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('PaintableInterface', Function, Arguments).


% throws Exception
up(This) ->
    erlang:error({abstract_method, up}).

% throws Exception
down(This) ->
    erlang:error({abstract_method, down}).

% throws Exception
right(This) ->
    erlang:error({abstract_method, right}).

% throws Exception
left(This) ->
    erlang:error({abstract_method, left}).

% throws Exception
strafeLeft(This) ->
    erlang:error({abstract_method, strafeLeft}).

% throws Exception
strafeRight(This) ->
    erlang:error({abstract_method, strafeRight}).

% throws Exception
fire(This, LayerManager, GameKeyEvent) ->
    erlang:error({abstract_method, fire}).

% throws Exception
special1(This, LayerManager, GameKeyEvent) ->
    erlang:error({abstract_method, special1}).

% throws Exception
special2(This, LayerManager, GameKeyEvent) ->
    erlang:error({abstract_method, special2}).

% throws Exception
special3(This, LayerManager, GameKeyEvent) ->
    erlang:error({abstract_method, special3}).

% throws Exception
special4(This, LayerManager, GameKeyEvent) ->
    erlang:error({abstract_method, special4}).

% throws Exception
special5(This, LayerManager, GameKeyEvent) ->
    erlang:error({abstract_method, special5}).

