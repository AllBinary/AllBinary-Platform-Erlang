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
% package org.allbinary.game.layer.waypoint
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.layer.WaypointBehaviorBase
% import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayList

-module('WaypointSelectedLogHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('WaypointLogHelper', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'WaypointSelectedLogHelper':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'WaypointLogHelper':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'WaypointSelectedLogHelper', instanceC}).

onWaypointEvent(This, AssociatedAdvancedRTSGameLayer, AdvancedRTSGameLayer) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " onWaypointEvent: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AdvancedRTSGameLayer, '$class'})):getName(AdvancedRTSGameLayer)),
        case ((get({AdvancedRTSGameLayer, '$class'})):getParentLayer(AdvancedRTSGameLayer) =/= undefined) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, " With Parent: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66408) -> (get({Target_N66408, '$class'})):getName(Target_N66408) end)((get({AdvancedRTSGameLayer, '$class'})):getParentLayer(AdvancedRTSGameLayer)));
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "onWaypointEvent").

addWaypointFromBuilding(This, AssociatedAdvancedRTSGameLayer, AdvancedRTSGameLayer) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Adding Waypoint: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AdvancedRTSGameLayer, '$class'})):getName(AdvancedRTSGameLayer)),
        case ((get({AdvancedRTSGameLayer, '$class'})):getParentLayer(AdvancedRTSGameLayer) =/= undefined) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, " With Parent: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66808) -> (get({Target_N66808, '$class'})):getName(Target_N66808) end)((get({AdvancedRTSGameLayer, '$class'})):getParentLayer(AdvancedRTSGameLayer)));
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: onWaypointEvent").

addWaypointFromBuildingList(This, AssociatedAdvancedRTSGameLayer, AdvancedRTSGameLayer, List) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Waypoints: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), List)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: onWaypointEvent").

insertWaypoint(This, AssociatedAdvancedRTSGameLayer, Index, RtsLayer, WaypointName) when is_integer(Index), (is_list(WaypointName) orelse WaypointName =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, WaypointName),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Insert: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({RtsLayer, '$class'})):getName(RtsLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " for Waypoint: "),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: insertWaypoint").

insertWaypointList(This, AssociatedAdvancedRTSGameLayer, Index, RtsLayer, WaypointName, List) when is_integer(Index), (is_list(WaypointName) orelse WaypointName =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, WaypointName),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Insert: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({RtsLayer, '$class'})):getName(RtsLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Waypoints: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), List)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: insertWaypoint").

setRandomGeographicMapCellHistoryList(This, AssociatedAdvancedRTSGameLayer, PathsList) ->
        Size = (get({PathsList, '$class'})):size(PathsList),
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'START'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Size),
        (get({StringBuffer, '$class'})):append(StringBuffer, " -> "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), PathsList)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: setRandomGeographicMapCellHistory").

moveAwayFromBuilding(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68721) -> (get({Target_N68721, '$class'})):toString(Target_N68721) end)((fun(Target_N68728) -> (get({Target_N68728, '$class'})):append(Target_N68728, " Trying to move away from building") end)((fun(Target_N68735) -> (get({Target_N68735, '$class'})):append(Target_N68735, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, "selected: moveAwayFromBuilding").

needToMove(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68879) -> (get({Target_N68879, '$class'})):toString(Target_N68879) end)((fun(Target_N68886) -> (get({Target_N68886, '$class'})):append(Target_N68886, (get({UnitWaypointBehavior, '$class'})):getMovementLogicAsString(UnitWaypointBehavior)) end)((fun(Target_N68893) -> (get({Target_N68893, '$class'})):append(Target_N68893, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, "needToMove").

setRandomGeographicMapCellHistory(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69073) -> (get({Target_N69073, '$class'})):toString(Target_N69073) end)((fun(Target_N69080) -> (get({Target_N69080, '$class'})):append(Target_N69080, " pathsList is null") end)((fun(Target_N69087) -> (get({Target_N69087, '$class'})):append(Target_N69087, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, "setRandomGeographicMapCellHistory").

setCurrentPathGeographicMapCellPosition(This, AssociatedAdvancedRTSGameLayer, ExistingCurrentPathGeographicMapCellPosition, CurrentPathGeographicMapCellPosition) ->
        case (ExistingCurrentPathGeographicMapCellPosition =:= undefined) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69250) -> (get({Target_N69250, '$class'})):toString(Target_N69250) end)((fun(Target_N69257) -> (get({Target_N69257, '$class'})):append(Target_N69257, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), CurrentPathGeographicMapCellPosition)) end)((fun(Target_N69264) -> (get({Target_N69264, '$class'})):append(Target_N69264, " currentPathGeographicMapCellPosition: ") end)((fun(Target_N69271) -> (get({Target_N69271, '$class'})):append(Target_N69271, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new())))), This, "setCurrentPathGeographicMapCellPosition");
            false -> ok
        end.

setNextUnvisitedPathGeographicMapCellPosition(This, AssociatedAdvancedRTSGameLayer, ExistingNextUnvisitedPathGeographicMapCellPosition, NextUnvisitedPathGeographicMapCellPosition) ->
        case (ExistingNextUnvisitedPathGeographicMapCellPosition =/= NextUnvisitedPathGeographicMapCellPosition) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69522) -> (get({Target_N69522, '$class'})):toString(Target_N69522) end)((fun(Target_N69529) -> (get({Target_N69529, '$class'})):append(Target_N69529, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), NextUnvisitedPathGeographicMapCellPosition)) end)((fun(Target_N69536) -> (get({Target_N69536, '$class'})):append(Target_N69536, " nextUnvisitedPathGeographicMapCellPosition: ") end)((fun(Target_N69543) -> (get({Target_N69543, '$class'})):append(Target_N69543, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new())))), This, "setNextUnvisitedPathGeographicMapCellPosition");
            false -> ok
        end.

