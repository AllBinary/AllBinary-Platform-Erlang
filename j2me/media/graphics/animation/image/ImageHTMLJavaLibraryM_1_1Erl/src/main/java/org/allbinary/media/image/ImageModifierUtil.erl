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
% import javax.microedition.lcdui.Graphics
% import javax.microedition.lcdui.Image
% import org.allbinary.graphics.Anchor
% import org.allbinary.graphics.color.BasicColor
% import org.allbinary.string.CommonStrings
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringMaker
% import org.microemu.device.playn.PlaynImage
% import org.microemu.device.ResourceCallbackStrings
% import playn.core.Canvas
% import playn.core.CanvasImage
% import playn.core.util.Callback

-module('ImageModifierUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, resourceCallbackStrings}, 'ResourceCallbackStrings':getInstance()),
    put({This, alphaArray}, undefined),
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
        ok.

changeColor(This, UnusedOriginalImage, Image, ImageIndex, BasicColor) when is_integer(ImageIndex) ->
        ok.

setAlpha(This, OriginalImage, Image, ImageIndex, Alpha) when is_integer(ImageIndex), is_integer(Alpha) ->
        AlphaF = float(Alpha),
        AlphaFloat = (AlphaF / 255.0),
        (get({This, '$class'})):setAlphaF(This, OriginalImage, Image, ImageIndex, AlphaFloat).

setAlphaF(This, OriginalImage, Image, ImageIndex, Alpha) when is_integer(ImageIndex), is_number(Alpha) ->
        case array:get(ImageIndex, get({This, alphaArray})) of
            true ->
            put({This, alphaArray}, array:set(ImageIndex, false, get({This, alphaArray}))),
            (get({This, '$class'})):setAlpha2(This, OriginalImage, Image, ImageIndex, Alpha);
            false -> ok
        end.

setAlpha2(This, OriginalImage, Image, ImageIndex, Alpha) when is_integer(ImageIndex), is_number(Alpha) ->
        HtmlImage = Image,
        CanvasImage = (get({HtmlImage, '$class'})):getImage(HtmlImage),
        OriginalPlaynImage = (get({(OriginalImage), '$class'})):getImage((OriginalImage)),
        Canvas = (get({CanvasImage, '$class'})):canvas(CanvasImage),
        (get({Canvas, '$class'})):clear(Canvas),
        (get({Canvas, '$class'})):setAlpha(Canvas, Alpha),
        (get({Canvas, '$class'})):drawImage(Canvas, OriginalPlaynImage, 0, 0).

setAlpha3(This, Image, Alpha) when is_number(Alpha) ->
        AlphaF = Alpha,
        AlphaFloat = (AlphaF / 255.0),
        HtmlImage = Image,
        CanvasImage = (get({HtmlImage, '$class'})):getImage(HtmlImage),
        Canvas = (get({CanvasImage, '$class'})):canvas(CanvasImage),
        (get({Canvas, '$class'})):setAlpha(Canvas, AlphaFloat).

getImageArray(This, OriginalImageArray) when (is_tuple(OriginalImageArray) orelse OriginalImageArray =:= undefined) ->
        Size = array:size(OriginalImageArray),
        put({This, alphaArray}, array:new(Size, {default, false})),
        ImageArray = array:new(Size, {default, undefined}),
        lists:foreach(fun(Index) ->
            array:set(Index, array:get(Index, OriginalImageArray), ImageArray),
            (get({This, '$class'})):handleImage(This, ImageArray, Index, array:get(Index, OriginalImageArray))
        end, lists:seq(0, Size - 1)),
        ImageArray.

handleImage(This, ImageArray, Index, Image) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(Index) ->
        Image3 = (get({(Image), '$class'})):getImage((Image)),
        case (Image3 =/= undefined) of
            true ->
            case (((get({Image3, '$class'})):isReady(Image3) orelse (((get({Image3, '$class'})):width(Image3) + (get({Image3, '$class'})):height(Image3)) =< 0)) orelse ((get({Image, '$class'})):getName(Image) =:= get({get({This, resourceCallbackStrings}), 'FROM_DATA'}))) of
                true ->
                (get({This, '$class'})):copy(This, ImageArray, Index, Image, Image3);
                false ->
                Callback = 'Callback':new() % Java anonymous class body: implement it as a module
%                     ok % onSuccess
%                     ok % onFailure
,
                (get({Image3, '$class'})):addCallback(Image3, Callback)
            end;
            false ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({This, resourceCallbackStrings}), 'NULL'}) + (get({Image, '$class'})):isMutable(Image)), This, get({get({This, resourceCallbackStrings}), 'HANDLE_IMAGE'}))
        end.

copy(This, ImageArray, Index, Image, Image3) when (is_tuple(ImageArray) orelse ImageArray =:= undefined), is_integer(Index) ->
        try
            Image2 = 'Image':createImage((get({Image3, '$class'})):width(Image3), (get({Image3, '$class'})):height(Image3)),
            Graphics = (get({Image2, '$class'})):getGraphics(Image2),
            (get({Graphics, '$class'})):drawImage(Graphics, Image, 0, 0, get({'Anchor', 'TOP_LEFT'})),
            array:set(Index, Image2, ImageArray)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), (get({get({This, commonStrings}), 'EXCEPTION_LABEL'}) + get({get({This, resourceCallbackStrings}), 'DONE'})), This, get({get({This, resourceCallbackStrings}), 'HANDLE_IMAGE'}))
        end.

reset(This) ->
        Size = array:size(get({This, alphaArray})),
        lists:foreach(fun(Index) ->
            put({This, alphaArray}, array:set(Index, true, get({This, alphaArray})))
        end, lists:seq(0, Size - 1)).

