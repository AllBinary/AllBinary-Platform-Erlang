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
% package org.allbinary.game.layer.waypoint
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
% import org.allbinary.game.health.Health
% import org.allbinary.game.identification.Group
% import org.allbinary.game.input.form.NullRTSFormInputFactory
% import org.allbinary.game.layer.AdvancedRTSGameLayer
% import org.allbinary.game.layer.AdvancedRTSProperties
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.game.view.TileLayerPositionIntoViewPosition
% import org.allbinary.graphics.Rectangle
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.game.layer.RTSPlayerLayerInterface
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.media.audio.AttackSound

-module('WaypointLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AdvancedRTSGameLayer', Function, Arguments).

init_fields(This) ->
    ok.


new(RemoteInfo, ParentLayer, GroupInterface, RootName, Name, AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, RemoteInfo, ParentLayer, GroupInterface, RootName, Name, AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y),
    This.

init(This, RemoteInfo, ParentLayer, GroupInterface, RootName, Name, AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
        'AdvancedRTSGameLayer':init(This, RemoteInfo, ParentLayer, 'AdvancedRTSProperties':createProperties(), GroupInterface, RootName, Name, 'Health':new(1000), 'NullRTSFormInputFactory':getInstance(), AnimationInterfaceFactoryInterface, AnimationInterfaceFactoryInterface, AnimationInterfaceFactoryInterface, AnimationInterfaceFactoryInterface, AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y, 'TileLayerPositionIntoViewPosition':new()),
        (get({This, '$class'})):setCollidableInferface(This, 'CollidableWaypointBehavior':new(true)),
        (fun(Target_N66273) -> (get({Target_N66273, '$class'})):setWaypoint(Target_N66273, 'Waypoint':new(This, 'AttackSound':getInstance())) end)((get({This, '$class'})):getWaypointBehavior(This)),
        (get({This, '$class'})):setAnimationInterface(This, get({This, indexedButShouldBeRotationAnimationInterface})).

construct(This, RtsPlayerLayerInterface) ->
        put({This, percentCompleteP}, 100),
        (get({This, '$class'})):initVisibility(This, RtsPlayerLayerInterface).

paint(This, Graphics) ->
        case (get({This, '$class'})):isVisible(This) of
            true ->
            'AdvancedRTSGameLayer':paint(This, Graphics);
            false -> ok
        end.

processTick(This, AllBinaryLayerManager) ->
        try
            (get({get({This, indexedButShouldBeRotationAnimationInterface}), '$class'})):nextFrame(get({This, indexedButShouldBeRotationAnimationInterface}))
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, "processTick", E)
        end.

damage(This, Damage, DamageType) when is_integer(Damage), is_integer(DamageType) ->
        ok.

% throws Exception
getDamage(This, DamageType) when is_integer(DamageType) ->
        0.

% throws Exception
setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        'AdvancedRTSGameLayer':setDestroyed(This, Destroyed),
        case (get({This, '$class'})):isDestroyed(This) of
            true ->
            (fun(Target_N67212) -> (get({Target_N67212, '$class'})):removeLayer(Target_N67212, This) end)('WaypointCellPositionHistory':getInstance());
            false -> ok
        end.

getType(This) ->
        'WaypointLayer':getStaticType().

getStaticType() ->
        4.

isSelfUpgradeable(This) ->
        false.

