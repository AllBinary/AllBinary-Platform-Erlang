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
% import org.allbinary.game.combat.weapon.WeaponProperties
% import org.allbinary.game.score.ScoreableInterface
% import org.allbinary.graphics.RelativeRelationship
% import org.allbinary.layer.AllBinaryLayer

-module('BasicWeaponPartCircularPool').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'NULL_BASIC_WEAPON_PART_CIRCULAR_POOL'}, 'BasicWeaponPartCircularPool':new()),
    ok.

init_fields(This) ->
    put({This, basicWeaponPart}, get({'BasicWeaponPart', 'NULL_BASIC_WEAPON_PART'})),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


% throws Exception
init(This, BasicWeaponPartFactoryInterface) ->
        put({This, basicWeaponPart}, (get({BasicWeaponPartFactoryInterface, '$class'})):getInstance(BasicWeaponPartFactoryInterface)).

% throws Exception
getInstance(This, SourceLayerInterface, WeaponProperties, ScoreableInterface, RelativeRelationship) ->
        (get({get({This, basicWeaponPart}), '$class'})):init(get({This, basicWeaponPart}), SourceLayerInterface, WeaponProperties, ScoreableInterface, RelativeRelationship),
        get({This, basicWeaponPart}).

