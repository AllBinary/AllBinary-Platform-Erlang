%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
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
% package org.allbinary.game.layer.pickup
% import javax.microedition.khronos.opengles.GL
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.game.collision.CollidableAlwaysPickupNeverCollideBehaviorFactory
% import org.allbinary.game.combat.destroy.DestroyedLayerProcessor
% import org.allbinary.game.identification.BasicGroupFactory
% import org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.graphics.Rectangle
% import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface
% import org.allbinary.view.ViewPositionBase

-module('PickupLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements PickedUpLayerInterface
% implements PickupableInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('MultiPlayerGameLayer', Function, Arguments).

init_fields(This) ->
    put({This, pickedUpLayerInterfaceFactoryInterface}, get({'CountedPickedUpLayerInterfaceFactory', 'NULL_COUNTED_PICKUP_LAYER_FACTORY'})),
    put({This, destroyed}, false),
    put({This, animationInterface}, (fun(Target_N66055) -> (get({Target_N66055, '$class'})):getInstance(Target_N66055, 0) end)('NullAnimationFactory':getFactoryInstance())),
    ok.


new(Name, RemoteInfo, Total, PickedUpLayerInterfaceFactoryInterface, AnimationInterface, Rectangle, ViewPosition) when (is_list(Name) orelse Name =:= undefined), is_integer(Total) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, RemoteInfo, Total, PickedUpLayerInterfaceFactoryInterface, AnimationInterface, Rectangle, ViewPosition),
    This.

'$init'(This, Name, RemoteInfo, Total, PickedUpLayerInterfaceFactoryInterface, AnimationInterface, Rectangle, ViewPosition) when (is_list(Name) orelse Name =:= undefined), is_integer(Total) ->
        'MultiPlayerGameLayer':'$init'(This, RemoteInfo, get({'BasicGroupFactory':getInstance(), 'NONE_ARRAY'}), Name, Rectangle, ViewPosition),
        init_fields(This),
        (get({This, '$class'})):setCollidableInferface(This, (fun(Target_N66188) -> (get({Target_N66188, '$class'})):createBehavior(Target_N66188) end)('CollidableAlwaysPickupNeverCollideBehaviorFactory':getInstance())),
        (get({This, '$class'})):setLayerWidth(This, 10),
        (get({This, '$class'})):setLayerHeight(This, 10),
        (get({This, '$class'})):init(This, PickedUpLayerInterfaceFactoryInterface, AnimationInterface).

init(This, PickedUpLayerInterfaceFactoryInterface, AnimationInterface) ->
        put({This, pickedUpLayerInterfaceFactoryInterface}, PickedUpLayerInterfaceFactoryInterface),
        put({This, animationInterface}, AnimationInterface),
        (get({This, '$class'})):setDestroyed(This, false).

initXYZ(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        (get({This, '$class'})):setPosition(This, X, Y, Z).

paint(This, Graphics) ->
        ViewPosition = (get({This, '$class'})):getViewPosition(This),
        ViewX = (get({ViewPosition, '$class'})):getX(ViewPosition),
        ViewY = (get({ViewPosition, '$class'})):getY(ViewPosition),
        (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, ViewX, ViewY).

paintThreed(This, Graphics) ->
        ViewPosition = (get({This, '$class'})):getViewPosition(This),
        ViewX = (get({ViewPosition, '$class'})):getX(ViewPosition),
        ViewY = (get({ViewPosition, '$class'})):getY(ViewPosition),
        (get({get({This, animationInterface}), '$class'})):paintThreedXYZ(get({This, animationInterface}), Graphics, ViewX, ViewY, 3).

getPickedUpLayerInterfaceFactoryInterface(This) ->
        get({This, pickedUpLayerInterfaceFactoryInterface}).

setPickedUp(This) ->
        (get({This, '$class'})):setDestroyed(This, true).

isDestroyed(This) ->
        get({This, destroyed}).

setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        put({This, destroyed}, Destroyed),
        case (get({This, '$class'})):isDestroyed(This) of
            true ->
            (fun(Target_N67466) -> (get({Target_N67466, '$class'})):add(Target_N67466, This) end)('DestroyedLayerProcessor':getInstance());
            false -> ok
        end.

damage(This, Damage, DamageType) when is_integer(Damage), is_integer(DamageType) ->
        ok.

getDamage(This, DamageType) when is_integer(DamageType) ->
        0.

% throws Exception
set(This, Gl) ->
        OpenGLSurfaceChangedInterface = get({This, animationInterface}),
        (get({OpenGLSurfaceChangedInterface, '$class'})):set(OpenGLSurfaceChangedInterface, Gl).

