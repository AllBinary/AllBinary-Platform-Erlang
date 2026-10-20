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
% import org.allbinary.game.combat.weapon.WeaponProperties
% import org.allbinary.game.score.ScoreableInterface
% import org.allbinary.layer.AllBinaryLayer
% import org.allbinary.layer.AllBinaryLayerCircularPool

-module('WeaponLayerCircularPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('AllBinaryLayerCircularPool', Function, Arguments).

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'AllBinaryLayerCircularPool':'$init'(This),
    init_fields(This),
        ok.

% throws Exception
getInstanceWeaponLayer(This, SourceLayerInterface, X, Y, Z, Angle, OtherAngle, WeaponProperties, Scoreable) when is_integer(X), is_integer(Y), is_integer(Z), is_integer(Angle), is_integer(OtherAngle) ->
        WeaponLayer = 'AllBinaryLayerCircularPool':getNextInstance(This),
        (get({WeaponLayer, '$class'})):initXYZ(WeaponLayer, X, Y, Z),
        (get({WeaponLayer, '$class'})):init(WeaponLayer, SourceLayerInterface, Angle, OtherAngle, WeaponProperties, Scoreable),
        WeaponLayer.

