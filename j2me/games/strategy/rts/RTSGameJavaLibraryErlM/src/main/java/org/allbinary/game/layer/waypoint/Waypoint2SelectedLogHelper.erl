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
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.math.PositionStrings
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayList

-module('Waypoint2SelectedLogHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('Waypoint2LogHelper', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'Waypoint2SelectedLogHelper':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, positionStrings}, 'PositionStrings':getInstance()),
    put({This, stringUtil}, 'StringUtil':getInstance()),
    put({This, 'ENEMY_POSSIBLE_TARGET'}, " Enemy Possible Target: "),
    put({This, 'CLOSE_RANGE'}, "closeRange: "),
    put({This, 'SENSOR_RANGE'}, " sensorRange: "),
    put({This, 'ONLY_TARGETS'}, " Only Targets: "),
    put({This, 'SHORTER_THAN_CURRENT_TARGET_DISTANCE'}, " isShorterThanCurrentTargetDistance: "),
    put({This, 'CURRENT_TARGET_DESTROYED'}, " isCurrentTargetDestroyed: "),
    put({This, 'CURRENT_TARGET_NOT_AVAILABLE'}, " isCurrentTargetNotAvailable: "),
    put({This, 'PROCESS_POSSIBLE_TARGET'}, "selected: processPossibleTarget1"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'Waypoint2LogHelper':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'Waypoint2SelectedLogHelper', instanceC}).

initRange(This, AssociatedAdvancedRTSGameLayer, CloseRange, SensorRange) when is_integer(CloseRange), is_integer(SensorRange) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'CLOSE_RANGE'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, CloseRange),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SENSOR_RANGE'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, SensorRange),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: initRange").

processPossibleTarget(This, AssociatedAdvancedRTSGameLayer, WaypointBehaviorBase, LayerInterface, AnotherTargetDistance, IsShorterThanCurrentTargetDistance, IsCurrentTargetDestroyed) when is_integer(AnotherTargetDistance), is_boolean(IsShorterThanCurrentTargetDistance), is_boolean(IsCurrentTargetDestroyed) ->
        case ((get({WaypointBehaviorBase, '$class'})):isWaypointListEmptyOrOnlyTargets(WaypointBehaviorBase) andalso (get({WaypointBehaviorBase, '$class'})):isInSensorRange(WaypointBehaviorBase, LayerInterface, AnotherTargetDistance)) of
            true ->
            StringBuffer = 'StringMaker':new(),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'ONLY_TARGETS'})),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({WaypointBehaviorBase, '$class'})):isWaypointListEmptyOrOnlyTargets(WaypointBehaviorBase)),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'SHORTER_THAN_CURRENT_TARGET_DISTANCE'})),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, IsShorterThanCurrentTargetDistance),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'CURRENT_TARGET_DESTROYED'})),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, IsCurrentTargetDestroyed),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'CURRENT_TARGET_NOT_AVAILABLE'})),
            (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (((get({WaypointBehaviorBase, '$class'})):getCurrentTargetLayerInterface(WaypointBehaviorBase) =:= undefined))),
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'PROCESS_POSSIBLE_TARGET'}));
            false -> ok
        end.

processSetTarget(This, AssociatedAdvancedRTSGameLayer, WaypointBehaviorBase, LayerInterface, AnotherTargetDistance) when is_integer(AnotherTargetDistance) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({WaypointBehaviorBase, '$class'})):getCurrentTargetingStateString(WaypointBehaviorBase)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'ENEMY_POSSIBLE_TARGET'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({LayerInterface, '$class'})):getName(LayerInterface)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " anotherTargetDistance: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, AnotherTargetDistance),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: processPossibleTarget2").

processPossibleTargetCloser(This, AssociatedAdvancedRTSGameLayer, WaypointBehaviorBase, LayerInterface, AnotherTargetDistance) when is_integer(AnotherTargetDistance) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({WaypointBehaviorBase, '$class'})):getCurrentTargetingStateString(WaypointBehaviorBase)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({This, 'ENEMY_POSSIBLE_TARGET'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({LayerInterface, '$class'})):getName(LayerInterface)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " anotherTargetDistance: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, AnotherTargetDistance),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: processPossibleTarget3").

setTarget(This, AssociatedAdvancedRTSGameLayer, WaypointBehaviorBase, LayerInterface, AnotherTargetDistance) when is_integer(AnotherTargetDistance) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({WaypointBehaviorBase, '$class'})):getName(WaypointBehaviorBase)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " targeting: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({LayerInterface, '$class'})):getName(LayerInterface)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " at: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, AnotherTargetDistance),
        (get({StringBuffer, '$class'})):append(StringBuffer, " instead of: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({WaypointBehaviorBase, '$class'})):getCurrentTargetingStateString(WaypointBehaviorBase)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: setTarget").

setTargetPath(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Target Destroyed", This, "selected: setTargetPath").

setTargetPathIgnoreNewPath(This, AssociatedAdvancedRTSGameLayer, WaypointBehaviorBase) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Set Path To Target: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N69300) -> (get({Target_N69300, '$class'})):getName(Target_N69300) end)((get({WaypointBehaviorBase, '$class'})):getCurrentTargetLayerInterface(WaypointBehaviorBase))),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), (get({WaypointBehaviorBase, '$class'})):getCurrentTargetLayerInterface(WaypointBehaviorBase))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: setTargetPath").

