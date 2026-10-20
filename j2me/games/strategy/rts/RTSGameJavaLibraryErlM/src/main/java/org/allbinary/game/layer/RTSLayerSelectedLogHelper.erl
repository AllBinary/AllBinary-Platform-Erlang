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
% package org.allbinary.game.layer
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonLabels
% import org.allbinary.string.CommonSeps
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.math.AngleInfo
% import org.allbinary.math.NamedAngle
% import org.allbinary.math.PositionStrings
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayList

-module('RTSLayerSelectedLogHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('RTSLayerLogHelper', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'RTSLayerSelectedLogHelper':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonSeps}, 'CommonSeps':getInstance()),
    put({This, positionStrings}, 'PositionStrings':getInstance()),
    put({This, 'TRACKTO_TURNTO'}, "trackTo:turnTo"),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'RTSLayerLogHelper':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'RTSLayerSelectedLogHelper', instanceC}).

setClosestGeographicMapCellHistory(This, AssociatedAdvancedRTSGameLayer, PathsList) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CommonLabels':getInstance(), 'START'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, (get({PathsList, '$class'})):size(PathsList)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " -> "),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66487) -> (get({Target_N66487, '$class'})):toString(Target_N66487, PathsList) end)('StringUtil':getInstance())),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: setClosestGeographicMapCellHistory").

trackTo(This, AssociatedAdvancedRTSGameLayer, NextUnvisitedPathGeographicMapCellPosition, Dx, Dy, Reason) when is_integer(Dx), is_integer(Dy), (is_list(Reason) orelse Reason =:= undefined) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N66808) -> (get({Target_N66808, '$class'})):toString(Target_N66808, NextUnvisitedPathGeographicMapCellPosition) end)('StringUtil':getInstance())),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, positionStrings}), 'DX_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Dx),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, positionStrings}), 'DY_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Dy),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, Reason),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, "selected: trackTo").

turnTo(This, AssociatedAdvancedRTSGameLayer, Dx, Dy, AngleInfo, Angle, MovementAngle, Evading, TargetAngle) when is_integer(Dx), is_integer(Dy), is_integer(Angle), is_boolean(Evading), is_integer(TargetAngle) ->
        StringBuffer = 'StringMaker':new(),
        (get({StringBuffer, '$class'})):append(StringBuffer, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)),
        (get({StringBuffer, '$class'})):append(StringBuffer, " steering - "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, positionStrings}), 'DX_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Dx),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, positionStrings}), 'DY_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Dy),
        (get({StringBuffer, '$class'})):append(StringBuffer, " angle: "),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, Angle),
        (get({StringBuffer, '$class'})):append(StringBuffer, " movementAngle: "),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({MovementAngle, name})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonSeps}), 'FORWARD_SLASH'})),
        (get({StringBuffer, '$class'})):appendshort(StringBuffer, trunc((get({MovementAngle, '$class'})):getValue(MovementAngle))),
        case (AngleInfo =/= undefined) of
            true ->
            AngleIncrement = (fun(Target_N67858) -> (get({Target_N67858, '$class'})):getAngleIncrement(Target_N67858) end)((get({AngleInfo, '$class'})):getAngleIncrementInfo(AngleInfo)),
            (get({StringBuffer, '$class'})):append(StringBuffer, " angleIncrement: "),
            (get({StringBuffer, '$class'})):appendshort(StringBuffer, AngleIncrement);
            false -> ok
        end,
        (get({StringBuffer, '$class'})):append(StringBuffer, " Evading: "),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, Evading),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({StringBuffer, '$class'})):toString(StringBuffer), This, get({This, 'TRACKTO_TURNTO'})).

