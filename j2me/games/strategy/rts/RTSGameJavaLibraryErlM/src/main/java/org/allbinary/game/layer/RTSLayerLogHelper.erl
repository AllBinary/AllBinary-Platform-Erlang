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
% import org.allbinary.math.AngleInfo
% import org.allbinary.math.NamedAngle
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
% import org.allbinary.util.BasicArrayList

-module('RTSLayerLogHelper').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'RTSLayerLogHelper':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'RTSLayerLogHelper', instance}).

setClosestGeographicMapCellHistory(This, AssociatedAdvancedRTSGameLayer, PathsList) ->
        ok.

trackTo(This, AssociatedAdvancedRTSGameLayer, NextUnvisitedPathGeographicMapCellPosition, Dx, Dy, Reason) when is_integer(Dx), is_integer(Dy), (is_list(Reason) orelse Reason =:= undefined) ->
        ok.

turnTo(This, AssociatedAdvancedRTSGameLayer, Dx, Dy, AngleInfo, Angle, MovementAngle, Evading, TargetAngle) when is_integer(Dx), is_integer(Dy), is_integer(Angle), is_boolean(Evading), is_integer(TargetAngle) ->
        ok.

doneMoving(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

closeEnough(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

movingLeft(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

movingRight(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

movingUp(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

movingDown(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

currentMoveEnded(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

evade(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

rotateLeft(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

rotateRight(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

handle(This, AssociatedAdvancedRTSGameLayer, MovementAngle) ->
        ok.

noRotation(This, AssociatedAdvancedRTSGameLayer) ->
        ok.

notOnPath(This, AssociatedAdvancedRTSGameLayer, GeographicMapCellHistory, CurrentGeographicMapCellPosition, PathList) ->
        ok.

