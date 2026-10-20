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
% package org.allbinary.game.layer
% import org.allbinary.direction.DirectionFactory

-module('LayerPlacementTypeFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'LayerPlacementTypeFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'MAP'}, 'LayerPlacementType':new(get({'Integer', 'MAX_VALUE'}))),
    put({This, 'LEFT'}, 'LayerPlacementType':new((fun(Target_N65809) -> (get({Target_N65809, '$class'})):getValue(Target_N65809) end)(get({'DirectionFactory':getInstance(), 'LEFT'})))),
    put({This, 'DOWN'}, 'LayerPlacementType':new((fun(Target_N65890) -> (get({Target_N65890, '$class'})):getValue(Target_N65890) end)(get({'DirectionFactory':getInstance(), 'DOWN'})))),
    put({This, 'UP'}, 'LayerPlacementType':new((fun(Target_N65971) -> (get({Target_N65971, '$class'})):getValue(Target_N65971) end)(get({'DirectionFactory':getInstance(), 'UP'})))),
    put({This, 'RIGHT'}, 'LayerPlacementType':new((fun(Target_N66052) -> (get({Target_N66052, '$class'})):getValue(Target_N66052) end)(get({'DirectionFactory':getInstance(), 'RIGHT'})))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'LayerPlacementTypeFactory', instance}).

