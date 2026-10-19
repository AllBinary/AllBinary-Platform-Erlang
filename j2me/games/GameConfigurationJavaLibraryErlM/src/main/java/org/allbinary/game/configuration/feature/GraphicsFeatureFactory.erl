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
% import org.allbinary.logic.string.StringUtil

-module('GraphicsFeatureFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'GraphicsFeatureFactory':new()),
    ok.

init_fields(This) ->
    put({This, 'NONE'}, 'GraphicsFeature':new(get({'StringUtil':getInstance(), 'NULL_STRING'}))),
    put({This, 'TRANSPARENT_IMAGE_CREATION'}, 'GraphicsFeature':new("Transparent Image Creation")),
    put({This, 'IMAGE_GRAPHICS'}, 'GraphicsFeature':new("Image Graphics")),
    put({This, 'IMAGE_ROTATION_ON_THE_FLY'}, 'GraphicsFeature':new("Image Rotated On The Fly")),
    put({This, 'IMAGE_TO_ARRAY_GRAPHICS'}, 'GraphicsFeature':new("Image To Array Graphics")),
    put({This, 'SPRITE_QUARTER_ROTATION_GRAPHICS'}, 'GraphicsFeature':new("Sprite Quarter Rotation Graphics")),
    put({This, 'SPRITE_FULL_GRAPHICS'}, 'GraphicsFeature':new("Sprite Full Rotation Graphics")),
    put({This, 'VECTOR_GRAPHICS'}, 'GraphicsFeature':new("BasicArrayList Graphics")),
    put({This, 'VECTOR_TO_IMAGE_GRAPHICS'}, 'GraphicsFeature':new("BasicArrayList To Image Graphics")),
    ok.


getInstance() ->
        get({'GraphicsFeatureFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

