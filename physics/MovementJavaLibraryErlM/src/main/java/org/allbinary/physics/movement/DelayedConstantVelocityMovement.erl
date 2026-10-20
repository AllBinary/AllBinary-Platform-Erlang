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
% import org.allbinary.game.physics.velocity.BasicVelocityProperties
% import org.allbinary.logic.math.BasicDecimal
% import org.allbinary.time.GameTickTimeDelayHelperFactory
% import org.allbinary.time.TimeDelayHelper

-module('DelayedConstantVelocityMovement').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicConstantVelocityMovement', Function, Arguments).

init_fields(This) ->
    put({This, timeDelayHelper}, 'TimeDelayHelper':new(60)),
    ok.


new(BasicDecimal, VelocityProperties) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, BasicDecimal, VelocityProperties),
    This.

'$init'(This, BasicDecimal, VelocityProperties) ->
        'BasicConstantVelocityMovement':'$init'(This, BasicDecimal, VelocityProperties),
        init_fields(This).

init(This, SpeedBasicDecimal, Angle, OtherAngle) when is_integer(Angle), is_integer(OtherAngle) ->
        ok.

% throws Exception
process(This, Layer) ->
        case (get({get({This, timeDelayHelper}), '$class'})):isTime(get({This, timeDelayHelper}), get({'GameTickTimeDelayHelperFactory':getInstance(), startTime})) of
            true ->
            'BasicConstantVelocityMovement':process(This, Layer);
            false -> ok
        end.

