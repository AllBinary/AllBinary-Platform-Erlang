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
% import android.graphics.Color
% import android.graphics.Matrix
% import android.graphics.Paint
% import javax.microedition.lcdui.Image
% import org.microemu.android.device.AndroidImageInterface

-module('AndroidImageUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AndroidImageUtil':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'AndroidImageUtil', instance}).

paintBitmap(This, Bitmap, OriginalBitmap, Paint) ->
        (get({Bitmap, '$class'})):eraseColor(Bitmap, get({'Color', 'TRANSPARENT'})),
        Canvas = 'Canvas':new(),
        (get({Canvas, '$class'})):setBitmap(Canvas, Bitmap),
        (get({Canvas, '$class'})):drawBitmap(Canvas, OriginalBitmap, 0.0, 0.0, Paint).

paint(This, Image, OriginalImage, Paint) ->
        AndroidImage = Image,
        (fun(Target_N66194) -> (get({Target_N66194, '$class'})):eraseColor(Target_N66194, get({'Color', 'TRANSPARENT'})) end)((get({AndroidImage, '$class'})):getBitmap(AndroidImage)),
        Canvas = (get({AndroidImage, '$class'})):getCanvas(AndroidImage),
        OriginalAndroidImage = OriginalImage,
        (get({Canvas, '$class'})):drawBitmap(Canvas, (get({OriginalAndroidImage, '$class'})):getBitmap(OriginalAndroidImage), 0.0, 0.0, Paint).

rotate(This, Image, OriginalImage, Matrix, Paint) ->
        AndroidImage = Image,
        (fun(Target_N66554) -> (get({Target_N66554, '$class'})):eraseColor(Target_N66554, get({'Color', 'TRANSPARENT'})) end)((get({AndroidImage, '$class'})):getBitmap(AndroidImage)),
        Canvas = (get({AndroidImage, '$class'})):getCanvas(AndroidImage),
        (get({Canvas, '$class'})):concat(Canvas, Matrix),
        OriginalAndroidImage = OriginalImage,
        (get({Canvas, '$class'})):drawBitmap(Canvas, (get({OriginalAndroidImage, '$class'})):getBitmap(OriginalAndroidImage), 0.0, 0.0, Paint).

