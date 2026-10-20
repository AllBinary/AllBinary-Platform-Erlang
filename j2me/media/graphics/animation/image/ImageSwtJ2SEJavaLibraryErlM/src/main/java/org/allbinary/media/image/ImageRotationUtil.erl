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
% import org.allbinary.game.configuration.feature.Features
% import org.allbinary.graphics.opengles.OpenGLFeatureFactory
% import org.allbinary.image.opengles.OpenGLESImage
% import org.allbinary.logic.communication.log.PreLogUtil
% import org.eclipse.swt.graphics.GC
% import org.microemu.device.swt.SwtImmutableImage
% import org.microemu.device.swt.SwtMutableImage

-module('ImageRotationUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageRotationUtil':new()),
    ok.

init_fields(This) ->
    put({This, imageSwtRotationUtil}, 'ImageSwtRotationUtil':getInstance()),
    put({This, features}, 'Features':getInstance()),
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

rotateImage(This, OriginalImage, Image, TotalAngle) when is_integer(TotalAngle) ->
        try
        OriginalImage2 = OriginalImage,
        case (get({get({This, features}), '$class'})):isFeature(get({This, features}), get({'OpenGLFeatureFactory':getInstance(), 'OPENGL'})) of
            true ->
            case ((get({Image, '$class'})):getType(Image) >= get({'OpenGLESImage', 'TYPE'})) of
                true ->
                OpenGLESImage = (Image),
                put({get({OpenGLESImage, openGLESImageProperties}), angle}, TotalAngle),
                throw({'$return', ok});
                false ->
                'PreLogUtil':put(lists:concat([lists:concat([lists:concat(["OpenGL but image is: ", Image]), " type: "]), (get({Image, '$class'})):getType(Image)]), This, "rotateImage")
            end;
            false -> ok
        end,
        OriginalSwtImage = ((get({OriginalImage2, '$class'})):getImage(OriginalImage2)),
        put({local, gc}, undefined),
        put({local, copySwtImage}, undefined),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            SwtImage = Image,
            put({local, copySwtImage}, (get({SwtImage, '$class'})):getImage(SwtImage)),
            put({local, gc}, (get({SwtImage, '$class'})):getGc(SwtImage)),
            (get({get({This, imageSwtRotationUtil}), '$class'})):rotateImage(get({This, imageSwtRotationUtil}), OriginalSwtImage, get({local, copySwtImage}), get({local, gc}), TotalAngle);
            false ->
            'PreLogUtil':put(lists:concat(["No rotation for: ", (get({Image, '$class'})):toString(Image)]), This, "rotateImage")
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
createRotatedImage(This, OriginalImage, RotationInDegrees) when is_integer(RotationInDegrees) ->
        OriginalImage.

