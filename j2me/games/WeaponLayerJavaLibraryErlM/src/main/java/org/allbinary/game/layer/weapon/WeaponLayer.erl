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
% package org.allbinary.game.layer.weapon
% import javax.microedition.khronos.opengles.GL
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.animation.IndexedAnimation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.game.collision.CollidableBaseBehavior
% import org.allbinary.game.combat.destroy.DestroyedLayerProcessor
% import org.allbinary.game.combat.weapon.WeaponProperties
% import org.allbinary.game.configuration.GameConfigurationUtil
% import org.allbinary.game.identification.BasicGroupFactory
% import org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer
% import org.allbinary.game.multiplayer.layer.RemoteInfo
% import org.allbinary.game.score.NoScoreable
% import org.allbinary.game.score.ScoreableInterface
% import org.allbinary.game.tick.TickableInterface
% import org.allbinary.graphics.Rectangle
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.physics.movement.Movement
% import org.allbinary.view.ViewPosition
% import org.allbinary.view.ViewPositionBase

-module('WeaponLayer').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements TickableInterface

'$handle_undefined_function'(Function, Arguments) ->
    apply('MultiPlayerGameLayer', Function, Arguments).

init_fields(This) ->
    put({This, animationInterface}, (fun(Target_N66234) -> (get({Target_N66234, '$class'})):getInstance(Target_N66234, 0) end)('NullAnimationFactory':getFactoryInstance())),
    put({This, initAnimationInterface}, undefined),
    put({This, destroyedAnimationInterface}, undefined),
    put({This, sourceLayerInterface}, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})),
    put({This, totalDamage}, 0),
    put({This, initDamage}, 0),
    put({This, destroyed}, true),
    put({This, scoreableInterface}, 'NoScoreable':getInstance()),
    put({This, movement}, undefined),
    put({This, weaponProperties}, get({'WeaponProperties', 'NULL_WEAPON_PROPERTIES'})),
    put({This, multiPlayerType}, 0),
    put({This, collidableWeaponBehavior}, 'CollidableWeaponBehavior':getNullInstance()),
    ok.


new(Name, RemoteInfo, MultiPlayerType, Movement, AnimationInterface, DestroyedAnimationInterface, Rectangle, ViewPosition) when (is_list(Name) orelse Name =:= undefined), is_integer(MultiPlayerType) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, Name, RemoteInfo, MultiPlayerType, Movement, AnimationInterface, DestroyedAnimationInterface, Rectangle, ViewPosition),
    This.

'$init'(This, Name, RemoteInfo, MultiPlayerType, Movement, AnimationInterface, DestroyedAnimationInterface, Rectangle, ViewPosition) when (is_list(Name) orelse Name =:= undefined), is_integer(MultiPlayerType) ->
        'MultiPlayerGameLayer':'$init'(This, RemoteInfo, get({'BasicGroupFactory':getInstance(), 'NONE_ARRAY'}), Name, Rectangle, ViewPosition),
        init_fields(This),
        put({This, initAnimationInterface}, AnimationInterface),
        (get({This, '$class'})):setAnimationInterface(This, AnimationInterface),
        put({This, destroyedAnimationInterface}, DestroyedAnimationInterface),
        put({This, movement}, Movement),
        put({This, multiPlayerType}, MultiPlayerType).

setCollidableInferface(This, CollidableInferface) ->
        'MultiPlayerGameLayer':setCollidableInferface(This, CollidableInferface),
        put({This, collidableWeaponBehavior}, (get({This, '$class'})):getCollidableInferface(This)).

