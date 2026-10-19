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
% package org.allbinary.graphics.j2me.workarea
% import org.w3c.dom.Document

-module('WorkAreaJPanelInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('KeyListener', Function, Arguments).


getName(This) ->
    erlang:error({abstract_method, getName}).

deselect(This) ->
    erlang:error({abstract_method, deselect}).

select(This) ->
    erlang:error({abstract_method, select}).

changeZoom(This, Factor) when is_integer(Factor) ->
    erlang:error({abstract_method, changeZoom}).

explodeAll(This) ->
    erlang:error({abstract_method, explodeAll}).

% throws Exception
autoRotate(This, Increments, TotalAngle) when is_integer(Increments), is_integer(TotalAngle) ->
    erlang:error({abstract_method, autoRotate}).

% throws Exception
autoExplode(This, NumberOfFrames, ExplodeType) when is_integer(NumberOfFrames), is_integer(ExplodeType) ->
    erlang:error({abstract_method, autoExplode}).

% throws Exception
autoMirror(This) ->
    erlang:error({abstract_method, autoMirror}).

play(This) ->
    erlang:error({abstract_method, play}).

stop(This) ->
    erlang:error({abstract_method, stop}).

isPlaying(This) ->
    erlang:error({abstract_method, isPlaying}).

% throws Exception
toDocument(This) ->
    erlang:error({abstract_method, toDocument}).

