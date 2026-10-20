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
% package org.allbinary.game.layer.unit
% import org.allbinary.game.layer.resources.BasicGameResources
% import org.allbinary.game.layer.resources.GameGraphicsResourceUtil
% import org.allbinary.AndroidUtil
% import org.allbinary.game.configuration.feature.GraphicsFeatureFactory

-module('Unit2DecalGameResources').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('BasicGameResources', Function, Arguments).

static_init() ->
    put({?MODULE, instance}, 'Unit2DecalGameResources':new()),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'BasicGameResources':'$init'(This),
    init_fields(This),
        ROOT = "/unit_decal",
        SMALL = "_30_by_30.png",
        MEDIUM = SMALL,
        SIZE_FOUR = SMALL,
        SIZE_FIVE = SMALL,
        SIZE_SIX = SMALL,
        SIZE = array:from_list([SMALL, MEDIUM, SIZE_FOUR, SIZE_FIVE, SIZE_SIX]),
        'BasicGameResources':init(This, ROOT, SIZE).

% throws Exception
append(This, ROOT, SizeString) when (is_list(ROOT) orelse ROOT =:= undefined), (is_list(SizeString) orelse SizeString =:= undefined) ->
        'BasicGameResources':append(This, ROOT, SizeString).

% throws Exception
getString(This) ->
        try
        case 'AndroidUtil':isAndroid() of
            true ->
            throw({'$return', (fun(Target_N66335) -> (get({Target_N66335, '$class'})):getStringForFeature(Target_N66335, get({'GraphicsFeatureFactory':getInstance(), 'SPRITE_QUARTER_ROTATION_GRAPHICS'})) end)('GameGraphicsResourceUtil':getInstance())});
            false ->
            throw({'$return', 'BasicGameResources':getString(This)})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getInstance() ->
        get({'Unit2DecalGameResources', instance}).

