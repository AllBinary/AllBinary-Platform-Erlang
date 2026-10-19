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

-module('ImageToRotationImageArrayUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageToRotationImageArrayUtil':new()),
    ok.

init_fields(This) ->
    ok.


getInstance() ->
        get({'ImageToRotationImageArrayUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

% throws Exception
generate(This, Image, AngleIncrement, TotalAngle) when is_integer(AngleIncrement), is_integer(TotalAngle) ->
        ImageRotationUtil = 'ImageRotationUtil':getInstance(),
        TotalFrames = (TotalAngle div AngleIncrement),
        ImageArray = array:new(TotalFrames, {default, undefined}),
        array:set(0, Image, ImageArray),
        lists:foreach(fun(Index) ->
            array:set(Index, (get({ImageRotationUtil, '$class'})):createRotatedImage(ImageRotationUtil, Image, (Index * AngleIncrement)), ImageArray)
        end, lists:seq(1, TotalFrames - 1)),
        ImageArray.

