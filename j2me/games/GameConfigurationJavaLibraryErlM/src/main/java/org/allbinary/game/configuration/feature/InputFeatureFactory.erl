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
% package org.allbinary.game.configuration.feature

-module('InputFeatureFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'InputFeatureFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'REMOVE_DUPLICATE_KEY_PRESSES'}, 'InputFeature':new("Remove Duplicate Key Presses")),
    put({This, 'INPUT_MAPPING'}, 'InputFeature':new("Input Mapping")),
    put({This, 'MULTI_KEY_PRESS'}, 'InputFeature':new("Multi Key Press")),
    put({This, 'SINGLE_KEY_REPEAT_PRESS'}, 'InputFeature':new("Single Key Repeat Press")),
    put({This, 'SINGLE_KEY_PRESS'}, 'InputFeature':new("Single Key Press")),
    ok.


getInstance() ->
        get({'InputFeatureFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

isSingleKeyProcessing(This) ->
        try
        Features = 'Features':getInstance(),
        case ((get({Features, '$class'})):isFeature(Features, get({This, 'SINGLE_KEY_REPEAT_PRESS'})) orelse (get({Features, '$class'})):isFeature(Features, get({This, 'SINGLE_KEY_PRESS'}))) of
            true ->
            throw({'$return', true});
            false ->
            throw({'$return', false})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

