% 
% AllBinary Open License Version 1 
% Copyright (c) 2022 AllBinary 
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
% package org.allbinary.animation.image
% import javax.microedition.lcdui.Image
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.media.image.ImageScaleUtil
% import org.allbinary.string.CommonStrings

-module('ScaleProcessor').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ScaleBaseProcessor', Function, Arguments).

static_init() ->
    put({?MODULE, instanceC}, 'ScaleProcessor':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, imageScaleUtil}, 'ImageScaleUtil':getInstance()),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'ScaleBaseProcessor':'$init'(This),
    init_fields(This).


getInstance() ->
        get({'ScaleProcessor', instanceC}).

update(This, OriginalImage, OriginalImageArray, XimageToShowArray, Unused, ScaleX, ScaleY, MaxScaleX, MaxScaleY) when (is_tuple(OriginalImageArray) orelse OriginalImageArray =:= undefined), (is_tuple(XimageToShowArray) orelse XimageToShowArray =:= undefined), is_integer(Unused), is_number(ScaleX), is_number(ScaleY), is_number(MaxScaleX), is_number(MaxScaleY) ->
        try
            (get({get({This, imageScaleUtil}), '$class'})):scale2(get({This, imageScaleUtil}), OriginalImage, OriginalImageArray, XimageToShowArray, Unused, ScaleX, ScaleY, MaxScaleX, MaxScaleY)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'UPDATE'}), E)
        end.

