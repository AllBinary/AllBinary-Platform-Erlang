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
% package org.allbinary.physics.movement
% import org.allbinary.game.layer.AllBinaryGameLayer
% import org.allbinary.game.physics.acceleration.GravityUtil
% import org.allbinary.game.physics.velocity.VelocityProperties
% import org.allbinary.logic.math.BasicDecimal

-module('BasicGravityConstantVelocityMovement').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicConstantVelocityMovement', Function, Arguments).

init_fields(This) ->
    put({This, gravityUtil}, 'GravityUtil':getInstance()),
    ok.


new(SpeedBasicDecimal) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, SpeedBasicDecimal),
    This.

init(This, SpeedBasicDecimal) ->
        'BasicConstantVelocityMovement':init(This, SpeedBasicDecimal, 'VelocityProperties':new(trunc((get({SpeedBasicDecimal, '$class'})):getUnscaled(SpeedBasicDecimal)), trunc((get({SpeedBasicDecimal, '$class'})):getUnscaled(SpeedBasicDecimal)))),
        init_fields(This).

% throws Exception
process(This, Layer) ->
        'BasicConstantVelocityMovement':process(This, Layer),
        (get({get({This, gravityUtil}), '$class'})):process(get({This, gravityUtil}), (get({This, '$class'})):getVelocityProperties(This), get({get({This, gravityUtil}), 'GAME_GRAVITY_VELOCITY'})).