% throws Exception
initXYZ(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        put({This, x}, X),
        put({This, y}, Y),
        put({This, z}, Z).

% throws Exception
init(This, SourceLayerInterface, Angle, OtherAngle, WeaponProperties, Scoreable) when is_integer(Angle), is_integer(OtherAngle) ->
        (get({This, '$class'})):setWeaponPropertiesP(This, WeaponProperties),
        (get({This, '$class'})):setReadyForExplosion(This, false),
        (get({This, '$class'})):setAnimationInterface(This, (get({This, '$class'})):getInitAnimationInterfaceP(This)),
        (get({This, '$class'})):setOwnerLayerInterface(This, SourceLayerInterface),
        (get({get({This, collidableWeaponBehavior}), '$class'})):init(get({This, collidableWeaponBehavior}), SourceLayerInterface),
        (get({This, '$class'})):setGroupInterfaces(This),
        case (Scoreable =/= undefined) of
            true ->
            put({This, scoreableInterface}, Scoreable);
            false -> ok
        end,
        put({This, totalDamage}, 0),
        put({This, initDamage}, (get({WeaponProperties, '$class'})):getDamage(WeaponProperties)),
        (get({This, '$class'})):setDestroyed(This, false),
        (get({get({This, movement}), '$class'})):init(get({This, movement}), (get({WeaponProperties, '$class'})):getSpeed(WeaponProperties), Angle, OtherAngle).

setGroupInterfaces(This) ->
        BasicGroupFactory = 'BasicGroupFactory':getInstance(),
        case (array:get(0, (get({get({This, sourceLayerInterface}), '$class'})):getGroupInterface(get({This, sourceLayerInterface}))) =:= get({BasicGroupFactory, 'ENEMY'})) of
            true ->
            (get({This, '$class'})):setGroupInterface(This, get({BasicGroupFactory, 'ENEMY_ARRAY'}));
            false ->
            (get({This, '$class'})):setGroupInterface(This, (get({get({This, sourceLayerInterface}), '$class'})):getGroupInterface(get({This, sourceLayerInterface})))
        end.

% throws Exception
processTick(This, AllBinaryLayerManager) ->
        case ((get({This, '$class'})):isExhausted(This) andalso (not (get({This, '$class'})):isDestroyed(This))) of
            true ->
            case (get({This, '$class'})):isReadyForExplosion(This) of
                true ->
                IndexedAnimationInterface = (get({This, '$class'})):getAnimationInterface(This),
                CurrentFrame = (get({IndexedAnimationInterface, '$class'})):getFrame(IndexedAnimationInterface),
                case (CurrentFrame < ((get({IndexedAnimationInterface, '$class'})):getAnimationSize(IndexedAnimationInterface) - 1)) of
                    true ->
                    (get({IndexedAnimationInterface, '$class'})):nextFrame(IndexedAnimationInterface);
                    false ->
                    (get({This, '$class'})):setDestroyed(This, true)
                end;
                false ->
                CollidableWeaponBehavior = (get({This, '$class'})):getCollidableInferface(This),
                case (get({CollidableWeaponBehavior, '$class'})):isCollided(CollidableWeaponBehavior) of
                    true ->
                    (get({This, '$class'})):setAnimationInterface(This, get({This, destroyedAnimationInterface})),
                    (fun(Target_N68299) -> (get({Target_N68299, '$class'})):stop(Target_N68299) end)((get({This, '$class'})):getMovement(This)),
                    (get({This, '$class'})):setReadyForExplosion(This, true);
                    false ->
                    (get({This, '$class'})):setDestroyed(This, true)
                end
            end;
            false -> ok
        end,
        (get({get({This, movement}), '$class'})):process(get({This, movement}), This),
        put({This, totalDamage}, (get({This, totalDamage}) + (get({get({This, weaponProperties}), '$class'})):getDissipation(get({This, weaponProperties})))).

isDestroyed(This) ->
        get({This, destroyed}).

damage(This, Damage, DamageType) when is_integer(Damage), is_integer(DamageType) ->
        put({This, totalDamage}, (get({This, totalDamage}) + (Damage * Damage))).

givePoints(This, Total) when is_integer(Total) ->
        (get({get({This, scoreableInterface}), '$class'})):addPoints(get({This, scoreableInterface}), ((fun(Target_N68892) -> (get({Target_N68892, '$class'})):getCompetitionValue(Target_N68892) end)('GameConfigurationUtil':getInstance()) * Total)).

isExhausted(This) ->
        try
        case ((get({This, totalDamage}) > (get({This, '$class'})):getInitDamage(This)) orelse (get({This, totalDamage}) < 0)) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getDamage(This, DamageType) when is_integer(DamageType) ->
        try
        case (not (get({This, '$class'})):isExhausted(This)) of
            true ->
            Total = ((get({This, '$class'})):getInitDamage(This) - get({This, totalDamage})),
            (get({This, '$class'})):givePoints(This, Total),
            throw({'$return', Total});
            false -> ok
        end,
        0
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

setDestroyed(This, Destroyed) when is_boolean(Destroyed) ->
        put({This, destroyed}, Destroyed),
        case (get({This, '$class'})):isDestroyed(This) of
            true ->
            put({This, scoreableInterface}, 'NoScoreable':getInstance()),
            (fun(Target_N69355) -> (get({Target_N69355, '$class'})):add(Target_N69355, This) end)('DestroyedLayerProcessor':getInstance());
            false -> ok
        end.

getInitDamage(This) ->
        get({This, initDamage}).

setAnimationInterface(This, AnimationInterface) ->
        put({This, animationInterface}, AnimationInterface).

getAnimationInterface(This) ->
        get({This, animationInterface}).

getInitAnimationInterfaceP(This) ->
        get({This, initAnimationInterface}).

setInitAnimationInterfaceP(This, InitAnimationInterface) ->
        put({This, initAnimationInterface}, InitAnimationInterface).

getDestroyedAnimationInterface(This) ->
        get({This, destroyedAnimationInterface}).

getOwnerLayerInterface(This) ->
        get({This, sourceLayerInterface}).

setOwnerLayerInterface(This, SourceLayerInterface) ->
        put({This, sourceLayerInterface}, SourceLayerInterface).

paint(This, Graphics) ->
        ViewPosition = (get({This, '$class'})):getViewPosition(This),
        (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, ((get({ViewPosition, '$class'})):getX(ViewPosition) - (get({This, '$class'})):getHalfWidth(This)), ((get({ViewPosition, '$class'})):getY(ViewPosition) - (get({This, '$class'})):getHalfHeight(This))).

paintThreed(This, Graphics) ->
        ViewPosition = (get({This, '$class'})):getViewPosition(This),
        (get({get({This, animationInterface}), '$class'})):paintThreedXYZ(get({This, animationInterface}), Graphics, ((get({ViewPosition, '$class'})):getX(ViewPosition) - (get({This, '$class'})):getHalfWidth(This)), ((get({ViewPosition, '$class'})):getY(ViewPosition) - (get({This, '$class'})):getHalfHeight(This)), ((get({ViewPosition, '$class'})):getZ(ViewPosition) - (get({This, '$class'})):getHalfDepth(This))).

getMovement(This) ->
        get({This, movement}).

setMovement(This, Movement) ->
        put({This, movement}, Movement).

getType(This) ->
        'WeaponLayer':getStaticType().

getStaticType() ->
        0.

getMultiPlayerType(This) ->
        get({This, multiPlayerType}).

setWeaponPropertiesP(This, WeaponProperties) ->
        put({This, weaponProperties}, WeaponProperties).

getWeaponPropertiesP(This) ->
        get({This, weaponProperties}).

implmentsTickableInterface(This) ->
        true.

% throws Exception
set(This, Gl) ->
        (get({get({This, initAnimationInterface}), '$class'})):set(get({This, initAnimationInterface}), Gl).

