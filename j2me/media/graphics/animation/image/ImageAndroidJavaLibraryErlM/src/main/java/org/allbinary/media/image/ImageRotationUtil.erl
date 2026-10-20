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
% import javax.microedition.lcdui.Image
% import org.allbinary.graphics.Anchor
% import android.graphics.Bitmap
% import android.graphics.Canvas
% import android.graphics.Matrix
% import org.microemu.android.device.AndroidImageInterface

-module('ImageRotationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageRotationUtil':new()),
    ok.

init_fields(This) ->
    put({This, matrix}, 'Matrix':new()),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


getInstance() ->
        get({'ImageRotationUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
createRotatedImage(This, OriginalImage, RotationInDegrees) when is_integer(RotationInDegrees) ->
        try
        Image = (fun(Target_N65959) -> (get({Target_N65959, '$class'})):createImageWH(Target_N65959, (get({OriginalImage, '$class'})):getWidth(OriginalImage), (get({OriginalImage, '$class'})):getHeight(OriginalImage)) end)('ImageCreationUtil':getInstance()),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            Bitmap = (get({(Image), '$class'})):getBitmap((Image)),
            Width = (get({Bitmap, '$class'})):getWidth(Bitmap),
            Height = (get({Bitmap, '$class'})):getHeight(Bitmap),
            (get({get({This, matrix}), '$class'})):setRotate(get({This, matrix}), float(RotationInDegrees), float(((Width bsr 1))), float(((Height bsr 1)))),
            Canvas = (get({(Image), '$class'})):getCanvas((Image)),
            (get({Canvas, '$class'})):concat(Canvas, get({This, matrix})),
            (fun(Target_N66461) -> (get({Target_N66461, '$class'})):drawImage(Target_N66461, OriginalImage, 0, 0, get({This, anchor})) end)((get({Image, '$class'})):getGraphics(Image)),
            throw({'$return', Image});
            false ->
            erlang:error({'Exception', "Not Mutable"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

