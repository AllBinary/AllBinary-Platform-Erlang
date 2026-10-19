%
% AllBinary Open License Version 1
% Copyright (c) 2023 AllBinary
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
% package org.allbinary.media.image
% import javax.microedition.lcdui.Image
% import org.allbinary.image.GameFeatureImageCacheFactory

-module('ImageJ2MEScaleUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageJ2MEScaleUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ImageJ2MEScaleUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
scaleArray(This, Images, Width, Height) when (is_tuple(Images) orelse Images =:= undefined), is_integer(Width), is_integer(Height) ->
        lists:foreach(fun(Index) ->
            Image = array:get(Index, Images),
            array:set(Index, (fun(Target_N65853) -> (get({Target_N65853, '$class'})):createImage2(Target_N65853, 'GameFeatureImageCacheFactory':getInstance(), Image, (float(Width) / 2.0), float((get({Image, '$class'})):getWidth(Image)), float(Height), float((get({Image, '$class'})):getHeight(Image)), false) end)('ImageScaleUtil':getInstance()), Images)
        end, lists:seq(0, array:size(Images) - 1)),
        Images.

% throws Exception
scale(This, Image, Width, Height) when is_integer(Width), is_integer(Height) ->
        (fun(Target_N66185) -> (get({Target_N66185, '$class'})):createImage2(Target_N66185, 'GameFeatureImageCacheFactory':getInstance(), Image, float(Width), float((get({Image, '$class'})):getWidth(Image)), float(Height), float((get({Image, '$class'})):getHeight(Image)), false) end)('ImageScaleUtil':getInstance()).

