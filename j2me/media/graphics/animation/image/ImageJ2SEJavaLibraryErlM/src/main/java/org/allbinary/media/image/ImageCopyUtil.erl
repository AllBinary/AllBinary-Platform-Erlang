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
% import org.allbinary.graphics.Anchor
% import org.allbinary.logic.communication.log.LogUtil
% import org.microemu.device.j2se.J2SEImmutableImage

-module('ImageCopyUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'ImageCopyUtil':new()),
    ok.

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, imageUtil}, 'ImageUtil':getInstance()),
    put({This, imageCreationUtil}, 'ImageCreationUtil':getInstance()),
    put({This, anchor}, get({'Anchor', 'TOP_LEFT'})),
    ok.


getInstance() ->
        get({'ImageCopyUtil', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This),
        ok.

% throws Exception
createImageForRotation(This, OriginalImage) ->
        (get({This, '$class'})):createImage(This, OriginalImage).

% throws Exception
createImage(This, OriginalImage) ->
        try
        Image = (get({get({This, imageCreationUtil}), '$class'})):createImageWH(get({This, imageCreationUtil}), (get({OriginalImage, '$class'})):getWidth(OriginalImage), (get({OriginalImage, '$class'})):getHeight(OriginalImage)),
        case (get({Image, '$class'})):isMutable(Image) of
            true ->
            (fun(Target_N66288) -> (get({Target_N66288, '$class'})):drawImage(Target_N66288, OriginalImage, 0, 0, get({This, anchor})) end)((get({Image, '$class'})):getGraphics(Image)),
            throw({'$return', Image});
            false ->
            erlang:error({'Exception', "Not Mutable"})
        end
        catch throw:{'$return', ReturnValue} -> ReturnValue end.

% throws Exception
createImageScale(This, OriginalImage, CanvasScale, Resize) when is_number(CanvasScale), is_boolean(Resize) ->
        put({local, newWidth}, trunc((((get({OriginalImage, '$class'})):getWidth(OriginalImage) * CanvasScale)))),
        put({local, newHeight}, trunc((((get({OriginalImage, '$class'})):getHeight(OriginalImage) * CanvasScale)))),
        case Resize of
            true ->
            case (get({local, newWidth}) < get({local, newHeight})) of
                true ->
                put({local, newWidth}, get({local, newHeight}));
                false -> ok
            end,
            case (get({local, newHeight}) < get({local, newWidth})) of
                true ->
                put({local, newHeight}, get({local, newWidth}));
                false -> ok
            end;
            false -> ok
        end,
        OriginalBufferedImage = (get({get({This, imageUtil}), '$class'})):getBufferedImage(get({This, imageUtil}), OriginalImage),
        BufferedImage = (get({get({This, imageUtil}), '$class'})):createBufferedImageWithLargerCanvas(get({This, imageUtil}), OriginalBufferedImage, get({local, newWidth}), get({local, newHeight})),
        Image = 'J2SEImmutableImage':new(BufferedImage),
        Image.

