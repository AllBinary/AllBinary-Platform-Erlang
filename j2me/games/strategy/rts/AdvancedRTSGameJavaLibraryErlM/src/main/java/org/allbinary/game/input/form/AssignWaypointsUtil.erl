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
% import org.allbinary.game.layer.AdvancedRTSGameLayer
% import org.allbinary.game.layer.NullPathFindingLayer
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.layer.RTSLayer
% import org.allbinary.game.layer.RTSLayerEvent
% import org.allbinary.game.layer.unit.UnitLayer
% import org.allbinary.game.layer.unit.UnitWaypointBehavior
% import org.allbinary.util.BasicArrayList
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil

-module('AssignWaypointsUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AssignWaypointsUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, 'WAYPOINT_EVENT'}, 'RTSLayerEvent':new(get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'AssignWaypointsUtil', instance}).

set(This, UnitLayer, OwnerAdvancedRTSGameLayer) ->
        try
            List = (fun(Target_N66139) -> (get({Target_N66139, '$class'})):getOwnedWaypointList(Target_N66139) end)((get({OwnerAdvancedRTSGameLayer, '$class'})):getWaypointBehavior(OwnerAdvancedRTSGameLayer)),
            UnitWaypointBehavior = (get({UnitLayer, '$class'})):getWaypointBehavior(UnitLayer),
            lists:foreach(fun(Index) ->
                put({local, waypointLayer}, (get({List, '$class'})):get(List, Index)),
                (get({get({This, 'WAYPOINT_EVENT'}), '$class'})):setRtsLayer(get({This, 'WAYPOINT_EVENT'}), get({local, waypointLayer})),
                (get({UnitWaypointBehavior, '$class'})):onWaypointEvent(UnitWaypointBehavior, get({This, 'WAYPOINT_EVENT'}))
            end, lists:seq(((get({List, '$class'})):size(List) - 1), 0, -1)),
            put({local, waypointLayer}, (fun(Target_N66477) -> (get({Target_N66477, '$class'})):getWaypointLayer(Target_N66477) end)('PrimaryWaypointHelper':getInstance())),
            case (get({local, waypointLayer}) =/= get({'NullPathFindingLayer', 'NULL_PATH_FINDING_LAYER'})) of
                true ->
                (get({get({This, 'WAYPOINT_EVENT'}), '$class'})):setRtsLayer(get({This, 'WAYPOINT_EVENT'}), get({local, waypointLayer})),
                (get({UnitWaypointBehavior, '$class'})):onWaypointEvent(UnitWaypointBehavior, get({This, 'WAYPOINT_EVENT'}));
                false -> ok
            end
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            CommonStrings = 'CommonStrings':getInstance(),
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({CommonStrings, 'EXCEPTION'}), This, "set", E)
        end.

