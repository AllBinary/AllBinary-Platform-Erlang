% 
% AllBinary Open License Version 1 
% Copyright (c) 2006 AllBinary 
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
% package org.allbinary.game.behavior.topview
% import org.allbinary.game.physics.FrictionProperties
% import org.allbinary.game.physics.friction.FrictionData

-module('CharacterFrictionProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('FrictionProperties', Function, Arguments).

init_fields(This) ->
    put({This, 'WATER_FRICTION_NOMINATOR'}, 0),
    put({This, 'AIR_FRICTION_NOMINATOR'}, 0),
    put({This, 'COLLISION_FRICTION_NOMINATOR'}, 0),
    ok.


new(AirFriction, WaterFriction, CollisionFriction) when is_integer(AirFriction), is_integer(WaterFriction), is_integer(CollisionFriction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, AirFriction, WaterFriction, CollisionFriction),
    This.

'$init'(This, AirFriction, WaterFriction, CollisionFriction) when is_integer(AirFriction), is_integer(WaterFriction), is_integer(CollisionFriction) ->
    'FrictionProperties':'$init'(This),
    init_fields(This),
        put({This, 'AIR_FRICTION_NOMINATOR'}, ('FrictionData':getFrictionDenominator() - AirFriction)),
        put({This, 'COLLISION_FRICTION_NOMINATOR'}, ('FrictionData':getFrictionDenominator() - CollisionFriction)),
        put({This, 'WATER_FRICTION_NOMINATOR'}, ('FrictionData':getFrictionDenominator() - WaterFriction)).

getWATER_FRICTION_NOMINATOR(This) ->
        get({This, 'WATER_FRICTION_NOMINATOR'}).

getAIR_FRICTION_NOMINATOR(This) ->
        get({This, 'AIR_FRICTION_NOMINATOR'}).

getCOLLISION_FRICTION_NOMINATOR(This) ->
        get({This, 'COLLISION_FRICTION_NOMINATOR'}).

