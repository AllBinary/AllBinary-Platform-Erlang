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
% import java.awt.image.BufferedImage
% import javax.microedition.lcdui.Image
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.microemu.device.j2se.J2SEImmutableImage
% import org.microemu.device.j2se.J2SEMutableImage

-module('ImageRotationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageRotationUtil':new()),
    ok.

init_fields(This) ->
    put({This, imageJ2SERotationUtil}, 'ImageJ2SERotationUtil':getInstance()),
    ok.


getInstance() ->
        get({'ImageRotationUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

rotateImage(This, OriginalImage, Image, TotalAngle) when is_integer(TotalAngle) ->
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            J2seImage = Image,
            NewBufferedImage = (get({J2seImage, '$class'})):getImage(J2seImage),
            put({local, originalAwtImage}, undefined),
            case (get({OriginalImage, '$class'})):isMutable(OriginalImage) of
                true ->
                put({local, originalJ2SEImage}, OriginalImage),
                put({local, originalAwtImage}, (get({get({local, originalJ2SEImage}), '$class'})):getImage(get({local, originalJ2SEImage})));
                false ->
                put({local, originalJ2SEImage}, OriginalImage),
                put({local, originalAwtImage}, (get({get({local, originalJ2SEImage}), '$class'})):getImage(get({local, originalJ2SEImage})))
            end,
            (get({get({This, imageJ2SERotationUtil}), '$class'})):rotateImage(get({This, imageJ2SERotationUtil}), get({local, originalAwtImage}), NewBufferedImage, TotalAngle);
            false ->
            'PreLogUtil':putOE("Not Mutable", This, "getRotatedImage", {'Exception'})
        end.

% throws Exception
createRotatedImage(This, OriginalImage, RotationInDegrees) when is_integer(RotationInDegrees) ->
        try
        Image = (fun(Target_N66591) -> (get({Target_N66591, '$class'})):createImageWH(Target_N66591, (get({OriginalImage, '$class'})):getWidth(OriginalImage), (get({OriginalImage, '$class'})):getHeight(OriginalImage)) end)('ImageCreationUtil':getInstance()),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            put({local, originalAwtImage}, undefined),
            case (get({OriginalImage, '$class'})):isMutable(OriginalImage) of
                true ->
                put({local, originalJ2SEImage}, OriginalImage),
                put({local, originalAwtImage}, (get({get({local, originalJ2SEImage}), '$class'})):getImage(get({local, originalJ2SEImage})));
                false ->
                put({local, originalJ2SEImage}, OriginalImage),
                put({local, originalAwtImage}, (get({get({local, originalJ2SEImage}), '$class'})):getImage(get({local, originalJ2SEImage})))
            end,
            J2seImage = Image,
            NewBufferedImage = (get({J2seImage, '$class'})):getImage(J2seImage),
            BufferedImage = (get({get({This, imageJ2SERotationUtil}), '$class'})):createRotatedImage(get({This, imageJ2SERotationUtil}), get({local, originalAwtImage}), NewBufferedImage, RotationInDegrees),
            throw({'$return', Image});
            false ->
            erlang:error({'Exception', "Not Mutable"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

