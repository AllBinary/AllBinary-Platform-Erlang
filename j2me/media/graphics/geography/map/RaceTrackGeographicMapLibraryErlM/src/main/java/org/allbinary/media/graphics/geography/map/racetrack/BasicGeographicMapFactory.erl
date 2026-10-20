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
% import org.allbinary.graphics.color.BasicColorFactory
% import org.allbinary.logic.math.SmallIntegerSingletonFactory
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory

-module('BasicGeographicMapFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

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
getInstance(This, RaceTrackInfo, RaceTrackData, TiledLayerFactoryInterface, GeographicMapCellPositionFactoryInterface, GeographicMapCellTypeFactory) ->
        'BasicGeographicMap':new((fun(Target_N65846) -> (get({Target_N65846, '$class'})):getAt(Target_N65846, (((fun(Target_N65879) -> (get({Target_N65879, '$class'})):intValue(Target_N65879) end)((get({RaceTrackInfo, '$class'})):getId(RaceTrackInfo)) + 100) + 1)) end)('SmallIntegerSingletonFactory':getInstance()), (get({RaceTrackInfo, '$class'})):getName(RaceTrackInfo), (get({RaceTrackData, '$class'})):getCellTypeIdToGeographicMapCellTypeArray(RaceTrackData), (get({TiledLayerFactoryInterface, '$class'})):getMiniInstance(TiledLayerFactoryInterface, RaceTrackData), get({'BasicColorFactory':getInstance(), 'CLEAR_COLOR'}), get({'BasicColorFactory':getInstance(), 'CLEAR_COLOR'}), GeographicMapCellPositionFactoryInterface, 'GeographicMapCellPositionBaseFactory':new(), GeographicMapCellTypeFactory).

