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
% package org.allbinary.game.layer
% import javax.microedition.lcdui.game.TiledLayer
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData
% import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo
% import org.allbinary.media.graphics.geography.map.racetrack.TiledLayerFactory

-module('AllBinaryTiledLayerFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AllBinaryTiledLayerFactoryInterface

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


% throws Exception
getInstance(This, RaceTrackInfo, RaceTrackData) ->
        put({local, allbinaryTiledLayer}, undefined),
        TiledLayer = (fun(Target_N65921) -> (get({Target_N65921, '$class'})):getInstance(Target_N65921, RaceTrackData) end)('TiledLayerFactory':new()),
        put({local, allbinaryTiledLayer}, 'AllBinaryJ2METiledLayer':new((get({RaceTrackData, '$class'})):getId(RaceTrackData), TiledLayer, (get({RaceTrackData, '$class'})):getMapArray(RaceTrackData), (fun(Target_N66036) -> (get({Target_N66036, '$class'})):intValue(Target_N66036) end)(get({'BasicColorFactory':getInstance(), 'RED'})))),
        (get({get({local, allbinaryTiledLayer}), '$class'})):setCells(get({local, allbinaryTiledLayer}), (get({RaceTrackData, '$class'})):getMapArray(RaceTrackData)),
        get({local, allbinaryTiledLayer}).

% throws Exception
getMiniInstance(This, RaceTrackData) ->
        SmallIntegerSingletonFactory = 'SmallIntegerSingletonFactory':getInstance(),
        TiledLayer = (fun(Target_N66294) -> (get({Target_N66294, '$class'})):getMiniInstance(Target_N66294, RaceTrackData) end)('TiledLayerFactory':new()),
        AllbinaryTiledLayer = 'AllBinaryJ2METiledLayer':new((get({SmallIntegerSingletonFactory, '$class'})):getAt(SmallIntegerSingletonFactory, (((fun(Target_N66397) -> (get({Target_N66397, '$class'})):intValue(Target_N66397) end)((get({RaceTrackData, '$class'})):getId(RaceTrackData)) + 100) + 1)), TiledLayer, (get({RaceTrackData, '$class'})):getMapArray(RaceTrackData), (fun(Target_N66457) -> (get({Target_N66457, '$class'})):intValue(Target_N66457) end)(get({'BasicColorFactory':getInstance(), 'RED'}))),
        (get({AllbinaryTiledLayer, '$class'})):setCells(AllbinaryTiledLayer, (get({RaceTrackData, '$class'})):getMapArray(RaceTrackData)),
        AllbinaryTiledLayer.