doneMoving(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68296) -> (get({Target_N68296, '$class'})):toString(Target_N68296) end)((fun(Target_N68303) -> (get({Target_N68303, '$class'})):append(Target_N68303, " steering - done moving 0,0") end)((fun(Target_N68310) -> (get({Target_N68310, '$class'})):append(Target_N68310, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, get({This, 'TRACKTO_TURNTO'})).

closeEnough(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68461) -> (get({Target_N68461, '$class'})):toString(Target_N68461) end)((fun(Target_N68468) -> (get({Target_N68468, '$class'})):append(Target_N68468, " steering - close enough") end)((fun(Target_N68475) -> (get({Target_N68475, '$class'})):append(Target_N68475, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, get({This, 'TRACKTO_TURNTO'})).

movingLeft(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68626) -> (get({Target_N68626, '$class'})):toString(Target_N68626) end)((fun(Target_N68633) -> (get({Target_N68633, '$class'})):append(Target_N68633, " steering - allow movingLeft") end)((fun(Target_N68640) -> (get({Target_N68640, '$class'})):append(Target_N68640, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, get({This, 'TRACKTO_TURNTO'})).

movingRight(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68791) -> (get({Target_N68791, '$class'})):toString(Target_N68791) end)((fun(Target_N68798) -> (get({Target_N68798, '$class'})):append(Target_N68798, " steering - allow movingRight") end)((fun(Target_N68805) -> (get({Target_N68805, '$class'})):append(Target_N68805, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, get({This, 'TRACKTO_TURNTO'})).

movingUp(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N68956) -> (get({Target_N68956, '$class'})):toString(Target_N68956) end)((fun(Target_N68963) -> (get({Target_N68963, '$class'})):append(Target_N68963, " steering - allow movingUp") end)((fun(Target_N68970) -> (get({Target_N68970, '$class'})):append(Target_N68970, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, get({This, 'TRACKTO_TURNTO'})).

movingDown(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69121) -> (get({Target_N69121, '$class'})):toString(Target_N69121) end)((fun(Target_N69128) -> (get({Target_N69128, '$class'})):append(Target_N69128, " steering - allow movingDown") end)((fun(Target_N69135) -> (get({Target_N69135, '$class'})):append(Target_N69135, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, get({This, 'TRACKTO_TURNTO'})).

currentMoveEnded(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69286) -> (get({Target_N69286, '$class'})):toString(Target_N69286) end)((fun(Target_N69293) -> (get({Target_N69293, '$class'})):append(Target_N69293, " steering - correct angle, but movement not needed for current deltas so reseting movement angle") end)((fun(Target_N69300) -> (get({Target_N69300, '$class'})):append(Target_N69300, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, get({This, 'TRACKTO_TURNTO'})).

evade(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69451) -> (get({Target_N69451, '$class'})):toString(Target_N69451) end)((fun(Target_N69458) -> (get({Target_N69458, '$class'})):append(Target_N69458, " steering - evade") end)((fun(Target_N69465) -> (get({Target_N69465, '$class'})):append(Target_N69465, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, get({This, 'TRACKTO_TURNTO'})).

rotateLeft(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69616) -> (get({Target_N69616, '$class'})):toString(Target_N69616) end)((fun(Target_N69623) -> (get({Target_N69623, '$class'})):append(Target_N69623, " steering - rotating left") end)((fun(Target_N69630) -> (get({Target_N69630, '$class'})):append(Target_N69630, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, get({This, 'TRACKTO_TURNTO'})).

rotateRight(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69781) -> (get({Target_N69781, '$class'})):toString(Target_N69781) end)((fun(Target_N69788) -> (get({Target_N69788, '$class'})):append(Target_N69788, " steering - rotating right") end)((fun(Target_N69795) -> (get({Target_N69795, '$class'})):append(Target_N69795, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, get({This, 'TRACKTO_TURNTO'})).

handle(This, AssociatedAdvancedRTSGameLayer, MovementAngle) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N69946) -> (get({Target_N69946, '$class'})):toString(Target_N69946) end)((fun(Target_N69953) -> (get({Target_N69953, '$class'})):appendshort(Target_N69953, trunc((get({MovementAngle, '$class'})):getValue(MovementAngle))) end)((fun(Target_N69960) -> (get({Target_N69960, '$class'})):append(Target_N69960, get({get({This, commonSeps}), 'FORWARD_SLASH'})) end)((fun(Target_N69967) -> (get({Target_N69967, '$class'})):append(Target_N69967, get({MovementAngle, name})) end)((fun(Target_N69974) -> (get({Target_N69974, '$class'})):append(Target_N69974, " steering - movementAngle: ") end)((fun(Target_N69981) -> (get({Target_N69981, '$class'})):append(Target_N69981, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new())))))), This, get({This, 'TRACKTO_TURNTO'})).

noRotation(This, AssociatedAdvancedRTSGameLayer) ->
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N70219) -> (get({Target_N70219, '$class'})):toString(Target_N70219) end)((fun(Target_N70226) -> (get({Target_N70226, '$class'})):append(Target_N70226, " steering - Do not rotate") end)((fun(Target_N70233) -> (get({Target_N70233, '$class'})):append(Target_N70233, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new()))), This, get({This, 'TRACKTO_TURNTO'})).

notOnPath(This, AssociatedAdvancedRTSGameLayer, GeographicMapCellHistory, CurrentGeographicMapCellPosition, PathList) ->
        StringUtil = 'StringUtil':getInstance(),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (fun(Target_N70434) -> (get({Target_N70434, '$class'})):toString(Target_N70434) end)((fun(Target_N70441) -> (get({Target_N70441, '$class'})):append(Target_N70441, (get({StringUtil, '$class'})):toString(StringUtil, PathList)) end)((fun(Target_N70448) -> (get({Target_N70448, '$class'})):append(Target_N70448, " - trying to move but not on path: ") end)((fun(Target_N70455) -> (get({Target_N70455, '$class'})):append(Target_N70455, (get({StringUtil, '$class'})):toString(StringUtil, CurrentGeographicMapCellPosition)) end)((fun(Target_N70462) -> (get({Target_N70462, '$class'})):append(Target_N70462, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N70469) -> (get({Target_N70469, '$class'})):appendint(Target_N70469, trunc((get({GeographicMapCellHistory, '$class'})):getTotalVisited(GeographicMapCellHistory))) end)((fun(Target_N70476) -> (get({Target_N70476, '$class'})):append(Target_N70476, get({'CommonSeps':getInstance(), 'SPACE'})) end)((fun(Target_N70483) -> (get({Target_N70483, '$class'})):append(Target_N70483, (get({AssociatedAdvancedRTSGameLayer, '$class'})):getName(AssociatedAdvancedRTSGameLayer)) end)('StringMaker':new())))))))), This, "turnTo").

