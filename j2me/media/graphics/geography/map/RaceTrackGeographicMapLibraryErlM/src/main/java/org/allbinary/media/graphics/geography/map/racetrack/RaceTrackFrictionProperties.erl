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
% package org.allbinary.media.graphics.geography.map.racetrack
% import org.allbinary.game.physics.friction.FrictionData

-module('RaceTrackFrictionProperties').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, 'ROAD_FRICTION_NOMINATOR'}, 0),
    put({This, 'GROUND_FRICTION_NOMINATOR'}, 0),
    ok.


new(RoadFriction, GroundFriction) when is_integer(RoadFriction), is_integer(GroundFriction) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, RoadFriction, GroundFriction),
    This.

init(This, RoadFriction, GroundFriction) when is_integer(RoadFriction), is_integer(GroundFriction) ->
    init_fields(This),
        put({This, 'ROAD_FRICTION_NOMINATOR'}, ('FrictionData':getFrictionDenominator() - RoadFriction)),
        put({This, 'GROUND_FRICTION_NOMINATOR'}, ('FrictionData':getFrictionDenominator() - GroundFriction)).

getRoadFrictionNominator(This) ->
        get({This, 'ROAD_FRICTION_NOMINATOR'}).

getGroundFrictionNominator(This) ->
        get({This, 'GROUND_FRICTION_NOMINATOR'}).

