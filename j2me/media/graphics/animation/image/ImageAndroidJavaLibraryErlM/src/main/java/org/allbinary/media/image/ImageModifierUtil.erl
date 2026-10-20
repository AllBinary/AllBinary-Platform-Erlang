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
% package org.allbinary.media.image
% import android.graphics.Paint
% import android.graphics.PorterDuff
% import android.graphics.PorterDuffColorFilter
% import javax.microedition.lcdui.Image
% import org.allbinary.graphics.color.BasicColor

-module('ImageModifierUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, paint}, 'Paint':new(get({'Paint', 'ANTI_ALIAS_FLAG'}))),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstanceOrCreate() ->
        'ImageModifierUtil':new().

setColor(This, UnusedOriginalImage, Image, ImageIndex, BasicColor) when is_integer(ImageIndex) ->
        (get({get({This, paint}), '$class'})):setColorFilter(get({This, paint}), 'PorterDuffColorFilter':new((get({BasicColor, '$class'})):intValue(BasicColor), get({get({'PorterDuff', 'Mode'}), 'SRC_IN'}))).

changeColor(This, UnusedOriginalImage, Image, ImageIndex, BasicColor) when is_integer(ImageIndex) ->
        (get({get({This, paint}), '$class'})):setColorFilter(get({This, paint}), 'PorterDuffColorFilter':new((get({BasicColor, '$class'})):intValue(BasicColor), get({get({'PorterDuff', 'Mode'}), 'SRC_IN'}))).

setAlpha(This, OriginalImage, Image, ImageIndex, AlphaInt) when is_integer(ImageIndex), is_integer(AlphaInt) ->
        case (AlphaInt =/= (get({get({This, paint}), '$class'})):getAlpha(get({This, paint}))) of
            true ->
            (get({get({This, paint}), '$class'})):setAlpha(get({This, paint}), AlphaInt);
            false -> ok
        end.

getImageArray(This, OriginalImageArray) when (is_tuple(OriginalImageArray) orelse OriginalImageArray =:= undefined) ->
        OriginalImageArray.

handleImage(This, ImageArray, Index, Image) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(Index) ->
        ok.

reset(This) ->
        ok.

