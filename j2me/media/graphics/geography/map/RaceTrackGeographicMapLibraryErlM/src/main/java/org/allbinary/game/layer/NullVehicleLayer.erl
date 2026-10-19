% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.RotationAnimation
% import org.allbinary.game.identification.Group
% import org.allbinary.logic.math.BasicDecimal
% import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
% import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking
% import org.allbinary.util.BasicArrayList

-module('NullVehicleLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements VehicleLayerInterface

static_init() ->
    put({?MODULE, 'NULL_VEHICLE_LAYER'}, 'NullVehicleLayer':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getName(This) ->
        erlang:error({'RuntimeException'}).

getGroupInterface(This) ->
        erlang:error({'RuntimeException'}).

setPosition(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        erlang:error({'RuntimeException'}).

getHeight(This) ->
        erlang:error({'RuntimeException'}).

getWidth(This) ->
        erlang:error({'RuntimeException'}).

getHalfHeight(This) ->
        erlang:error({'RuntimeException'}).

getHalfWidth(This) ->
        erlang:error({'RuntimeException'}).

getXP(This) ->
        erlang:error({'RuntimeException'}).

getYP(This) ->
        erlang:error({'RuntimeException'}).

getZP(This) ->
        erlang:error({'RuntimeException'}).

getX2(This) ->
        erlang:error({'RuntimeException'}).

getY2(This) ->
        erlang:error({'RuntimeException'}).

getZ2(This) ->
        erlang:error({'RuntimeException'}).

isVisible(This) ->
        erlang:error({'RuntimeException'}).

moveDXYZ(This, Dx, Dy, Dz) when is_integer(Dx), is_integer(Dy), is_integer(Dz) ->
        erlang:error({'RuntimeException'}).

setVisible(This, Visible) when is_boolean(Visible) ->
        erlang:error({'RuntimeException'}).

implmentsTickableInterface(This) ->
        erlang:error({'RuntimeException'}).

implmentsCollidableInterface(This) ->
        erlang:error({'RuntimeException'}).

implmentsGameInputInterface(This) ->
        erlang:error({'RuntimeException'}).

implmentsArtificialIntelligenceCompositeInterface(This) ->
        erlang:error({'RuntimeException'}).

getType(This) ->
        erlang:error({'RuntimeException'}).

getVehicleProperties(This) ->
        erlang:error({'RuntimeException'}).

getGameKeyEventList(This) ->
        erlang:error({'RuntimeException'}).

getSpeedBasicDecimal(This) ->
        erlang:error({'RuntimeException'}).

isReadyForExplosion(This) ->
        erlang:error({'RuntimeException'}).

getRotationAnimationInterface(This) ->
        erlang:error({'RuntimeException'}).

setRotationAnimationInterface(This, AnimationInterface) ->
        erlang:error({'RuntimeException'}).

isDestroyed(This) ->
        erlang:error({'RuntimeException'}).

isFinish(This) ->
        erlang:error({'RuntimeException'}).

getFinalPosition(This) ->
        erlang:error({'RuntimeException'}).

% throws Exception
handleFinish(This) ->
        erlang:error({'RuntimeException'}).

getGeographicMapCellPositionTracking(This) ->
        erlang:error({'RuntimeException'}).

getGeographicMapCellHistoryArray(This) ->
        erlang:error({'RuntimeException'}).

setGeographicMapCellHistoryArray(This, GeographicMapCellHistory) when (is_tuple(GeographicMapCellHistory) orelse GeographicMapCellHistory =:= undefined) ->
        erlang:error({'RuntimeException'}).

paint(This, Graphics) ->
        ok.

paintThreed(This, Graphics) ->
        ok.