processWaypoint(This, AssociatedAdvancedRTSGameLayer, WaypointBehaviorBase, TargetLayer, Size) when is_integer(Size) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Size: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Size),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Waypoint: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({TargetLayer, '$class'})):getName(TargetLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Target: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), (get({WaypointBehaviorBase, '$class'})):getCurrentTargetLayerInterface(WaypointBehaviorBase))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " isTrackingWaypoint: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({WaypointBehaviorBase, '$class'})):isTrackingWaypoint(WaypointBehaviorBase)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " WaypointOverridesAttacking: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, (get({WaypointBehaviorBase, '$class'})):isWaypointOverridesAttacking(WaypointBehaviorBase)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: processWaypoint").

processWaypointTracked(This, AssociatedAdvancedRTSGameLayer, WaypointBehaviorBase) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " currentPathGeographicMapCellPosition: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), (get({WaypointBehaviorBase, '$class'})):getCurrentPathGeographicMapCellPosition(WaypointBehaviorBase))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " nextUnvisitedPathGeographicMapCellPosition: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), (get({WaypointBehaviorBase, '$class'})):getNextUnvisitedPathGeographicMapCellPosition(WaypointBehaviorBase))),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Tracked: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), (fun(Target_N70503) -> (get({Target_N70503, '$class'})):getTracked(Target_N70503) end)((get({WaypointBehaviorBase, '$class'})):getCurrentGeographicMapCellHistory(WaypointBehaviorBase)))),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: processWaypoint").

processWaypointTrackedVisit(This, AssociatedAdvancedRTSGameLayer, GeographicMapCellPosition) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Visited: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), GeographicMapCellPosition)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: processWaypoint").

processWaypointTrackedWithoutProgress(This, AssociatedAdvancedRTSGameLayer, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N70992) -> (get({Target_N70992, '$class'})):toString(Target_N70992) end)((fun(Target_N70999) -> (get({Target_N70999, '$class'})):append(Target_N70999, Reason) end)((fun(Target_N71006) -> (get({Target_N71006, '$class'})):append(Target_N71006, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, "turnTo").

wander(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer), This, "wander").

targetDestroyed(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N71290) -> (get({Target_N71290, '$class'})):toString(Target_N71290) end)((fun(Target_N71297) -> (get({Target_N71297, '$class'})):append(Target_N71297, " Target Destroyed") end)((fun(Target_N71304) -> (get({Target_N71304, '$class'})):append(Target_N71304, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, "selected: processTargeting").

processTargeting(This, AssociatedAdvancedRTSGameLayer, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, positionStrings}), 'DX_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Dx),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, positionStrings}), 'DY_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Dy),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: processTargeting").

processTargetingNonWayPoint(This, AssociatedAdvancedRTSGameLayer, Dx, Dy) when is_integer(Dx), is_integer(Dy) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Targeting Non Waypoint "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, positionStrings}), 'DX_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Dx),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, positionStrings}), 'DY_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Dy),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: processTargeting").

removeWaypoint(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior2, WaypointLayer, Reason) when (is_list(Reason) orelse Reason =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({UnitWaypointBehavior2, '$class'})):getName(UnitWaypointBehavior2)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " remove: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({WaypointLayer, '$class'})):getName(WaypointLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " because: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, Reason),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: removeWaypoint").

removeWaypointList(This, AssociatedAdvancedRTSGameLayer, UnitWaypointBehavior2, List) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({UnitWaypointBehavior2, '$class'})):getName(UnitWaypointBehavior2)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Waypoints: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({get({This, stringUtil}), '$class'})):toString(get({This, stringUtil}), List)),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: removeWaypoint").

removeWaypointClear(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N73247) -> (get({Target_N73247, '$class'})):toString(Target_N73247) end)((fun(Target_N73254) -> (get({Target_N73254, '$class'})):append(Target_N73254, " Clearing removed waypoint") end)((fun(Target_N73261) -> (get({Target_N73261, '$class'})):append(Target_N73261, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, "selected: removeWaypoint").

clearTarget(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N73405) -> (get({Target_N73405, '$class'})):toString(Target_N73405) end)((fun(Target_N73412) -> (get({Target_N73412, '$class'})):append(Target_N73412, " Cleared Target") end)((fun(Target_N73419) -> (get({Target_N73419, '$class'})):append(Target_N73419, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, "selected: clearTarget").

addWaypointFromUser(This, AssociatedAdvancedRTSGameLayer, AdvancedRTSGameLayer) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " Adding Waypoint to Selected: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AdvancedRTSGameLayer, '$class'})):getName(AdvancedRTSGameLayer)),
        case ((get({AdvancedRTSGameLayer, '$class'})):getParentLayer(AdvancedRTSGameLayer) =/= undefined) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, " With Parent: "),
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N73774) -> (get({Target_N73774, '$class'})):getName(Target_N73774) end)((get({AdvancedRTSGameLayer, '$class'})):getParentLayer(AdvancedRTSGameLayer)));
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: onWaypointEvent").

targetMovedSoRetarget(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N73963) -> (get({Target_N73963, '$class'})):toString(Target_N73963) end)((fun(Target_N73970) -> (get({Target_N73970, '$class'})):append(Target_N73970, " - target moved so retargeting") end)((fun(Target_N73977) -> (get({Target_N73977, '$class'})):append(Target_N73977, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, "turnTo").

