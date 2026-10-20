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
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.game.configuration.feature.GameFeatureFactory
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.eclipse.swt.SWT
% import org.eclipse.swt.graphics.GC
% import org.eclipse.swt.graphics.ImageData

-module('ImageSwtRotationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageSwtRotationUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, imageUtil}, 'ImageUtil':getInstance()),
    put({This, gameFeatureFactory}, 'GameFeatureFactory':getInstance()),
    put({This, features}, 'Features':getInstance()),
    put({This, 'NO_COPY'}, "SWT should not copy images after initial loading as the alpha is not honored"),
    ok.


getInstance() ->
        get({'ImageSwtRotationUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

getRotatedImage(This, BufferedImage, TotalAngle) when is_integer(TotalAngle) ->
        try
        case (not (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({This, gameFeatureFactory}), 'POST_IMAGE_LOADING_MODIFICATION'}))) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'NO_COPY'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            throw({'$return', BufferedImage});
            false -> ok
        end,
        BufferedImage
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

getRotatedImage2(This, BufferedImage, NewBufferedImage, Gc, Angle) when is_number(Angle) ->
        try
        case (not (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({get({This, gameFeatureFactory}), 'POST_IMAGE_LOADING_MODIFICATION'}))) of
            true ->
            (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({This, 'NO_COPY'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
            throw({'$return', BufferedImage});
            false -> ok
        end,
        BufferedImage
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

rotateImage(This, OriginalSwtImage, NewSwtImage, Gc, TotalAngle) when is_integer(TotalAngle) ->
        (get({This, '$class'})):getRotatedImage2(This, OriginalSwtImage, NewSwtImage, Gc, TotalAngle).

getRotatedImageSWT(This, BufferedImage, NewSwtImage, Gc, TotalAngle) when is_integer(TotalAngle) ->
        (get({This, '$class'})):getRotatedImage2(This, BufferedImage, NewSwtImage, Gc, TotalAngle).

getRotatedImages(This, BufferedImage, NumberOfFrames, TotalAngle) when is_integer(NumberOfFrames), is_integer(TotalAngle) ->
        BufferedImageArray = array:new(NumberOfFrames, {default, undefined}),
        put({local, angle}, 0),
        Size = array:size(BufferedImageArray),
        lists:foreach(fun(Index) ->
            put({local, angle}, (((TotalAngle div Size)) * Index)),
            array:set(Index, (get({This, '$class'})):getRotatedImage(This, BufferedImage, get({local, angle})), BufferedImageArray)
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
        put({local, imageData}, (get({FirstBufferedImage, '$class'})):getImageData(FirstBufferedImage)),
        BufferedImage = (get({get({This, imageUtil}), '$class'})):create(get({This, imageUtil}), (get({get({local, imageData}), width}) * get({local, columns})), (get({get({local, imageData}), height}) * get({local, rows}))),
        Gc = 'GC':new(BufferedImage),
        (get({Gc, '$class'})):setAntialias(Gc, get({'SWT', 'ON'})),
        (get({Gc, '$class'})):setInterpolation(Gc, get({'SWT', 'HIGH'})),
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
            put({local, imageData}, (get({get({local, nextBufferedImage}), '$class'})):getImageData(get({local, nextBufferedImage}))),
            (get({Gc, '$class'})):drawImage(Gc, BufferedImage, 0, 0, get({(get({BufferedImage, '$class'})):getBounds(BufferedImage), width}), get({(get({BufferedImage, '$class'})):getBounds(BufferedImage), height}), (get({get({local, imageData}), width}) * get({local, columnIndex})), (get({get({local, imageData}), height}) * get({local, rowIndex})), get({get({local, imageData}), width}), get({get({local, imageData}), height})),
            put({local, columnIndex}, get({local, columnIndex}) + 1)
        end, lists:seq(0, Size - 1)),
        (get({Gc, '$class'})):dispose(Gc),
        BufferedImage.

