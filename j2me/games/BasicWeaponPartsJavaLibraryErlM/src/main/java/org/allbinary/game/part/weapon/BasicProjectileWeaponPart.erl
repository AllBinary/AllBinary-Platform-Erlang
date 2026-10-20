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
% package org.allbinary.game.part.weapon
% import org.allbinary.animation.Animation
% import org.allbinary.game.combat.weapon.WeaponProperties
% import org.allbinary.game.layer.weapon.WeaponLayer
% import org.allbinary.game.layer.weapon.WeaponLayerCircularPool
% import org.allbinary.game.score.NoScoreable
% import org.allbinary.game.score.ScoreableInterface
% import org.allbinary.graphics.RelativeRelationship
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager

-module('BasicProjectileWeaponPart').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicWeaponPart', Function, Arguments).

init_fields(This) ->
    put({This, weaponLayerCircularStaticPool}, undefined),
    ok.


createBasicProjectileWeaponPart(AnimationInterface, WeaponLayerCircularStaticPool) ->
        'BasicProjectileWeaponPart':new(AnimationInterface, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'}), WeaponLayerCircularStaticPool, get({'WeaponProperties', 'NULL_WEAPON_PROPERTIES'}), 'NoScoreable':getInstance(), get({'RelativeRelationship', 'NULL_RELATIVE_RELATIONSHIP'})).

new(AnimationInterface, SourceLayerInterface, WeaponLayerCircularStaticPool, WeaponProperties, ScoreableInterface, RelativeRelationship) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AnimationInterface, SourceLayerInterface, WeaponLayerCircularStaticPool, WeaponProperties, ScoreableInterface, RelativeRelationship),
    This.

'$init'(This, AnimationInterface, SourceLayerInterface, WeaponLayerCircularStaticPool, WeaponProperties, ScoreableInterface, RelativeRelationship) ->
        'BasicWeaponPart':'$init'(This, AnimationInterface, SourceLayerInterface, WeaponProperties, ScoreableInterface, RelativeRelationship),
        init_fields(This),
        put({This, weaponLayerCircularStaticPool}, WeaponLayerCircularStaticPool).

% throws Exception
processScore(This, AllbinaryLayerManager, Angle, OtherAngle, WeaponProperties, ScoreableInterface) when is_integer(Angle), is_integer(OtherAngle) ->
        WeaponLayer = (get({get({This, weaponLayerCircularStaticPool}), '$class'})):getInstanceWeaponLayer(get({This, weaponLayerCircularStaticPool}), (get({This, '$class'})):getOwnerLayerInterface(This), (get({get({This, relativeRelationship}), '$class'})):getX(get({This, relativeRelationship})), (get({get({This, relativeRelationship}), '$class'})):getY(get({This, relativeRelationship})), (get({get({This, relativeRelationship}), '$class'})):getZ(get({This, relativeRelationship})), Angle, OtherAngle, WeaponProperties, ScoreableInterface),
        (get({AllbinaryLayerManager, '$class'})):append(AllbinaryLayerManager, WeaponLayer).

