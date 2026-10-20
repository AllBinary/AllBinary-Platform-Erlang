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
% package org.allbinary.image.opengles
% import java.io.InputStream
% import javax.microedition.khronos.opengles.GL10
% import javax.microedition.lcdui.Image
% import javax.microedition.lcdui.NullImage
% import org.allbinary.device.NullGL10
% import org.allbinary.graphics.opengles.renderer.AllBinaryRendererBase3
% import org.allbinary.util.BasicArrayList
% import org.allbinary.util.BasicArrayListD
% import org.allbinary.image.ImageCache
% import org.allbinary.image.ImageCacheFactory
% import org.allbinary.image.PreResourceImageUtil
% import org.allbinary.thread.SynchObject

-module('OpenGLImageCache').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('ImageCache', Function, Arguments).

init_fields(This) ->
    put({This, imageCache}, 'ImageCacheFactory':getInstance()),
    put({This, preResourceImageUtil}, 'PreResourceImageUtil':getInstance()),
    put({This, gl}, get({'NullGL10', 'NULL_GL10'})),
    put({This, lock}, 'SynchObject':new()),
    put({This, list}, 'BasicArrayListD':new()),
    put({This, renderer}, 'AllBinaryRendererBase3':new()),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'ImageCache':'$init'(This),
    init_fields(This),
        ok.

addListener(This, Renderer) ->
        put({This, renderer}, Renderer).

% throws Exception
update(This, Gl) ->
        put({This, gl}, Gl),
        begin % synchronized
            lists:foreach(fun(Index) ->
                OpenGLESImage = (array:get(Index, get({get({This, list}), objectArray}))),
                case (OpenGLESImage =/= get({'OpenGLESImage', 'NULL_OPENGL_IMAGE'})) of
                    true ->
                    (get({OpenGLESImage, '$class'})):set(OpenGLESImage, Gl);
                    false -> ok
                end
            end, lists:seq(((get({get({This, list}), '$class'})):size(get({This, list})) - 1), 0, -1))
        end.

% throws Exception
createImage(This, Caller, Width, Height) when (is_list(Caller) orelse Caller =:= undefined), is_integer(Width), is_integer(Height) ->
        put({local, width}, Width),
        put({local, height}, Height),
        put({local, textureSize}, get({local, width})),
        case (get({local, height}) > get({local, width})) of
            true ->
            put({local, textureSize}, get({local, height}));
            false -> ok
        end,
        (fun Loop() -> case (((get({local, textureSize}) rem 4)) =/= 0) of true ->
            put({local, textureSize}, get({local, textureSize}) + 1),
            Loop();
        false -> ok end end)(),
        put({local, width}, get({local, textureSize})),
        put({local, height}, get({local, textureSize})),
        Image2 = (get({get({This, imageCache}), '$class'})):get(get({This, imageCache}), Caller, get({local, width}), get({local, height})),
        Image = (get({get({This, preResourceImageUtil}), '$class'})):encapsulate(get({This, preResourceImageUtil}), Image2),
        begin % synchronized
            case (Image =/= get({'NullImage', 'NULL_IMAGE'})) of
                true ->
                (get({get({This, list}), '$class'})):add(get({This, list}), Image);
                false -> ok
            end
        end,
        Image.

% throws Exception
createImageFromInputStream(This, Key, InputStream) ->
        CachedImage = (get({get({This, imageCache}), '$class'})):getWithKey(get({This, imageCache}), Key),
        Image = (get({get({This, preResourceImageUtil}), '$class'})):encapsulate(get({This, preResourceImageUtil}), CachedImage),
        begin % synchronized
            case (Image =/= get({'NullImage', 'NULL_IMAGE'})) of
                true ->
                (get({get({This, list}), '$class'})):add(get({This, list}), Image);
                false -> ok
            end
        end,
        Image.

getGlP(This) ->
        get({This, gl}).

init(This, Image) ->
        try
            begin % synchronized
                case (get({get({This, list}), '$class'})):contains(get({This, list}), Image) of
                    true ->
                    erlang:error({'RuntimeException'});
                    false -> ok
                end,
                (get({get({This, list}), '$class'})):add(get({This, list}), Image)
            end,
            (get({get({This, renderer}), '$class'})):add(get({This, renderer}), Image)
        catch _:E when E =/= '$break', E =/= '$continue', (not is_tuple(E) orelse element(1, E) =/= '$return') ->
            (get({get({This, logUtil}), '$class'})):put(get({This, logUtil}), get({get({This, commonStrings}), 'EXCEPTION'}), This, get({get({This, commonStrings}), 'INIT'}), E)
        end.

