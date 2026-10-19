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
% package org.allbinary.media.graphics.geography.map.racetrack
% import org.allbinary.media.graphics.geography.map.GeographicMapInterface

-module('RaceTrackGeographicMapInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('GeographicMapInterface', Function, Arguments).


getRaceTrackInfo(This) ->
    erlang:error({abstract_method, getRaceTrackInfo}).

setRaceTrackInfo(This, ARaceTrackInfo) ->
    erlang:error({abstract_method, setRaceTrackInfo}).

getRaceTrackData(This) ->
    erlang:error({abstract_method, getRaceTrackData}).

setRaceTrackData(This, RaceTrackData) ->
    erlang:error({abstract_method, setRaceTrackData}).

