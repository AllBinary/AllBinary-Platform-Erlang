% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.input.form
% import org.allbinary.game.input.LayerPositionFinderInterface
% import org.allbinary.game.layer.waypoint.WaypointCellPositionHistory
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory

-module('AdvancedRTSGameLayerPositionFinder').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements LayerPositionFinderInterface

static_init() ->
    put({?MODULE, instance}, 'AdvancedRTSGameLayerPositionFinder':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'AdvancedRTSGameLayerPositionFinder', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getLayerInterface(This, GeographicMapCellPosition) ->
        put({local, layerInterface}, (fun(Target_N65923) -> (get({Target_N65923, '$class'})):getLayerInterface(Target_N65923, GeographicMapCellPosition) end)('DropCellPositionHistory':getInstance())),
        case (get({local, layerInterface}) =:= get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})) of
            true ->
            put({local, layerInterface}, (fun(Target_N66026) -> (get({Target_N66026, '$class'})):getLayerInterface(Target_N66026, GeographicMapCellPosition) end)('WaypointCellPositionHistory':getInstance()));
            false -> ok
        end,
        get({local, layerInterface}).

