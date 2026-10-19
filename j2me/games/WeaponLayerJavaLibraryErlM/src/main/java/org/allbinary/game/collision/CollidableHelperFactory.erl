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
% package org.allbinary.game.collision
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.layer.AllBinaryLayer

-module('CollidableHelperFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        try
        case (fun(Target_N65693) -> (get({Target_N65693, '$class'})):isFeature(Target_N65693, get({'GameFeatureFactory':getInstance(), 'COLLISIONS_WITH_SOURCE'})) end)('Features':getInstance()) of
            true ->
            throw({'$return', 'CollisionHelper':new(get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'}))});
            false ->
            throw({'$return', 'SourceCollisionHelper':new(get({'AllBinaryLayer', 'NULL_ALLBINARY_LAYER'}))})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

