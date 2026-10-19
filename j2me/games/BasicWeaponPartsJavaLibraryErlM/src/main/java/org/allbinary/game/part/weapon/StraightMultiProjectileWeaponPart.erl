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
% import org.allbinary.math.NoDecimalTrigTable

-module('StraightMultiProjectileWeaponPart').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicWeaponPart', Function, Arguments).

init_fields(This) ->
    put({This, weaponLayerCircularStaticPool}, undefined),
    put({This, total}, 0),
    put({This, noDecimalTrigTable}, 'NoDecimalTrigTable':getInstance()),
    ok.


createStraightMultiProjectileWeaponPart(AnimationInterface, WeaponLayerCircularStaticPool) ->
        'StraightMultiProjectileWeaponPart':new(AnimationInterface, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'}), WeaponLayerCircularStaticPool, 2, get({'WeaponProperties', 'NULL_WEAPON_PROPERTIES'}), 'NoScoreable':getInstance(), get({'RelativeRelationship', 'NULL_RELATIVE_RELATIONSHIP'})).

new(AnimationInterface, SourceLayerInterface, WeaponLayerCircularStaticPool, Total, WeaponProperties, ScoreableInterface, RelativeRelationship) when is_integer(Total) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnimationInterface, SourceLayerInterface, WeaponLayerCircularStaticPool, Total, WeaponProperties, ScoreableInterface, RelativeRelationship),
    This.

init(This, AnimationInterface, SourceLayerInterface, WeaponLayerCircularStaticPool, Total, WeaponProperties, ScoreableInterface, RelativeRelationship) when is_integer(Total) ->
        'BasicWeaponPart':init(This, AnimationInterface, SourceLayerInterface, WeaponProperties, ScoreableInterface, RelativeRelationship),
        init_fields(This),
        put({This, total}, Total),
        put({This, weaponLayerCircularStaticPool}, WeaponLayerCircularStaticPool).

% throws Exception
processScore(This, AllbinaryLayerManager, Angle, OtherAngle, WeaponProperties, ScoreableInterface) when is_integer(Angle), is_integer(OtherAngle) ->
        SourceLayerInterface = (get({This, '$class'})):getOwnerLayerInterface(This),
        ReducedWidth = ((((get({SourceLayerInterface, '$class'})):getWidth(SourceLayerInterface) * 8) / 10)),
        HalfWidth = ((ReducedWidth bsr 1)),
        X = (get({get({This, relativeRelationship}), '$class'})):getX(get({This, relativeRelationship})),
        Y = (get({get({This, relativeRelationship}), '$class'})):getY(get({This, relativeRelationship})),
        put({local, sine}, 0),
        put({local, beamX}, 0),
        put({local, cosine}, 0),
        put({local, beamY}, 0),
        put({local, weaponLayer}, undefined),
        Increment = (ReducedWidth div ((get({This, total}) - 1))),
        put({local, next}, (-HalfWidth)),
        lists:foreach(fun(Index) ->
            put({local, sine}, trunc(((get({local, next}) * (get({get({This, noDecimalTrigTable}), '$class'})):sin(get({This, noDecimalTrigTable}), Angle))))),
            put({local, beamX}, trunc(((get({local, sine}) / get({get({This, noDecimalTrigTable}), 'SCALE'}))))),
            put({local, cosine}, trunc(((get({local, next}) * (get({get({This, noDecimalTrigTable}), '$class'})):cos(get({This, noDecimalTrigTable}), Angle))))),
            put({local, beamY}, (-trunc(((get({local, cosine}) / get({get({This, noDecimalTrigTable}), 'SCALE'})))))),
            put({local, weaponLayer}, (get({get({This, weaponLayerCircularStaticPool}), '$class'})):getInstanceWeaponLayer(get({This, weaponLayerCircularStaticPool}), SourceLayerInterface, (X + get({local, beamX})), (Y + get({local, beamY})), 0, Angle, OtherAngle, WeaponProperties, ScoreableInterface)),
            (get({AllbinaryLayerManager, '$class'})):append(AllbinaryLayerManager, get({local, weaponLayer})),
            put({local, next}, (get({local, next}) + Increment))
        end, lists:seq(0, get({This, total}) - 1)).

