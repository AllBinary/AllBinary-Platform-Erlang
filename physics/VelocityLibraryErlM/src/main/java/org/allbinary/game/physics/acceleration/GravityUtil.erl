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
% package org.allbinary.game.physics.acceleration
% import org.allbinary.game.physics.velocity.BasicVelocityProperties

-module('GravityUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GravityUtil':new()),
    ok.

init_fields(This) ->
    put({This, 'GAME_GRAVITY_VELOCITY'}, 1800),
    put({This, 'MAX_GAME_VELOCITY'}, 18000),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'GravityUtil', instance}).

process(This, VelocityProperties, CustomGravity) when is_integer(CustomGravity) ->
        (fun(Target_N65818) -> (get({Target_N65818, '$class'})):addint(Target_N65818, CustomGravity) end)((get({VelocityProperties, '$class'})):getVelocityYBasicDecimalP(VelocityProperties)).

