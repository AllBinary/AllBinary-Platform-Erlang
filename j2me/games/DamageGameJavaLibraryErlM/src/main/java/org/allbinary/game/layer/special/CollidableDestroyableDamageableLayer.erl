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
% package org.allbinary.game.layer.special
% import javax.microedition.lcdui.Graphics
% import org.allbinary.game.collision.CollidableNeverCollideBehaviorFactory
% import org.allbinary.game.combat.damage.DamageableInterface
% import org.allbinary.game.combat.destroy.DestroyableInterface
% import org.allbinary.game.combat.destroy.event.DestroyedEvent
% import org.allbinary.game.identification.BasicGroupFactory
% import org.allbinary.game.identification.Group
% import org.allbinary.game.input.event.GameKeyEvent
% import org.allbinary.game.layer.AllBinaryGameLayerManager
% import org.allbinary.game.layer.CollidableCompositeLayer
% import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface
% import org.allbinary.game.layer.pickup.PickupBehavior
% import org.allbinary.game.layer.pickup.PickupCompositeInterface
% import org.allbinary.game.part.PartInterface
% import org.allbinary.game.part.PartInterfaceUtil
% import org.allbinary.graphics.Rectangle
% import org.allbinary.graphics.RectangleFactory
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.logic.NullUtil
% import org.allbinary.logic.string.StringMaker
% import org.allbinary.logic.string.StringUtil
% import org.allbinary.math.PositionStrings
% import org.allbinary.string.CommonSeps
% import org.allbinary.view.ViewPositionBase

-module('CollidableDestroyableDamageableLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements DestroyableInterface
% implements DamageableInterface
% implements PickupCompositeInterface
% implements SpecialGameInputInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('CollidableCompositeLayer', Function, Arguments).

static_init() ->
    put({?MODULE, 'NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER'}, get({'NullUtil':getInstance(), 'NULL_OBJECT'})),
    put({?MODULE, 'READYFOREXPLOSION'}, "ReadyForExplosion: "),
    ok.

init_fields(This) ->
    put({This, groupInterface}, undefined),
    put({This, readyForExplosion}, false),
    put({This, initWidth}, 0),
    put({This, initHeight}, 0),
    put({This, initX}, 0),
    put({This, initY}, 0),
    put({This, initZ}, 0),
    put({This, partInterfaceArrayP}, 'PartInterfaceUtil':getZeroArray()),
    put({This, pickupBehavior}, undefined),
    put({This, allBinaryGameLayerManagerP}, 'AllBinaryGameLayerManager':getNullInstance()),
    put({This, isDraggable}, false),
    put({This, isDragged}, false),
    put({This, isDropped}, false),
    ok.


getNullInstance() ->
        case (get({'CollidableDestroyableDamageableLayer', 'NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER'}) =:= get({'NullUtil':getInstance(), 'NULL_OBJECT'})) of
            true ->
            put({'CollidableDestroyableDamageableLayer', 'NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER'}, 'CollidableDestroyableDamageableLayer':new(get({'BasicGroupFactory':getInstance(), 'NONE_ARRAY'}), get({'StringUtil':getInstance(), 'EMPTY_STRING'}), get({'RectangleFactory', 'SINGLETON'}), get({'ViewPositionBase', 'NULL_VIEW_POSITION'})));
            false -> ok
        end,
        get({'CollidableDestroyableDamageableLayer', 'NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER'}).

new(GroupInterface, Name, LayerInfo, ViewPosition) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(Name) orelse Name =:= undefined) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, GroupInterface, Name, LayerInfo, ViewPosition),
    This.

'$init'(This, GroupInterface, Name, LayerInfo, ViewPosition) when (is_tuple(GroupInterface) orelse GroupInterface =:= undefined), (is_list(Name) orelse Name =:= undefined) ->
        'CollidableCompositeLayer':'$init'(This, Name, LayerInfo, ViewPosition, 'CollidableNeverCollideBehaviorFactory':getInstance()),
        init_fields(This),
        put({This, initWidth}, (get({LayerInfo, '$class'})):getWidth(LayerInfo)),
        put({This, initHeight}, (get({LayerInfo, '$class'})):getHeight(LayerInfo)),
        put({This, groupInterface}, GroupInterface),
        put({This, pickupBehavior}, 'PickupBehavior':getNullInstance()).

% throws Exception
initPosition(This) ->
        (get({This, '$class'})):setPosition(This, get({This, initX}), get({This, initY}), get({This, initZ})).

