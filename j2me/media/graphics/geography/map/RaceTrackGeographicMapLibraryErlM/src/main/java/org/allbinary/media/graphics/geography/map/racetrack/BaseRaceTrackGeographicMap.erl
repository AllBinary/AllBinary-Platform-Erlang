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
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface
% import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory

-module('BaseRaceTrackGeographicMap').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements RaceTrackGeographicMapInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicGeographicMap', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, raceTrackInfo}, undefined),
    put({This, raceTrackData}, undefined),
    put({This, miniGeographicMap}, undefined),
    ok.


new(RaceTrackInfo, RaceTrackData, TiledLayer, MiniGeographicMap, GeographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory, GeographicMapCellTypeFactory) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RaceTrackInfo, RaceTrackData, TiledLayer, MiniGeographicMap, GeographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory, GeographicMapCellTypeFactory),
    This.

'$init'(This, RaceTrackInfo, RaceTrackData, TiledLayer, MiniGeographicMap, GeographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory, GeographicMapCellTypeFactory) ->
        'BasicGeographicMap':'$init'(This, (get({RaceTrackInfo, '$class'})):getId(RaceTrackInfo), (get({RaceTrackInfo, '$class'})):getName(RaceTrackInfo), (get({RaceTrackData, '$class'})):getCellTypeIdToGeographicMapCellTypeArray(RaceTrackData), TiledLayer, (get({RaceTrackInfo, '$class'})):getForegroundBasicColor(RaceTrackInfo), (get({RaceTrackInfo, '$class'})):getBackgroundBasicColor(RaceTrackInfo), GeographicMapCellPositionFactoryInterface, GeographicMapCellPositionBaseFactory, GeographicMapCellTypeFactory),
        init_fields(This),
        put({This, raceTrackInfo}, RaceTrackInfo),
        put({This, raceTrackData}, RaceTrackData),
        put({This, miniGeographicMap}, MiniGeographicMap),
        MiniTiledLayer = (get({get({This, miniGeographicMap}), '$class'})):getAllBinaryTiledLayer(get({This, miniGeographicMap})),
        case ((get({MiniTiledLayer, '$class'})):getColumns(MiniTiledLayer) =/= (fun(Target_N66325) -> (get({Target_N66325, '$class'})):getColumns(Target_N66325) end)((get({This, '$class'})):getGeographicMapCellPositionFactory(This))) of
            true ->
            put({local, error}, (fun(Target_N66368) -> (get({Target_N66368, '$class'})):toString(Target_N66368) end)((fun(Target_N66375) -> (get({Target_N66375, '$class'})):appendint(Target_N66375, trunc((fun(Target_N66453) -> (get({Target_N66453, '$class'})):getColumns(Target_N66453) end)((get({This, '$class'})):getGeographicMapCellPositionFactory(This)))) end)((fun(Target_N66382) -> (get({Target_N66382, '$class'})):append(Target_N66382, " != ") end)((fun(Target_N66389) -> (get({Target_N66389, '$class'})):appendint(Target_N66389, trunc((get({MiniTiledLayer, '$class'})):getColumns(MiniTiledLayer))) end)((fun(Target_N66396) -> (get({Target_N66396, '$class'})):append(Target_N66396, "RaceTrackMap has incorrect Mini Map columns: ") end)('StringMaker':new())))))),
            put({local, commonStrings}, 'CommonStrings':getInstance()),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({local, commonStrings}), 'EXCEPTION'}), This, get({get({local, commonStrings}), 'CONSTRUCTOR'})),
            erlang:error({'Exception', get({local, error})});
            false -> ok
        end,
        case ((get({MiniTiledLayer, '$class'})):getRows(MiniTiledLayer) =/= (fun(Target_N66655) -> (get({Target_N66655, '$class'})):getRows(Target_N66655) end)((get({This, '$class'})):getGeographicMapCellPositionFactory(This))) of
            true ->
            put({local, error}, "RaceTrackMap has incorrect Mini Map rows"),
            put({local, commonStrings}, 'CommonStrings':getInstance()),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({local, commonStrings}), 'EXCEPTION'}), This, get({get({local, commonStrings}), 'CONSTRUCTOR'})),
            erlang:error({'Exception', get({local, error})});
            false -> ok
        end.

getRaceTrackInfo(This) ->
        get({This, raceTrackInfo}).

setRaceTrackInfo(This, ARaceTrackInfo) ->
        put({This, raceTrackInfo}, ARaceTrackInfo).

setMiniBasicGeographicMap(This, MiniBasicGeographicMap) ->
        put({This, miniGeographicMap}, MiniBasicGeographicMap).

getMiniBasicGeographicMap(This) ->
        get({This, miniGeographicMap}).

getRaceTrackData(This) ->
        get({This, raceTrackData}).

setRaceTrackData(This, RaceTrackData) ->
        put({This, raceTrackData}, RaceTrackData).

