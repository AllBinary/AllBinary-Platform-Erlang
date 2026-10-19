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
% package org.allbinary.layer
% import org.allbinary.game.identification.GroupInterfaceCompositeInterface
% import org.allbinary.graphics.paint.PaintableInterface

-module('LayerInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('NamedInterface', Function, Arguments).


getHeight(This) ->
    erlang:error({abstract_method, getHeight}).

getWidth(This) ->
    erlang:error({abstract_method, getWidth}).

getHalfHeight(This) ->
    erlang:error({abstract_method, getHalfHeight}).

getHalfWidth(This) ->
    erlang:error({abstract_method, getHalfWidth}).

getXP(This) ->
    erlang:error({abstract_method, getXP}).

getYP(This) ->
    erlang:error({abstract_method, getYP}).

getZP(This) ->
    erlang:error({abstract_method, getZP}).

getX2(This) ->
    erlang:error({abstract_method, getX2}).

getY2(This) ->
    erlang:error({abstract_method, getY2}).

getZ2(This) ->
    erlang:error({abstract_method, getZ2}).

isVisible(This) ->
    erlang:error({abstract_method, isVisible}).

moveDXYZ(This, Dx, Dy, Dz) when is_integer(Dx), is_integer(Dy), is_integer(Dz) ->
    erlang:error({abstract_method, moveDXYZ}).

setVisible(This, Visible) when is_boolean(Visible) ->
    erlang:error({abstract_method, setVisible}).

implmentsTickableInterface(This) ->
    erlang:error({abstract_method, implmentsTickableInterface}).

implmentsCollidableInterface(This) ->
    erlang:error({abstract_method, implmentsCollidableInterface}).

implmentsGameInputInterface(This) ->
    erlang:error({abstract_method, implmentsGameInputInterface}).

implmentsArtificialIntelligenceCompositeInterface(This) ->
    erlang:error({abstract_method, implmentsArtificialIntelligenceCompositeInterface}).

getType(This) ->
    erlang:error({abstract_method, getType}).

