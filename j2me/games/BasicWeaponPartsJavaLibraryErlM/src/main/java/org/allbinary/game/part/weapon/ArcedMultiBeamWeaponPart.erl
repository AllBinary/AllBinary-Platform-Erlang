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
% import org.allbinary.game.score.ScoreableInterface
% import org.allbinary.graphics.RelativeRelationship
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.math.AngleFactory

-module('ArcedMultiBeamWeaponPart').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicWeaponPart', Function, Arguments).

init_fields(This) ->
    put({This, weaponLayerCircularStaticPool}, undefined),
    put({This, total}, 0),
    put({This, 'TOTAL_ANGLE'}, trunc(get({'AngleFactory':getInstance(), 'TOTAL_ANGLE'}))),
    ok.


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
        Increment = ((((get({This, total}) - 1)) div get({This, 'TOTAL_ANGLE'}))),
        MinAngle = ((Angle - ((((Increment * get({This, total}))) bsr 1)))),
        put({local, next}, 0),
        put({local, weaponLayer}, undefined),
        lists:foreach(fun(Index) ->
            put({local, weaponLayer}, (get({get({This, weaponLayerCircularStaticPool}), '$class'})):getInstanceWeaponLayer(get({This, weaponLayerCircularStaticPool}), (get({This, '$class'})):getOwnerLayerInterface(This), (get({get({This, relativeRelationship}), '$class'})):getX(get({This, relativeRelationship})), (get({get({This, relativeRelationship}), '$class'})):getY(get({This, relativeRelationship})), 0, ((MinAngle + Increment)), OtherAngle, WeaponProperties, ScoreableInterface)),
            (get({AllbinaryLayerManager, '$class'})):append(AllbinaryLayerManager, get({local, weaponLayer})),
            put({local, next}, (get({local, next}) + Increment))
        end, lists:seq(0, get({This, total}) - 1)).

