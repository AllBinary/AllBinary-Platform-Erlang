% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.game.behavior.topview
% import org.allbinary.direction.Direction
% import org.allbinary.game.layer.AllBinaryTiledLayer
% import org.allbinary.game.tracking.TrackingEventCircularStaticPool
% import org.allbinary.game.tracking.TrackingEventHandler
% import org.allbinary.graphics.displayable.DisplayInfoSingleton
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.media.graphics.geography.map.BasicGeographicMap
% import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition

-module('PlayerTopViewCharacterBehavior').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('TopViewCharacterBehavior', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'TopViewCharacterBehavior':'$init'(This),
    init_fields(This).


% throws Exception
terrainEvent(This, Layer, Direction, X, Y, GeographicMapInterfaceArray, GeographicMapCellPosition) when is_integer(X), is_integer(Y), (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined) ->
        (fun(Target_N65989) -> (get({Target_N65989, '$class'})):fireEvent(Target_N65989, (fun(Target_N66014) -> (get({Target_N66014, '$class'})):getNextInstance(Target_N66014, Layer) end)('TrackingEventCircularStaticPool':getInstance())) end)('TrackingEventHandler':getInstance()).

terrainMove(This, Layer, GeographicMapInterfaceArray, X, Y) when (is_tuple(GeographicMapInterfaceArray) orelse GeographicMapInterfaceArray =:= undefined), is_integer(X), is_integer(Y) ->
        BasicGeographicMapUtil = 'BasicGeographicMapUtil':getInstance(),
        (get({BasicGeographicMapUtil, '$class'})):setPosition(BasicGeographicMapUtil, GeographicMapInterfaceArray, X, Y).

moveIfOnScreen(This, Layer, Ax, Ay) when is_integer(Ax), is_integer(Ay) ->
        ok.

isTiledLayerMoveable(This, TerrainTiledLayer, X, Y) when is_integer(X), is_integer(Y) ->
        ((((((get({TerrainTiledLayer, '$class'})):getXP(TerrainTiledLayer) + (fun(Target_N66606) -> (get({Target_N66606, '$class'})):getLastWidth(Target_N66606) end)('DisplayInfoSingleton':getInstance())) < (get({TerrainTiledLayer, '$class'})):getWidth(TerrainTiledLayer)) orelse (X < 0))) andalso ((((get({TerrainTiledLayer, '$class'})):getXP(TerrainTiledLayer) > 0) orelse (X > 0)))).

