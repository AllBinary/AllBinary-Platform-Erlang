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
% package org.allbinary.image
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.animation.Animation

-module('AnimationFrameToImageUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AnimationFrameToImageUtil':new()),
    ok.

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
        get({'AnimationFrameToImageUtil', instance}).

% throws Exception
getInstanceTranslate(This, Width, Height, AnimationInterface) when is_integer(Width), is_integer(Height) ->
        Image = (fun(Target_N65776) -> (get({Target_N65776, '$class'})):get(Target_N65776, atom_to_list(get({get({'AnimationFrameToImageUtil', instance}), '$class'})), ((((Width * 3)) bsr 1)), ((((Height * 3)) bsr 1))) end)('GameFeatureImageCacheFactory':getInstance()),
        Graphics = (get({Image, '$class'})):getGraphics(Image),
        TranlateX = ((Width bsr 2)),
        TranlateY = ((Height bsr 2)),
        (get({Graphics, '$class'})):translate(Graphics, TranlateX, TranlateY),
        (get({AnimationInterface, '$class'})):paintXY(AnimationInterface, Graphics, 0, 0),
        (get({Graphics, '$class'})):translate(Graphics, (-TranlateX), (-TranlateY)),
        Image.

% throws Exception
getInstanceWH(This, Width, Height, AnimationInterface) when is_integer(Width), is_integer(Height) ->
        Image = (fun(Target_N66287) -> (get({Target_N66287, '$class'})):get(Target_N66287, atom_to_list(get({get({'AnimationFrameToImageUtil', instance}), '$class'})), Width, Height) end)('GameFeatureImageCacheFactory':getInstance()),
        Graphics = (get({Image, '$class'})):getGraphics(Image),
        (get({AnimationInterface, '$class'})):paintXY(AnimationInterface, Graphics, 0, 0),
        Image.

