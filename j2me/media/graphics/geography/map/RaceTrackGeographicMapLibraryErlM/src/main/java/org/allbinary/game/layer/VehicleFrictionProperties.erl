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
% import org.allbinary.game.physics.FrictionProperties
% import org.allbinary.game.physics.friction.FrictionData

-module('VehicleFrictionProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('FrictionProperties', Function, Arguments).

init_fields(This) ->
    put({This, 'TIRE_FRICTION_NOMINATOR'}, 0),
    put({This, 'BRAKE_FRICTION_NOMINATOR'}, 0),
    put({This, 'AIR_FRICTION_NOMINATOR'}, 0),
    put({This, 'CRASH_FRICTION_NOMINATOR'}, 0),
    ok.


new(TireFriction, BrakeFriction, AirFriction, CrashFriction) when is_integer(TireFriction), is_integer(BrakeFriction), is_integer(AirFriction), is_integer(CrashFriction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, TireFriction, BrakeFriction, AirFriction, CrashFriction),
    This.

init(This, TireFriction, BrakeFriction, AirFriction, CrashFriction) when is_integer(TireFriction), is_integer(BrakeFriction), is_integer(AirFriction), is_integer(CrashFriction) ->
    'FrictionProperties':init(This),
    init_fields(This),
        put({This, 'TIRE_FRICTION_NOMINATOR'}, ('FrictionData':getFrictionDenominator() - TireFriction)),
        put({This, 'BRAKE_FRICTION_NOMINATOR'}, ('FrictionData':getFrictionDenominator() - BrakeFriction)),
        put({This, 'AIR_FRICTION_NOMINATOR'}, ('FrictionData':getFrictionDenominator() - AirFriction)),
        put({This, 'CRASH_FRICTION_NOMINATOR'}, ('FrictionData':getFrictionDenominator() - CrashFriction)).

getTireFrictionNominator(This) ->
        get({This, 'TIRE_FRICTION_NOMINATOR'}).

getBrakeFrictionNominator(This) ->
        get({This, 'BRAKE_FRICTION_NOMINATOR'}).

getAirFrictionNominator(This) ->
        get({This, 'AIR_FRICTION_NOMINATOR'}).

getCrashFrictionNominator(This) ->
        get({This, 'CRASH_FRICTION_NOMINATOR'}).

