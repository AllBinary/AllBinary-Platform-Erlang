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
% import org.allbinary.graphics.color.BasicColor

-module('RaceTrackInfo').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, id}, undefined),
    put({This, name}, undefined),
    put({This, raceTrackFrictionProperties}, undefined),
    put({This, foregroundBasicColor}, undefined),
    put({This, backgroundBasicColor}, undefined),
    put({This, qualifyTime}, 0),
    put({This, worstContinuePosition}, 0),
    put({This, totalLaps}, 0),
    ok.


new(Id, Name, RaceTrackFrictionProperties, ForegroundBasicColor, BackgroundBasicColor, QualifyTime, WorstContinuePosition, TotalLaps) when (is_list(Name) orelse Name =:= undefined), is_integer(QualifyTime), is_integer(WorstContinuePosition), is_integer(TotalLaps) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Id, Name, RaceTrackFrictionProperties, ForegroundBasicColor, BackgroundBasicColor, QualifyTime, WorstContinuePosition, TotalLaps),
    This.

'$init'(This, Id, Name, RaceTrackFrictionProperties, ForegroundBasicColor, BackgroundBasicColor, QualifyTime, WorstContinuePosition, TotalLaps) when (is_list(Name) orelse Name =:= undefined), is_integer(QualifyTime), is_integer(WorstContinuePosition), is_integer(TotalLaps) ->
    init_fields(This),
        put({This, id}, Id),
        put({This, name}, Name),
        put({This, raceTrackFrictionProperties}, RaceTrackFrictionProperties),
        put({This, backgroundBasicColor}, BackgroundBasicColor),
        put({This, foregroundBasicColor}, ForegroundBasicColor),
        put({This, qualifyTime}, QualifyTime),
        put({This, worstContinuePosition}, WorstContinuePosition),
        put({This, totalLaps}, TotalLaps).

getId(This) ->
        get({This, id}).

setId(This, Id) ->
        put({This, id}, Id).

getName(This) ->
        get({This, name}).

setName(This, Name) when (is_list(Name) orelse Name =:= undefined) ->
        put({This, name}, Name).

getQualifyTime(This) ->
        get({This, qualifyTime}).

setQualifyTime(This, QualifyTime) when is_integer(QualifyTime) ->
        put({This, qualifyTime}, QualifyTime).

getWorstContinuePosition(This) ->
        get({This, worstContinuePosition}).

setWorstContinuePosition(This, WorstContinuePosition) when is_integer(WorstContinuePosition) ->
        put({This, worstContinuePosition}, WorstContinuePosition).

getTotalLaps(This) ->
        get({This, totalLaps}).

setTotalLaps(This, TotalLaps) when is_integer(TotalLaps) ->
        put({This, totalLaps}, TotalLaps).

getForegroundBasicColor(This) ->
        get({This, foregroundBasicColor}).

setForegroundBasicColor(This, ForegroundBasicColor) ->
        put({This, foregroundBasicColor}, ForegroundBasicColor).

getBackgroundBasicColor(This) ->
        get({This, backgroundBasicColor}).

setBackgroundBasicColor(This, BackgroundBasicColor) ->
        put({This, backgroundBasicColor}, BackgroundBasicColor).

getRaceTrackFrictionProperties(This) ->
        get({This, raceTrackFrictionProperties}).

setRaceTrackFrictionProperties(This, RaceTrackFrictionProperties) ->
        put({This, raceTrackFrictionProperties}, RaceTrackFrictionProperties).

