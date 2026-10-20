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
% import android.graphics.Bitmap
% import android.graphics.Canvas
% import android.graphics.Matrix
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullImage
% import org.allbinary.graphics.Anchor
% import org.allbinary.image.ImageCache
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.string.CommonStrings
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.microemu.android.device.AndroidImageInterface

-module('ImageScaleUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageScaleUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    put({This, imageBasicArrayList}, 'BasicArrayListD':new()),
    put({This, scaledImageBasicArrayList}, 'BasicArrayListD':new()),
    put({This, scaleXBasicArrayList}, 'BasicArrayListD':new()),
    put({This, scaleYBasicArrayList}, 'BasicArrayListD':new()),
    ok.


getInstance() ->
        get({'ImageScaleUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
createImage2(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached) when is_number(ScaleNominatorX), is_number(ScaleDenominatorX), is_number(ScaleNominatorY), is_number(ScaleDenominatorY), is_boolean(Cached) ->
        (get({This, '$class'})):createImage3(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached, true).

% throws Exception
createImage3(This, ImageCache, OriginalImage, ScaleNominatorX, ScaleDenominatorX, ScaleNominatorY, ScaleDenominatorY, Cached, Mutable) when is_number(ScaleNominatorX), is_number(ScaleDenominatorX), is_number(ScaleNominatorY), is_number(ScaleDenominatorY), is_boolean(Cached), is_boolean(Mutable) ->
        ScaleX = (ScaleNominatorX / ScaleDenominatorX),
        ScaleY = (ScaleNominatorY / ScaleDenominatorY),
        (get({This, '$class'})):createImage(This, ImageCache, OriginalImage, ScaleX, ScaleY, Cached).

% throws Exception
createImage(This, ImageCache, OriginalImage, ScaleX, ScaleY, Cached) when is_number(ScaleX), is_number(ScaleY), is_boolean(Cached) ->
        try
        OriginalAndroidImage = OriginalImage,
        OriginalBitmap = (get({OriginalAndroidImage, '$class'})):getBitmap(OriginalAndroidImage),
        Width = trunc((((get({OriginalBitmap, '$class'})):getWidth(OriginalBitmap) * ScaleX))),
        Height = trunc((((get({OriginalBitmap, '$class'})):getHeight(OriginalBitmap) * ScaleY))),
        Index = (get({get({This, imageBasicArrayList}), '$class'})):indexOf(get({This, imageBasicArrayList}), OriginalImage),
        put({local, alreadyAvailable}, false),
        case (Index >= 0) of
            true ->
            ScaleX2Float = (get({get({This, scaleXBasicArrayList}), '$class'})):get(get({This, scaleXBasicArrayList}), Index),
            ScaleX2 = (get({ScaleX2Float, '$class'})):floatValue(ScaleX2Float),
            ScaleY2Float = (get({get({This, scaleYBasicArrayList}), '$class'})):get(get({This, scaleYBasicArrayList}), Index),
            ScaleY2 = (get({ScaleY2Float, '$class'})):floatValue(ScaleY2Float),
            case ((ScaleX2 =:= ScaleX) andalso (ScaleY2 =:= ScaleY)) of
                true ->
                put({local, alreadyAvailable}, true);
                false -> ok
            end;
            false -> ok
        end,
        case get({local, alreadyAvailable}) of
            true ->
            throw({'$return', (get({get({This, scaledImageBasicArrayList}), '$class'})):get(get({This, scaledImageBasicArrayList}), Index)});
            false ->
            ScaledImage = (get({This, '$class'})):getScaledImage(This, ImageCache, OriginalImage, ScaleX, ScaleY, Width, Height, Cached),
            (get({get({This, imageBasicArrayList}), '$class'})):add(get({This, imageBasicArrayList}), OriginalImage),
            (get({get({This, scaledImageBasicArrayList}), '$class'})):add(get({This, scaledImageBasicArrayList}), ScaledImage),
            (get({get({This, scaleXBasicArrayList}), '$class'})):add(get({This, scaleXBasicArrayList}), ScaleX),
            (get({get({This, scaleYBasicArrayList}), '$class'})):add(get({This, scaleYBasicArrayList}), ScaleY),
            throw({'$return', ScaledImage})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
getScaledImage(This, ImageCache, OriginalImage, ScaleX, ScaleY, Width, Height, Cached) when is_number(ScaleX), is_number(ScaleY), is_integer(Width), is_integer(Height), is_boolean(Cached) ->
        try
        put({local, image}, get({'NullImage', 'NULL_IMAGE'})),
        case Cached of
            true ->
            put({local, image}, (get({ImageCache, '$class'})):get(ImageCache, atom_to_list(get({This, '$class'})), Width, Height));
            false ->
            put({local, image}, (get({ImageCache, '$class'})):get(ImageCache, get({get({This, commonStrings}), 'CREATE_IMAGE'}), Width, Height))
        end,
        case (get({get({local, image}), '$class'})):isMutable(get({local, image})) of
            true ->
            Matrix = 'Matrix':new(),
            (get({This, '$class'})):scale(This, get({local, image}), Matrix, ScaleX, ScaleY),
            (fun(Target_N68515) -> (get({Target_N68515, '$class'})):drawImage(Target_N68515, OriginalImage, 0, 0, get({This, anchor})) end)((get({get({local, image}), '$class'})):getGraphics(get({local, image}))),
            throw({'$return', get({local, image})});
            false ->
            erlang:error({'Exception', "Not Mutable"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

scale(This, Image, Matrix, ScaleX, ScaleY) when is_number(ScaleX), is_number(ScaleY) ->
        (get({Matrix, '$class'})):setScale(Matrix, ScaleX, ScaleY),
        Canvas = (get({(Image), '$class'})):getCanvas((Image)),
        (get({Canvas, '$class'})):concat(Canvas, Matrix).

