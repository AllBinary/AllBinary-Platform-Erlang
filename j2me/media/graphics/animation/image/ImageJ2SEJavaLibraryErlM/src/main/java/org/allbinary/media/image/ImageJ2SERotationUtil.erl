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
% import java.awt.Graphics2D
% import java.awt.Image
% import java.awt.image.BufferedImage

-module('ImageJ2SERotationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageJ2SERotationUtil':new()),
    ok.

init_fields(This) ->
    put({This, imageUtil}, 'ImageUtil':getInstance()),
    put({This, imageJ2SEUtil}, 'ImageJ2SEUtil':getInstance()),
    put({This, 'TWO_PIE'}, (2 * get({'Math', 'PI'}))),
    ok.


getInstance() ->
        get({'ImageJ2SERotationUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

getRotatedImage(This, BufferedImage, TotalAngle) when is_integer(TotalAngle) ->
        (get({This, '$class'})):getRotatedImageRadians(This, BufferedImage, ((get({This, 'TWO_PIE'}) * float(TotalAngle)) / 360.0)).

getRotatedImageRadians(This, BufferedImage, Radians) when is_number(Radians) ->
        NewBufferedImage = (get({get({This, imageUtil}), '$class'})):create(get({This, imageUtil}), (get({BufferedImage, '$class'})):getWidth(BufferedImage, undefined), (get({BufferedImage, '$class'})):getHeight(BufferedImage, undefined)),
        (get({This, '$class'})):drawRotatedImageRadians(This, BufferedImage, NewBufferedImage, (get({NewBufferedImage, '$class'})):createGraphics(NewBufferedImage), Radians).

drawRotatedImageRadians(This, BufferedImage, NewBufferedImage, G, Radians) when is_number(Radians) ->
        (get({G, '$class'})):rotate(G, Radians, ((get({NewBufferedImage, '$class'})):getWidth(NewBufferedImage, undefined) / 2), ((get({NewBufferedImage, '$class'})):getHeight(NewBufferedImage, undefined) / 2)),
        (get({G, '$class'})):drawImage(G, BufferedImage, 0, 0, (get({BufferedImage, '$class'})):getWidth(BufferedImage, undefined), (get({BufferedImage, '$class'})):getHeight(BufferedImage, undefined), undefined),
        (get({G, '$class'})):dispose(G),
        NewBufferedImage.

rotateImage(This, BufferedImage, NewBufferedImage, TotalAngle) when is_integer(TotalAngle) ->
        G = (get({NewBufferedImage, '$class'})):createGraphics(NewBufferedImage),
        (get({G, '$class'})):setBackground(G, get({get({This, imageJ2SEUtil}), 'TRANSPARENT_COLOR'})),
        (get({G, '$class'})):clearRect(G, 0, 0, (get({NewBufferedImage, '$class'})):getWidth(NewBufferedImage), (get({NewBufferedImage, '$class'})):getHeight(NewBufferedImage)),
        (get({This, '$class'})):drawRotatedImageRadians(This, BufferedImage, NewBufferedImage, G, ((get({This, 'TWO_PIE'}) * float(TotalAngle)) / 360.0)).

createRotatedImage(This, BufferedImage, NewBufferedImage, TotalAngle) when is_integer(TotalAngle) ->
        G = (get({NewBufferedImage, '$class'})):createGraphics(NewBufferedImage),
        (get({This, '$class'})):drawRotatedImageRadians(This, BufferedImage, NewBufferedImage, G, ((get({This, 'TWO_PIE'}) * float(TotalAngle)) / 360.0)).

getRotatedImages(This, BufferedImage, NumberOfFrames, TotalAngle) when is_integer(NumberOfFrames), is_integer(TotalAngle) ->
        BufferedImageArray = array:new(NumberOfFrames, {default, undefined}),
        Arc = (((get({This, 'TWO_PIE'})) * float(TotalAngle)) / 360.0),
        Size = array:size(BufferedImageArray),
        lists:foreach(fun(Index) ->
            Radians = (((Arc / float(Size))) * float(Index)),
            array:set(Index, (get({This, '$class'})):getRotatedImageRadians(This, BufferedImage, Radians), BufferedImageArray)
        end, lists:seq(0, Size - 1)),
        BufferedImageArray.

createSpriteImage(This, BufferedImageArray) when (is_tuple(BufferedImageArray) orelse BufferedImageArray =:= undefined) ->
        put({local, columns}, 9),
        put({local, rows}, 0),
        Size = array:size(BufferedImageArray),
        case (Size < get({local, columns})) of
            true ->
            put({local, columns}, Size);
            false -> ok
        end,
        put({local, rows}, ((Size div get({local, columns})))),
        case ((Size rem get({local, columns})) =/= 0) of
            true ->
            put({local, rows}, get({local, rows}) + 1);
            false -> ok
        end,
        FirstBufferedImage = array:get(0, BufferedImageArray),
        BufferedImage = (get({get({This, imageUtil}), '$class'})):create(get({This, imageUtil}), ((get({FirstBufferedImage, '$class'})):getWidth(FirstBufferedImage, undefined) * get({local, columns})), ((get({FirstBufferedImage, '$class'})):getHeight(FirstBufferedImage, undefined) * get({local, rows}))),
        G = (get({BufferedImage, '$class'})):createGraphics(BufferedImage),
        put({local, columnIndex}, 0),
        put({local, rowIndex}, 0),
        put({local, nextBufferedImage}, undefined),
        lists:foreach(fun(Index) ->
            case (((Index div 9) =/= 0) andalso ((Index rem 9) =:= 0)) of
                true ->
                put({local, rowIndex}, get({local, rowIndex}) + 1),
                put({local, columnIndex}, 0);
                false -> ok
            end,
            put({local, nextBufferedImage}, array:get(Index, BufferedImageArray)),
            (get({G, '$class'})):drawImage(G, get({local, nextBufferedImage}), ((get({get({local, nextBufferedImage}), '$class'})):getWidth(get({local, nextBufferedImage}), undefined) * get({local, columnIndex})), ((get({get({local, nextBufferedImage}), '$class'})):getHeight(get({local, nextBufferedImage}), undefined) * get({local, rowIndex})), (get({get({local, nextBufferedImage}), '$class'})):getWidth(get({local, nextBufferedImage}), undefined), (get({get({local, nextBufferedImage}), '$class'})):getHeight(get({local, nextBufferedImage}), undefined), undefined),
            put({local, columnIndex}, get({local, columnIndex}) + 1)
        end, lists:seq(0, Size - 1)),
        (get({G, '$class'})):dispose(G),
        BufferedImage.