% throws Exception
initPositionXYZ(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        put({This, initX}, X),
        put({This, initY}, Y),
        put({This, initZ}, Z).

paint(This, Graphics) ->
        'CollidableCompositeLayer':paint(This, Graphics).

% throws Exception
damage(This, Damage, DamageType) when is_integer(Damage), is_integer(DamageType) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
getDamage(This, DamageType) when is_integer(DamageType) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

% throws Exception
isDestroyed(This) ->
        erlang:error({'Exception', get({get({This, commonStrings}), 'NOT_IMPLEMENTED'})}).

getGroupInterface(This) ->
        get({This, groupInterface}).

setGroupInterface(This, TeamInterface) when (is_tuple(TeamInterface) orelse TeamInterface =:= undefined) ->
        put({This, groupInterface}, TeamInterface).

% throws Exception
setAllBinaryGameLayerManager(This, AllBinaryGameLayerManager) ->
        put({This, allBinaryGameLayerManagerP}, AllBinaryGameLayerManager),
        case (get({This, allBinaryGameLayerManagerP}) =:= undefined) of
            true ->
            erlang:error({'RuntimeException'});
            false -> ok
        end.

isReadyForExplosion(This) ->
        get({This, readyForExplosion}).

setReadyForExplosion(This, IsReadyForExplosion) when is_boolean(IsReadyForExplosion) ->
        put({This, readyForExplosion}, IsReadyForExplosion).

getInitWidth(This) ->
        get({This, initWidth}).

getInitHeight(This) ->
        get({This, initHeight}).

getInitX(This) ->
        get({This, initX}).

getInitY(This) ->
        get({This, initY}).

% throws Exception
up(This) ->
        ok.

% throws Exception
down(This) ->
        ok.

% throws Exception
right(This) ->
        ok.

% throws Exception
left(This) ->
        ok.

% throws Exception
strafeLeft(This) ->
        ok.

% throws Exception
strafeRight(This) ->
        ok.

% throws Exception
fire(This, LayerManager, GameKeyEvent) ->
        ok.

% throws Exception
special1(This, LayerManager, GameKeyEvent) ->
        ok.

% throws Exception
special2(This, LayerManager, GameKeyEvent) ->
        ok.

% throws Exception
special3(This, LayerManager, GameKeyEvent) ->
        ok.

% throws Exception
special4(This, LayerManager, GameKeyEvent) ->
        ok.

% throws Exception
special5(This, LayerManager, GameKeyEvent) ->
        ok.

% throws Exception
upAnalog(This, YAnalogValue) when is_integer(YAnalogValue) ->
        ok.

% throws Exception
downAnalog(This, YAnalogValue) when is_integer(YAnalogValue) ->
        ok.

% throws Exception
rightAnalog(This, XAnalogValue) when is_integer(XAnalogValue) ->
        ok.

% throws Exception
leftAnalog(This, XAnalogValue) when is_integer(XAnalogValue) ->
        ok.

% throws Exception
rightTrigger(This, LayerManager, GameKeyEvent, XAnalogValue) when is_integer(XAnalogValue) ->
        ok.

% throws Exception
leftTrigger(This, LayerManager, GameKeyEvent, XAnalogValue) when is_integer(XAnalogValue) ->
        ok.

onDestroyed(This, DestroyedEvent) ->
        ok.

getPickupBehavior(This) ->
        get({This, pickupBehavior}).

setPickupBehavior(This, PickupBehavior) ->
        put({This, pickupBehavior}, PickupBehavior).

% throws Exception
addPart(This, PickedUpLayerInterfaceFactoryInterface) ->
        ok.

setPartInterfaceArray(This, PartInterfaceArray) when (is_tuple(PartInterfaceArray) orelse PartInterfaceArray =:= undefined) ->
        put({This, partInterfaceArrayP}, PartInterfaceArray).

getPartInterfaceArray(This) ->
        get({This, partInterfaceArrayP}).

toStringAppend(This, StringBuffer) ->
        CommonSeps = 'CommonSeps':getInstance(),
        PositionStrings = 'PositionStrings':getInstance(),
        'CollidableCompositeLayer':toStringAppend(This, StringBuffer),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        GroupInterfaceArray = (get({This, '$class'})):getGroupInterface(This),
        Size = array:size(GroupInterfaceArray),
        lists:foreach(fun(Index) ->
            (get({StringBuffer, '$class'})):append(StringBuffer, (fun(Target_N70634) -> (get({Target_N70634, '$class'})):toString(Target_N70634) end)(array:get(Index, GroupInterfaceArray))),
            (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'COMMA'}))
        end, lists:seq(0, Size - 1)),
        PickupBehavior = (get({This, '$class'})):getPickupBehavior(This),
        case (PickupBehavior =/= undefined) of
            true ->
            (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
            (get({StringBuffer, '$class'})):append(StringBuffer, (get({PickupBehavior, '$class'})):toString(PickupBehavior));
            false -> ok
        end,
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({'CollidableDestroyableDamageableLayer', 'READYFOREXPLOSION'})),
        (get({StringBuffer, '$class'})):appendboolean(StringBuffer, get({This, readyForExplosion})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'NEW_LINE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({get({This, commonStrings}), 'INIT'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({CommonSeps, 'SPACE'})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'X_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, initX})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Y_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, initX})),
        (get({StringBuffer, '$class'})):append(StringBuffer, get({PositionStrings, 'Z_LABEL'})),
        (get({StringBuffer, '$class'})):appendint(StringBuffer, get({This, initZ})).

toString(This) ->
        StringBuffer = 'StringMaker':new(),
        (get({This, '$class'})):toStringAppend(This, StringBuffer),
        (get({StringBuffer, '$class'})):toString(StringBuffer).

