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
% import java.awt
% import java.awt.geom.AffineTransform
% import java.awt.image.AffineTransformOp
% import java.awt.image.BufferedImage
% import org.allbinary.logic.communication.log.LogUtil

-module('MirrorImageUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'MirrorImageUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, imageUtil}, 'ImageUtil':getInstance()),
    ok.


getInstance() ->
        get({'MirrorImageUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getImage(This, BufferedImage, Verticle, Horizontal) when is_boolean(Verticle), is_boolean(Horizontal) ->
        put({local, bufferedImage}, BufferedImage),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), "Starting", This, "getImage"),
        NewBufferedImage = (get({get({This, imageUtil}), '$class'})):create(get({This, imageUtil}), (get({get({local, bufferedImage}), '$class'})):getWidth(get({local, bufferedImage}), undefined), (get({get({local, bufferedImage}), '$class'})):getHeight(get({local, bufferedImage}), undefined)),
        G = (get({NewBufferedImage, '$class'})):createGraphics(NewBufferedImage),
        case Verticle of
            true ->
            put({local, tx}, 'AffineTransform':getScaleInstance(1, (-1))),
            (get({get({local, tx}), '$class'})):translate(get({local, tx}), 0, (-(get({get({local, bufferedImage}), '$class'})):getHeight(get({local, bufferedImage}), undefined))),
            put({local, op}, 'AffineTransformOp':new(get({local, tx}), get({'AffineTransformOp', 'TYPE_NEAREST_NEIGHBOR'}))),
            put({local, bufferedImage}, (get({get({local, op}), '$class'})):filter(get({local, op}), get({local, bufferedImage}), undefined));
            false -> ok
        end,
        case Horizontal of
            true ->
            put({local, tx}, 'AffineTransform':getScaleInstance((-1), 1)),
            (get({get({local, tx}), '$class'})):translate(get({local, tx}), (-(get({get({local, bufferedImage}), '$class'})):getWidth(get({local, bufferedImage}), undefined)), 0),
            put({local, op}, 'AffineTransformOp':new(get({local, tx}), get({'AffineTransformOp', 'TYPE_NEAREST_NEIGHBOR'}))),
            put({local, bufferedImage}, (get({get({local, op}), '$class'})):filter(get({local, op}), get({local, bufferedImage}), undefined));
            false -> ok
        end,
        (get({G, '$class'})):drawImage(G, get({local, bufferedImage}), 0, 0, (get({get({local, bufferedImage}), '$class'})):getWidth(get({local, bufferedImage}), undefined), (get({get({local, bufferedImage}), '$class'})):getHeight(get({local, bufferedImage}), undefined), undefined),
        (get({G, '$class'})):dispose(G),
        NewBufferedImage.

getImages(This, BufferedImage, Verticle, Horizontal) when is_boolean(Verticle), is_boolean(Horizontal) ->
        Width = (get({BufferedImage, '$class'})):getWidth(BufferedImage),
        Height = (get({BufferedImage, '$class'})):getHeight(BufferedImage),
        CellHeight = Height,
        CellWidth = Height,
        NumberOfFramesPerOrientation = (Width div CellWidth),
        put({local, numberOfFrames}, NumberOfFramesPerOrientation),
        case Verticle of
            true ->
            put({local, numberOfFrames}, (get({local, numberOfFrames}) * 2));
            false -> ok
        end,
        case Horizontal of
            true ->
            put({local, numberOfFrames}, (get({local, numberOfFrames}) * 2));
            false -> ok
        end,
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), lists:concat([lists:concat([lists:concat(["numberOfFramesPerOrientation: ", NumberOfFramesPerOrientation]), " numberOfFrames: "]), get({local, numberOfFrames})]), This, "getImages"),
        BufferedImageArray = array:new(get({local, numberOfFrames}), {default, undefined}),
        Y = 0,
        lists:foreach(fun(Index) ->
            X = (Index * CellWidth),
            array:set(Index, (get({BufferedImage, '$class'})):getSubimage(BufferedImage, X, Y, CellWidth, CellHeight), BufferedImageArray)
        end, lists:seq(0, NumberOfFramesPerOrientation - 1)),
        lists:foreach(fun(Index) ->
            array:set((Index + NumberOfFramesPerOrientation), (get({This, '$class'})):getImage(This, array:get(Index, BufferedImageArray), Verticle, Horizontal), BufferedImageArray)
        end, lists:seq(0, NumberOfFramesPerOrientation - 1)),
        BufferedImageArray.

