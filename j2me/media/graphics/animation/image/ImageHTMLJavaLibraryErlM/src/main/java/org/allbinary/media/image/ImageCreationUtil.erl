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
% package org.allbinary.media.image
% import javax.microedition.lcdui.Image
% import org.allbinary.image.GameFeatureImageCacheFactory

-module('ImageCreationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageCreationUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ImageCreationUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
createImageWH(This, Width, Height) when is_integer(Width), is_integer(Height) ->
        Image = (fun(Target_N65785) -> (get({Target_N65785, '$class'})):get(Target_N65785, atom_to_list(get({This, '$class'})), Width, Height) end)('GameFeatureImageCacheFactory':getInstance()),
        Image.

% throws Exception
createImage(This, Width, Height, MaxScaleX, MaxScaleY) when is_integer(Width), is_integer(Height), is_number(MaxScaleX), is_number(MaxScaleY) ->
        Image = (fun(Target_N65977) -> (get({Target_N65977, '$class'})):get(Target_N65977, atom_to_list(get({This, '$class'})), (trunc(((float(Width) * MaxScaleX))) + 1), (trunc(((float(Height) * MaxScaleY))) + 1)) end)('GameFeatureImageCacheFactory':getInstance()),
        Image.

