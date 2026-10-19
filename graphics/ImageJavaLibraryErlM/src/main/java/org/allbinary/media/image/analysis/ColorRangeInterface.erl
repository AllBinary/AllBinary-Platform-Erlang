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
% package org.allbinary.media.image.analysis
% import java.awt

-module('ColorRangeInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getMinRed(This) ->
    erlang:error({abstract_method, getMinRed}).

setMinRed(This, MinRed) when is_integer(MinRed) ->
    erlang:error({abstract_method, setMinRed}).

getMaxRed(This) ->
    erlang:error({abstract_method, getMaxRed}).

setMaxRed(This, MaxRed) when is_integer(MaxRed) ->
    erlang:error({abstract_method, setMaxRed}).

getMinGreen(This) ->
    erlang:error({abstract_method, getMinGreen}).

setMinGreen(This, MinGreen) when is_integer(MinGreen) ->
    erlang:error({abstract_method, setMinGreen}).

getMaxGreen(This) ->
    erlang:error({abstract_method, getMaxGreen}).

setMaxGreen(This, MaxGreen) when is_integer(MaxGreen) ->
    erlang:error({abstract_method, setMaxGreen}).

getMinBlue(This) ->
    erlang:error({abstract_method, getMinBlue}).

setMinBlue(This, MinBlue) when is_integer(MinBlue) ->
    erlang:error({abstract_method, setMinBlue}).

getMaxBlue(This) ->
    erlang:error({abstract_method, getMaxBlue}).

setMaxBlue(This, MaxBlue) when is_integer(MaxBlue) ->
    erlang:error({abstract_method, setMaxBlue}).

isInRange(This, Color) ->
    erlang:error({abstract_method, isInRange}).

