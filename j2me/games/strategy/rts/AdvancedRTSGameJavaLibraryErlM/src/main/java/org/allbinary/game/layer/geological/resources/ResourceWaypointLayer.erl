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
% package org.allbinary.game.layer.geological.resources
% import org.allbinary.game.layer.SelectionHudPaintable
% import org.allbinary.game.layer.waypoint.WaypointLayer
% import org.allbinary.animation.AnimationInterfaceFactoryInterface
% import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
% import org.allbinary.game.identification.Group
% import org.allbinary.game.layer.PathFindingLayerInterface
% import org.allbinary.graphics.Rectangle
% import org.allbinary.game.multiplayer.layer.RemoteInfo

-module('ResourceWaypointLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('WaypointLayer', Function, Arguments).

init_fields(This) ->
    ok.


new(RemoteInfo, ParentLayer, GroupInterface, RootName, Name, AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, RemoteInfo, ParentLayer, GroupInterface, RootName, Name, AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y),
    This.

'$init'(This, RemoteInfo, ParentLayer, GroupInterface, RootName, Name, AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(RootName) orelse RootName =:= undefined), (is_list(Name) orelse Name =:= undefined), is_integer(X), is_integer(Y) ->
        'WaypointLayer':'$init'(This, RemoteInfo, ParentLayer, GroupInterface, RootName, Name, AnimationInterfaceFactoryInterface, ProceduralAnimationInterfaceFactoryInterface, Rectangle, X, Y).

createHudPaintable(This) ->
        RtsLayerHudPaintable = 'GeologicalResourceInfoHudPaintableSingleton':getInstance(),
        (get({RtsLayerHudPaintable, '$class'})):setBasicColorP(RtsLayerHudPaintable, (get({get({This, allBinaryGameLayerManagerP}), '$class'})):getForegroundBasicColor(get({This, allBinaryGameLayerManagerP}))),
        (get({RtsLayerHudPaintable, '$class'})):setRtsLayer(RtsLayerHudPaintable, This),
        RtsLayerHudPaintable.

getHudPaintable(This) ->
        RtsLayerHudPaintable = 'GeologicalResourceInfoHudPaintableSingleton':getInstance(),
        RtsLayerHudPaintable.

