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
% import javax.microedition.lcdui.Graphics
% import org.allbinary.animation.Animation
% import org.allbinary.animation.NullAnimationFactory
% import org.allbinary.game.combat.weapon.WeaponProperties
% import org.allbinary.game.part.PartInterface
% import org.allbinary.game.score.NoScoreable
% import org.allbinary.game.score.ScoreableInterface
% import org.allbinary.graphics.RelativeRelationship
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerManager
% import org.allbinary.string.CommonStrings
% import org.allbinary.view.ViewPositionBase

-module('BasicWeaponPart').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements PartInterface
% implements SalvoInterface

static_init() ->
    put({?MODULE, 'NULL_BASIC_WEAPON_PART'}, 'BasicWeaponPart':createBasicWeaponPart((fun(Target_N66124) -> (get({Target_N66124, '$class'})):getInstance(Target_N66124, 0) end)('NullAnimationFactory':getFactoryInstance()))),
    ok.

init_fields(This) ->
    put({This, animationInterface}, (fun(Target_N66187) -> (get({Target_N66187, '$class'})):getInstance(Target_N66187, 0) end)('NullAnimationFactory':getFactoryInstance())),
    put({This, ownerLayerInterface}, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'})),
    put({This, weaponProperties}, get({'WeaponProperties', 'NULL_WEAPON_PROPERTIES'})),
    put({This, scoreableInterface}, 'NoScoreable':getInstance()),
    put({This, relativeRelationship}, get({'RelativeRelationship', 'NULL_RELATIVE_RELATIONSHIP'})),
    ok.


createBasicWeaponPart(AnimationInterface) ->
        'BasicWeaponPart':new(AnimationInterface, get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'}), get({'WeaponProperties', 'NULL_WEAPON_PROPERTIES'}), 'NoScoreable':getInstance(), get({'RelativeRelationship', 'NULL_RELATIVE_RELATIONSHIP'})).

new(AnimationInterface, SourceLayerInterface, WeaponProperties, ScoreableInterface, RelativeRelationship) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, AnimationInterface, SourceLayerInterface, WeaponProperties, ScoreableInterface, RelativeRelationship),
    This.

init(This, AnimationInterface, SourceLayerInterface, WeaponProperties, ScoreableInterface, RelativeRelationship) ->
    init_fields(This),
        (get({This, '$class'})):init(This, SourceLayerInterface, WeaponProperties, ScoreableInterface, RelativeRelationship),
        (get({This, '$class'})):setAnimationInterface(This, AnimationInterface).

init(This, SourceLayerInterface, WeaponProperties, ScoreableInterface, RelativeRelationship) ->
        (get({This, '$class'})):setOwnerLayerInterface(This, SourceLayerInterface),
        (get({This, '$class'})):setWeaponProperties(This, WeaponProperties),
        put({This, scoreableInterface}, ScoreableInterface),
        put({This, relativeRelationship}, RelativeRelationship).

% throws Exception
process(This, AllbinaryLayerManager, Angle, OtherAngle) when is_integer(Angle), is_integer(OtherAngle) ->
        (get({This, '$class'})):processScore(This, AllbinaryLayerManager, Angle, OtherAngle, (get({This, '$class'})):getWeaponProperties(This), get({This, scoreableInterface})).

% throws Exception
processScore(This, AllbinaryLayerManager, Angle, OtherAngle, WeaponProperties, ScoreableInterface) when is_integer(Angle), is_integer(OtherAngle) ->
        erlang:error({'Exception', get({'CommonStrings':getInstance(), 'NOT_IMPLEMENTED'})}).

getOwnerLayerInterface(This) ->
        get({This, ownerLayerInterface}).

setOwnerLayerInterface(This, OwnerLayerInterface) ->
        put({This, ownerLayerInterface}, OwnerLayerInterface).

getAnimationInterface(This) ->
        get({This, animationInterface}).

setAnimationInterface(This, AnimationInterface) ->
        put({This, animationInterface}, AnimationInterface).

paint(This, Graphics) ->
        ViewPosition = (fun(Target_N67544) -> (get({Target_N67544, '$class'})):getViewPosition(Target_N67544) end)((get({This, '$class'})):getOwnerLayerInterface(This)),
        ViewX = (get({ViewPosition, '$class'})):getX(ViewPosition),
        ViewY = (get({ViewPosition, '$class'})):getY(ViewPosition),
        (get({get({This, animationInterface}), '$class'})):paintXY(get({This, animationInterface}), Graphics, ViewX, ViewY).

paintThreed(This, Graphics) ->
        ok.

getWeaponProperties(This) ->
        get({This, weaponProperties}).

setWeaponProperties(This, WeaponProperties) ->
        put({This, weaponProperties}, WeaponProperties).

