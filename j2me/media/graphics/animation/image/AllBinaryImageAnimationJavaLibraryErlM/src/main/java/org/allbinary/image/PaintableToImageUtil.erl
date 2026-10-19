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
% import org.allbinary.graphics.paint.PaintableInterface

-module('PaintableToImageUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'PaintableToImageUtil':new()),
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


% throws Exception
getImage(PaintableInterface, Width, Height) when is_integer(Width), is_integer(Height) ->
        Image = (fun(Target_N65727) -> (get({Target_N65727, '$class'})):get(Target_N65727, atom_to_list(get({get({'PaintableToImageUtil', instance}), '$class'})), Width, Height) end)('GameFeatureImageCacheFactory':getInstance()),
        Graphics = (get({Image, '$class'})):getGraphics(Image),
        (get({PaintableInterface, '$class'})):paint(PaintableInterface, Graphics),
        Image.

