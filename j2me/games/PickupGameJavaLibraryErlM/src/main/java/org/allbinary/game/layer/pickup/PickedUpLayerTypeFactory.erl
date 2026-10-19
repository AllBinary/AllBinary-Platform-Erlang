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
% import org.allbinary.logic.string.StringUtil

-module('PickedUpLayerTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PickedUpLayerTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NONE'}, 'PickedUpLayerType':new(get({'StringUtil':getInstance(), 'NULL_STRING'}))),
    put({This, 'BEAM'}, 'PickedUpLayerType':new("BEAM")),
    put({This, 'MINE'}, 'PickedUpLayerType':new("MINE")),
    put({This, 'PROJECTILE'}, 'PickedUpLayerType':new("PROJECTILE")),
    put({This, 'ENHANCEMENT'}, 'PickedUpLayerType':new("Enhancement")),
    put({This, 'MORPH'}, 'PickedUpLayerType':new("Morph")),
    put({This, 'PART'}, 'PickedUpLayerType':new("Part")),
    put({This, 'HEAL'}, 'PickedUpLayerType':new("Heal")),
    put({This, 'LIFE'}, 'PickedUpLayerType':new("Life")),
    put({This, 'POINTS'}, 'PickedUpLayerType':new("Points")),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'PickedUpLayerTypeFactory', instance}).

